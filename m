Received: from [203.194.144.59] (helo=ns3.dns-hk.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1820s6-0002Mt-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2002 03:58:51 +0100
Received: from 203186230125.ctinets.com ([203.186.230.125] helo=paulmobile)
	by ns3.dns-hk.net with asmtp (Exim 3.36 #1)
	id 1820rw-0005aW-00
	for linux-mtd@lists.infradead.org; Thu, 17 Oct 2002 10:58:40 +0800
Message-ID: <004c01c27588$e24ffc50$bd00a8c0@paulmobile>
Reply-To: <paul@maypaul.com>
From: <paul@maypaul.com>
To: <linux-mtd@lists.infradead.org>
Subject: Bootup slow???
Date: Thu, 17 Oct 2002 10:57:03 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
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

Hi all,

 I have a problem about the bootup speed about the newest MTD code via CVS.
I use the old version (about 1 month ago) with linux-2.4.17  to implement
the NAND flash device in JFFS2 system. It is woking well and the speed is
very good. But when I update the code via CVS, the speed is very slow slow.
What is the different between the old one and new one? Is the ECC problem??
Any patch to improve it?

Thank you.

Paul
