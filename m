Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SgEj-0001ZZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 16:52:09 +0100
Date: Fri, 12 Jul 2002 17:48:15 +0200 (CEST)
From: Marius Groeger <mag@sysgo.de>
To: Patrik Fuchs <pfuchs@giga-stream.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: Boot kernel right from JFFS2
In-Reply-To: <MNEEJPPNAELHIHNGGLHOAEJNCAAA.pfuchs@giga-stream.de>
Message-ID: <Pine.LNX.4.40.0207121743480.7172-100000@mag.devdep.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 11 Jul 2002, Patrik Fuchs wrote:

> Here are my basics: PPCBoot1.1.5, Walnut 405GP,
> 8MB AMD NOR Flash with two partitions:
> MTD0 with JFFS2(root filesystem) on it and MTD1 with the bootloader
> PPCBoot1.1.5.
> Is it possible to boot a compressed kernel(Version 2.4.17) with ppcboot
> 1.1.5 right from jffs2 as root filessystem residing on the first MTD
> partition?

Yes. Just for the records: mtd/0 is the entire flash, the partitions
are counted starting with mtd/1 etc. With ppcboot fsinfo,fsload you
can access your jffs file systems.

Another option is to put the kernel image into a raw mtd partition
(eg. cat pImage >/dev/mtd/1). You can then load it from ppcboot with
the regular bootm command. This is faster than using jffs, but of
course the kernel image will not take advantage of the wear levelling.

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions GmbH     mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
