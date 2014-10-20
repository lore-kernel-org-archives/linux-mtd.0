Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgD2j-0005Iw-W3
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 13:30:38 +0000
Message-ID: <1413811808.7906.278.camel@sauron.fi.intel.com>
Subject: Re: bad node type after using ubiupdatevol
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Per Smitt <per.smitt@sbie.se>
Date: Mon, 20 Oct 2014 16:30:08 +0300
In-Reply-To: <1413805882326.37838@sbie.se>
References: <1413805882326.37838@sbie.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2014-10-20 at 11:51 +0000, Per Smitt wrote:
> Hi
> 
> I am having some issues with ubifs. I have a system with two rootfs and
> when I upgrade I planned to simply update the rootfs volume currently not 
> in use with the new filesystem.
> 
> When loading the system for the first time using U-Boot it always works to
> write both rootfs volumes but once I try to upgrade I run into problems.
> 
> My upgrade process:
> ubiupdatevol /dev/ubi0_$INDEX "$FS_IMG"
> sync
> mount -t ubifs ubi0:rootfs$INDEX "$MOUNT_POINT"
> # Migrate config files like passwords, hostname, application specific config
> sync
> umount "$MOUNT_POINT"
> sync
> fw_setenv boot_index "$INDEX"    (Telling U-Boot environment which rootfs to use)

Can you experiment and put a very long sleep here, say, 20 minutes. The
idea is to wait until UBI finishes all the background operations. This
should not matter normally, but may be for your HW/SW it does for some
reasons.

> reboot

I'd also tried to validate the flash with MTD tests.

> Yes I was littering with syncs in a desperate attempt to get it to work. I am also
> checking for error codes after every command and I get return code 0 all the time.

sync is only the FS sync, it does not flush the UBI queue, because it
should not be necessary.

> When rebooting I get the following in the log:
> UBIFS error (pid 418): ubifs_read_node: bad node type (255 but expected 1)                                
> UBIFS error (pid 418): ubifs_read_node: bad node at LEB 68:27440                                                                      
> UBIFS error (pid 418): do_readpage: cannot read page 1000 of inode 617, error -22                                                     
> UBIFS error (pid 418): ubifs_read_node: bad node type (255 but expected 1)                                                            
> UBIFS error (pid 418): ubifs_read_node: bad node at LEB 68:27440                                                                      
> UBIFS error (pid 418): do_readpage: cannot read page 1000 of inode 617, error -22      

> It seems random which files are affected as I can sometimes upgrade without
> any error message. It might even be possible that the upgrade completed without
> any error at all, I cannot say.
> 
> Do anyone see anything outright wrong here that I simply am not aware of?

What may, in theory cause issues may be related to how you flash your
images. There are whole bunch of tricks related to this, see [1] and
[2]. It is possible that you see the issues only after the update just
because you hit them this way first. If you do enough UBIFS operations
before update, you may also hit issues due to "improper" flashing.

To exclude those, please either use ubiformat, or just start with fully
erase flash, and attach it to UBI, so UBI formats it. Then you may be
sure it is not your u-boot/firmware/whatever flasher doing nasty things.

Artem
