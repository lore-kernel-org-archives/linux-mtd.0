Received: from natpost.webmailer.de ([192.67.198.65] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SfwH-0001XE-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 16:33:05 +0100
Received: from Prak1 (mail.gigastream.de [212.18.200.6] (may be forged))
	by post.webmailer.de (8.9.3/8.8.7) with SMTP id RAA03855
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 17:32:33 +0200 (MET DST)
From: "Patrik Fuchs" <pfuchs@giga-stream.de>
To: <linux-mtd@lists.infradead.org>
Subject: Boot kernel right from JFFS2
Date: Thu, 11 Jul 2002 17:38:19 +0200
Message-ID: <MNEEJPPNAELHIHNGGLHOAEJNCAAA.pfuchs@giga-stream.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hello
I beg your help:
Here are my basics: PPCBoot1.1.5, Walnut 405GP,
8MB AMD NOR Flash with two partitions:
MTD0 with JFFS2(root filesystem) on it and MTD1 with the bootloader
PPCBoot1.1.5.
Is it possible to boot a compressed kernel(Version 2.4.17) with ppcboot
1.1.5 right from jffs2 as root filessystem residing on the first MTD
partition? Do you have a description or a HOWTO for that?
Thank you for your help.
Patrik
