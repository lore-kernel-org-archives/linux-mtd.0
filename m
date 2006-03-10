Received: from mxs2.siemens.at ([194.138.12.133])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FHhct-0004LS-Gh
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 08:25:58 -0500
Received: from vies1k7x.sie.siemens.at ([158.226.129.83])
	by mxs2.siemens.at  with ESMTP id k2ADPmoV013511
	for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2006 14:25:48 +0100
Received: from nets138a.ww300.siemens.net ([158.226.129.98])
	by vies1k7x.sie.siemens.at (8.12.11/8.12.1) with ESMTP id
	k2ADPcHE007173
	for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2006 14:25:48 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Mar 2006 14:25:41 +0100
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F13C4A0@budgw09a.ww300.siemens.net>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <linux-mtd@lists.infradead.org>
Subject: NAND + partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Is it possible to create partitions on a NAND flash card? And if that =
card is a SmartMedia Card?

I'd need to following layout:
partition0: boot loader                       128 KB
partition1: linux kernel boot params           64 KB
partition2: linux kernel
partition3: root filesystem (now it's cramfs but I'd like to change to =
JFFS2)   50 MB

Bye
--
Tamas Selmeci
Siemens PSE HU
Tel.   : +36-1-471-3861
Email  : tamas.selmeci@siemens.com
Address: H-1143 Budapest, Gizella ut 51-59
