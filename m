Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnT5S-0008W5-MA
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 07:04:00 +0000
Received: from mail-irva-8.broadcom.com (mail-irva-8 [10.11.18.52]) by
	mail-irva-10.broadcom.com (Postfix) with ESMTP id 0572D2B0 for
	<linux-mtd@lists.infradead.org>; Wed, 8 Oct 2008 00:03:44 -0700 (PDT)
Received: from NT-SJCA-0752.brcm.ad.broadcom.com (nt-sjca-0752
	[10.16.192.222]) by mail-sj1-12.sj.broadcom.com (Postfix) with ESMTP id
	E00CB20501 for <linux-mtd@lists.infradead.org>; Wed, 8 Oct 2008
	00:03:40 -0700 (PDT)
From: "Ramgopal Kota" <rkota@broadcom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 8 Oct 2008 00:03:21 -0700
Subject: MTD Erase Size usage in JFFS2
Message-ID: <6C370B347C3FE8438C9692873287D2E1100B4BF956@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

our board is having a 8MB flash and we are using JFFS2 as a image storage.
Due to lead times we decided to use 4 vendors flash chips of same size, the=
y all work fine.
Each flash chip has different sector sizes.

 As part of  manufacturing  process, we took a working image on  one flash =
and burn it in all  different vendor flashes,
 due to sector size mishap  they are not working as intended.

I want to know if I can specify something similar to "-e" option in mkfs.jf=
fs2 where I can specify the block size.

Thanks and Regards,
Ramgopal Kota
