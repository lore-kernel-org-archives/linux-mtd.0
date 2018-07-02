Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZzDd-0000yV-Nn
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 13:50:45 +0000
Message-ID: <1530539396.469.98.camel@gmail.com>
Subject: Re: [PATCH v5 0/2] ubi: add possibility to skip CRC check for
 static UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Quentin Schulz <quentin.schulz@bootlin.com>, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com,  marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Date: Mon, 02 Jul 2018 16:49:56 +0300
In-Reply-To: <cover.ab725a3c64626915f8184e28937870f36684db61.1530524405.git-series.quentin.schulz@bootlin.com>
References: <cover.ab725a3c64626915f8184e28937870f36684db61.1530524405.git-series.quentin.schulz@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2018-07-02 at 11:43 +0200, Quentin Schulz wrote:
> Some users of static UBI volumes implement their own integrity check, thus
> making the volume CRC check done at open time useless. For instance, this
> is the case when one use the ubiblock + dm-verity + squashfs combination,
> where dm-verity already checks integrity of the block device but this time
> at the block granularity instead of verifying the whole volume.
> 
> Skipping this test drastically improves the boot-time.
> 
> mtd-utils patches are already merged. See:
> http://git.infradead.org/mtd-utils.git/commit/9095d213f536aec0f3c37f6666177f3b907afde7
> http://git.infradead.org/mtd-utils.git/commit/7b4a65a27d2621b58c634d02c6a068ed9562383c
> http://git.infradead.org/mtd-utils.git/commit/5e9bc0daa41d84ce5de81c4a1665d65f51893c10
> http://git.infradead.org/mtd-utils.git/commit/8ba21ab75b41a1f9a6e27eed3ea80c9829669c5a

For the whole patch-set,

Reviewed-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
