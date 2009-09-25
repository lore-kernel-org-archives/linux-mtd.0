MIME-Version: 1.0
In-Reply-To: <771cded00909250457w19686a53obdc178488368dd43@mail.gmail.com>
References: <771cded00909250457w19686a53obdc178488368dd43@mail.gmail.com>
Date: Sat, 26 Sep 2009 01:04:47 +0800
Message-ID: <69f617130909251004y2a17cdetb45f6022a37b4249@mail.gmail.com>
Subject: Re: [PATCH 1/5] pxa3xx_nand: enable PXA3xx bad block management
From: Mok Keith <ek9852@gmail.com>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, kyungmin.park@samsung.com,
	Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Any reason to limit the max slot to 40 (PXA_MAX_SLOT). It seems the
bad block management scheme is not scalable and have a limitation of
up to 256M bytes flash size only. (256M, 128kB per block = 2048 blocks
= 40 bad blocks)

Also for the calibration of the 2% bad block area, according to most
NAND specifications (checked Samsung, Hynix, Micron), nand flash
vendor guarantee no more than 20 bad block per 1024 blocks and this
rule is apply linearly.

Would it be better to use the following otherwise when nand size is
greater than 256M the no of bad block entries is not matched to
specification:
instead of:
> +    entries = (entries * 2) / 100;

use:
+    entries = (entries * 10) / 512;

May I know what is the use of PXA_BEGIN_SLOT ?

Keith
