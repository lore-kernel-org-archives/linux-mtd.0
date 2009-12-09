Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NIA7p-0000xh-N3
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 00:09:54 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 8 Dec 2009 16:09:34 -0800
Subject: UBIFS read-only rootfs needs 1 or more eraseblocks to mount
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DFAAE18A@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On a read-only UBIFS rootfs, why do you need at least 1 eraseblock? There i=
s nothing to replace since nothing is ever written to this partition on the=
 fly and a block that goes bad cannot be recovered anyways?

UBI error: ubi_eba_init_scan: no enough physical eraseblocks (0, need 1)
UBI error: ubi_init: cannot attach mtd6
UBI error: ubi_init: UBI error: cannot initialize UBI, error -28

Note that adding room for a single bad block PEB allows the mount to work, =
and you get a warning like this:
"UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB han=
dling, reserved 0, need 19"

It looks like the normal read/write code is reserving/requiring blocks that=
 the read-only mode doesn't actually use? All this is probably just a futur=
e suggestion to support read-only mode a little bit better with less block =
wastage.

Thanks.
Darwin
