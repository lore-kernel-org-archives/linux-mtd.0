Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZwpp-0006vO-Tb
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 10:45:20 +0000
From: Richard Weinberger <richard@nod.at>
To: Yufen Yu <yuyufen@huawei.com>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH] ubifs: Add zstd support
Date: Fri, 12 Jan 2018 11:45:49 +0100
Message-ID: <7790203.HFZG64yrZx@blindfold>
In-Reply-To: <20180112092421.22095-1-yuyufen@huawei.com>
References: <20180112092421.22095-1-yuyufen@huawei.com>
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

Yufen Yu,

Am Freitag, 12. Januar 2018, 10:24:21 CET schrieb Yufen Yu:
> Add zstd compression and decompression support to ubifs. zstd at its
> fastest level compresses almost as well as zlib, while offering much
> faster compression and decompression, approaching lzo speeds.
> 
> This patch is based on the patch:
> 	https://patchwork.kernel.org/patch/9892631/
> 
> zstd source repository: https://github.com/facebook/zstd

Do you have numbers on how much we gain for UBIFS on a typical embedded 
device?

Thanks,
//richard
