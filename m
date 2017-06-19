Received: from smtp1.ascom-ws.com ([195.81.148.76] helo=mail.ascom-ws.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dMwhm-0006Af-55
 for linux-mtd@lists.infradead.org; Mon, 19 Jun 2017 13:27:03 +0000
From: Danesh Daroui <Danesh.Daroui@ascom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: 4-bits ECC correction
Date: Mon, 19 Jun 2017 13:26:33 +0000
Message-ID: <39BC08CB3FF4C84CB6397533D4FC79097E94EE06@SEGOTEXCH02.ascom-Resource.ads>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

We are using a NAND flash memory which requires  4-bit ECC per 540 bytes. S=
ince this is usually done by the MCU in a circuit and our MCU supports only=
 1-bit ECC, I wanted to ask whether it is possible (or maybe it has been do=
ne) to implement 4-bit ECC at driver/UBI or UBIFS level for the cases like =
we have that hardware, that is not able to support higher levels of ECC?=20

Regards,

Danesh Daroui
