Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904C8C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2yES+BqtkUwm1QTG5LGxbvwZvCF2F04CWiPWriiofAM=; b=nNHk+EJPiNbIcmynj0d3QFLzQX
	vCrWaFD0VeztaTr35dRhD+cpFhso3DzTCxeYe+miB1Y9KcHSThk+rCpRBWiHrCpnu+Nayo28HLJhe
	aLL0PKUqWSBkcpb2E88rJ67OHB+L35gidC7vnpWEfOF2KV/ibV1qWAZxVy78dGhwjXh30fZ78A8Sl
	8NDfpLZ86fLTLMclfzst9+VaEC1gwZKHBem6PU7aKfh2cOrOrwmHEzJSJTYexGK6XKIWB6mQb0AAZ
	hPyVlGefijTIVnaaHv96Q82NJWt66WZaD1l3t6SPZoV0SYhTxLxOm7G0WWYLIZ5JVBRjLaOerjpmi
	qladx9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phCYJ-00FCfx-03;
	Tue, 28 Mar 2023 16:52:07 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phCYF-00FCdx-0Z
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 16:52:04 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 64FC161989E6;
	Tue, 28 Mar 2023 18:51:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id rSqEHlFbiw2K; Tue, 28 Mar 2023 18:51:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A0DF061989F6;
	Tue, 28 Mar 2023 18:51:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id G1mmPBPF4NNz; Tue, 28 Mar 2023 18:51:56 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 75C9361989E6;
	Tue, 28 Mar 2023 18:51:56 +0200 (CEST)
Date: Tue, 28 Mar 2023 18:51:56 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Bang Li <libang.linuxer@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	stable <stable@vger.kernel.org>
Message-ID: <1646372169.361736.1680022316353.JavaMail.zimbra@nod.at>
In-Reply-To: <20230328163012.4264-1-libang.linuxer@gmail.com>
References: <20230328163012.4264-1-libang.linuxer@gmail.com>
Subject: Re: [PATCH v2] mtdblock: tolerate corrected bit-flips
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdblock: tolerate corrected bit-flips
Thread-Index: ouKfcIuIMflG9wXsCuCDxoFYiHDGng==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_095203_365970_3913F408 
X-CRM114-Status: UNSURE (   4.82  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkJhbmcgTGkiIDxsaWJhbmcu
bGludXhlckBnbWFpbC5jb20+Cj4gQW46ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVzaCBSYWdoYXZl
bmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc+LCAiQmFuZyBMaSIKPiA8bGliYW5nLmxpbnV4ZXJAZ21haWwuY29tPiwgInN0YWJsZSIg
PHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IERpZW5zdGFnLCAyOC4gTcOkcnog
MjAyMyAxODozMDoxMgo+IEJldHJlZmY6IFtQQVRDSCB2Ml0gbXRkYmxvY2s6IHRvbGVyYXRlIGNv
cnJlY3RlZCBiaXQtZmxpcHMKCj4gbXRkX3JlYWQoKSBtYXkgcmV0dXJuIC1FVUNMRUFOIGluIGNh
c2Ugb2YgY29ycmVjdGVkIGJpdC1mbGlwcy5UaGlzCj4gcGFydGljdWxhciBjb25kaXRpb24gc2hv
dWxkIG5vdCBiZSB0cmVhdGVkIGxpa2UgYW4gZXJyb3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFu
ZyBMaSA8bGliYW5nLmxpbnV4ZXJAZ21haWwuY29tPgo+IEZpeGVzOiBlNDdmNjg1ODdiODIgKCJt
dGQ6IGNoZWNrIGZvciBtYXhfYml0ZmxpcHMgaW4gbXRkX3JlYWRfb29iKCkiKQo+IENjOiA8c3Rh
YmxlQHZnZXIua2VybmVsLm9yZz4gIyB2My43Cj4gLS0tCgpBY2tlZC1ieTogUmljaGFyZCBXZWlu
YmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
