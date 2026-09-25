Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EF9C9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oX7C2DyU+3yDY7JJ6YKBaRI2YC+9eh5hZRmVhTsxl2Y=; b=KhEC3VeTHvRNAN
	5DDUc9q0zdcAWpDTdXBlxBGjVElNe7sxIWnG8oFtrO8t2JJSbSt6Mqk8asyE/3tHgsVTdJia9iav2
	6Uiwx6e2WK36ZhxO70KcRaKPBRsEfaljPYdHHYKy/hxIfSKWiotL8AkSqQHFo6BICAucJisa/LOrY
	Qoj09ubLNtmYDhHfKpc9sfs+RLwruli2ROG5RO5WG7I1R7dI+H8c+MIVDqkSNxcsqSma9DOWWSYQ/
	0SDfyhw65dCzx6j9jrD4nron0/etyA1yInlEpXdOlAjy2cjA2Xh/lyaJjgJSufabyrWNz/ptrcfbb
	ObvV/4210zLsm/8X70xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA35e-0000000D5yt-24k8;
	Fri, 25 Sep 2026 10:23:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA35b-0000000D5yX-0xd0
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 10:23:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B6DC1A1022;
	Fri, 25 Sep 2026 10:23:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE92C6073B;
	Fri, 25 Sep 2026 10:23:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AC4B1032959D;
	Fri, 25 Sep 2026 12:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790331810; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3szgY9zm9EvPd+IGHLd9mHO0PhxaT/u5j83BrGfC9yY=;
	b=XXkwearNrO2Owi+No8Tkk9ZXP4+olA6HVlP1/rb1tHjpkYrQ1/5BiHvnB+0CPIHRG+jC/A
	lgYLxJycCtmWfqCGYflng9l+RIv5XfeuZoXcD/+PSKU0/YeS7gXiB/r+nh0D9k0YOxsF7H
	218DJz2HgLAjCJXBx77gf0i+VvaqXjX8fwmETvMb0SYJYGpBuu/IgJOqg5gUZgfsye4c2E
	++enOXuvW8m5c/0aicGbSJqncQoInSu6Xu+f54BTxOkP5uWQ0HJ6P1D51IASgRjvXvZWx4
	MNnRUaE21cw88nGzD44wFF7QNXQLBsYTmSkLq2oLx+2lBcjQUfISPLUYJGKWWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>
Cc: Mark Brown <broonie@kernel.org>,  Fei Xie <fei.xie@horizon.auto>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Parshuram
 Thombare <pthombar@cadence.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
In-Reply-To: <arZHjbzUEFhydnHt@nsa> ("Nuno =?utf-8?Q?S=C3=A1=22's?= message
 of "Fri, 25 Sep 2026
	11:14:01 +0100")
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
	<20260921093701.1341766-3-fei.xie@horizon.auto>
	<arFEjzkHGMbecWWV@sirena.co.uk>
	<20260923061211.1608907-1-fei.xie@horizon.auto>
	<67f4e1a4-fc0e-4b2b-b41e-8dbb33227302@sirena.org.uk>
	<87pky1ll4g.fsf@bootlin.com> <arZHjbzUEFhydnHt@nsa>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 12:23:21 +0200
Message-ID: <87ecehljdy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_032335_441205_63EBF420 
X-CRM114-Status: GOOD (  19.58  )
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

SGVsbG8sCgo+PiA+IEkgdGhpbmsgdGhhdCBtYWtlcyBzZW5zZSwgdGhhdCBtaXJyb3JzIHNvbWUg
aWRlYXMgcGVvcGxlIGhhdmUgaGFkIGZvcgo+PiA+IG9wdGltaXNpbmcgU1BJIG1lc2FnZXMgaW4g
Z2VuZXJhbCAtIHN1Ym1pdCB0aGUgc2VxdWVuY2UgdG8gdGhlIGRyaXZlciB0bwo+PiA+IHNlZSBp
ZiBpdCBjYW4gZG8gaXQgaW4gb25lLCBmYWxsaW5nIGJhY2sgdG8ganVzdCBydW5uaW5nIGluZGl2
aWR1YWwKPj4gPiBvcGVyYXRpb25zIGlmIHRoYXQgZG9lc24ndCB3b3JrLiAgU2VlIHNwaV9vcHRp
bWl6ZV9tZXNzYWdlKCkuCj4+IAo+PiBUaGUgc3BpLW1lbSBvcGVyYXRpb24tc2VxdWVuY2UgaW50
ZXJmYWNlIHNlZW1zIHZlcnkgY29tcGxleCB0byBoYW5kbGUKPj4gY29ycmVjdGx5IElNSE8uIEkg
ZmVhciBzdWNoIGEgc29sdXRpb24gd291bGQgYWxzbyByZXF1aXJlIG1ham9yIHJld3JpdGVzCj4+
IG9mIHRoZSBjb3JlLiBJdCBpcyBhbHdheXMgaGFyZCB0byBtYWtlIGZpdCBoYXJkd2FyZSBpbiBj
b2RlIGJhc2VzIG5vdAo+PiB0aG91Z2h0IGZvciB0aGVtLiBNb3N0IG9mIHRoZSB0aW1lIGJlaW5n
IHNwZW50IGluIEkvT3MgYW5kIHdhaXQgc3RhdGVzLAo+PiBJIGFtIHdvbmRlcmluZyBob3cgbXVj
aCB3b3VsZCBiZSBzYXZlZCBieSBwYWNraW5nIHRoZSBjb21tYW5kcy4gRG8geW91Cj4+IGhhdmUg
YmVuY2htYXJrcz8KPgo+IFlvdSBjYW4gc2VlIG15IHJlcGxpZXMgZm9yIGEgbW9yZSB2ZXJib3Nl
IHRoaW5nLCBidXQgdGhlIFRMRFIgZm9yIG1lIHdhcwo+IHRoYXQgdGhlIGdhaW5zIGluIHBlcmZv
cm1hbmNlIGRpZCBub3QgcmVhbGx5IHBheWVkIG9mZiAodnMgdGhlCj4gY29tcGxleGl0eSB3ZSB3
b3VsZCBiZSBhZGRpbmcpLgoKVGhhdCdzIHByZWNpc2VseSB3aGF0IEkgd2FzIGV4cGVjdGluZy4K
Cj4gVGhlIHJlYWwgZ2FpbnMKPiBmb3IgbWUgY2FtZSBieSB1c2luZyB0aGUgbmFuZCBjb250aW51
b3VzIG1vZGUgc28gdGhhdCB1c2luZyBBQ01EIChhbmQKPiBETUEpIHNvIHRoYXQgd2UgY2FuIGFj
dHVhbGx5IHJlYWR5IGNodW5rcyA+IHBhZ2Ugc2l6ZS4gT2YgY291cnNlIHRoaXMgd29ya3MKPiBm
b3IgbmFuZCBjaGlwcyBzdXBwb3J0aW5nIGNvbnQgbW9kZSAod2hpY2ggaG9wZWZ1bGx5IG5ld2Vy
IG9uZXMgYWxsIGRvKS4KCkkgYW0gdmVyeSBoYXBweSB0byBzZWUgdGhpcyBmZWF0dXJlIGJlaW5n
IHVzZWQhIEl0IGFscmVhZHkgY2F1c2VkIHF1aXRlCmEgYml0IG9mIGNodXJuIGluIHRoZSBjb3Jl
IDotKQoKPiBBcyBmb3IgUFJPR1JBTSBhbmQgRVJBU0UgY29tbWFuZHMgSSByZWFsbHkgZGlkIG5v
dCBzYXcgYW55IGFkZGVkCj4gdmFsdWUuCgpZZXMsIG1vc3Qgb2YgdGhlIHRpbWUgaXMgc3BlbnQg
aW4gdGhlIHdhaXRfcmVhZHksIHdoaWNoIGlzIG5vdCBnZXR0aW5nCmZhc3RlciB3aXRoIGhhcmR3
YXJlIGF1dG9tYXRpb24uCgo+IFNvIGJlbG93IGlzIG15IHZlcnNpb24gb2YgdGhpczoKPgo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9hbmFsb2dkZXZpY2VzaW5jL2xpbnV4L3B1bGwvMzQ3OC9jaGFuZ2Vz
LzQ3N2U2MDk1NTA4NTQ2NTUyMDcxYjgyNWE2NjUyMmNmNjk3YzI3YzIKPgo+IEkgcHJldHR5IG11
Y2ggdHJlYXQgTk9SIGFuZCBOQU5EIHRoZSBzYW1lIHRoaW5nLiBPbmx5IHdoZW4geW91IHdhbnQg
dG8KPiBkbyB0aGluZyBsaWtlIGhhdmluZyB0aGUgY29udHJvbGxlciBzZW5kaW5nIGNvbW1hbmRz
IGl0c2VsZiAob3Igd2Fsa2luZwo+IHBhZ2VzKSwgdGhlbiBrbm93aW5nIGFib3V0IHRoZSBjaGlw
IGdlb21ldHJ5IGJlY29tZXMgbmVjZXNzYXJ5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
