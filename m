Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07297E8537A
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gl8Mipw3suLvB8Ivywcow3qQlk2CftJmU5M+n36DLk0=; b=aS02/Pl7r/+IGC
	7B8FR3lwLjZ0Eg6uXzQtqks9hwhJx/U18nkUl5appyzBBgrFoei7D3Q2aEU+Cm52AhGBgC+rZi3Y0
	dJ1I4UJ3GPt/OTRHlRB32m0MWchrtsCRke9XV8+t5hGe18zjy+sGbCwEcSrGMXKgR92YE9slAtakU
	cYt8x6U54ViS9NcHiEQSRzBt8lk1DcR5dtQDM1rXnEYBAv/G0C1FQA4jcclH4FoT83WDwgSRTw9pY
	6VcW3t0nPulV9ZzdOD6nOPngA5CaVpi1E6HFsdzD1FvKB5C0b3XPqO0FDWR3f7461s8o99tU4wEew
	ezRk9EAKJ6MKeTHZyRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h2r-00000002FtY-3OcZ;
	Fri, 03 Apr 2026 16:06:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h2m-00000002Fsw-19HG
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:06:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD9191A312B;
	Fri,  3 Apr 2026 16:06:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 703EC603C1;
	Fri,  3 Apr 2026 16:06:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 049E3104500F9;
	Fri,  3 Apr 2026 18:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KrVx7jihaMo4JfVPFc6GDwNKRrjQQHnDzJIXkqNJIFg=;
	b=2Tx1mKPqr6MGr+MBrfMLLJ7EKQyPlAHd+lPXQZazym6imMuJ10BcFwZxJ3Tkdz4VOmXNLl
	fqbziwHYlYvdSeJn99Qj3FsRy9ciSZwNxpNUVTYNdtBLaWRk++Ji2j3HvP7fO4hdJBPSZW
	1HWLavfhPgrYou6npZxg0jcOwPUuxa/eKtL1BPcodUfuEu7aOAHgPmTsxBHm3NFdHmBYo8
	zoUb0sGSk/Whv5/D3OC6A4bfoRFLjd6jnoZBJmJs/STJIO66Ud7kxgvqFfyeOWc7oMIlPy
	30Hdqch5+DaKmbe6L4E/VP09lKdFP2wiOm2awo2HDAw84feMgnaz3f69IZFyLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <corbet@lwn.net>,  <tudor.ambarus@linaro.org>,
  <sean.anderson@linux.dev>,  <thomas.petazzoni@bootlin.com>,
  <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 17/27] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <ee2057a104d44d3dbfbedcf5b1ed80b2@infineon.com> (Takahiro
	Kuwano's message of "Thu, 2 Apr 2026 05:40:55 +0000")
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
	<20260317-winbond-v6-18-rc1-spi-nor-swp-v3-17-2ca9ea4e7b9b@bootlin.com>
	<ee2057a104d44d3dbfbedcf5b1ed80b2@infineon.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Apr 2026 18:06:33 +0200
Message-ID: <87a4vk58qe.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_090648_803125_82A5A1D4 
X-CRM114-Status: GOOD (  12.08  )
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

SGkgVGFrYWhpcm8sCgo+PiArdTY0IHNwaV9ub3JfZ2V0X21pbl9wcm90X2xlbmd0aF9zcihzdHJ1
Y3Qgc3BpX25vciAqbm9yKTsKPj4gK3ZvaWQgc3BpX25vcl9nZXRfbG9ja2VkX3JhbmdlX3NyKHN0
cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0IHU4ICpzciwgbG9mZl90ICpvZnMsIHU2NCAqbGVuKTsK
Pj4gK2Jvb2wgc3BpX25vcl9pc19sb2NrZWRfc3Ioc3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90
IG9mcywgdTY0IGxlbiwgY29uc3QgdTggKnNyKTsKPj4gKwo+Cj4gSXQgd291bGQgYmUgYmV0dGVy
IHRvIGhhdmUgZ2VuZXJpYyBoZWxwZXIgZnVuY3Rpb25zIHJhdGhlciB0aGFuIHVzaW5nIFNSLWJh
c2VkCj4gZnVuY3Rpb25zIGRpcmVjdGx5LiBUaGUgbG9ja2luZ19vcHMgaXMgdmVuZG9yL2NoaXAg
c3BlY2lmaWMgYW5kIGNhbiBwcm92aWRlCj4gb3RoZXIgbG9ja2luZyBtZWNoYW5pc20gdGhhbiBT
Ui1iYXNlZCBibG9jayBwcm90ZWN0aW9uLiBGb3IgaW5zdGFuY2UsIEluZmluZW9uLAo+IE1pY3Jv
biwgTWFjcm9uaXggKGFuZCBtYXliZSBvdGhlciB2ZW5kb3JzKSBvZmZlciBwcm90ZWN0aW9uIG1l
Y2hhbmlzbXMgdGhhdCBjYW4KPiBwcm90ZWN0IHNlY3RvcnMgaW5kaXZpZHVhbGx5IHdpdGggdm9s
YXRpbGUgb3Igbm9uLXZvbGF0aWxlIG1hbm5lci4KCkkgZ2V0IHdoYXQgeW91IG1lYW4sIHRoYW5r
cyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIFVuZm9ydHVuYXRlbHkgaXQncwpub3QgdGhhdCBzdHJh
aWdodGZvcndhcmQuCgpBcyBvZiB0b2RheSwgdGhlcmUgYXJlIHRoZSAiZGVmYXVsdCIgbG9ja2lu
ZyBvcHMgKFNSIGJhc2VkKSBhbmQgYSBmZXcKb3RoZXJzLCBjaGlwIHNwZWNpZmljLiBGb3IgZGVi
dWdnaW5nIHB1cnBvc2VzLCB0aGVzZSAib3RoZXIiIG9wcyBkbyBub3QKcHJvdmlkZSBhbnkga2lu
ZCBvZiB1c2VmdWwgZmVlZGJhY2sgcmVnYXJkaW5nIHdoYXQgaGFzIGFjdHVhbGx5IGJlZW4KbG9j
a2VkLiBPbmx5IFNSIGJhc2VkIGNoaXBzIHByb3ZpZGUgdGhpcywgaXQgaXMgdXNlZnVsLCBJIHdh
bnQgdG8gdXNlIGl0LgoKU28gSSdtIGdvaW5nIHRvIGV4cG9zZSBhIG5ldyBib29sZWFuIHRvIGZp
bHRlciBvdXQgd2hldGhlciB3ZSBoYXZlCmxvY2tpbmcgc3VwcG9ydCAqYW5kKiBpZiB5ZXMsIHdo
ZXRoZXIgd2UgY2FuIHVzZSBTUiBiYXNlZCBmdW5jdGlvbnMsIHRoaXMKc2hvdWxkIGFsc28gYWRk
cmVzcyB0aGlzIGNvbmNlcm46Cgo+IERvbid0IHdlIG5lZWQgdG8gY2hlY2sgJ1NOT1JfRl9IQVNf
TE9DSycgZmxhZyBoZXJlPwoKV2Ugd2lsbCBzdGlsbCBuZWVkIHRvIGV4cG9zZSB0aGUgU1Igc3Bl
Y2lmaWMgaGVscGVycywgdGhvdWdoLCBidXQgYXQKbGVhc3Qgd2Ugd2lsbCBubyBsb25nZXIgZ2V0
IGluY29uc2lzdGVuY2llcyB3aXRoIGNoaXBzIG5vdCBmZWF0dXJpbmcgdGhlCmRlZmF1bHQgU1Ig
YXBwcm9hY2guCgo+PiArICAgICAgIHNlcV9wdXRzKHMsICJcbmxvY2tlZCBzZWN0b3JzXG4iKTsK
Pj4gKyAgICAgICBzZXFfcHV0cyhzLCAiIHJlZ2lvbiAoaW4gaGV4KSAgIHwgc3RhdHVzICAgfCAj
YmxvY2tzXG4iKTsKPj4gKyAgICAgICBzZXFfcHV0cyhzLCAiIC0tLS0tLS0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tKy0tLS0tLS0tXG4iKTsKPj4gKwo+PiArICAgICAgIHNwaV9ub3JfZ2V0X2xvY2tl
ZF9yYW5nZV9zcihub3IsIG5vci0+ZGZzX3NyX2NhY2hlLCAmbG9ja19zdGFydCwgJmxvY2tfbGVu
Z3RoKTsKPj4gKyAgICAgICBpZiAoIWxvY2tfbGVuZ3RoIHx8IGxvY2tfbGVuZ3RoID09IHBhcmFt
cy0+c2l6ZSkgewo+PiArICAgICAgICAgICAgICAgc2VxX3ByaW50ZihzLCAiICUwOGxseC0lMDhs
bHggfCAlcyB8ICVsbHVcbiIsIDBVTEwsIHBhcmFtcy0+c2l6ZSAtIDEsCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxvY2tfbGVuZ3RoID8gIiAgbG9ja2VkIiA6ICJ1bmxvY2tlZCIsIHBh
cmFtcy0+c2l6ZSAvIG1pbl9wcm90X2xlbik7Cj4KPiBkaXZfdTY0KCkgaXMgbmVlZGVkLiAKPiBJ
IGdvdCB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX3VsZGl2bW9kJyBmb3IgbXkgMzIt
Yml0IEFSTSBwbGF0Zm9ybS4KPiBTYW1lIGZvciBmb2xsb3dpbmcgZm91ciBzZXFfcHJpbnRmKCku
CgpHb29kIGNhdGNoLCBJIHdpbGwgZml4IHRoaXMgdG9vLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
