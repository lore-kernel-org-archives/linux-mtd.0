Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B49C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 04:30:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779A22072F
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 04:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fPux7SMX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="ptPf8S7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 779A22072F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=If9Z53aZt9eDDKfKL49Ln0AcqLwGmbkCQXWL6c8jVfU=; b=fPux7SMXJjHsrPohiqCBLYViF
	Otnv7gbCMJDBUvIPCIrVAYU87K+5+sZ2DGpe1Lcu3kckHCHnUZ4daOrQjMadRIw+hCNMAJmKGbcii
	v/0beFfUcRIIeYu16pYM4rmXkrAKVrlthrpBi2A6E5efmXdMv2C/C7J1x/Ir48IeChiz6ije5o0sT
	oZKsMwvSLH1eHlZrt/7jHlHep80svpP3zodidLn9sjwMocTTntf3RRjrWOsc1v+6ek7CXTmP+bIz2
	Lneauf8fnC2MW5kfwCOACIqJ5zgC5exWQ37cmIuNi0pn0xKhRfwpjids68giU0v+ohw9rNGYCbnrU
	LezHCoCdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjErF-0004UP-Bb; Thu, 11 Jun 2020 04:30:29 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjEr8-0004On-O2
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 04:30:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591849825; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QJjET0k8yu9zFcdIKSvsKbosEtQIO+kgRnz9burdEE4=;
 b=ptPf8S7WQMyM4fbbHFLy0MOsFdSdYdhhztWow309vUYTPZ1zU1ZI6A8jpOQ/Ye7nlumqcpNs
 Mz/jf40Ovj1STjl/ABKXYiURCHe8uq1vTft44YjhKOYhyi+/huZVMtKSHFckQuNVIwceKANT
 LjwxMXrDd90Z1LQ0/zJ/hgcrzXg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5ee1b34e0206ad41d1d8090f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 04:30:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1038CC4339C; Thu, 11 Jun 2020 04:30:06 +0000 (UTC)
Received: from [192.168.0.105] (unknown [183.83.153.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sivaprak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C95DC433CA;
 Thu, 11 Jun 2020 04:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C95DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V2 1/2] mtd: rawnand: qcom: remove write to unavailable
 register
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1591701056-3944-1-git-send-email-sivaprak@codeaurora.org>
 <1591701056-3944-2-git-send-email-sivaprak@codeaurora.org>
 <20200609160217.0b111883@xps13>
From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <5a82ed80-0ca3-ecb6-2c30-7ac279d437fa@codeaurora.org>
Date: Thu, 11 Jun 2020 10:00:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200609160217.0b111883@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_213025_918688_04A3A3C6 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: peter.ujfalusi@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gNi85LzIwMjAgNzozMiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBTaXZhcHJha2FzaCwKPgo+IFNpdmFwcmFrYXNoIE11cnVnZXNhbiA8c2l2YXByYWtAY29kZWF1
cm9yYS5vcmc+IHdyb3RlIG9uIFR1ZSwgIDkgSnVuCj4gMjAyMCAxNjo0MDo1NSArMDUzMDoKPgo+
PiBTRkxBU0hDX0JVUlNUX0NGRyByZWdpc3RlciBpcyBub3QgYXZhaWxhYmxlIG9uIGFsbCBpcHEg
bmFuZCBwbGF0Zm9ybXMsCj4+IGl0IGlzIGF2YWlsYWJsZSBvbmx5IG9uIGlwcTgwNjQgZGV2aWNl
cyBhbmQgdGhlIG5hbmQgY29udHJvbGxlciB3b3Jrcwo+PiB3aXRob3V0IGNvbmZpZ3VyaW5nIHRo
ZXNlIHJlZ2lzdGVycyBpbiB0aGlzIHBsYXRmb3JtLCBzbyByZWdpc3RlciB3cml0ZQo+PiB0byB0
aGlzIGNhbiBiZSByZW1vdmVkLgo+IE1heWJlIGl0IHdvcmtzIGJlY2F1c2UgdGhlIGJvb3Rsb2Fk
ZXIgaXMgc2V0dGluZyB0aGUgcmVnaXN0ZXIgaXRzZWxmLgo+IFdoYXQgaWYgeW91IHVzZSBhIGRp
ZmZlcmVudCBib290bG9hZGVyLCBvciB0aGUgc2FtZSBib290bG9hZGVyIHdpdGhvdXQKPiBOQU5E
IHN1cHBvcnQ/Cj4KPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBwcm9wZXIgZml4LCB5b3Ugc2hv
dWxkIGluc3RlYWQgaGF2ZSBhIGRpZmZlcmVudAo+IGNvbXBhdGlibGUgaWYgdGhlIElQIGlzIG5v
dCB0aGUgc2FtZSBhbmQgZGVwZW5kaW5nIG9uIHRoaXMgY29tcGF0aWJsZQo+IGRvIHRoZSB3cml0
ZSwgb3Igbm90LgoKSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQsIHdpbGwgZml4IHRoaXMgaW4gbmV4
dCBwYXRjaC4KClRoYW5rcywKClNpdmEKCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
