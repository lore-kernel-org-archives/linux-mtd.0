Received: from web13205.mail.yahoo.com ([216.136.174.190])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tD84-0006CE-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 20:42:40 +0100
Message-ID: <20020404194237.87870.qmail@web13205.mail.yahoo.com>
Date: Thu, 4 Apr 2002 11:42:37 -0800 (PST)
From: Sanjay Kumar <sankumar73@yahoo.com>
Subject: Re: jffs2 mounting problem
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <200204041814.g34IEjw20020@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi Robert,
Thanks for you useful sugestions.
Now I create the character device using MAKEDEV script i.e 
crwxr--r--   1 root     root      90,   0 Mar 27  2002 mtd0
crwxr--r--   1 root     root      90,   2 Mar 27  2002 mtd1
crwxr--r--   1 root     root      90,   4 Mar 27  2002 mtd2
Also I am using eraseall(eraseall /dev/mtd2)to erase the last partition completely. 
Still I see the same behaviour. 
Also the used space remains at 100% and event after long time
it doesn't decrease.

Please let me know what else I can try. I am in very urgent need to solve this problem.

Thanks & regards,
Sanjay
--- Robert Kaiser <rob@sysgo.de> wrote:
> Hi,
> 
> Am Donnerstag, 4. April 2002 18:07 schrieben Sie:
> > I am using two AMD flash of 4MB each. Then I am relocating them such that
> > they are continuous.
> > Then I create  three partitions, first one for bootloader, second for JFFS2
> > root partition and the last is free to be used latter.
> >
> > Then probing of the flash also shows the following information -
> > physmap flash device: 800000 at bf800000
> > Number of erase regions: 2
> > Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
> >
> > Now when I boot the system from 2nd jffs2 root partition I see the
> > following info -
> >
> > #cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 000a0000 00010000 "bootstrap and kernel"
> > mtd1: 00360000 00010000 "jffs2 filesystem"
> > mtd2: 00400000 00010000 "jffs2 2nd filesystem"
> >
> > Also I have following devices created -
> > #ls -l
> > crwxr--r--   1 root     root      90,   0 Mar 27  2002 mtd0
> > crwxr--r--   1 root     root      90,   1 Mar 27  2002 mtd1
> > crwxr--r--   1 root     root      90,   2 Mar 27  2002 mtd2
> > crw-r--r--   1 root     root      90,   4 Jan  1 00:03 mtd4
> > brwxr--r--   1 root     root      31,   0 Mar 27  2002 mtdblock0
> > brwxr--r--   1 root     root      31,   1 Mar 27  2002 mtdblock1
> > brw-r--r--   1 root     root      31,   2 Jan  1 00:02 mtdblock2
> >
> 
> Have a look at the MAKEDEV script in directory "util" of the MTD directory. 
> The minor numbers you chose for /dev/mtd? are, umm, unusual. I doubt you 
> really want them. The MAKEDEV script would have assigned these numbers:
> 
>    mtd0: 0
>    mtd1: 2
>    mtd2: 4
>    mtd4: 8
> 
> >
> >
> > Now I want the last partition to be mounted to /mnt directory.
> > For that first I use /dev/mtd4 for erasing the partition and
> 
> Due to the (presumably wrong) minor numbers, /dev/mtd4 in your case 
> corresponds to device mtd2 (i.e. "jffs2 2nd filesystem"), so that is
> what got erased.
> 
> > then I use the following command to mount the last partition -
> >
> > #mount -t jffs2 /dev/mtdblock2 /mnt
> 
> The minor number for mtdblock2 is correct (i.e. it also corresponds to the 
> "jffs2 2nd filesystem" partition), so this should actually work. My only 
> guess is that you may have used "erase /dev/mtd4" to do the erase ? Note that 
> the "erase" command by default erases only one block, "eraseall" erases an 
> entire device.
> 
> >
> > When the mounting is completed I use the command "df" and I see the
> > used space in the partition increases rapidly to 100%.
> 
> This is normal AFAIK. After increasing to 100% as you observed, it should go 
> back to some 5% or so (depends on the erase block size).
> 
> Hope this helps
> 
> Rob
> 
> 
> ----------------------------------------------------------------
> Robert Kaiser                         email: rkaiser@sysgo.de
> SYSGO RTS GmbH
> Am Pfaffenstein 14                    phone: (49) 6136 9948-762
> D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


__________________________________________________
Do You Yahoo!?
Yahoo! Tax Center - online filing with TurboTax
http://taxes.yahoo.com/
