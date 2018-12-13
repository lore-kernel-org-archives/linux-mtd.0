Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXY6J-0000JS-G2
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 21:00:57 +0000
From: Richard Weinberger <richard@nod.at>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 Gabor Juhos <juhosg@openwrt.org>
Subject: Re: [PATCH] ubifs: fix default compression selection in ubifs
Date: Thu, 13 Dec 2018 22:00:41 +0100
Message-ID: <1748539.DXXeEdXEhI@blindfold>
In-Reply-To: <20181209171213.26264-1-hauke@hauke-m.de>
References: <20181209171213.26264-1-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Sonntag, 9. Dezember 2018, 18:12:13 CET schrieb Hauke Mehrtens:
> From: Gabor Juhos <juhosg@openwrt.org>
> 
> When ubifs is build without the LZO compressor and no compressor is
> given the creation of the default file system will fail. before
> selection the LZO compressor check if it is present and if not fall back
> to the zlib or none.
> 
> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Thanks for addressing this!

Thanks,
//richard
