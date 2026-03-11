Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF580112583A
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gj7pLhElM65Z7UR1f4nVgPQCLZs1tdCfFhnHjvy35eY=; b=4JQDWGoK7QGcMx
	u68C7hFo8MT2Kye7Yw7iG0+WxEp64cRsADVddIqxrAOXzXUl6fQlkPMh5twHS2JzMgQr+uv5VfGif
	fdazlYSiq4QvJpyiv8sEEx6aEBTZlQ56DomsT/ea/VmDsor6A5c+cSkhQNtp1Ugnof4wfg6Bx28vF
	toE7iSdxqAa+lYxom/lzyX3DKynJcjavK0jtbuWt0y4dHEp6WS3x7/lhUcxzRKOud7tr2qTlNhX7o
	JmPTKt9F/sZSfcqk8FLSCBEWc85tHveDYKiICAPHnG+1HPBQkoz9WlqIpkxXSKUUsWYhz7A7YMynU
	zfXwByar6+dVJpbnjryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRW-0000000Boh8-4Aht;
	Wed, 11 Mar 2026 15:25:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRT-0000000BofR-2FEI
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:25:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F3091C41585;
	Wed, 11 Mar 2026 15:26:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A953060004;
	Wed, 11 Mar 2026 15:25:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3900210369C28;
	Wed, 11 Mar 2026 16:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773242744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aGGOKQKLNv66wRtz6gvL44kOvwwfN/Yy1rPosvihq/c=;
	b=SHXElD26/U8f0kxunXG/0GWkSCM77Qn//1mquVyFrcHTYoxxQOiHxWWGhCSaciK9BVrMlY
	3nlQnbJRL/cr9hUwHB1JVWRS9GZIZjWR8SaSmqWteMclqywVaMJnhs2trZRSqymCFlZfuW
	p67QWLf15n+IqxjdlOf/S8sxGcU/6wNCQxM3Y09Z1sKj/mWH6dD+3z21d21SHqZVmAFJNG
	FbFKlRp8nvLU/S1dUL58miISHO69tHiqLiMU5mt0rovJT4vCWoAEw0oufEE1DfxooJwAF3
	hND7QawEjlQLfa6HiuMX5Uy7LmwdlgPCH/2VmexY+UslFz1xOaUjsD2dfB43pw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linusw@kernel.org, bbrezillon@kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260227014337.3938091-1-nichen@iscas.ac.cn>
References: <20260227014337.3938091-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] mtd: physmap_of_gemini: Fix disabled pinctrl state
 check
Message-Id: <177324274204.685435.10642743440992123297.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:25:42 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082547_712091_939ED744 
X-CRM114-Status: UNSURE (   6.35  )
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

T24gRnJpLCAyNyBGZWIgMjAyNiAwOTo0MzozNiArMDgwMCwgQ2hlbiBOaSB3cm90ZToKPiBUaGUg
Y29uZGl0aW9uIGZvciBjaGVja2luZyB0aGUgZGlzYWJsZWQgcGluY3RybCBzdGF0ZSBpbmNvcnJl
Y3RseSBjaGVja3MKPiBnZi0+ZW5hYmxlZF9zdGF0ZSBpbnN0ZWFkIG9mIGdmLT5kaXNhYmxlZF9z
dGF0ZS4gVGhpcyBjYXVzZXMgbWlzbGVhZGluZwo+IGVycm9yIG1lc3NhZ2VzIGFuZCBjb3VsZCBs
ZWFkIHRvIGluY29ycmVjdCBiZWhhdmlvciB3aGVuIG9ubHkgb25lIG9mIHRoZQo+IHBpbmN0cmwg
c3RhdGVzIGlzIGRlZmluZWQuCj4gCj4gRml4IHRoZSBjb25kaXRpb24gdG8gcHJvcGVybHkgY2hl
Y2sgZ2YtPmRpc2FibGVkX3N0YXRlLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0
aGFua3MhCgpbMS8xXSBtdGQ6IHBoeXNtYXBfb2ZfZ2VtaW5pOiBGaXggZGlzYWJsZWQgcGluY3Ry
bCBzdGF0ZSBjaGVjawogICAgICBjb21taXQ6IGI3YzA5ODIxODRiMDY2MWY1YjFiODA1ZjNhNTZm
MWJkMzc1N2I2M2UKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5n
aXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2Jv
dCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
