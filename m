Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRSd5-00046P-Vt
	for linux-mtd@lists.infradead.org; Sun, 03 Jan 2010 15:44:36 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "Bill Gatliff" <bgat@billgatliff.com>,
	"David Woodhouse" <dwmw2@infradead.org>
Date: Sun, 3 Jan 2010 07:44:19 -0800
Subject: RE: Can ID the NAND chip, but every erase block is bad?
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DFC17E79@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B3ED430.5040607@billgatliff.com>
	<1262426622.3181.5832.camel@macbook.infradead.org>
	<4B40A27A.30804@billgatliff.com>
In-Reply-To: <4B40A27A.30804@billgatliff.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Is there any way to instruct MTD to discard any previous bad block
> information, and reconstruct the bad block table from scratch?

You can use the config option that leaves the bad block markers alone in th=
e oob=20
and have linux quickly build the bad block table in RAM on bootup instead o=
f flash.=20
I think that it's risky to corrupt the bad block markers in the oob of the =
bad
block itself since a single accidental erasure can lose _all_ the bad block=
 markers
in one fell swoop and they can't be reconstructed without detailed knowledg=
e of the
factory testing algorithms and environmental test parameters. You could pos=
sibly
have redundant blocks for bad block tables in flash to handle this. If you =
need more=20
space for strong bch/reed solomon ecc bytes, you can truncate the 8 byte cl=
eanmarker=20
down to a byte or two using a custom oob layout map, and the multi-byte ecc=
 can skip
over the bad block marker.

Darwin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
