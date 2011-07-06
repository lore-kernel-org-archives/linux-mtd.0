Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeTBe-0006yw-LB
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 14:34:47 +0000
Received: by iyn15 with SMTP id 15so7483302iyn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 07:34:43 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 6 Jul 2011 17:34:43 +0300
Message-ID: <CAALhOvBcocpY7igrzcsTyUPdPFZoJ+AkJ+X1LrWVBMjHs0CQLg@mail.gmail.com>
Subject: Attaching ubifs on a NOR flash
From: Alex Levin <s.alex.levin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

after ubiformatting the flash (NOR) and trying to attach ubi I get the
following error:

UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    262016 bytes
UBI: smallest flash I/O unit:    1
UBI: VID header offset:          64 (aligned 64)
UBI: data offset:                128
UBI warning: ubi_scan: 2 PEBs are corrupted
corrupted PEBs are: 0 1
UBI error: ubi_read_volume_table: the layout volume was not found
ubiattach: error!: cannot attach mtd2
           error 22 (Invalid argument)


I think it has something to do with ECC (that is absent on the NOR device).

Please advice,
Alex.
