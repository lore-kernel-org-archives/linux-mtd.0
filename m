Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDkuD-0008SW-8z
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 21:30:06 +0000
Received: by qyk32 with SMTP id 32so552650qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Nov 2010 14:30:03 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 3 Nov 2010 23:30:02 +0200
Message-ID: <AANLkTimKc_EtT6NEwbga8g7AKoGnDSt7UMQwgou_jCXD@mail.gmail.com>
Subject: ubi deadlock on .36+
From: Grazvydas Ignotas <notasas@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

there seems to be some issue with NAND on my OMAP3 board that causes
CRC errors on 2.6.36 and 2.6.37-rc1. Those seem to be triggering a bug
in UBI that makes it loop forever (or very long) printing this:

uncorrectable error :
UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
from PEB 0:512, read 512 bytes
uncorrectable error :
UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
from PEB 68:512, read 512 bytes
UBI: run torture test for PEB 68
UBI: PEB 68 passed torture test, do not mark it a bad


here is full log of one minute session, after which I killed power:
http://notaz.gp2x.de/misc/pnd/logs/linux_20101103_ubi_lockup


Gra=C5=BEvydas
