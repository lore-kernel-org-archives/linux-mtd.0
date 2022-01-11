Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0458EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVi7TWUWQTXf4/5rbqQxOf72jhCh5cTsFBGeqTHl5I0=; b=hwdcmLBH7CMQA7eA1kBl7TUAa0
	9a3htt7US1QHL7odbAMUgbxVnFj5ojMg8e3CyPOzCOzeuGIK3VLLv7ume4UmU3e+UTGKGt6juNSQB
	3FbNGwYzGHzfoQSv9lHrRI05ymNBNPqoELgYvSsJJd8Nyc4OWDySwFUraA3w88xHUmRf5uuc6AGbu
	AaAXJPNUJ5Ox/8gyjuATJtDCeitqFO1p+qZ6VlUrUSpqkj/jVHfohcMU5VOepkMT9mhCnavZXSF6O
	VvFSK/R45PTEesHrJc/gGFjmrI/ltB2ImDoIxyOV1a4Dbo+C80Vya0txHMcFSQzmwWwYVBaETaN5x
	jTifMG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7H84-00GOgi-MJ; Tue, 11 Jan 2022 13:24:00 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7H81-00GOf7-3z
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 13:23:58 +0000
Received: from kwepemi100005.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JYBGC3qzVzccRY;
 Tue, 11 Jan 2022 21:23:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100005.china.huawei.com (7.221.188.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 21:23:53 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 21:23:53 +0800
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
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
Date: Tue, 11 Jan 2022 21:23:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_052357_350642_EAE47AED 
X-CRM114-Status: UNSURE (   6.87  )
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

5ZyoIDIwMjIvMS8xMSAxOTo1NywgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiB1Ymlfd2xf
aW5pdCgpIGlzIGNhbGxlZCBpbiBib3RoIGNhc2VzLCB3aXRoIGFuZCB3aXRob3V0IGZhc3RtYXAu
CkkgYWdyZWUuCgo+IEFuZCBhaS0+ZmFzdG1hcCBjb250YWlucyBhbGwgYW5jaG9yIFBFQnMgdGhh
dCBzY2FuX2Zhc3QoKSBmb3VuZC4KPiBUaGlzIGNhbiBiZSB0aGUgbW9zdCByZWNlbnQgYnV0IGFs
c28gb3V0ZGF0ZWQgYW5jaG9yIFBFQnMuCklzIGl0IGV4aXN0cyBhIGNhc2UgdGhhdCBvdXRkYXRl
ZCBmYXN0bWFwIFBFQnMgYXJlIG5laXRoZXIgY291bnRlZCBpbnRvIAonZm1oZHItPmVyYXNlX3Bl
Yl9jb3VudCcgbm9yIHNjYW5uZWQgaW50byAnYWktPmZhc3RtYXAnIGFmdGVyIGF0dGFjaGluZyAK
YnkgZmFzdG1hcC4KCjE4NTMgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHViaS0+bG9va3Vw
dGJsW2FlYi0+cG51bV0pIAoKMTg1NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOyAKCjE4NTUgCgoxODU2ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIAoKMTg1NyAg
ICAgICAgICAgICAgICAgICAgICAgICAgKiBUaGUgZmFzdG1hcCB1cGRhdGUgY29kZSBtaWdodCBu
b3QgZmluZCBhIApmcmVlIFBFQiBmb3IKMTg1OCAgICAgICAgICAgICAgICAgICAgICAgICAgKiB3
cml0aW5nIHRoZSBmYXN0bWFwIGFuY2hvciB0byBhbmQgdGhlbiAKcmV1c2VzIHRoZQoxODU5ICAg
ICAgICAgICAgICAgICAgICAgICAgICAqIGN1cnJlbnQgZmFzdG1hcCBhbmNob3IgUEVCLiBXaGVu
IHRoaXMgClBFQiBnZXRzIGVyYXNlZAoxODYwICAgICAgICAgICAgICAgICAgICAgICAgICAqIGFu
ZCBhIHBvd2VyIGN1dCBoYXBwZW5zIGJlZm9yZSBpdCBpcyAKd3JpdHRlbiBhZ2FpbiB3ZQoxODYx
ICAgICAgICAgICAgICAgICAgICAgICAgICAqIG11c3QgbWFrZSBzdXJlIHRoYXQgdGhlIGZhc3Rt
YXAgYXR0YWNoIApjb2RlIGRvZXNuJ3QKMTg2MiAgICAgICAgICAgICAgICAgICAgICAgICAgKiBm
aW5kIGFueSBvdXRkYXRlZCBmYXN0bWFwIGFuY2hvcnMsIGhlbmNlIAp3ZSBlcmFzZSB0aGUKMTg2
MyAgICAgICAgICAgICAgICAgICAgICAgICAgKiBvdXRkYXRlZCBmYXN0bWFwIGFuY2hvciBQRUJz
IApzeW5jaHJvbm91c2x5IGhlcmUuCjE4NjQgICAgICAgICAgICAgICAgICAgICAgICAgICovIAoK
MTg2NSAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYWViLT52b2xfaWQgPT0gVUJJX0ZNX1NC
X1ZPTFVNRV9JRCkgCgoxODY2ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3luYyA9
IHRydWU7CgpJIHRoaW5rIFVCSSBhdHRhY2hlcyBmYWlsZWQgYnkgZmFzdG1hcCBpZiBrZXJuZWwg
Z29lcyBoZXJlLgoxODcwICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IGVyYXNlX2FlYih1
YmksIGFlYiwgc3luYyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
