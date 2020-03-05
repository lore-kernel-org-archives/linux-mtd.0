Return-Path: <SRS0=05/s=4W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19789C3F2CD
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2020 09:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1B2208CD
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2020 09:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u7dz1+GM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF1B2208CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+qzgy/jjXTIbAVDvhM9p3/OE4WoOocVBWiYmtWUAfww=; b=u7dz1+GMm4a256
	Knfb1cRObj3u0hBVbuMZNruladoTr6tKJ18bbTBNWscMyz97yzhN6lbxkvN24jcs6StoADE3Ca/oE
	c2mSO0/GgIG99DsDy7RIBAsMtYjn9HM3OTJ6Tado9TzrQOSSrkReT/R/gO88WKBzCMw6V5ZslmfOk
	jLhGQg2MmOcCPHRDtN0itUtarMTptrNsaCAxforDESO8/yzu5IqCJQ5XGS9K/bunLO8zDyUQva4Ib
	ha2qnxBSp80U8XOSxuHD1vHmOTGprp+B4jWw2X6AEEUYtUDAn13qhmC6veKNhLlRIWQ76/xRQaPJm
	uxAScTVOVQFG4mfoy4GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9mbG-0003Dx-1O; Thu, 05 Mar 2020 09:15:26 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9mb9-0002g1-Iv
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2020 09:15:21 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9E89F3C5D7818ADE1930;
 Thu,  5 Mar 2020 17:15:01 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Thu, 5 Mar 2020
 17:14:51 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
Subject: [PATCH v3 0/2] fix potential race between ubifs_tnc_locate() and GC
Date: Thu, 5 Mar 2020 17:22:03 +0800
Message-ID: <20200305092205.127758-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.25.0.4.g0ad7144999
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_011519_826253_6EBB00E5 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Carson.Li1@unisoc.com, Adrian Hunter <ext-adrian.hunter@nokia.com>,
 houtao1@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpUaGUgcGF0Y2hzZXQgdHJpZXMgdG8gZml4IHRoZSBwcm9ibGVtIHJlcG9ydGVkIGJ5IOad
juWCsuWCsiBbMV0uIEl0IGhhcHBlbnMKYmVjYXVzZSB0aGVyZSBhcmUgcmFjZXMgYmV0d2VlbiB1
Ymlmc190bmNfbG9jYXRlKCkgYW5kIEdDIHdoZW4KdWJpZnNfdG5jX2xvY2F0ZSgpIGZpbmRzIHRo
ZSB0YXJnZXQgTEVCIGlzIHVzZWQgYXMgd3JpdGUtYnVmZmVycyBvciBidWRzLgpBbmQgdGhlIHBh
dGNoc2V0IGZpeGVzIGl0IGJ5IG9ubHkgcmVhZGluZyB0aGUgbm9kZSBmcm9tIHdyaXRlLWJ1ZmZl
cgp3aGVuIHRoZSBub2RlIGlzIGZ1bGx5IGNvbnRhaW5lZCBpbiB3cml0ZS1idWZmZXIuCgpDb21t
ZW50cyBhcmUgd2VsY29tZS4KClJlZ2FyZHMsClRhbwoKLS0KdjM6CiAtLSBhZGQgTGluazogdGFn
CiAtLSBhZGQgVUJJRlNfQ0hLX0ZPUkNFX0RVTVBfQkFEX05PREUgZmxhZyBmb3IgZXJyb3IgbWVz
c2FnZSBjb250cm9sCgpbMV06IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LW10
ZC9tc2cxMDc3MS5odG1sCgpIb3UgVGFvICgyKToKICB1YmlmczogZmFjdG9yIG91dCBoZWxwZXIg
dWJpZnNfY2hlY2tfbm9kZV9idWYoKQogIHViaWZzOiByZWFkIG5vZGUgZnJvbSB3YnVmIHdoZW4g
aXQgZnVsbHkgc2l0cyBpbiB3YnVmCgogZnMvdWJpZnMvaW8uYyAgICB8IDEwOSArKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZnMvdWJpZnMvdG5jLmMgICB8
ICA4MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogZnMvdWJpZnMvdWJpZnMu
aCB8ICAgNSArKysKIDMgZmlsZXMgY2hhbmdlZCwgMTM2IGluc2VydGlvbnMoKyksIDU5IGRlbGV0
aW9ucygtKQoKCi0tIAoyLjI1LjAuNC5nMGFkNzE0NDk5OQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
