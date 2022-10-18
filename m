Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DFFC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELIiYaGPgbvK6gsJ0VlYcoYjbnv/A5tO9bskwqzt6GA=; b=tk1CQLZsDTsXaL
	496ZGcm8p0kf64/6Rv6vR6kVIS3k5A79xGYPCbeedbNah2ufucTrtXlxhR7NPVGt/l9skH/6KB58Z
	F7tdUDszgCuqTdvpEORdZ64nEvfcBMGGr6DK4tcV/ijsMRLXHnLA2UIROVD7UhX1AfeMaA0LMNdbn
	i1YzbP+1+P+DGI7nPDOqL6ptf+APWMJCJXo5XRVYWn51GpW06G5FhbUs8WrKBgtMDtNW/lYOmIS1U
	JjaHng/lUDWVUolHZjoBCF8hPxoMFPMEontjd0t1NmWNPAZnC0fVNbaFwlHl7r78yi+SOEvQcJiFc
	yE8X9dTpTY8+RtUcxBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okow5-0086AS-Jy; Tue, 18 Oct 2022 15:55:21 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okow2-00861b-5O; Tue, 18 Oct 2022 15:55:19 +0000
Received: by mail-ej1-x62b.google.com with SMTP id d26so33311322ejc.8;
        Tue, 18 Oct 2022 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ze2iQW7Ubk1DBaTyzAEIIUKAqNn2VA5sWTsaUEmBUpM=;
        b=Dl4L5xbF7jd0OVQQ3rs5MnpwKOcbg52KbtO6WWw0M1SksG1GWj0kxDC1HXekzP8OV0
         /y2NLJS94MGFVVhejp0ts7xB0gLn4ZI4fNvuMM2xph3I448b1AG9kmAzhZe0piEnSM86
         CFG+HYUVAANgyeKQpimlX3Wq7osNHrpOxG+RCPc+zP5qWxgPkJFEiwfqD8Mu4lUtqdyR
         ZU5ldU9oy7/xGf8o1J3k3jX+ZZdM85JbF9GQSY+brcHLVdNN518tWyS5Tj7EJ8sUik1C
         dZtT7LpwOWjg0DBXBQivCly/NCZCxnwW8bmfJtpUQVQA8C7/AwqCucdpajrDtbxEvLpm
         Aq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ze2iQW7Ubk1DBaTyzAEIIUKAqNn2VA5sWTsaUEmBUpM=;
        b=OO4riK09xsAh0EqyYcqZvJVKhnk6qKsXk99LN2kOwnGI34OvNWen9E2D22/99q1wwK
         fWsM47ckEpH/rv8sMs/FUNSEiQ/WKvIGb+4cENWLUrMpR8x2eazE2xX0KntFn0kfyCNe
         yAUeq7I3zZ0M0oDGyY9RxoVFbzjNFKWOn4NvW1EmhxUleYkllJZtockGe5ZMrA04At9n
         NR7/DlVQW+G/e0B2catzCYu2tiwMve7WHVaJkGDUYfvKbi7KWM8eYbM+Rpv3CfsJOcPh
         /2867tyYRB7/q3myaEgsPfZg+snlUpyu5La+AZXDenlhof+nz80u70V9rydLqLQo4bpn
         hpzQ==
X-Gm-Message-State: ACrzQf1dXlp1/7OTJB6b/wc+gN8wDZedw/iJXmDIM9G8l4tDJJUUBigo
	nyOreILU9H7j7A2KE48OE6g=
X-Google-Smtp-Source: AMsMyM7NKaPdktFPck4SbtkHlX5uYLlpxukySouUq+wlEPXTXynkWtkbFsAbfrE18sqR7TkD6NmkxA==
X-Received: by 2002:a17:907:1ded:b0:78d:4606:268 with SMTP id og45-20020a1709071ded00b0078d46060268mr3046776ejc.163.1666108516509;
        Tue, 18 Oct 2022 08:55:16 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id e26-20020a056402149a00b0043bbb3535d6sm9067327edv.66.2022.10.18.08.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 08:55:15 -0700 (PDT)
Message-ID: <bd2bcbeb-c800-4f14-c801-c6b5489dbf49@gmail.com>
Date: Tue, 18 Oct 2022 17:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: u-boot: allow
 dynamic subpartitions
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tom Rini <trini@konsulko.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Joel Peshkin <joel.peshkin@broadcom.com>,
 William Zhang <william.zhang@broadcom.com>,
 Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 u-boot@lists.denx.de, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20221018154202.4634-1-zajec5@gmail.com> <Y07LYoq6Dh+k0uJm@spud>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <Y07LYoq6Dh+k0uJm@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_085518_263644_5D7DCF29 
X-CRM114-Status: GOOD (  13.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTguMTAuMjAyMiAxNzo1MCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDE4
LCAyMDIyIGF0IDA1OjQyOjAxUE0gKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gRnJv
bTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pgo+PiBVLUJvb3QgcGFydGl0
aW9uIG1heSBjb250YWluIHN1YnBhcnRpdGlvbnMuIEZvciBleGFtcGxlIEJyb2FkY29tCj4+IGlu
Y2x1ZGVzIGVudmlyb25tZW50IGRhdGEgYmxvY2sgaW4gdGhlIG1pZGRsZSBvZiBpdHMgVS1Cb290
IHBhcnRpdGlvbi4KPj4KPj4gVGhpcyBhbGxvd3MgZGVzY3JpYmluZyBCcm9hZGNvbSdzIFUtQm9v
dCBlbnYgZGF0YSBhbmQgd2lsbCBhbGxvdwo+PiByZWZlcmVuY2luZyBpdHMgTlZNRU0gY2VsbCBp
biB0aGUgZnV0dXJlLgo+Pgo+PiBSZWc6IDExOGYzZmJlNTE3ZjQgKCJkdC1iaW5kaW5nczogbXRk
OiBwYXJ0aXRpb25zOiBzdXBwb3J0IGxhYmVsL25hbWUgb25seSBwYXJ0aXRpb24iKQo+IAo+IFBh
cmRvbiBteSBpZ25vcmFuY2UgaGVyZSwgYnV0IHdoYXQgaXMgdGhlIHNpZ25pZmljYW5jZSBvZiBh
ICJSZWciIHRhZz8KClRoYXQgd2FzIG1lYW50IHRvIGJlICJSZWY6IiBhbmQgd2FzIG1lYW50IHRv
IHNob3cgY29tbWl0IHRoYXQgaW50cm9kdWNlZApjb25jZXB0IG9mIGR5bmFtaWMgcGFydGl0aW9u
cy4gSSB0aG91Z2h0IGl0J3MgYSBuZXcgZmVhdHVyZSBub3QgZXZlcnlvbmUKbWF5IGJlIGZhbWls
aWFyIHdpdGggeWV0LiBJIHRob3VnaHQgaXQgbWF5IGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2gu
CgpJZiB0aGF0IGlzIHBvaW50bGVzcyB0aG91Z2ggY291bGQgeW91IFJvYiBqdXN0IGRyb3AgdGhv
c2UgdGFncyB3aGlsZQphcHBseWluZywgcGxlYXNlPyBJIGd1ZXNzIEknbGwganVzdCBsZXQgeW91
IGRlY2lkZS4KCgo+PiBSZWY6IGRkNjM4MjAyZGZiNjUgKCJkdC1iaW5kaW5nczogbXRkOiBwYXJ0
aXRpb25zOiBhZGQgYWRkaXRpb25hbCBleGFtcGxlIGZvciBxY29tLHNtZW0tcGFydCIpCj4+IFNp
Z25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
