Received: from nf-out-0910.google.com ([64.233.182.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kl326-0002v1-1x
	for linux-mtd@lists.infradead.org; Wed, 01 Oct 2008 14:50:30 +0000
Received: by nf-out-0910.google.com with SMTP id d21so323226nfb.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Oct 2008 07:50:28 -0700 (PDT)
Message-ID: <1fc50b580810010750g5e817923of9a43f1caaa807da@mail.gmail.com>
Date: Wed, 1 Oct 2008 09:50:27 -0500
From: "Monte Copeland" <catboatmonte@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: gluebi char vs block devices
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

What is expected (correct) behavior when reading content of static UBI volumes?

/ # cat /sys/class/ubi/ubi0_6/name
kernel_0
/ # cat /sys/class/ubi/ubi0_6/data_bytes
3149958
/ # cat /dev/mtd/kernel_0 | wc -c
3149958
/ # cat /dev/mtdblock/kernel_0 | wc -c
3149824

On my older UBI platform, the byte count from the
mtdblock dev is truncated down to an even multiple
of 512.

Monte Copeland
Austin
