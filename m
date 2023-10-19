Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAF7CDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 02:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzVibKRe6KfAvu4ve5ASeUUMJV1b/nVi8Zau2WI70mY=; b=ntO1S00xcoPeC3AFHq6SKXXX6c
	tyTtxqAM3XPPkjBR9NMEDhc6Yx8pI22G87R8xNWDRuawXgdIVzc97Wqw2mbSzswmHeRHpCpfU3o8i
	Q+r0p3wSuks5uVF8NcJq8HHZaVowEH6uOCNINnj+jLUC3vKXSwAR9ni2P+X0NmMX/BY6pqAki88P9
	yP6AzQD6lSmoyyxnLydgE2EVAX2x/tIvXdBhruEFqtQdoqJsZraqhM2VunDzqzGuDGa5Y5LYcO7ji
	FG/6su4phrvu4jclYIl2lv3fwf9or/QIjScUtqOEb8NIvOerqC4owmVl4mH5ggB7Lzz94fUAnhJUf
	C7UBVB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtIcq-00G7Fx-35;
	Thu, 19 Oct 2023 02:19:04 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtIci-00G7EE-0t
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 02:19:03 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S9rs722ckzRt6k;
	Thu, 19 Oct 2023 10:15:07 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 19 Oct 2023 10:18:48 +0800
Subject: Re: JFFS2 bind mount bug ?
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1876d96f398217d9e7d166a6cb4068dbd9e8c69a.camel@infinera.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1f877ec5-8bb7-0b49-f813-cc7c7b28aa31@huawei.com>
Date: Thu, 19 Oct 2023 10:18:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1876d96f398217d9e7d166a6cb4068dbd9e8c69a.camel@infinera.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_191856_526730_5347E196 
X-CRM114-Status: UNSURE (   5.06  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMy8xMC8xOCAyMjowNiwgSm9ha2ltIFRqZXJubHVuZCDQtLXAOgo+IEdvdCB0d28gSkZG
UzIgcGFydGl0aW9ucyAob24gLyBhbmQgL3ZhcikgYW5kIGRvCj4gICAgUFdST09UPS92YXIvb3MK
PiAgICBtb3VudCAtLWJpbmQgIiR7UFdST09UfSIvZXRjL3NoYWRvdyAvZXRjL3NoYWRvdwo+IHRo
ZW4gSSBtb2RpZnkgIiR7UFdST09UfSIvZXRjL3NoYWRvdyBhbmQgZXhwZWN0IGJvdGggIiR7UFdS
T09UfSIvZXRjL3NoYWRvdyAvZXRjL3NoYWRvdyB0bwo+IGJlIGVxdWFsIGJ1dCB0aGUgL2V0Yy9z
aGFkb3cgaXMgdW5jaGFuZ2VkIQo+IEtlcm5lbCBoZXJlIGlzIDUuMTUuMTI5Cj4gCgoKSXNuJ3Qg
Jy9ldGMvc2hhZG93JyBhIHJlZ3VsYXIgZmlsZT8gV2FzIG1vdW50aW5nIHN1Y2Nlc3NmdWw/CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
