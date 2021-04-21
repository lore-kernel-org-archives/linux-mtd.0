Return-Path: <SRS0=I5F2=JS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3669DC433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Apr 2021 17:06:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF6A61440
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Apr 2021 17:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF6A61440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9nczbJbFaWRUC57Q7z9zgL0c0zQa+g1EymgsBOKaFxM=; b=AHZOSWDR9RGdVq+nMNdw0SrRO
	5ITsTlpx2WuZ0AtO552lxqsSRQNthO7xAJlxe+vtpPqOiOq4jjUuOWyLhJLWITcG6B+SWV/2p2BY9
	DNfZX/V7kBBqv9BXfYdtLz+yRrYG4OOYbcjYZQ2Q6ySN6VsgL+OBCkRY2S9QMqDbP8YnB8D7s8Sky
	l4WF0QI4JyGPGVlAAgTQT9g/s6V14lThfsZqlJPzqUJ1rL93ti6CdPTkHurlmVhGCwe5t31E/ryHV
	SL+269JqeoATWQqZuxB5XtsOKg8GKNZsJd1BnUP7ooOR0VcO2C8bVYkVgaGdbohP7U3dfsB2r5wtn
	aab3u3cjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZGHw-00EoRJ-MY; Wed, 21 Apr 2021 17:05:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZGHt-00EoR8-9G
 for linux-mtd@desiato.infradead.org; Wed, 21 Apr 2021 17:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8FXKniw8jHOTahM/pwMH/P6A02dlxXcwmF/jIM5RqeA=; b=eoLS6q5ZGk0+urfo3Ej4Kfjlvq
 XEZ4DBqBRJafxuICUZRTV2srhbgpHUzgMR1DBK6T4z9a10Gc9OgvJB2NDzdFgJuQS7gEpm87jg1+O
 m266IdmyIDTx3WrI4i4gXvq0u07JBtnylp0jd5DByzfprJGRd61+96pCnvUqGBYzBUw5eEMTTzSHi
 vkfHPzF85Hxek5ku4xBKev1W1XnKUFp22mV1HHA/vnnlYEo3EURjZMq4Y9mNBxECxIn899qmnIex6
 aQVpvSHYMCBn2c4toz5EmVvv/kHqxIQw1U7R+HvwXIxB2mmRoNSInCQSVPotA3XRCe9FLv7uR9pOP
 9ZMeq1cQ==;
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZGHp-00D34q-TL
 for linux-mtd@lists.infradead.org; Wed, 21 Apr 2021 17:05:15 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so39566078otn.1
 for <linux-mtd@lists.infradead.org>; Wed, 21 Apr 2021 10:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8FXKniw8jHOTahM/pwMH/P6A02dlxXcwmF/jIM5RqeA=;
 b=N+tCAuFaraRLdozeV+aVdt08cEksWxzf26fp3ZCEj6gsbUv2iTd/qxvfC5DAY/T+2U
 9kdCoYyszcftfb6UfyLwrsIoL7y3B9VUkIUMoL0wgyzd9PNw0PkWXL46TU6FUwBYSauI
 Q+CxnPTi7ii/NF9NOaEVzHPmoCWVaFOdxGLh3sPiHZhVaxxizcVrb4z0GBVd4REx5ET0
 jhoYDK2qGfcQ8YgqhbaCWDnr7Knix1Nvk4KUbd3C0gDmbhWnn69fS+tcvo5TALrBOrg+
 n75oxrvyRBAudEKahCX96FqqUWnDEt7GLN1Vc1LFvJqeThdcRe0XjsP47Yf94Cr+RniL
 899g==
X-Gm-Message-State: AOAM531txu64ccw6H1cP0UYueVnm6ZWNgDckw7HINz35UnP9rnF4TNmP
 2+kl3ct1hcbVZITempv8ug==
X-Google-Smtp-Source: ABdhPJzzucGM3FgxeYjJT19A18C4RGp+yiS9lYimDHaT+KnSAYKGvVLYHSUZvZFtvFirzQHOyETmVQ==
X-Received: by 2002:a9d:5c87:: with SMTP id a7mr6928563oti.292.1619024712567; 
 Wed, 21 Apr 2021 10:05:12 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a6sm563809oiw.44.2021.04.21.10.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 10:05:11 -0700 (PDT)
Received: (nullmailer pid 1299462 invoked by uid 1000);
 Wed, 21 Apr 2021 17:05:09 -0000
Date: Wed, 21 Apr 2021 12:05:09 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V3] dt-bindings: mtd: brcm,brcmnand: convert to the
 json-schema
Message-ID: <20210421170509.GA1299408@robh.at.kernel.org>
References: <20210416195432.24595-1-zajec5@gmail.com>
 <20210420212008.13174-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420212008.13174-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_100513_966479_3CAC2A68 
X-CRM114-Status: GOOD (  13.53  )
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

T24gVHVlLCAyMCBBcHIgMjAyMSAyMzoyMDowOCArMDIwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3Rl
Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIGhl
bHBzIHZhbGlkYXRpbmcgRFRTIGZpbGVzLgo+IAo+IENoYW5nZXMgdGhhdCByZXF1aXJlIG1lbnRp
b25pbmc6Cj4gMS4gUHJvcGVydHkgImNsb2NrIiB3YXMgcmVuYW1lZCB0byAiY2xvY2tzIgo+IDIu
IER1cGxpY2F0ZWQgcHJvcGVydGllcyAoZGVmaW5lZCBpbiBuYW5kLWNvbnRyb2xsZXIueWFtbCkg
d2VyZSBkcm9wcGVkCj4gMy4gQ29tcGF0aWJsZSAiYnJjbSxuYW5kLWJjbTYzMTY4IiB3YXMgYWRk
ZWQKPiA0LiBTb0Mgc3BlY2lmaWMgImNvbXBhdGlibGUiIGNhc2VzIGdvdCBsaW1pdGVkIGNvbnRy
b2xsZXIgdmVyc2lvbnMKPiAKPiBFeGFtcGxlcyBjaGFuZ2VzOgo+IDEuIE5vZGVzICJuYW5kIiB3
ZXJlIHJlbmFtZWQgdG8gIm5hbmQtY29udHJvbGxlciIKPiAyLiBOb2RlcyAibmFuZGNzIiB3ZXJl
IHJlbmFtZWQgdG8gIm5hbmQiCj4gMy4gRHJvcHBlZCBwYXJ0aXRpb25zIGFzIHRoZXkgd2VyZSB1
c2luZyBvbGQgc3ludGF4IGFuZCBhcmUgd2VsbAo+ICAgIGRvY3VtZW50ZWQgZWxzZXdoZXJlIGFu
eXdheQo+IAo+IFRoaXMgcmV3cml0dGVuIGJpbmRpbmcgdmFsaWRhdGVzIGNsZWFubHkgdXNpbmcg
dGhlICJkdF9iaW5kaW5nX2NoZWNrIi4KPiBTb21lIExpbnV4IHN0b3JlZCBEVFMgZmlsZXMgd2ls
bCByZXF1aXJlIHVwZGF0aW5nIHRvIG1ha2UgImR0YnNfY2hlY2siCj4gaGFwcHkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IFYy
OiBEcm9wIGV4YW1wbGUgcGFydGl0aW9ucyB0aGF0IHdlcmUgdXNpbmcgZGVwcmVjYXRlZCBzeW50
YXgtdGhhbmtzIFJvYgo+IFYzOiAiU29DIHNwZWNpZmljICJjb21wYXRpYmxlIiBjYXNlcyBnb3Qg
bGltaXRlZCBjb250cm9sbGVyIHZlcnNpb25zIgo+ICAgICBUaGFua3MgUm9iIGZvciB0ZWFjaGlu
ZyBtZSB0aGUgaXRlbXM6IGVudW0gW10gdHJpY2sgKG5vICItIikKPiAtLS0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0IHwgMTg2IC0tLS0tLS0tLS0tLS0t
Cj4gIC4uLi9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sICAgICAgICAgICB8IDI0MiAr
KysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNDIgaW5zZXJ0aW9ucygrKSwg
MTg2IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlh
bWwKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
