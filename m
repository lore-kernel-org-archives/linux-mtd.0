Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffNOR-0002jx-9J
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 10:39:45 +0000
From: Richard Weinberger <richard@nod.at>
To: Per Forlin <per.forlin@axis.com>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Per Forlin <perfn@axis.com>
Subject: Re: [PATCH] UBI: Add volume read and write statistics
Date: Tue, 17 Jul 2018 12:39:27 +0200
Message-ID: <1986554.RvkB0gC8kI@blindfold>
In-Reply-To: <1531823419-8665-1-git-send-email-perfn@axis.com>
References: <1531823419-8665-1-git-send-email-perfn@axis.com>
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

Am Dienstag, 17. Juli 2018, 12:30:19 CEST schrieb Per Forlin:
> Simple read and write statistics.
> * Bytes read
> * Bytes written
> * Number of reads
> * Number of writes
> 
> This is useful to find out how the storage is being utilized.
> For block devices this already exists via /proc/diskstats.
> The intention of this patch is to add similar stats
> for UBI as well.

Why on UBI level and not MTD?

Thanks,
//richard
