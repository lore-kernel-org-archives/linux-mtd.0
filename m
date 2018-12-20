Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZvpv-0001bd-CG
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 10:45:53 +0000
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] jffs2: Fix integer underflow in jffs2_rtime_compress
Date: Thu, 20 Dec 2018 11:45:37 +0100
Message-ID: <2142335.HPRDAJu19m@blindfold>
In-Reply-To: <cae86ca1-91f9-6728-df64-40580145220d@huawei.com>
References: <20181215162350.12489-1-richard@nod.at>
 <cae86ca1-91f9-6728-df64-40580145220d@huawei.com>
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

Am Donnerstag, 20. Dezember 2018, 11:43:08 CET schrieb Hou Tao:
> 
> On 2018/12/16 0:23, Richard Weinberger wrote:
> > The rtime compressor assumes that at least two bytes are
> > compressed.
> > If we try to compress just one byte, the loop condition will
> > wrap around and an out-of-bounds write happens.
> > 
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> >  fs/jffs2/compr_rtime.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > It seems that it doesn't incur any harm because the minimal allocated
> size will be 8-bytes and jffs2_rtime_compress() will write 2-bytes into
> the allocated buffer.

Are you sure about that? I saw odd kernel behavior and KASAN complained too.

Thanks,
//richard
