Received: from [203.63.104.245] (helo=cobalttech.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9I0W-0005qQ-IE
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 06:46:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by cobalttech.com (Postfix) with ESMTP id 3DFC7717C0
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Oct 2003 01:44:27 -0400 (EDT)
Date: Tue, 14 Oct 2003 15:44:27 +1000 (EST)
From: Michael McLellan <michael-mclellan@swsa.com.au>
To: mtd list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.53.0310141537460.12298@slop.cobalttech.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: DoC Grub booting problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've compiled grub v.0.93 with the lastest MTD patch and it pretty much
works. But it doesn't detect the DoC until I explicitly tell it its there.

Currently when it boots up it doesn't say anything about finding the DoC
and leaves me at a Grub shell prompt. If I type 'root (dc0,0)' it
comes up with the usual guff about finding the DoC and NFTL
partitions. Then I can type 'configfile /boot/grub/menu.lst' and it works
fine.

So my question is, how come it doesn't detect the DoC before searching for
the menu.lst file? So then it will boot without going to the Grub shell.

Thanks & regards, Mikey.
