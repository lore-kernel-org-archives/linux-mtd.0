Received: from smtp1.altran.com ([194.98.79.72])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Scbsl-0002Jt-Ou
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 12:32:08 +0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
Subject: UBI and volume checksum
Date: Thu, 7 Jun 2012 14:21:53 +0200
Message-ID: <0D6614B1791E3B4C86DD3784FCD9B20617B90131@XMB-TODC-23.altranit.corp.altran.com>
From: "Giovanni Malfara'" <Giovanni.Malfara.ext@altran.it>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I need to verify that the UBI image once it has been written on the UBI
volume.
So I try to extract the content with the "dd" tool from the UBI bolume
and I calculate the checksum to be compared with the one of the original
UBI image.

My question is: is it always true? If I extract the content of the UBI
volume at any time (the fileystem is mounted read-only) , will the
checksum always the same? Will the data move from a PEB that has
bit-flips to a new one cause a difference in checksum?

Is this the best way to achieve this?

Thansk in advance.

--=20
Giovanni Malfar=E0
