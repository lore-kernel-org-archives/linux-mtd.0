Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B698C83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 14:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3602A2083B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 14:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bkWE8bfP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3602A2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqJk67PbIQtYfNFcYxw6ULokMLhEIlyESEJaeJ0qqmw=; b=bkWE8bfPKEZb+m
	HuC/26b84m1kKJuL/59EVIXYKGeD+fJDHpRFAlGiBge/BvOb6ODnVBiWRaCToxpiOtULWnGj0MNsI
	q0zYUGu2Z/yI20XGz5xk41/Fsc9TjYZmS978/KdjMNOk3SVLzEbB6oa0WJ1GEbcGT1UfSftc6Km8T
	J4rek5ZSp0BS8hKgMKS4HdcOqXKj1s2jE+tQ0W1Ec0Q1mU/+KmnCaZwXO4Zbq+hU1MdlSG184FXpO
	Kt8L27B7IrV2XARM7dpPyH47xYLhxTKYUrR57rYghApoNytADuz51sQeSSwSNJ9JfR+dPdCBnPMPj
	YEzis0ifuPUkg063whLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTo0L-0002LK-49; Wed, 29 Apr 2020 14:48:05 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTo04-00027t-7Z; Wed, 29 Apr 2020 14:47:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CA2F1045;
 Wed, 29 Apr 2020 07:47:46 -0700 (PDT)
Received: from bogus (unknown [10.37.12.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E7CD3F68F;
 Wed, 29 Apr 2020 07:47:44 -0700 (PDT)
Date: Wed, 29 Apr 2020 15:47:41 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: Support the absence of protection
 registers
Message-ID: <20200429144741.GB16356@bogus>
References: <20200417142325.2931423-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417142325.2931423-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_074748_342873_55F2082E 
X-CRM114-Status: GOOD (  14.92  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDQ6MjM6MjZQTSArMDIwMCwgSmVhbi1QaGlsaXBwZSBC
cnVja2VyIHdyb3RlOgo+IFRoZSBmbGFzaCBjb250cm9sbGVyIGltcGxlbWVudGVkIGJ5IHRoZSBB
cm0gQmFzZSBwbGF0Zm9ybSBiZWhhdmVzIGxpa2UKPiB0aGUgSW50ZWwgU3RyYXRhRmxhc2ggSjMg
ZGV2aWNlLCBidXQgb21pdHMgc2V2ZXJhbCBmZWF0dXJlcy4gSW4KPiBwYXJ0aWN1bGFyIGl0IGRv
ZXNuJ3QgaW1wbGVtZW50IGEgcHJvdGVjdGlvbiByZWdpc3Rlciwgc28gIk51bWJlciBvZgo+IFBy
b3RlY3Rpb24gcmVnaXN0ZXIgZmllbGRzIiBpbiB0aGUgUHJpbWFyeSBWZW5kb3ItU3BlY2lmaWMg
RXh0ZW5kZWQKPiBRdWVyeSwgaXMgMC4KPiAKPiBUaGUgSW50ZWwgU3RyYXRhRmxhc2ggSjMgZGF0
YXNoZWV0IG9ubHkgbGlzdHMgMSBhcyBhIHZhbGlkIHZhbHVlIGZvcgo+IE51bVByb3RlY3Rpb25G
aWVsZHMuIEl0IGRlc2NyaWJlcyB0aGUgZmllbGQgYXM6Cj4gCj4gCSJOdW1iZXIgb2YgUHJvdGVj
dGlvbiByZWdpc3RlciBmaWVsZHMgaW4gSkVERUMgSUQgc3BhY2UuCj4gCeKAnDAwaCzigJ0gaW5k
aWNhdGVzIHRoYXQgMjU2IHByb3RlY3Rpb24gYnl0ZXMgYXJlIGF2YWlsYWJsZSIKPiAKPiBXaGls
ZSBhIHZhbHVlIG9mIDAgbWF5IGFyZ3VhYmx5IG5vdCBiZSBhcmNoaXRlY3R1cmFsbHkgdmFsaWQs
IHRoZQo+IGRyaXZlcidzIGN1cnJlbnQgYmVoYXZpb3IgaXMgY2VydGFpbmx5IHdyb25nOiBpZiBO
dW1Qcm90ZWN0aW9uRmllbGRzIGlzCj4gMCwgcmVhZF9wcmlfaW50ZWxleHQoKSBhZGRzIGEgbmVn
YXRpdmUgdmFsdWUgdG8gdGhlIHVuc2lnbmVkIGV4dHJhX3NpemUsCj4gYW5kIGVuZHMgdXAgaW4g
YW4gaW5maW5pdGUgbG9vcC4KPiAKPiBGaXggaXQgYnkgaWdub3JpbmcgYSBOdW1Qcm90ZWN0aW9u
RmllbGRzIG9mIDAuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVhbi1QaGlsaXBwZSBCcnVja2VyIDxq
ZWFuLXBoaWxpcHBlQGxpbmFyby5vcmc+Cj4gLS0tCj4gSSBndWVzcyB0aGlzIGZsYXNoIGRldmlj
ZSBoYXMgbmV2ZXIgYmVlbiB0ZXN0ZWQgb24gTGludXguIFRoZSBidWcgc2hvd2VkCj4gdXAgd2hl
biB0cnlpbmcgdG8gYm9vdCB0aGUgbGF0ZXN0IGFybTY0IGRlZmNvbmZpZywgd2hpY2ggZW5hYmxl
ZAo+IENPTkZJR19NVERfUEhZU01BUF9PRiwgb24gdGhlIFJldkMgRmFzdE1vZGVsLiBXaXRob3V0
IHRoaXMgY29uZmlnIG9wdGlvbgo+IHRoZSBkZXZpY2UgaXNuJ3QgcHJvYmVkLgoKQW55IHByb2dy
ZXNzIHdpdGggdGhpcyBwYXRjaCA/CgpGV0lXLCB0aGlzIGZpeGVzIGJvb3Qgb24gZmV3IGFybTY0
IEFybSBMdGQgRmFzdE1vZGVscyB3ZSB1c2UgZm9yCmRldmVsb3BtZW50IGluY2x1ZGluZyB0aGUg
YWJvdmUgbWVudGlvbmVkIFJldkMgRmFzdE1vZGVsLiBTbywKClRlc3RlZC1ieTogIFN1ZGVlcCBI
b2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+CgotLSAKUmVnYXJkcywKU3VkZWVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
