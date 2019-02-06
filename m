Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEA7C169C4
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 08:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59ACF217F9
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 08:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nk/MukHs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xF4XjsJa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59ACF217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mfOw8yvUWtQJm0VRk3rTw5TDQf8qInDZCbTajlxWc0=; b=nk/MukHsZC0t+C
	3NoHjX1M8qYzqP46ok7N/JJ00wT1ZAuiDBYMxlHCdIIbX65WjK/TVNT7FnrxMtSTvDlL7ibLK3TyZ
	+CuhjGRFqQ5qV5u9bwVHVspde/CNTlswQ9B7D02lJyMffiP1Hg0Gxef7HnovGdMYFcPldRECaceRF
	jpzSMeWJs0KaAANkTeP47hRzhlAN6bRzOVZ5Bcs09r1kY5aUJCgHr+AsMGe7jeeSvlhVtBxiNlp6V
	AOK9o/waTqA1nYrs9El6eSyLRl+sxg7NPuz1bWmksZ85v0C0/EY7olx9kDX2m2/FrbYdmUfoCdxc/
	RuzYeeNYpkLs74RKSpaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grIn5-0004as-4Y; Wed, 06 Feb 2019 08:42:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grImz-0004aE-7J
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2019 08:42:39 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A9B92073D;
 Wed,  6 Feb 2019 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549442555;
 bh=Bau3v10/Vt8Y81oqOlrnH3EznqJG2Yu4PBK/974FP94=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xF4XjsJaKry+RPXfvvQRROGC8Ml71pGnrb3+Ko9He5rqptqwX0aAy1QZOKQnWg781
 op1bumk+QaV4N8XYOrElP4DKMXvhEXwjxNUxZBnUn+hvwJSwGHuZ1tL07sFpCgR8tC
 BOuKKLv+w1UFw0MeyqjeUYB6vgCQdOzrE5Fgy0Fc=
Date: Wed, 6 Feb 2019 09:42:26 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: fix MX28 bus master lockup problem
Message-ID: <20190206094226.1dadbf61@kernel.org>
In-Reply-To: <20190205155251.18733-1-martin.kepplinger@ginzinger.com>
References: <20190205155251.18733-1-martin.kepplinger@ginzinger.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_004237_291689_9B120639 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 miquel.raynal@bootlin.com, han.xu@nxp.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKT24gVHVlLCA1IEZlYiAyMDE5IDE2OjUyOjUxICswMTAwCk1hcnRpbiBLZXBw
bGluZ2VyIDxtYXJ0aW4ua2VwcGxpbmdlckBnaW56aW5nZXIuY29tPiB3cm90ZToKCj4gRGlzYWJs
ZSBCQ0ggc29mdCByZXNldCBhY2NvcmRpbmcgdG8gTVgyMyBlcnJhdHVtICMyODQ3ICgiQkNIIHNv
ZnQKPiByZXNldCBtYXkgY2F1c2UgYnVzIG1hc3RlciBsb2NrIHVwIikgZm9yIE1YMjggdG9vLiBJ
dCBoYXMgdGhlIHNhbWUKPiBwcm9ibGVtLgo+IAo+IE9ic2VydmVkIHByb2JsZW06IG9uY2UgcGVy
IDEwMCwwMDArIE1YMjggcmVib290cyBOQU5EIHJlYWQgZmFpbGVkIG9uCj4gRE1BIHRpbWVvdXQg
ZXJyb3JzOgo+IFsgICAgMS43NzA4MjNdIFVCSTogYXR0YWNoaW5nIG10ZDMgdG8gdWJpMAo+IFsg
ICAgMi43NjgwODhdIGdwbWlfbmFuZDogRE1BIHRpbWVvdXQsIGxhc3QgRE1BIDoxCj4gWyAgICAz
Ljk1ODA4N10gZ3BtaV9uYW5kOiBCQ0ggdGltZW91dCwgbGFzdCBETUEgOjEKPiBbICAgIDQuMTU2
MDMzXSBncG1pX25hbmQ6IEVycm9yIGluIEVDQy1iYXNlZCByZWFkOiAtMTEwCj4gWyAgICA0LjE2
MTEzNl0gVUJJIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtMTEwIHdoaWxlIHJlYWRpbmcg
NjQKPiBieXRlcyBmcm9tIFBFQiAwOjAsIHJlYWQgb25seSAwIGJ5dGVzLCByZXRyeQo+IFsgICAg
NC4xNzEyODNdIHN0ZXAgMSBlcnJvcgo+IFsgICAgNC4xNzM4NDZdIGdwbWlfbmFuZDogQ2hpcDog
MCwgRXJyb3IgLTEKPiAKPiBXaXRob3V0IEJDSCBzb2Z0IHJlc2V0IHdlIHN1Y2Nlc3NmdWxseSBl
eGVjdXRlZCAxLDAwMCwwMDAgTVgyOCByZWJvb3RzLgo+IAo+IEkgaGF2ZSBhIHF1b3RlIGZyb20g
TlhQIHJlZ2FyZGluZyB0aGlzIHByb2JsZW0sIGZyb20gSnVseSAxOHRoIDIwMTY6Cj4gCj4gIkFz
IHRoZSBpLk1YMjMgYW5kIGkuTVgyOCBhcmUgb2YgdGhlIHNhbWUgZ2VuZXJhdGlvbiwgdGhleSBz
aGFyZSBtYW55Cj4gY2hhcmFjdGVyaXN0aWNzLiBVbmZvcnR1bmF0ZWx5LCBhbHNvIHRoZSBlcnJh
dGFzIG1heSBiZSBzaGFyZWQuCj4gSW4gY2FzZSBvZiB0aGUgZG9jdW1lbnRlZCBlcnJhdGFzIGFu
ZCB0aGUgd29ya2Fyb3VuZHMsIHlvdSBjYW4gYWxzbwo+IGFwcGx5IHRoZSB3b3JrYXJvdW5kIHNv
bHV0aW9uIG9mIG9uZSBkZXZpY2Ugb24gdGhlIG90aGVyIG9uZS4gVGhpcyBoYXZlCj4gYmVlbiBy
ZXBvcnRlZCwgYnV0IEnigJltIGFmcmFpZCB0aGF0IHRoZXJlIGFyZSBub3QgYW4gZXN0aW1hdGVk
IGRhdGUgZm9yCj4gdXBkYXRpbmcgdGhlIEVycmF0YSBkb2N1bWVudHMuCj4gUGxlYXNlIGFjY2Vw
dCBvdXIgYXBvbG9naWVzIGZvciBhbnkgaW5jb252ZW5pZW5jZXMgdGhpcyBtYXkgY2F1c2UuIgo+
IAo+IEZpeGVzOiA2ZjJhNmE1MjU2MGEgKCJtdGQ6IG5hbmQ6IGdwbWk6IHJlc2V0IEJDSCBlYXJs
aWVyLCB0b28sIHRvIGF2b2lkCj4gTkFORCBzdGFydHVwIHByb2JsZW1zIikKClBsZWFzZSBtYWtl
IHN1cmUgdGhpcyBGaXhlcyBsaW5lIGlzIG5vdCB3cmFwcGVkIG5leHQgdGltZS4KClRoYW5rcywK
CkJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
