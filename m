Received: from 213-97-242-113.uc.nombres.ttd.es ([213.97.242.113] helo=rebirth.wojtyla.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vJk0-0006zi-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2002 16:10:33 +0100
Received: from devil.iqc-services.com (devil.iqc-services.local [192.168.197.3])
	by rebirth.wojtyla.org (8.11.6/8.8.7) with ESMTP id g3AFqBh22842
	for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2002 17:52:11 +0200
Message-Id: <5.1.0.14.2.20020410170818.01fc1b90@pop3.iqc-services.com>
Date: Wed, 10 Apr 2002 17:09:31 +0200
To: linux-mtd@lists.infradead.org
From: Marcos Lois =?iso-8859-1?Q?Berm=FAdez?= <marcos@iqc-services.com>
Subject: Messagre from MTD layer
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I try this, to put a test fs in my MTD device, for test purposes, i get=
 this:

/etc> expand ramfs.img /dev/mtd0
MTD_open
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
Last[3] is bfa7, datum is 4000
MTD_write
Last[3] is 8da7, datum is 7200
MTD_write
Last[3] is ffa7, datum is 20
MTD_write
Last[3] is 9a26, datum is 65c5
MTD_write
Last[3] is eba7, datum is 1400
MTD_write
Last[3] is fea7, datum is 100
MTD_write
Last[3] is 2ea7, datum is d174
MTD_write
Last[3] is ffa7, datum is 6c
MTD_write
Last[3] is fca7, datum is 300
MTD_write
Last[3] is c9a7, datum is 3600
MTD_write
Last[3] is a4, datum is ff1f
MTD_write
Last[3] is ff27, datum is 80
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is 24, datum is ffff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is ff24, datum is ff
MTD_write
Last[3] is 12a6, datum is ed41
MTD_write
Last[3] is 12a6, datum is ed41
MTD_write
Last[3] is 7fa5, datum is 803a
MTD_write
Last[3] is efa7, datum is 1000
MTD_write
Last[3] is eca7, datum is 1300
MTD_write
Last[3] is e9a7, datum is 1600
MTD_write
Last[3] is e6a7, datum is 1900
MTD_write
Last[3] is fea7, datum is 100
MTD_write
Last[3] is fda7, datum is 200
MTD_write
Last[3] is d1a7, datum is 2e00
MTD_write
Last[3] is fda7, datum is 200
MTD_write
Last[3] is ffa4, datum is 3
MTD_write
Last[3] is ffa7, datum is 64
MTD_close

------------------------
Last[3] is xxx, datanum is xxx <- What are this message?

----------------------------------------------------
Marcos Lois Berm=FAdez
marcos@iqc-services.com
IQC-Services.
Carretera provincial 60 - 1
36210 Vigo - Pontevedra
Tel: +34 986 281 830
Fax: +34 986 415 074
http://www.iqc-services.com
----------------------------------------------------
