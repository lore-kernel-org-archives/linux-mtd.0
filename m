Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta01.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ql8t-0003r7-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Mar 2002 01:25:23 +0000
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Thu, 28 Mar 2002 17:25:21 -0800 (PST)
From: Jim Zeus <zeusj@firstlinux.net>
To: David Woodhouse <dwmw2@infradead.org>,
	"David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Whats wrong with my jffs2?
Reply-To: zeusj@firstlinux.net
Message-Id: <20020329012521.C065A36F9@sitemail.everyone.net>
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


--- David Woodhouse <dwmw2@infradead.org> wrote:
>
>zeusj@firstlinux.net said:
>>  Thanks, I have checked the devices.txt, so I got why the odd mtd
>> "permission denied". But if the device nodes with major 31 ,mi 0-7 are
>> ROM card (as the device.txt said),why my flash can works without
>> nothing wrong? I think the minor number should be 8-15 , isnt it?
>
>Hmmm. That's out of date - I reused the major number. I thought the change
>had propagated to devices.txt by now. We don't actually distinguish between
>flash and ROM 'cards'.

Thanks, I'll check it out.

>> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0014: 0x552f instead
>
>Did you erase the flash completely before putting the JFFS2 image on there?

I think there is no relation to Jffs2 image, now I show you my mtd partition:

0x00000000-0x00020000 : "Perseus Bootloader"

0x00020000-0x00800000 : "Perseus Kernel"

0x00800000-0x01000000 : "Perseus Rootfs"

0x01000000-0x02000000 : "Perseus JFFS2"

and if  you check the message you will find that "the Magic bitmask 0x1985 not found at 0x000e0014" are all in Perseus Kernel partition, moreover, I erased all the first 16M (from bootloader to rootfs) , so I think its none of jffs2.image's business  (the rootfs is jffs2 and the root filesystem )
And it still cant explain why jffs is ok.

>> VFS: Mounted root (jffs2 filesystem) readonly.
>
>Add 'rw' to the kernel command line (and/or remove 'ro') ?

I dont have kernel command line :<

Thanks

Jim Zeus

_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com from Everyone.net  http://www.everyone.net?tag
