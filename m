Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2500FC678D5
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Mar 2023 07:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjcxlT6OfWN6AKY4EFBGX6sVu+BosqHXI5yizwjIaa0=; b=eLlv/xa0NTIXNx
	mtbjEouOftC/Au+JVMlVVQcb3y+fjEdWmHY8DTshfuizZfoaRDU+v2uo2e/Ra7YqQQVSss33YliS8
	mfnLTPKakPJRnlgfRpnxv7E6KKotwuphdrbtnOLgMAtv35h3/qTFHP1DhdCmiYOYHaLhDI92Rj2OZ
	QKWXrCM2dQgNZwzw5ktD2KlU/BVt2KZAhJFimE044PXIsPecPOrTojaJOIO3smhrNzCaguY6HR5Qq
	HhtpZJZQ04NkQ6Jh3wf2KXRqrWfC3lRg+z2oRpJpiX2gMwCIAZ2QGLO5l72K//wB/UTv8vN2/ew1V
	wse5kiQ3kRevTyNSeL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYLtu-008TNs-46; Sat, 04 Mar 2023 07:01:50 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYLtq-008TNC-Gb
	for linux-mtd@lists.infradead.org; Sat, 04 Mar 2023 07:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677913306; x=1709449306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=276x+64R1mmWEpyYzI/lC8P7QkXqReujjrVKcTo9ET8=;
  b=XKw6Kb1C/bcEeYTXRirfY45QUVjVDsac5qhI9x4lcYVkFib0FtJa15eB
   b2LqnduptKwk+jq2aqjW79RBwGLTBhsSx5Fn9DKKKvRXddHA+QrJQBv+Z
   zDauC4X+DTp63g7C4p8oSXtmi6KkAVDq9v9ZPWv/xcYJoHgZ0NUudrrgh
   rfLTHpyBhqyHFtk/gfwC1lHzBXSsX8wJV/d4Ps6HxlFCGg0AV6JR/8UuB
   QgRrO3/IRai7YkG972CPddz0K0UStv4MEqqQ0D1PbjXaAHHzLX5YcrfCo
   uTyClMrG5bOWi2KbOBtauCZx2NDDX9TVwnfZEeZ4NrPH/3PF/tc3Tx3ya
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="335258132"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="335258132"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 23:01:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="677916980"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="677916980"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2023 23:01:39 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYLti-0001wa-17;
	Sat, 04 Mar 2023 07:01:38 +0000
Date: Sat, 4 Mar 2023 15:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, richard@nod.at,
	miquel.raynal@bootlin.com, s.hauer@pengutronix.de,
	george.kennedy@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, chengzhihao1@huawei.com,
	yi.zhang@huawei.com
Subject: Re: [PATCH] ubi: Fix failure attaching when vid_hdr offset equals to
 (sub)page size
Message-ID: <202303041438.JdnS3veD-lkp@intel.com>
References: <20230304053056.403325-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230304053056.403325-1-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_230146_605360_2E4D354A 
X-CRM114-Status: GOOD (  25.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Zhihao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rw-ubifs/next]
[also build test WARNING on linus/master rw-ubifs/fixes v6.2 next-20230303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhihao-Cheng/ubi-Fix-failure-attaching-when-vid_hdr-offset-equals-to-sub-page-size/20230304-130928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
patch link:    https://lore.kernel.org/r/20230304053056.403325-1-chengzhihao1%40huawei.com
patch subject: [PATCH] ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230304/202303041438.JdnS3veD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c9c8101e019bacf5c9a4e933c22888f07cc2f2c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhihao-Cheng/ubi-Fix-failure-attaching-when-vid_hdr-offset-equals-to-sub-page-size/20230304-130928
        git checkout c9c8101e019bacf5c9a4e933c22888f07cc2f2c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/mtd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041438.JdnS3veD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/ubi/build.c: In function 'io_init':
>> drivers/mtd/ubi/build.c:694:30: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
     694 |                 ubi_err(ubi, "Invalid VID header offset %d, VID header shift(%d)"
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/build.c:695:47: note: format string is defined here
     695 |                         " + VID header size(%lu) > VID header aligned size(%d).",
         |                                             ~~^
         |                                               |
         |                                               long unsigned int
         |                                             %u


vim +694 drivers/mtd/ubi/build.c

   578	
   579	/**
   580	 * io_init - initialize I/O sub-system for a given UBI device.
   581	 * @ubi: UBI device description object
   582	 * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
   583	 *
   584	 * If @ubi->vid_hdr_offset or @ubi->leb_start is zero, default offsets are
   585	 * assumed:
   586	 *   o EC header is always at offset zero - this cannot be changed;
   587	 *   o VID header starts just after the EC header at the closest address
   588	 *     aligned to @io->hdrs_min_io_size;
   589	 *   o data starts just after the VID header at the closest address aligned to
   590	 *     @io->min_io_size
   591	 *
   592	 * This function returns zero in case of success and a negative error code in
   593	 * case of failure.
   594	 */
   595	static int io_init(struct ubi_device *ubi, int max_beb_per1024)
   596	{
   597		dbg_gen("sizeof(struct ubi_ainf_peb) %zu", sizeof(struct ubi_ainf_peb));
   598		dbg_gen("sizeof(struct ubi_wl_entry) %zu", sizeof(struct ubi_wl_entry));
   599	
   600		if (ubi->mtd->numeraseregions != 0) {
   601			/*
   602			 * Some flashes have several erase regions. Different regions
   603			 * may have different eraseblock size and other
   604			 * characteristics. It looks like mostly multi-region flashes
   605			 * have one "main" region and one or more small regions to
   606			 * store boot loader code or boot parameters or whatever. I
   607			 * guess we should just pick the largest region. But this is
   608			 * not implemented.
   609			 */
   610			ubi_err(ubi, "multiple regions, not implemented");
   611			return -EINVAL;
   612		}
   613	
   614		if (ubi->vid_hdr_offset < 0)
   615			return -EINVAL;
   616	
   617		/*
   618		 * Note, in this implementation we support MTD devices with 0x7FFFFFFF
   619		 * physical eraseblocks maximum.
   620		 */
   621	
   622		ubi->peb_size   = ubi->mtd->erasesize;
   623		ubi->peb_count  = mtd_div_by_eb(ubi->mtd->size, ubi->mtd);
   624		ubi->flash_size = ubi->mtd->size;
   625	
   626		if (mtd_can_have_bb(ubi->mtd)) {
   627			ubi->bad_allowed = 1;
   628			ubi->bad_peb_limit = get_bad_peb_limit(ubi, max_beb_per1024);
   629		}
   630	
   631		if (ubi->mtd->type == MTD_NORFLASH)
   632			ubi->nor_flash = 1;
   633	
   634		ubi->min_io_size = ubi->mtd->writesize;
   635		ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
   636	
   637		/*
   638		 * Make sure minimal I/O unit is power of 2. Note, there is no
   639		 * fundamental reason for this assumption. It is just an optimization
   640		 * which allows us to avoid costly division operations.
   641		 */
   642		if (!is_power_of_2(ubi->min_io_size)) {
   643			ubi_err(ubi, "min. I/O unit (%d) is not power of 2",
   644				ubi->min_io_size);
   645			return -EINVAL;
   646		}
   647	
   648		ubi_assert(ubi->hdrs_min_io_size > 0);
   649		ubi_assert(ubi->hdrs_min_io_size <= ubi->min_io_size);
   650		ubi_assert(ubi->min_io_size % ubi->hdrs_min_io_size == 0);
   651	
   652		ubi->max_write_size = ubi->mtd->writebufsize;
   653		/*
   654		 * Maximum write size has to be greater or equivalent to min. I/O
   655		 * size, and be multiple of min. I/O size.
   656		 */
   657		if (ubi->max_write_size < ubi->min_io_size ||
   658		    ubi->max_write_size % ubi->min_io_size ||
   659		    !is_power_of_2(ubi->max_write_size)) {
   660			ubi_err(ubi, "bad write buffer size %d for %d min. I/O unit",
   661				ubi->max_write_size, ubi->min_io_size);
   662			return -EINVAL;
   663		}
   664	
   665		/* Calculate default aligned sizes of EC and VID headers */
   666		ubi->ec_hdr_alsize = ALIGN(UBI_EC_HDR_SIZE, ubi->hdrs_min_io_size);
   667		ubi->vid_hdr_alsize = ALIGN(UBI_VID_HDR_SIZE, ubi->hdrs_min_io_size);
   668	
   669		dbg_gen("min_io_size      %d", ubi->min_io_size);
   670		dbg_gen("max_write_size   %d", ubi->max_write_size);
   671		dbg_gen("hdrs_min_io_size %d", ubi->hdrs_min_io_size);
   672		dbg_gen("ec_hdr_alsize    %d", ubi->ec_hdr_alsize);
   673		dbg_gen("vid_hdr_alsize   %d", ubi->vid_hdr_alsize);
   674	
   675		if (ubi->vid_hdr_offset == 0)
   676			/* Default offset */
   677			ubi->vid_hdr_offset = ubi->vid_hdr_aloffset =
   678					      ubi->ec_hdr_alsize;
   679		else {
   680			ubi->vid_hdr_aloffset = ubi->vid_hdr_offset &
   681							~(ubi->hdrs_min_io_size - 1);
   682			ubi->vid_hdr_shift = ubi->vid_hdr_offset -
   683							ubi->vid_hdr_aloffset;
   684		}
   685	
   686		/*
   687		 * Memory allocation for VID header is ubi->vid_hdr_alsize
   688		 * which is described in comments in io.c.
   689		 * Make sure VID header shift + UBI_VID_HDR_SIZE not exceeds
   690		 * ubi->vid_hdr_alsize, so that all vid header operations
   691		 * won't access memory out of bounds.
   692		 */
   693		if ((ubi->vid_hdr_shift + UBI_VID_HDR_SIZE) > ubi->vid_hdr_alsize) {
 > 694			ubi_err(ubi, "Invalid VID header offset %d, VID header shift(%d)"
   695				" + VID header size(%lu) > VID header aligned size(%d).",
   696				ubi->vid_hdr_offset, ubi->vid_hdr_shift,
   697				UBI_VID_HDR_SIZE, ubi->vid_hdr_alsize);
   698			return -EINVAL;
   699		}
   700	
   701		/* Similar for the data offset */
   702		ubi->leb_start = ubi->vid_hdr_offset + UBI_VID_HDR_SIZE;
   703		ubi->leb_start = ALIGN(ubi->leb_start, ubi->min_io_size);
   704	
   705		dbg_gen("vid_hdr_offset   %d", ubi->vid_hdr_offset);
   706		dbg_gen("vid_hdr_aloffset %d", ubi->vid_hdr_aloffset);
   707		dbg_gen("vid_hdr_shift    %d", ubi->vid_hdr_shift);
   708		dbg_gen("leb_start        %d", ubi->leb_start);
   709	
   710		/* The shift must be aligned to 32-bit boundary */
   711		if (ubi->vid_hdr_shift % 4) {
   712			ubi_err(ubi, "unaligned VID header shift %d",
   713				ubi->vid_hdr_shift);
   714			return -EINVAL;
   715		}
   716	
   717		/* Check sanity */
   718		if (ubi->vid_hdr_offset < UBI_EC_HDR_SIZE ||
   719		    ubi->leb_start < ubi->vid_hdr_offset + UBI_VID_HDR_SIZE ||
   720		    ubi->leb_start > ubi->peb_size - UBI_VID_HDR_SIZE ||
   721		    ubi->leb_start & (ubi->min_io_size - 1)) {
   722			ubi_err(ubi, "bad VID header (%d) or data offsets (%d)",
   723				ubi->vid_hdr_offset, ubi->leb_start);
   724			return -EINVAL;
   725		}
   726	
   727		/*
   728		 * Set maximum amount of physical erroneous eraseblocks to be 10%.
   729		 * Erroneous PEB are those which have read errors.
   730		 */
   731		ubi->max_erroneous = ubi->peb_count / 10;
   732		if (ubi->max_erroneous < 16)
   733			ubi->max_erroneous = 16;
   734		dbg_gen("max_erroneous    %d", ubi->max_erroneous);
   735	
   736		/*
   737		 * It may happen that EC and VID headers are situated in one minimal
   738		 * I/O unit. In this case we can only accept this UBI image in
   739		 * read-only mode.
   740		 */
   741		if (ubi->vid_hdr_offset + UBI_VID_HDR_SIZE <= ubi->hdrs_min_io_size) {
   742			ubi_warn(ubi, "EC and VID headers are in the same minimal I/O unit, switch to read-only mode");
   743			ubi->ro_mode = 1;
   744		}
   745	
   746		ubi->leb_size = ubi->peb_size - ubi->leb_start;
   747	
   748		if (!(ubi->mtd->flags & MTD_WRITEABLE)) {
   749			ubi_msg(ubi, "MTD device %d is write-protected, attach in read-only mode",
   750				ubi->mtd->index);
   751			ubi->ro_mode = 1;
   752		}
   753	
   754		/*
   755		 * Note, ideally, we have to initialize @ubi->bad_peb_count here. But
   756		 * unfortunately, MTD does not provide this information. We should loop
   757		 * over all physical eraseblocks and invoke mtd->block_is_bad() for
   758		 * each physical eraseblock. So, we leave @ubi->bad_peb_count
   759		 * uninitialized so far.
   760		 */
   761	
   762		return 0;
   763	}
   764	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
