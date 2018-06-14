Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTLfh-0006OI-8t
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2018 06:23:51 +0000
From: Richard Weinberger <richard@nod.at>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/14] ubi: fastmap: Read PEB numbers more carefully
Date: Thu, 14 Jun 2018 08:23:27 +0200
Message-ID: <191143367.e1U5rnYpgk@blindfold>
In-Reply-To: <201806140802.6mK4vHdX%fengguang.wu@intel.com>
References: <20180613212344.11608-2-richard@nod.at>
 <201806140802.6mK4vHdX%fengguang.wu@intel.com>
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

Am Donnerstag, 14. Juni 2018, 03:04:40 CEST schrieb kbuild test robot:
> Hi Richard,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on mtd/master]
> [also build test WARNING on v4.17 next-20180613]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Richard-Weinberger/ubi-Fastmap-updates/20180614-052830
> base:   git://git.infradead.org/linux-mtd.git master
> reproduce:
>         # apt-get install sparse
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF=-D__CHECK_ENDIAN__
> 
> 
> sparse warnings: (new ones prefixed by >>)
> 
> >> drivers/mtd/ubi/fastmap.c:110:14: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] pnum @@    got  [usertype] pnum @@
>    drivers/mtd/ubi/fastmap.c:110:14:    expected restricted __be32 [usertype] pnum
>    drivers/mtd/ubi/fastmap.c:110:14:    got unsigned int
> >> drivers/mtd/ubi/fastmap.c:111:13: sparse: restricted __be32 degrades to integer
> >> drivers/mtd/ubi/fastmap.c:112:27: sparse: incorrect type in assignment (different base types) @@    expected int [signed] <noident> @@    got restricted __be3int [signed] <noident> @@
>    drivers/mtd/ubi/fastmap.c:112:27:    expected int [signed] <noident>
>    drivers/mtd/ubi/fastmap.c:112:27:    got restricted __be32 [usertype] pnum
>    drivers/mtd/ubi/fastmap.c:116:13: sparse: restricted __be32 degrades to integer
>    drivers/mtd/ubi/fastmap.c:116:25: sparse: restricted __be32 degrades to integer
>    drivers/mtd/ubi/fastmap.c:121:27: sparse: incorrect type in assignment (different base types) @@    expected int [signed] <noident> @@    got restricted __be3int [signed] <noident> @@
>    drivers/mtd/ubi/fastmap.c:121:27:    expected int [signed] <noident>
>    drivers/mtd/ubi/fastmap.c:121:27:    got restricted __be32 [usertype] pnum
>    drivers/mtd/ubi/fastmap.c:604:23: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] max_sqnum @@    got nsigned long long [unsigned] max_sqnum @@
>    drivers/mtd/ubi/fastmap.c:604:23:    expected unsigned long long [unsigned] max_sqnum
>    drivers/mtd/ubi/fastmap.c:604:23:    got restricted __be64 [usertype] sqnum
>    drivers/mtd/ubi/fastmap.c:1075:17: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] tmp_crc @@    got  [usertype] tmp_crc @@
>    drivers/mtd/ubi/fastmap.c:1075:17:    expected restricted __be32 [usertype] tmp_crc
>    drivers/mtd/ubi/fastmap.c:1075:17:    got unsigned int
>    drivers/mtd/ubi/fastmap.c:1077:13: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] crc @@    got  [usertype] crc @@
>    drivers/mtd/ubi/fastmap.c:1077:13:    expected restricted __be32 [usertype] crc
>    drivers/mtd/ubi/fastmap.c:1077:13:    got unsigned int
>    drivers/mtd/ubi/fastmap.c:1086:22: sparse: incorrect type in assignment (different base types) @@    expected restricted __be64 [usertype] sqnum @@    got unsigned lonrestricted __be64 [usertype] sqnum @@
>    drivers/mtd/ubi/fastmap.c:1086:22:    expected restricted __be64 [usertype] sqnum
>    drivers/mtd/ubi/fastmap.c:1086:22:    got unsigned long long [unsigned] [assigned] sqnum
> 
> vim +110 drivers/mtd/ubi/fastmap.c
> 
>    103	
>    104	static bool read_pnum(struct ubi_device *ubi, struct ubi_attach_info *ai,
>    105			     __be32 pnum, int *out_pnum)
>    106	{
>    107		int ret = true;
>    108		int max_pnum = ubi->peb_count;
>    109	
>  > 110		pnum = be32_to_cpu(pnum);
>  > 111		if (pnum == UBI_UNKNOWN) {
>  > 112			*out_pnum = pnum;
>    113			goto out;
>    114		}

Okay, let's use a new variable of type int instead of reusing pnum.

Thanks,
//richard
