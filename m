Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947F7FD875E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 13:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lq/NnEO0FhYw310WlIPHuIvTQJT5V9VRtNH2jAYtrBQ=; b=fkOm2OC4+VXJZF
	WKo/YNw5yzhWsUAwl0UHQdrJH6D4XW3haHurc3CGXXj8T1tc9NArB+AzLwOdOIjcaKmNqKtpnWEEU
	YGmarNByPFvo1HBy+hr6k2lIcIj889tWWaUdemVOQGxsLksiUwmf2KoSIEB/8C8WF53HkmvvrzA7b
	LyIb6dTG+AqO/u9gOBh+fah/xOy5c38Oys0t5yDLcbfXCh3dWD5OZqUQMKW3ohV8Ye6IKF1YoSOeX
	6hve8OhviIh2bl0A5F+Zgrbm6DXZlyCQWh+0TAf710fv0VQS08w5s1DMIoj4g1H/o1iOAA/iWvDcV
	uxYV8YJ9/5oKVlihPwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UMF-00000006PfC-3pJf;
	Tue, 17 Mar 2026 13:21:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UMD-00000006PeO-3JXf
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 13:21:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98F76C55056;
	Tue, 17 Mar 2026 13:21:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85AC55FC9A;
	Tue, 17 Mar 2026 13:21:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3938104504FB;
	Tue, 17 Mar 2026 14:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773753670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EUj7foHItats0vf9RNx1RK9KgjyXySvrUxAxeX2cN0M=;
	b=qBzYemSd38ZIKWlBTSLBMyFheljbrBpeGh2jg3nInMvSRsgdrbJTl2sdhsuvZvLrRvWU6d
	obpwyMvEjiN7WLww73jEtKINfADV+7/aBCSSid0WrRXwlMEoWnA0qAwdOGrHI3+8H15ivd
	DXRdNVMNdq2zw2rtheItZAmCjM0ISDFRAYAmnjHUDlxZfeMALZhdLhdg1tQyMDGA7K4HXc
	Sb+/vkZ+P763mrCwZJWKdIrOrGKjgytA7QsAzE8cwlBlMh+EqRe2Now3upNA3J8QnzJo3c
	WtIuWOZySxecKTVCqsMAq7a2wkF9iGUynLdwssQ5Iw/n4rI7ynDQRiJXzvqHMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
In-Reply-To: <2vxzjyvad97q.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	17 Mar 2026 10:46:49 +0000")
References: <20260317102115.321807-1-miquel.raynal@bootlin.com>
	<2vxzjyvad97q.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 14:21:08 +0100
Message-ID: <87bjgmegmz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_062114_019056_325DB802 
X-CRM114-Status: GOOD (  11.60  )
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

T24gMTcvMDMvMjAyNiBhdCAxMDo0Njo0OSBHTVQsIFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBr
ZXJuZWwub3JnPiB3cm90ZToKCj4gT24gVHVlLCBNYXIgMTcgMjAyNiwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPgo+PiBUaGlzIGhlbHBlciByZWFsbHkgaXMganVzdCBhIGxpdHRsZSBoZWxwZXIgZm9y
IGludGVybmFsIHB1cnBvc2VzLCBhbmQgaXMKPj4gSS9PIG9wZXJhdGlvbiBvcmllbnRlZCwgZGVz
cGl0ZSBpdHMgbmFtZS4gSXQgaGFzIGFscmVhZHkgYmVlbiBtaXN1c2VkCj4+IGluIGNvbW1pdCA1
MDA4YzNlYzNmODkgKCJtdGQ6IHNwaS1ub3I6IGNvcmU6IENoZWNrIHJlYWQgQ1Igc3VwcG9ydCIp
LCBzbwo+PiByZW5hbWUgaXQgdG8gY2xhcmlmeSBpdHMgcHVycG9zZTogaXQgaXMgb25seSB1c2Vm
dWwgZm9yIHJlYWRzIGFuZCBwYWdlCj4+IHByb2dyYW1zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Cj4gUmV2aWV3ZWQtYnk6
IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPgo+Cj4gVGhpcyBvbmUgaXMgdHJp
Y2t5LiBJdCB3b24ndCBjb21waWxlIHdpdGhvdXQgIm10ZDogc3BpLW5vcjogRml4IFJEQ1IKPiBj
b250cm9sbGVyIGNhcGFiaWxpdHkgY29yZSBjaGVjayIuIFNvIHRvIHRha2UgaXQgdGhyb3VnaCBz
cGktbm9yL25leHQsIEkKPiB3b3VsZCBuZWVkIHRvIHJlYmFzZSB0aGUgYnJhbmNoIG9uIHRoZSAt
cmMgaW4gd2hpY2ggdGhlIFJEQ1IgcGF0Y2ggWzBdCj4gbGFuZHMuCgpJIGZvcmdvdCBpdCB3YXMg
b25seSBhcHBsaWNhYmxlIGFmdGVyIHRoZSBvdGhlciBwYXRjaC4gSW4gZ2VuZXJhbCwgeW91CmFy
ZSB3ZWxjb21lIHRvIGRpcmVjdGx5IG1lcmdlIHRoZSByZWxldmFudCAtcmMgaW4gc3BpLW5vci9u
ZXh0LCBubyBuZWVkCmZvciBtdGQvbmV4dCB0byBiZSBiYXNlZCBvbiBpdCB0b28uIEJ1dCBmb3Ig
dGhpcyBzcGVjaWZpYyBjYXNlLCBpZiB5b3UKYWdyZWUgSSB3aWxsIHRha2UgaXQgdGhyb3VnaCB0
aGUgZml4ZXMgYnJhbmNoIGRpcmVjdGx5LiBUaGV5IGFyZSByZWxhdGVkCmFueXdheSAoYWZ0ZXIg
cmVuYW1pbmcgaXQgX3JlYWRfcHBfb3AoKSBhcyBzdWdnZXN0ZWQgYnkgVHVkb3IpLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
