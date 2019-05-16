Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CB6C04AAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 18:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC6420818
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 18:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MPRE+haw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC6420818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=breakpoint.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ibCFjE9p6rmjBRMr4CjSMw21U9o7V865pRiEcHXtQ4=; b=MPRE+hawtF9bSS
	KJ18cljeB4O3a8JCfQHvJHYR5ENMTn0VlLfaWZNKD6GLtODnUyJRC1Uep/0y3IFtT4d+DD1Bgf7tC
	2dVIkch+KkpfTt9/LqZXal9n8eKzPSeglIUdKWiyVsgHpPWWPRaDYRYt2Lw/JMYYaejPbT7TcyF50
	M1oTYAnKFAW4uap9pJDRpyyCPIoKCq9IdQWFsGqdx5h3GTto1guLP9Wm8GHnM2WZQD+syn9H1w0mX
	HWJXVTThA+XBYSquz4m/o1VOh0C0RzvTF+ZpqdNujIRHO/a/1dDpwNcOltP7quc5X/8CuhjKfk58i
	5GTHMxjSD5BosDKL3pKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRL4c-0002aU-2e; Thu, 16 May 2019 18:25:46 +0000
Received: from chamillionaire.breakpoint.cc ([146.0.238.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRL4Z-0001DJ-J2
 for linux-mtd@lists.infradead.org; Thu, 16 May 2019 18:25:44 +0000
Received: from bigeasy by Chamillionaire.breakpoint.cc with local (Exim 4.89)
 (envelope-from <sebastian@breakpoint.cc>)
 id 1hRL2S-0005Hj-Sf; Thu, 16 May 2019 20:23:33 +0200
Date: Thu, 16 May 2019 20:23:32 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ubifs: Add support for zstd compression.
Message-ID: <20190516182331.znkfibxah2pa5yaq@flow>
References: <20190515210202.21169-1-richard@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515210202.21169-1-richard@nod.at>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_112543_774702_37D0025F 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michele Dionisio <michele.dionisio@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAxOS0wNS0xNSAyMzowMjowMiBbKzAyMDBdLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6
CgpUaGF0IGlzIGEgbG90IGxlc3MgY29tcGFyZWQgdG8gd2hhdCBJIG5lZWRlZCBmb3IgbWtmcy51
Ymlmcy4gSSBqdXN0CnRlc3RlZCB0aGlzIGluIG5hbmRzaW0gYW5kIGl0IHdvcmtzIC0gSSBjYW4g
cmVhZCB0aGUgaW1hZ2UgZ2VuZXJhdGVkIGJ5Cm1rZnMuCgpBcyBmb3IgbXkgY29tcHJlc3Npb24g
bGV2ZWwgdGVzdGluZzogRG8gd2Ugd2FudCB0byBrZWVwIC1MIHBhcmFtZXRlciBvcgpyYXRoZXIg
ZHJvcCBpdD8gVGhlIG1heCBsZXZlbCBoYXJkbHkgbWFrZXMgYSBkaWZmZXJlbmNlIChhbmQgd2Ug
ZG9uJ3QKaGF2ZSBpdCAvIHVzZSBpdCBmb3IgTFpPL1pMSUIp4oCmCgpTZWJhc3RpYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
