Received: from tweedy.ksc.nasa.gov ([128.217.76.165])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17DjiX-0006Q3-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 May 2002 11:33:09 +0100
Subject: Re: Grub Booting Disk On Chip
From: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0205301138270.16856-100000@server.superbt.com>
References: <Pine.LNX.4.44.0205301138270.16856-100000@server.superbt.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 31 May 2002 06:33:02 -0400
Message-Id: <1022841182.19406.118.camel@tweedy.ksc.nasa.gov>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I found the code in stage2.c that attempts to load from the DOC.  At
about line 1009, I changed the following:

                  is_opened = find_config(0xE0);
//                is_opened = find_config(saved_drive);

It seems safe since this code is inside of an #ifdef BDEV_DISKONCHIP.

I haven't determined where "saved_drive" is getting setup, or why it is
not set to 0xe0, but forcing it seems to work.

Bob...

On Thu, 2002-05-30 at 11:48, Ilguiz Latypov wrote:
    Bob,
    
    On 30 May 2002, Bob Chiodini wrote:
    
    > root (dc0,0)
    > configfile /boot/grub/menu.lst
    > 
    > At this point a get a menu with the second entry highlighted.  Hitting
    > enter boots from /dev/hda1.  /dev/hda1 is the only disk on the system.
    
    Does GRUB show unsuccessful attempts to load /boot/grub/menu.lst from the 
    disk 0xE0 before going to interactive mode?  
    
    Also, the fact that menu.lst is a symbolic link could confuse the stripped
    down ext2 filesystem driver of GRUB.  Can you remove the link and create a 
    regular configuration file?
    
    > It looks like DS is saved as the address of the DOC, if it is not a
    > Millenium DOC.
    
    Oops, you are right.  In fact, the read-only initial program loader of DoC 
    2000 will copy the firmware from the flash memory to 0x2000:0 before 
    jumping there with the DS segment pointing to the DoC BIOS window.  Here 
    is the David's comment in the patch:
    
            * With DoC 2000, _start is loaded at 0x20000 by the IPL,
            * and is jumped to with CS:IP 0x2000:0, DS is <DoC segment>.
    
    Later DS is stored in %cs:doc_seg where %cs holds the segment at the end
    of conventional RAM.
    
-- 
Bob Chiodini
Sr. Communications Engineer
Dynacs Engineering Company, Inc.
DNX-18
Kennedy Space Center, Florida 32899
321-867-6313 (voice)
321-867-6300 (fax)
