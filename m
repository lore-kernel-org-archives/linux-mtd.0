Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB6AEE4996
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 07:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQlLaVDyzRhALPWLbi07iUlvC2tkKQQyvJnjDlI33Ug=; b=sbFaSy9iVsC7fp
	delYgIafvgO26jTh0qk25yauw6SBx0t5s8ukuCV46cvLf1xmNDkdfeFQk3ScpKfZqX+Ed+cbrneZY
	StfNtAhQrN7fTeiG85fVMG4VCAr5fuPURjg53BbVVu6Y1h7+SrR0+QV8aSkZ5tbOQb1LZDkXpfBfc
	GkKEur89JxJxgq97fwwq2I0FO5/rzCtPhZFLZ15Gh5FhsgCWKcU6+r7o4TskbGkXIWYmMYmdmhdCy
	BlPs3MdJCLm5kZe5tE+15kelo8f6ojUXcMhUdr43okcOy3LgkwfqVB66Dg5Qn8b60oKFCZPF8M80+
	c+OuERWVjSAXpIVYYwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzLx-00DM5b-2O;
	Mon, 21 Aug 2023 07:29:33 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzLv-00DM4W-2B
	for linux-mtd@lists.infradead.org;
	Mon, 21 Aug 2023 07:29:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D063E1C0005;
	Mon, 21 Aug 2023 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692602964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VB0zz0K+Kec15Zr+s4clFuGZtwWuG8rXdL+bGDFcguA=;
	b=aHkuW+sKsyf1aKqa6GIJT2MRUoDZ+MJUvnVTvgwtz74Cr+OXRvyD6L5F6lni5BksaRmE6x
	enxAhCul+Co32CuTqnyt5oqEnL1JtDNWbYxpR52uB74RjxUtQ9mpYgZpwxXGU6hYivIVM2
	Z+Va8W29a8jdJeq+L55tZuk5OvWrfp/sl2il1gYML1FC5SLyiF+52m3P6rXYeL+LeTiTe0
	7XU9iWcfswS2GiXj45Ke6RwvpwJr0gwgnxDF6V4ajR6e/S6KfABOClQH/I7YboYau7A7EW
	HmVhHCdJOYyKM6vyAZ8XU7qFIMBN4tHQY5lGysZ+JuK91MiGmt8F2E95vlVVGQ==
Date: Mon, 21 Aug 2023 09:29:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: mani@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix build issue
Message-ID: <20230821092923.7043c90f@xps-13>
In-Reply-To: <20230821053513.13728-1-quic_mdalam@quicinc.com>
References: <20230821053513.13728-1-quic_mdalam@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_002931_878347_A9AFEAC6 
X-CRM114-Status: GOOD (  13.19  )
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

SGVsbG8sCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBNb24sIDIxIEF1ZyAyMDIz
IDExOjA1OjEzICswNTMwOgoKPiBGaXggdGhlIGJ1aWxkIGlzc3VlLCBhZnRlciByZW1vdmluZyB1
bnVzZWQgdmFyaWFibGUgbmFuZGMKPiBpbiBxY29tX3BhcnNlX2luc3RydWN0aW9ucygpIGZ1bmN0
aW9uLgo+IAo+IEZpeGVzOiAwYmIyYmQxOGVmZTggKCJtdGQ6IHJhd25hbmQ6IHFjb206IEFkZCBy
ZWFkL3JlYWRfc3RhcnQgb3BzIGluIGV4ZWNfb3AgcGF0aCIpCgpJIHdpbGwgc3F1YXNoIHRoaXMg
Zml4LgoKPiBTaWduZWQtb2ZmLWJ5OiBTcmljaGFyYW4gUmFtYWJhZGhyYW4gPHF1aWNfc3JpY2hh
cmFAcXVpY2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFs
YW1AcXVpY2luYy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
YyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9xY29tX25hbmRjLmMKPiBpbmRleCAzNzBhNzc5NjEwZTIuLjZhZmY0NWYzMjI2MCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMjU5Myw3ICsyNTkzLDYgQEAgc3RhdGlj
IGludCBxY29tX3BhcnNlX2luc3RydWN0aW9ucyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICAJ
CQkJICAgIGNvbnN0IHN0cnVjdCBuYW5kX3N1Ym9wICpzdWJvcCwKPiAgCQkJCSAgICBzdHJ1Y3Qg
cWNvbV9vcCAqcV9vcCkKPiAgewo+IC0Jc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5k
YyA9IGdldF9xY29tX25hbmRfY29udHJvbGxlcihjaGlwKTsKPiAgCWNvbnN0IHN0cnVjdCBuYW5k
X29wX2luc3RyICppbnN0ciA9IE5VTEw7Cj4gIAl1bnNpZ25lZCBpbnQgb3BfaWQ7Cj4gIAlpbnQg
aSwgcmV0OwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
