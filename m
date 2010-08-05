Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgtcG-0004pq-C6
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 06:07:46 +0000
Received: by fxm3 with SMTP id 3so3263890fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 23:07:43 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: fix the check for valid primary
	extension versions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100804193242.10954.14837.stgit@dev.siriade.com>
References: <20100804193242.10954.14837.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 09:07:40 +0300
Message-Id: <1280988460.1175.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gernot Hoyler <Gernot.Hoyler@spansion.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-08-04 at 21:36 +0200, Guillaume LECERF wrote:
> Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4 [1][2][3].
> Fix the check in cfi_cmdset_0002 accordingly.
> 
> [1] http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf, page 19
> [2] http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_100_20011201.pdf
> [3] http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf
> 
> Signed-off-by: Florian Fainelli <florian@openwrt.org>
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

Please, make it applicable to mtd-2.6.git / master tree and re-send.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
