Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7156C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 03:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoOL5Rs6GPBWqAjCWx5qH/4Qbep9gEoMSpnyRSaHctk=; b=tGBBvAbQxjiYdfirdUane0WAHS
	hnrgiyZnP140fhEE+cYZeYHSzBo7/e9nzuo1A4kTOZKW22KobiF8TQP0O9Ynbd6r0GhX7tBeEAjMC
	GUjpFqlHqc0sX3XZYggnByD5aFZca2bq/F9DGPJtKDXWQM3Q10GjPBN2dySvEOt+L4hL0RHQqp/e7
	1vMZfnB/iXd820PUmqPa5zFj1H81rUSQqmfl+3RUFwhfDeGpk5F5Ya3rNK98l4zS+3e3IsoUUmwxD
	mI5VSeSF7aXyU9dliRh+LmXHsbKfgOFmS3u0sUHItALm9yWaK1IgnJsH2fvytoRQl/Hur6gqUduR7
	oySwE5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Uau-0012al-CP; Wed, 12 Jan 2022 03:46:40 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Uaq-0012a1-7Y
 for linux-mtd@lists.infradead.org; Wed, 12 Jan 2022 03:46:38 +0000
Received: from kwepemi100007.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JYYL55rV8zZdY4;
 Wed, 12 Jan 2022 11:42:53 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100007.china.huawei.com (7.221.188.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 11:46:29 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 11:46:29 +0800
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
 <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
 <244238061.248369.1641886066066.JavaMail.zimbra@nod.at>
 <420c7567-8926-2e8b-4da0-a9bfc8379642@huawei.com>
 <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
 <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
 <1492514284.249466.1641909382867.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6815e4af-9b5b-313f-5828-644722dd4d1f@huawei.com>
Date: Wed, 12 Jan 2022 11:46:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1492514284.249466.1641909382867.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_194637_174538_9B5D9DCF 
X-CRM114-Status: GOOD (  15.75  )
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

>>> ubi_wl_init() is called in both cases, with and without fastmap.
>> I agree.
>>
>>> And ai->fastmap contains all anchor PEBs that scan_fast() found.
>>> This can be the most recent but also outdated anchor PEBs.
>> Is it exists a case that outdated fastmap PEBs are neither counted into
>> 'fmhdr->erase_peb_count' nor scanned into 'ai->fastmap' after attaching
>> by fastmap.
>>
> 
> [...]
>   
>> I think UBI attaches failed by fastmap if kernel goes here.
>> 1870                         err = erase_aeb(ubi, aeb, sync);
> 
> Hmm, I think the paranoia check in fastmap.c is too strict these days.
>          if (WARN_ON(count_fastmap_pebs(ai) != ubi->peb_count -
>                      ai->bad_peb_count - fm->used_blocks))
>                  goto fail_bad;
> 
> It does not account ai->fastmap. So if ai->fastmap contains old anchor PEBs
> this check will trigger and force falling back to scanning mode.
> With this check fixed, ubi_wl_init() will erase all old PEBs from ai->fastmap.
Forgive my stubbornness, I think this strict check is good, could you 
show me a process to trigger this WARN_ON, it would be nice to provide a 
reproducer.
I still insist the point(after my fix patch applied): All outdated 
fastmap PEBs are added into 'ai->fastmap'(full scanning case) or counted 
into 'fmhdr->erase_peb_count'(fast attached case).
> 
> So I agree that this code path is wonky and can be cleaned up. But please be
> extremely careful and give all your changes excessive testing with real workload
> and power-cuts.Let's list all power-cut cases during fastmap updateing(I tried to 
simulate some of them on nandsim), in theory, I think the WARN_ON check 
is okay and all outdated fastmap PEBs can be erased in next attaching:

ubi_update_fastmap:
1565         for (i = 1; i < new_fm->used_blocks; i++) {
1570                 if (!tmp_e) {
1571                         if (old_fm && old_fm->e[i]) {
                              /* sync erase old fm data PEBs */
power-cut!!!
1585                         } else {
                              /* async erase old fm data PEBs */
power-cut!!!
1595                         }
1596                 } else {
1599                         if (old_fm && old_fm->e[i]) {
			     /* async erase old fm data PEBs */
power-cut!!!
1603                         }
1604                 }
1605         }
1621         if (old_fm) {
1623                 if (!tmp_e) {
  		     /* sync erase old fm anchor PEB */
power-cut!!!
1638                 } else {
		     /* async erase old fm anchor PEB */
power-cut!!!
1644                 }
1645         } else {
1658         }
1660         ret = ubi_write_fastmap(ubi, new_fm);

ubi_write_fastmap:
1324         ret = ubi_io_write_vid_hdr(ubi, new_fm->e[0]->pnum, avbuf);
power-cut!!!
1345         for (i = 1; i < new_fm->used_blocks; i++) {
1350                 ret = ubi_io_write_vid_hdr(...);
power-cut!!!
1356         }

1358         for (i = 0; i < new_fm->used_blocks; i++) {
1359                 ret = ubi_io_write_data(...),
power-cut!!!
1366         }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
