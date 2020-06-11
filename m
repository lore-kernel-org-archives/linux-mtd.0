Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E410C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:23:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C413206C3
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NuIPTvp7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSz6Td8d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C413206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AodxLpy0BktvPeT6BKY2ppWl1+jLErLsX+tDq2T26dU=; b=NuIPTvp7e5Z0l0
	qshrUgXnvCK02bgm8xXXqTAXDtpH2f4sn9yUMdjKNNhUbEwaQYpKLV6P6iGurHwHX/ts3x6Sby+Yx
	yYYWm5MJ5Ow1EFRpg04XTDy/l7/X/uIOIhkVRbSnBfGkZdzAjpb5u1ssmf/RJx4O362cMzsaRnL2B
	72Prbbt5+GsPP1J8Hd/0Vr9cROZC/HDnO6mq8QSYXU+TCsNOO1zvaJujHZopxwkFan63mJzg9+Z9c
	h61cjh9Ie7lkx10iPLh1U32k1HCc3FqZ31Ft1hz+A8xAj4zQu/v01NUD4DedE7YTGXgCwvycqA46c
	0RrUAXp2rbtBoX/wU4yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjP2s-0000UG-54; Thu, 11 Jun 2020 15:23:10 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjP2p-0000Td-O3
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 15:23:09 +0000
Received: by mail-io1-xd42.google.com with SMTP id r2so6732536ioo.4
 for <linux-mtd@lists.infradead.org>; Thu, 11 Jun 2020 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=05dAwFr23x6Wppd3aNSMMdwYxKpiRDbAuqlCwKPeXLs=;
 b=bSz6Td8dFaOqGljMe+1eneoUKrmQkEKpijse6qYgWOnOjpf+lKXD+jhBG6dS39PsP0
 OXni1wRiqAMdPUA7iHtVRQpprUmR9VRMyxsOxay3NgLezGIG6NbYfraE1bN8Ri7UjNuw
 ZNrcfhRmEzqonmX9Q9RpTjgMcEEeqvxX/VfXyZspPNDSdRacTc7G1KawNqfrnAfruXTS
 wNUoFIida5sohhd8IALsGjfKN4Ilq1EdQA1ALjP6dvEUXoR3kgB94mS8CnA4TpmlgImb
 F6aanALco9UeNpBpWgUpCyuROUV4kMcKDHEnkm5aGCkM8qIDGd9mIsSK7Sbf8T+oBIsr
 268g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=05dAwFr23x6Wppd3aNSMMdwYxKpiRDbAuqlCwKPeXLs=;
 b=FVTMYnvN649zqDLP6UoXhwLMbu6z/x94CU/5y+WqZHR0u0peD6v7VXJlhQFpCIUNRj
 6LzZN6YPbPNJprLCWP/Cm73TlIZcU3wOhmMNOLgzeiKndNiCVNFn46BXRMXV0dQOaEeq
 +cinU1rsgtDNoN3GpKsctbvCeIQv7OaB+3Zu5zArbsmxbOLNq1YNUX9tWRuLJVzwWUOR
 3Q8XsUovMyXii61oKcNXJ2H8bJSwTERT8YXQxqmKPkvsu5RaPVHTvtY9QcsE9Bbv9ksU
 ndDi5+AJljSjKcKf8eQWELs7DWJrpCITrgVrY7jMxjqVGDJgPbs33bCc8q6h8kEcenro
 moWg==
X-Gm-Message-State: AOAM533B4MA4N1dhNQLgFu7jNL1czGU3DV7vybq9NqujXqG08eUJfksX
 h90UXAwGzBXC5oY7u/9ej+DpMtMPH8RjbTdpwYk=
X-Google-Smtp-Source: ABdhPJycJe56RMdmTSlh49JWS/4xOF/jY8JcxrWNnB+gxvwV3TotTs2lDnPAQjHS4uzji26kHExgWy0GfGqPDMtFPHQ=
X-Received: by 2002:a6b:f40a:: with SMTP id i10mr8810173iog.155.1591888986914; 
 Thu, 11 Jun 2020 08:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200611054454.2547-1-kdasu.kdev@gmail.com>
 <20200611091604.1bec2418@xps13>
In-Reply-To: <20200611091604.1bec2418@xps13>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Thu, 11 Jun 2020 11:22:56 -0400
Message-ID: <CAC=U0a0ReuPpxZjB2vV_YNynrMx4OjzPmPPyJeVbhueFgFeNbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: brcmnand: Don't default to edu transfer
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_082307_797705_13E27F31 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMzoxNiBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEthbWFsLAo+Cj4gS2FtYWwgRGFzdSA8a2Rh
c3Uua2RldkBnbWFpbC5jb20+IHdyb3RlIG9uIFRodSwgMTEgSnVuIDIwMjAgMDE6NDQ6NTMKPiAt
MDQwMDoKPgo+ID4gV2hlbiBmbGFzaC1kbWEgaXMgYWJzZW50IGRvIG5vdCBkZWZhdWx0IHRvIHVz
aW5nIGZsYXNoLWVkdS4KPiA+IE1ha2Ugc3VyZSBmbGFzaC1lZHUgaXMgZW5hYmxlZCBiZWZvcmUg
c2V0dGluZyBFRFUgdHJhbnNmZXIKPiA+IGZ1bmN0aW9uLgo+ID4KPiA+IEZpeGVzOiBhNWQ1M2Fk
MjZhOGIgKCJtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBBZGQgc3VwcG9ydCBmb3IgZmxhc2gtZWR1
IGZvciBkbWEgdHJhbnNmZXJzIikKPiA+IFNpZ25lZC1vZmYtYnk6IEthbWFsIERhc3UgPGtkYXN1
LmtkZXZAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYyB8IDUgKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYwo+ID4gaW5kZXggOGY5ZmZiNDZhMDlmLi4wYzFkNmU1NDM1ODYgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiBAQCAtMjk1Myw4
ICsyOTUzLDkgQEAgaW50IGJyY21uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsIHN0cnVjdCBicmNtbmFuZF9zb2MgKnNvYykKPiA+ICAgICAgICAgICAgICAgaWYgKHJldCA8
IDApCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gPgo+ID4gLSAgICAgICAg
ICAgICAvKiBzZXQgZWR1IHRyYW5zZmVyIGZ1bmN0aW9uIHRvIGNhbGwgKi8KPiA+IC0gICAgICAg
ICAgICAgY3RybC0+ZG1hX3RyYW5zID0gYnJjbW5hbmRfZWR1X3RyYW5zOwo+ID4gKyAgICAgICAg
ICAgICBpZiAoaGFzX2VkdShjdHJsKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiBzZXQg
ZWR1IHRyYW5zZmVyIGZ1bmN0aW9uIHRvIGNhbGwgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBjdHJsLT5kbWFfdHJhbnMgPSBicmNtbmFuZF9lZHVfdHJhbnM7Cj4KPiBEb2VzIHRoaXMgZmFs
bGJhY2sgdG8gcmV0dXJuaW5nIGFuIGVycm9yIGluIGNhc2UgIWhhc19lZHUoKSA/IE90aGV3aXNl
LAo+IGhvdyBpcyBpdCBoYW5kbGVkPwo+CgogVGhlIGRyaXZlciB3aWxsIGRlZmF1bHQgdG8gcGlv
IGlmIGJvdGggZmxhc2gtZG1hIGFuZCBmYWxzaC1lZHUgYXJlCm5vdCBwcmVzZW50LgoKPiBUaGFu
a3MsCj4gTWlxdcOobAoKS2FtYWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
