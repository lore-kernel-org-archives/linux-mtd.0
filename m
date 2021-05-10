Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDBBC43470
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:41:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63987610FA
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63987610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c4NRxK4QUezYtGUYXYfuPOA9mddXg25hwknxTqHllQU=; b=SaG/ILdx1AUdFBbjgQqJDSGpb
	iju8n1c7R3YRAcchRTQuPa5q63iGRpZESOLU1zwFm2CXGR3c3N708A/B1ytELxMDpKptO4/U9lvJf
	RLMWevNdj0njBg9RcPvKAVrZb6XEejM+o2+0BRNfk4J+SVNuLnKMhdyvwg+OAxfs4sKL7vPOqx4xF
	pZZHDLdxOQsCWJPE6VJ6OMG5On/eJr0VP0B1EgYtZi8zNTDKWbth+XU1R0fMV1MmZHk+kVeQP8jjY
	sFHXBJdFtt0XpJiTn/+w8K/j3dCmy8dQsErf1/6MdnDT8sa+hiNrIT/3wM4NXn5lGC0yuThJ1n28/
	PsxyYQF+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4Fg-00E793-W4; Mon, 10 May 2021 11:39:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3gX-00E1pw-7d
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 11:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=J3PXGLF2YkYCZXEkR63sT764T5glOrFLTG+/coFcn74=; b=Ow7uG6B/L+rXine8ePW0xCg7bv
 8UgErvgsbzS1PiQGmadPi3RqlkvjtXoANGa/nPo/vcSCzustRgt6CWoA/nDR4y2bV1aVKV3Kk0V3n
 R/7khK/VbmyaDruLMXTh+Iy6+5V7J1vinj/2/Lf5SXViKKKFbxAqeHs17aNxKeNQIVyhXpUBDbyyC
 U+3yzKRpaAD8k4u1V7LDcLtZZJrk2uOH/wTqadC6FwjJbuTTrwWIGsX08nCWkz81hgW+yB5IjReCH
 fTiih3bxz01reTU04bKOoJxXg0EF80Cxmvy+3c3mOS2dScpgudrP9e0CNNLqUuDVOWhoBbt68Skpj
 Rl10fKqQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3gU-008aZp-5E
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 11:02:47 +0000
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 87695200004;
 Mon, 10 May 2021 11:02:42 +0000 (UTC)
Date: Mon, 10 May 2021 13:02:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH V2] mtd: rawnand: qcom: avoid writing to obsolete register
Message-ID: <20210510130241.00d9c3aa@xps13>
In-Reply-To: <1620644206-2250-1-git-send-email-mdalam@codeaurora.org>
References: <1620644206-2250-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_040246_354957_D2FCA65D 
X-CRM114-Status: UNSURE (   7.35  )
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

Ck1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4gd3JvdGUgb24gTW9uLCAxMCBN
YXkgMjAyMQoxNjoyNjo0NiArMDUzMDoKCj4gUVBJQ19FQkkyX0VDQ19CVUZfQ0ZHIHJlZ2lzdGVy
IGdvdCBvYnNvbGV0ZSBmcm9tIFFQSUMgVjIuMCBvbndhcmRzLgo+IEF2b2lkIHdyaXRpbmcgdGhp
cyByZWdpc3RlciBpZiBRUElDIHZlcnNpb24gaXMgVjIuMCBvciBuZXdlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4gW1Yy
XQo+ICAqIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UKCkkgYWxyZWFkeSBhcHBsaWVkIHRoZSBwYXRj
aCB3aXRoIHRoZSBmaXhlZCB0aXRsZSwgYnV0IHRoYW5rcy4KCkNoZWVycywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
