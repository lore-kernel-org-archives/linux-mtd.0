Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC65C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 02:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbAs3GaF15uFVj0keXUjJShQqp2SlcagNmEqFvhjThM=; b=zak/mLcO58YJRlaMJ8/IuoHYvF
	GYPwlj4yj6vs7B1EcfLVYnyHeyGlhAu7Qs0rmOjZDbXwtUQ4vLlpp+4fqa6uQYU8N4ugF3o0xQRDG
	3DXAzIgY2FZnEZQR7U7vlWDnygRWcB38I0R7NkeFx/FKkx8mbNA/ODAQGixGvAHHC9xsS/eMEIBC3
	Mrqzz4KKrii/NABbRebYl4fH5WdD+YtAAcTreVgIZ0vR1ImHkEaC4/xUsY2KE3wwvlvKo37IDP06/
	pk7DxsSiLhVpm76cO60/4J8S9PczvAGlJPQsz2DNzRDy43vnYBQjF6J3tpM3g5JEkAwazVDHqxOQl
	zgVA6PcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n77D8-00EL1Y-K1; Tue, 11 Jan 2022 02:48:34 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n77D5-00EL08-1O
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 02:48:33 +0000
Received: from kwepemi100001.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JXw8R2d0hz9s5k;
 Tue, 11 Jan 2022 10:47:19 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100001.china.huawei.com (7.221.188.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 10:48:26 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 10:48:25 +0800
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, mcoquelin stm32 <mcoquelin.stm32@gmail.com>, "kirill
 shutemov" <kirill.shutemov@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-13-chengzhihao1@huawei.com>
 <361758697.248157.1641857025490.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
Date: Tue, 11 Jan 2022 10:48:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <361758697.248157.1641857025490.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_184831_309640_F35C6661 
X-CRM114-Status: GOOD (  10.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,
> scan_ai->fastmap may contain also old fastmap PEBs.
> In the area < UBI_FM_MAX_START you can find outdated fastmap PEBs.
> e.g. after power-cut.
> That's why scan_ai->fastmap is copied into ai->fastmap.
> Later in ubi_wl_init() these outdated PEBs will get erased.
> So, you cannot remove this code.
I thought old fastmap PEBs(async erase works in ubi_update_fastmap()) 
will be counted into erase PEBs in the next attaching process, because I 
saw following code snippet in ubi_write_fastmap():
1260         list_for_each_entry(ubi_wrk, &ubi->works, list) { 

1261                 if (ubi_is_erase_work(ubi_wrk)) { 

1262                         wl_e = ubi_wrk->e; 

1263                         ubi_assert(wl_e); 

1264 

1265                         fec = (struct ubi_fm_ec *)(fm_raw + 
fm_pos);
1266 

1267                         fec->pnum = cpu_to_be32(wl_e->pnum); 

1268                         set_seen(ubi, wl_e->pnum, seen_pebs); 

1269                         fec->ec = cpu_to_be32(wl_e->ec); 

1270 

1271                         erase_peb_count++; 

1272                         fm_pos += sizeof(*fec); 

1273                         ubi_assert(fm_pos <= ubi->fm_size); 

1274                 } 

1275         } 

1276         fmh->erase_peb_count = cpu_to_be32(erase_peb_count);
Half-writing on fastmap will be recognized in scanning, and UBI 
fallbacks full scanning, So, I come up with two situations:
1. power-cut before new fastmap written, the old fastmap is completely 
saved until next attaching, and some free PEBs are written with new 
fastmap data. Luckly, fastmap anchor PEB's vid header is written first 
of all, bad fastmap will be returned by ubi_attach_fastmap() in next 
attaching.
2. power-cut after new fastmap written, the old fastmap PEBs will be 
added into 'ai->erase' list in next attaching.
Did I miss other possible circumstances?
> 
> But I fully agree with you that the fm->used_blocks > 1 case is not correct.
> I fear if scan_ai->fastmap contains old fastmap PEBs and fm->used_blocks is > 1
> we need to fall back to scanning mode while attaching.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
