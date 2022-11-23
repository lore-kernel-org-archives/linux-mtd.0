Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E00BC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CEpZeprYaUtBzNrd964lNATOtdLs2RKrcCQV2r7bzss=; b=B2XlHNianuZIILafHoJsCmbOlS
	z1wbv4RW9BYOCcP8d/ZKkcXADnX2gSDCt9Ue+COUgcWd4TGpB5U59ImHvRu5cssLrKMG3F07OV/2Z
	XioGlsCQKd7XSU1WsA0oknrqCm+Lsuntx+yLD60oNFxqeQIbq1hDNilPn0eV6JSjOYAGZeMCIYb2j
	sNcZBTC+cgrNJJF5l0B/taszEJCW23H1x8d7C726B8XZQ33xargHFYjq3S3VDtrk6MsGKwPEuFUkL
	NbdCFVj0KRpJiRYnZ2gCk4CmK7b6HLjnazQfCEXq4ov8YajvuILidn6wolvyAc9zWALZzu6n4w7zR
	13f1qSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkIR-00FDd9-PC; Wed, 23 Nov 2022 07:35:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkIO-00FDYj-Fo
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 07:35:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 72E6663E5148;
	Wed, 23 Nov 2022 08:35:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9EFN1IRcMIeV; Wed, 23 Nov 2022 08:35:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E37EF63E515B;
	Wed, 23 Nov 2022 08:35:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nBXtOD2zi7y0; Wed, 23 Nov 2022 08:35:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C3C0163E5148;
	Wed, 23 Nov 2022 08:35:39 +0100 (CET)
Date: Wed, 23 Nov 2022 08:35:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Lihua <hucool.lihua@huawei.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Wei Yongjun <weiyongjun1@huawei.com>, 
	yusongping <yusongping@huawei.com>
Message-ID: <1427885394.268278.1669188939670.JavaMail.zimbra@nod.at>
In-Reply-To: <ad8ff736-bbce-2ec3-301f-691401a80bd1@huawei.com>
References: <20221121111847.71648-1-hucool.lihua@huawei.com> <ad8ff736-bbce-2ec3-301f-691401a80bd1@huawei.com>
Subject: Re: [PATCH v2] ubifs: Fix build errors as symbol undefined
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix build errors as symbol undefined
Thread-Index: Syve/GRFazr/6Fr3vH7Qg++v1/6ndA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_233548_698326_DAE33642 
X-CRM114-Status: UNSURE (   3.03  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkxpaHVhIiA8aHVjb29sLmxp
aHVhQGh1YXdlaS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiU2FzY2hh
IEhhdWVyIiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc+LCAiV2VpIFlvbmdqdW4iCj4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+
LCAieXVzb25ncGluZyIgPHl1c29uZ3BpbmdAaHVhd2VpLmNvbT4KPiBHZXNlbmRldDogTWl0dHdv
Y2gsIDIzLiBOb3ZlbWJlciAyMDIyIDA0OjI5OjA0Cj4gQmV0cmVmZjogUmU6IFtQQVRDSCB2Ml0g
dWJpZnM6IEZpeCBidWlsZCBlcnJvcnMgYXMgc3ltYm9sIHVuZGVmaW5lZAoKPiBwaW5nCgpXaGls
ZSBJJ20gcGVyZmVjdGx5IGZpbmUgd2l0aCBwaW5naW5nLCBiZWNhdXNlIEknbSBtb3JlIGJ1c3kg
dGhhbiBJIHdhbnQgdG8sCnBpbmdpbmcgYWZ0ZXIgbGVzcyB0aGFuIDQ4IGhvdXJzIGlzIGEgbGl0
dGxlIGFnZ3Jlc3NpdmUuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
