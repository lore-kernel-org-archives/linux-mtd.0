Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FB8EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 01:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52/NHfEPlUozOXUZO7DzGA7St1AZcgAdIv8IgES+JLg=; b=mKm3iNOKaA4PBm
	BNRAiUeKIiwAPngLqwFu1yUnqHQ9dkYkvzbO38/BCxHtVoFYs3ITaNZHBxH5rlNH1vkvBMAbGKVpl
	lw7BOPwgM3DEvftKQwUzCmsYICkC3ahjL05y7oj3rnHcPTBrypPDH+dUGC3kHAMqvMSIJFhT6MjhQ
	kh3lWTEgtfD2w/OQkKpDBjfOzqZL+2wL4bdXEjhAsi6haTsG+dqoBhVDOgTgcvUYUGQ9kEfYVVjGD
	Iyi5ByP1bbHp3DKBVuPZe9BXIV/VoO8j4ZLoi10zbMAXXdo84NITaBG6vhkH+XDk5xS9KTl7ic4WO
	BajmxvMO5EDQQdv4QwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQHpJ-00DN7j-0E;
	Mon, 31 Jul 2023 01:36:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQHpF-00DN5x-0y
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 01:35:59 +0000
Received: from dggpeml100024.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RDglR6s8kzrRqN;
	Mon, 31 Jul 2023 09:34:43 +0800 (CST)
Received: from [10.174.176.83] (10.174.176.83) by
 dggpeml100024.china.huawei.com (7.185.36.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 09:35:43 +0800
Message-ID: <d9d56389-7409-79ae-6854-00ab8de7da4d@huawei.com>
Date: Mon, 31 Jul 2023 09:35:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mtd: fix use-after-free in mtd release
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Winkler, Tomas" <tomas.winkler@intel.com>,
	"Lubart, Vitaly" <vitaly.lubart@intel.com>
References: <20230727145758.3880967-1-alexander.usyskin@intel.com>
 <ZMKJRNDoQV8p0DH4@smile.fi.intel.com> <20230727172013.7c85c05d@xps-13>
 <ZMKUJbl7kFOfgKGg@smile.fi.intel.com> <20230727183611.37d01f51@xps-13>
 <CY5PR11MB63660B9CE604C0CFF2E088DAED04A@CY5PR11MB6366.namprd11.prod.outlook.com>
From: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
In-Reply-To: <CY5PR11MB63660B9CE604C0CFF2E088DAED04A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-Originating-IP: [10.174.176.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml100024.china.huawei.com (7.185.36.115)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_183557_527424_3F2B5195 
X-CRM114-Status: UNSURE (   3.75  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy83LzMwIDE5OjEwLCBVc3lza2luLCBBbGV4YW5kZXIg5YaZ6YGTOgo+IE1pcXVl
bCwgaXMgdGhpcyBwYXRjaCBoZWxwcyB3aXRoIHlvdXIgb3JpZ2luYWwgcHJvYmxlbSBvZiBkZXZp
Y2VzIG5vdCBmcmVlZD8KPiAKPiBaaGFuZywgaXMgdGhpcyBwYXRjaCBoZWxwcyB3aXRoIHlvdXIg
cHJvYmxlbSB3aXRoIEtBc2FuPwpBZnRlciB0aGlzIHBhdGNoIGFwcGxpZWQsIHRoZSBwcm9ibGVt
IGNhbiBzdGlsbCBiZSByZXByb2R1Y2VkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
