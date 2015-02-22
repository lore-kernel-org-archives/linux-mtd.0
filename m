Received: from mail-db3on0055.outbound.protection.outlook.com ([157.55.234.55]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YPYGL-0002mo-Lk
 for linux-mtd@lists.infradead.org; Sun, 22 Feb 2015 15:16:06 +0000
From: Alexander Aronsky <alexander_ar@rad.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Resizing mtd partition
Date: Sun, 22 Feb 2015 15:15:38 +0000
Message-ID: <DBXPR03MB4327478CB0DB83D82615D9DE2280@DBXPR03MB432.eurprd03.prod.outlook.com>
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

Hi everyone,

I have to resize an existing mtd partition on a NOR flash of an embedded
device (PPC architecture) without losing the data on this partition.

To be more specific, I have /dev/mtd0 and /dev/mtd1 devices on my flash,
and I want to increase the size of the file system mounted on /dev/mtdblock=
0
at the expense of the one on /dev/mtdblock1. For example, eliminate the
/dev/mtd1 altogether and give the /dev/mtd0 all the available space on the
flash.

What is the proper way to do it?

With kind regards,
Alex
