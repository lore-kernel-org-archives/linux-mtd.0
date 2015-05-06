Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq6OW-0007he-9B
 for linux-mtd@lists.infradead.org; Wed, 06 May 2015 20:58:17 +0000
Message-ID: <554A804B.2050003@nod.at>
Date: Wed, 06 May 2015 22:57:47 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] UBI: block: Add missing cache flushes
References: <1429705853-23872-1-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1429705853-23872-1-git-send-email-ezequiel.garcia@imgtec.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@chromium.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.04.2015 um 14:30 schrieb Ezequiel Garcia:
> From: Kevin Cernekee <cernekee@chromium.org>
> 
> Block drivers are responsible for calling flush_dcache_page() on each
> BIO request. This operation keeps the I$ coherent with the D$ on
> architectures that don't have hardware coherency support. Without this
> flush, random crashes are seen when executing user programs from an ext4
> filesystem backed by a ubiblock device.
> 
> This patch is based on the change implemented in commit 2d4dc890b5c8
> ("block: add helpers to run flush_dcache_page() against a bio and a
> request's pages").
> 
> Fixes: 9d54c8a33eec ("UBI: R/O block driver on top of UBI volumes")
> Signed-off-by: Kevin Cernekee <cernekee@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

Applied to linux-ubifs.git/master.

Thanks a lot Kevin and Ezequiel!
//richard
