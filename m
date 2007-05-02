Received: from mail2.metocean.com ([142.176.129.151] helo=metocean.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hj5if-00058n-O5
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 23:41:34 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: How to create BDTL partition on DOC2000 using docfdisk
Date: Wed, 2 May 2007 00:40:41 -0300
Message-ID: <5269FB0A43484A4AA1B7EE047BCBFAAD01BC8815@juno.MetoceanData.local>
From: "Charles Mao" <CMao@metocean.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,
=20
Is it possible to create BDTL partitions on DOC2000 using docfdisk? If
yes, how? Thanks.

The reason I want create BDTL partition is because INFTL module looking
for BDTL partition when I load the module.

Dmesg showing below:

INFTL: inftlcore.c $Revision: 1.19 $, inftlmount.c $Revision: 1.18 $
INFTL: Media Header sanity check failed: NoOfBDTLPartitions (0) =3D=3D =
0,
must be at least 1
INFTL: could not find valid boot record?
INFTL: could not mount device=20
