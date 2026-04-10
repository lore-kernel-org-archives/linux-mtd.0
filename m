Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30777F36BAA
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 04:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4hz1hwORRHZxPnPHTXoNOSfQii12a1K5E9oYmdEhSI=; b=xp3PJpAIeUUCd/
	1k5/JCGBiG6CRFzHJ9tY2GHykjUvp4dpe9in5vOKeMXh5JF6W7D3bobvb9IC7QlJZmvPxuZL0BvNe
	RCjz12USfd7fF1T1D7imEjUtBa8HA/WPrA5Eyt0Wj+Q/B8ls9Jtv4dTyY5MwcD/qbS6v6VZb5PLaV
	W3YFyglPcZoo/EoCRxtY5oepzAx4Ar8nd6+WF2PvWXKsT5IH8V2EXfBbiEH3dqbCSn9O+h3rMUtQK
	I9ACEz1HX1m7zijm/+1kNuNYnl/rdXkBn0/4WBOztgnDNuTPpOIAAKWgV8bVv/3eVHHtOuUjLj7Vr
	4/1sCGRaSBc8/iuHEPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3eV-0000000Bb37-3nyZ;
	Fri, 10 Apr 2026 04:39:31 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3eR-0000000Bb2T-3xHH
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 04:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1775795968; x=1807331968;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sjGWn7+fy9yPuoagO7nCCICEsLk1p9rQMDNZOLFAsWc=;
  b=DV0g6W4itW68p3b1yAbwzBKHTV2NamOwMrZ1UZp74Oiffn9Owh8S+ZuB
   pBecWczJzg4gxPfbk9aWPdxDFfTsLlLfqs8q7tuXghIGv6SwKFLdbZ1Ly
   kuCdJDbQAcPdVlJqUViQtPNo/Z9HRcVv3EKUsWvtlDSSh9fM/2W1jQ9QQ
   A=;
X-CSE-ConnectionGUID: vCb3euiaRpmJ27qRWl8dQw==
X-CSE-MsgGUID: 12F2J5gTRHOi5SmBW2dqzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="125399480"
X-IronPort-AV: E=Sophos;i="6.23,170,1770591600"; 
   d="scan'208";a="125399480"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:39:24 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Apr
 2026 06:39:22 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE815.infineon.com
 (172.23.29.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Apr
 2026 06:39:22 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.037; Fri, 10 Apr 2026 06:39:22 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <corbet@lwn.net>
CC: <sean.anderson@linux.dev>, <thomas.petazzoni@bootlin.com>,
	<STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 17/27] mtd: spi-nor: debugfs: Add locking support
Thread-Topic: [PATCH v4 17/27] mtd: spi-nor: debugfs: Add locking support
Thread-Index: AQHcw4RelEXg6NHRDkGFCIUYpLBcj7XXwIdw
Date: Fri, 10 Apr 2026 04:39:22 +0000
Message-ID: <c8521e12e49040ce8683f81692644574@infineon.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
 <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-17-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-17-833dab5e7288@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_213928_453781_B2AB543B 
X-CRM114-Status: GOOD (  30.36  )
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

> The ioctl output may be counter intuitive in some cases. Asking for a
> "locked status" over a region that is only partially locked will return
> "unlocked" whereas in practice maybe the biggest part is actually
> locked.
> 
> Knowing what is the real software locking state through debugfs would be
> very convenient for development/debugging purposes, hence this proposal
> for adding an extra block at the end of the file: a "locked sectors"
> array which lists every section, if it is locked or not, showing both
> the address ranges and the sizes in numbers of blocks.
> 
> Here is an example of output, what is after the "sector map" is new.
> 
> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
> name            (null)
> id              ef a0 20 00 00 00
> size            64.0 MiB
> write size      1
> page size       256
> address nbytes  4
> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP |
> SOFT_RESET | NO_WP
> 
> opcodes
>  read           0xec
>   dummy cycles  6
>  erase          0xdc
>  program        0x34
>  8D extension   none
> 
> protocols
>  read           1S-4S-4S
>  write          1S-1S-4S
>  register       1S-1S-1S
> 
> erase commands
>  21 (4.00 KiB) [1]
>  dc (64.0 KiB) [3]
>  c7 (64.0 MiB)
> 
> sector map
>  region (in hex)   | erase mask | overlaid
>  ------------------+------------+---------
>  00000000-03ffffff |     [   3] | no
> 
> locked sectors
>  region (in hex)   | status   | #blocks
>  ------------------+----------+--------
>  00000000-03ffffff | unlocked | 1024
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Here are below more examples of output with various situations. The full
> output of the "params" content has been manually removed to only show
> what has been added and how it behaves.
> 
> $ flash_lock -l /dev/mtd0 0x3f00000 16
> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #blocks
>  ------------------+----------+--------
>  00000000-03efffff | unlocked | 1008
>  03f00000-03ffffff |   locked | 16
> $
> $ flash_lock -u /dev/mtd0 0x3f00000 8
> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #blocks
>  ------------------+----------+--------
>  00000000-03f7ffff | unlocked | 1016
>  03f80000-03ffffff |   locked | 8
> $
> $ flash_lock -u /dev/mtd0
> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #blocks
>  ------------------+----------+--------
>  00000000-03ffffff | unlocked | 1024
> $
> $ flash_lock -l /dev/mtd0
> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #blocks
>  ------------------+----------+--------
>  00000000-03ffffff |   locked | 1024
> $
> $ flash_lock -u /dev/mtd0 0x20000 1022
> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #blocks
>  ------------------+----------+--------
>  00000000-0001ffff |   locked | 2
>  00020000-03ffffff | unlocked | 1022
> ---
>  drivers/mtd/spi-nor/core.h    |  5 +++++
>  drivers/mtd/spi-nor/debugfs.c | 27 +++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/swp.c     | 16 ++++++++++++----
>  3 files changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 091eb934abe4..8717a0ad90f0 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -673,6 +673,7 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>                              const struct sfdp_bfpt *bfpt);
> 
>  void spi_nor_init_default_locking_ops(struct spi_nor *nor);
> +bool spi_nor_has_default_locking_ops(struct spi_nor *nor);
>  void spi_nor_try_unlock_all(struct spi_nor *nor);
>  void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr);
>  void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
> @@ -707,6 +708,10 @@ static inline bool spi_nor_needs_sfdp(const struct spi_nor *nor)
>         return !nor->info->size;
>  }
> 
> +u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor);
> +void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs, u64 *len);
> +bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr);
> +
>  #ifdef CONFIG_DEBUG_FS
>  void spi_nor_debugfs_register(struct spi_nor *nor);
>  void spi_nor_debugfs_shutdown(void);
> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
> index d0191eb9f879..298ce3d9e905 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
> 
>  #include <linux/debugfs.h>
> +#include <linux/math64.h>
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/spi/spi.h>
>  #include <linux/spi/spi-mem.h>
> @@ -77,10 +78,12 @@ static void spi_nor_print_flags(struct seq_file *s, unsigned long flags,
>  static int spi_nor_params_show(struct seq_file *s, void *data)
>  {
>         struct spi_nor *nor = s->private;
> +       unsigned int min_prot_len = spi_nor_get_min_prot_length_sr(nor);
>         struct spi_nor_flash_parameter *params = nor->params;
>         struct spi_nor_erase_map *erase_map = &params->erase_map;
>         struct spi_nor_erase_region *region = erase_map->regions;
>         const struct flash_info *info = nor->info;
> +       loff_t lock_start, lock_length;
>         char buf[16], *str;
>         unsigned int i;
> 
> @@ -159,6 +162,30 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
>                            region[i].overlaid ? "yes" : "no");
>         }
> 
> +       if (!spi_nor_has_default_locking_ops(nor))
> +               return 0;
> +
> +       seq_puts(s, "\nlocked sectors\n");
> +       seq_puts(s, " region (in hex)   | status   | #blocks\n");
> +       seq_puts(s, " ------------------+----------+--------\n");
> +
> +       spi_nor_get_locked_range_sr(nor, nor->dfs_sr_cache, &lock_start, &lock_length);
> +       if (!lock_length || lock_length == params->size) {
> +               seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, params->size - 1,
> +                          lock_length ? "  locked" : "unlocked",
> +                          div_u64(params->size, min_prot_len));
> +       } else if (!lock_start) {
> +               seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_length - 1,
> +                          "  locked", div_u64(lock_length, min_prot_len));
> +               seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_length, params->size - 1,
> +                          "unlocked", div_u64(params->size - lock_length, min_prot_len));
> +       } else {
> +               seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_start - 1,
> +                          "unlocked", div_u64(lock_start, min_prot_len));
> +               seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_start, params->size - 1,
> +                          "  locked", div_u64(lock_length, min_prot_len));
> +       }
> +
>         return 0;
>  }
>  DEFINE_SHOW_ATTRIBUTE(spi_nor_params);
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 7a6c2b8ef921..d75ed83eb787 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -32,7 +32,7 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
>                 return SR_TB_BIT5;
>  }
> 
> -static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
> +u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>  {
>         unsigned int bp_slots, bp_slots_needed;
>         /*
> @@ -53,8 +53,8 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>                 return sector_size;
>  }
> 
> -static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
> -                                       u64 *len)
> +void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
> +                                u64 *len)
>  {
>         u64 min_prot_len;
>         u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
> @@ -112,7 +112,7 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
>                 return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
>  }
> 
> -static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
> +bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
>  {
>         return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
>  }
> @@ -410,6 +410,9 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
>   * -is_locked(): Checks if the region is *fully* locked, returns false otherwise.
>   *               This feeback may be misleading because users may get an "unlocked"
>   *               status even though a subpart of the region is effectively locked.
> + *
> + * If in doubt during development, check-out the debugfs output which tries to
> + * be more user friendly.
>   */
>  static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
>         .lock = spi_nor_sr_lock,
> @@ -422,6 +425,11 @@ void spi_nor_init_default_locking_ops(struct spi_nor *nor)
>         nor->params->locking_ops = &spi_nor_sr_locking_ops;
>  }
> 
> +bool spi_nor_has_default_locking_ops(struct spi_nor *nor)
> +{
> +       return nor->params->locking_ops == &spi_nor_sr_locking_ops;
> +}
> +
>  static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, u64 len)
>  {
>         struct spi_nor *nor = mtd_to_spi_nor(mtd);
> 
> --
> 2.53.0

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
