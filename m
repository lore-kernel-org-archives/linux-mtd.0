Received: from mxs2.siemens.at ([194.138.12.133])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FHi7F-0005CQ-WA
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 08:57:23 -0500
Received: from vies1k7x.sie.siemens.at ([158.226.129.83])
	by mxs2.siemens.at  with ESMTP id k2ADvBrH023138
	for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2006 14:57:11 +0100
Received: from nets138a.ww300.siemens.net ([158.226.129.98])
	by vies1k7x.sie.siemens.at (8.12.11/8.12.1) with ESMTP id
	k2ADvBBR023613
	for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2006 14:57:11 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Mar 2006 14:57:10 +0100
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F23BBE5@budgw09a.ww300.siemens.net>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <linux-mtd@lists.infradead.org>
Subject: (no subject)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Yes it possible,
> You can use cmdpartion if it is present in the kernel, or static
partion.

Maybe this will be a silly question, but how can I create those
partitions on my SMC using PC-based Linux if I have a card reader? Is
cmdpartition for this purpose? (using vivi on the developer board I can
create partitions, but vivi is in close relationship with BonFS and it
keeps on creating BonFS for me - probably I should modify the
sources...)

And does anybody know why should BonFS be used if partitioning can be
solved without that too?

Bye
--
Tamas Selmeci
Siemens PSE HU
Tel.:    +36-1-471-3861
Email:   tamas.selmeci@siemens.com
Address: H-1143 Budapest, Gizella ut 51-59=20
