Received: from ussvlmgty02.spansion.com ([12.151.36.113])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZmS2-0005kN-Ne
	for linux-mtd@lists.infradead.org; Fri, 16 Jul 2010 15:03:48 +0000
From: "Hoyler, Gernot" <Gernot.Hoyler@spansion.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 16 Jul 2010 07:53:29 -0700
Subject: CFI for 2x 16 bit NOR-FLash on one chipselect?
Message-ID: <D0271AF888369C4C85548462366DB24B3F524F05@US2K7EXMBPF1.spansion.com>
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

Hi Alexander,

yes, the AMD/Spansion NOF flash driver (cfi_cmdset_0002.c) supports a 2x16 =
setup.

Cheers,=20
Gernot

--
Dr. Gernot Hoyler, Customer Engineering, Spansion LLC
