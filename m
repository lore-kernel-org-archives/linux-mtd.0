Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78C7C04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 19:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PePifSOHdpTrza29dxjXICH9wp6mnwhfzwHtX31HUtU=; b=zQZcxEqwt61ZXU
	p/nfpyq3/1Ma6bQDJicAQSxkKV9/2WtDQaIT2Cit/CKHpXZBagGP/1PN7uDcpJL+o6BJOSumbSgOy
	Tift8VNUSqPIurAqTHn+tEMIRPCEKm8Invb/qB737Wn1qMd1Ct7EyQjZFXlyUP+t1d1iCOCgLrhmm
	7GY7+uYX4j4WGHTt+/DOpJV36IzArBXqHB3oCps0r1FRu5rdnifjqSgewuwbx53Vd9mkuhr5CS+PF
	S30fsZJFxlz1kznOb83I33ZyskIkr94+q3OPLZXXHtLsthKbukeaJXAmS4UPAQMRl6k1xL0iVNfn9
	noYDA/MmoED4m82jMrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH95c-00DUDB-RL; Thu, 28 Jul 2022 19:22:32 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH95R-00DU83-DL; Thu, 28 Jul 2022 19:22:22 +0000
Received: by mail-pg1-x52e.google.com with SMTP id bh13so2283260pgb.4;
        Thu, 28 Jul 2022 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=EFOAo/QdtEPRv+rmfrGIwUMKLAu+6hzcQDL1f3TAQNM=;
        b=lB+pWhhlv93nZ1uF9MlIOnX5O59BjNqfBlzyuwaJ9IcEqZIikDytWL8FxK9mRR7bGC
         CP0N3vcVC4GRQyBqp/aXDsHM+Rp/kL+AcBtbGgawHiyB0n2SQ/S9YTLhVKYgLJzYvnfa
         DRgHjFYGggf4djkLYGpyCKIAfFc4nCcIoEjsFfGVMZ1/sB2/Jgb8jz20AGsMwpQd4Rhb
         5lHHgqgPkKGl66JAg/+e1Wkvj9UiHeRANwaOr3+bwehcQ5WJ52Rwi+bf7sjW1dQxqAEB
         0wInCPsCu9FBE5kiqsjVn81pQZUQnEayOJ4Rp+zGMKxlzT+3V1MGecumxQBkOPnllvzK
         p+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EFOAo/QdtEPRv+rmfrGIwUMKLAu+6hzcQDL1f3TAQNM=;
        b=jyST+PBzcV4g9CI6o3VBFw9oRDrgddV9I6hzRu+QdSAivh/VrKayouX+VUIV3bqrUM
         FJJhl4Ej+QqqhNG2RKTmwmSELiPVfnvj5D1Rv3AwhLT4BSjr9QV4XmeFKtYmm0aJHFkB
         ViMBa7Ha9T5oGcXDSgCB/j9Kmnk8sCcdxLFCliNLBfZ9iPDtg4aIykQ6rK6hMnQttOiy
         t3wiZfyfddVB2SBQiEGrv9MopLvDNNJam4Fp845/1weAEkHZl1YjStjPC0bcMVzwnHOx
         czeRHKc/YgJK8RbRq9M5N8GPLrItJoWv8nPjDDLE0e1ht1PTmjCQIQAatvP9Df0Ej7eq
         kIYA==
X-Gm-Message-State: AJIora8VZTA5/gd/HrXZ6iloozFXnZyvFYC9iXpsDJUyXRNq7n4OM6/W
	anxvjpA/zuy/whyyTR2KLMs=
X-Google-Smtp-Source: AGRyM1tj9cuz/W4LAd9BMq4WIOZkxkrW2UJLCS/AeNw+AhegYlhfdsgfmykyQIPR9LbFViQAWRDZ3w==
X-Received: by 2002:a63:ce0f:0:b0:41a:f0ee:c28e with SMTP id y15-20020a63ce0f000000b0041af0eec28emr190116pgf.43.1659036138925;
        Thu, 28 Jul 2022 12:22:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id m8-20020a654c88000000b0040cfb5151fcsm1282985pgt.74.2022.07.28.12.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 12:22:18 -0700 (PDT)
Message-ID: <db9560c1-7fc7-405e-bee1-3827a943b712@gmail.com>
Date: Thu, 28 Jul 2022 12:22:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/9] arm64: bcmbca: Make BCM4908 drivers depend on
 ARCH_BCMBCA
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 William Zhang <william.zhang@broadcom.com>
Cc: Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 joel.peshkin@broadcom.com,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 dan.beygelman@broadcom.com, anand.gore@broadcom.com,
 kursad.oney@broadcom.com, krzysztof.kozlowski@linaro.org,
 Guenter Roeck <linux@roeck-us.net>, Bjorn Helgaas <bhelgaas@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220725055402.6013-1-william.zhang@broadcom.com>
 <20220725055402.6013-7-william.zhang@broadcom.com>
 <63797827553783061a0ad5e897ed6538@milecki.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <63797827553783061a0ad5e897ed6538@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_122221_488001_7ED1B3EE 
X-CRM114-Status: GOOD (  19.43  )
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

T24gNy8yNy8yMiAwNTozMSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE9uIDIwMjItMDctMjUg
MDc6NTMsIFdpbGxpYW0gWmhhbmcgd3JvdGU6Cj4+IFdpdGggQnJvYWRjb20gQnJvYWRiYW5kIGFy
Y2ggQVJDSF9CQ01CQ0Egc3VwcG9ydGVkIGluIHRoZSBrZXJuZWwsIHRoaXMKPj4gcGF0Y2ggc2Vy
aWVzIG1pZ3JhdGUgdGhlIEFSQ0hfQkNNNDkwOCBzeW1ib2wgdG8gQVJDSF9CQ01CQ0EuIEhlbmNl
Cj4+IHJlcGxhY2UgQVJDSF9CQ000OTA4IHdpdGggQVJDSF9CQ01CQ0EgaW4gc3Vic3lzdGVtIEtj
b25maWcgZmlsZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0u
emhhbmdAYnJvYWRjb20uY29tPgo+PiBBY2tlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9l
Y2stdXMubmV0PiAoZm9yIHdhdGNoZG9nKQo+PiBBY2tlZC1ieTogQmpvcm4gSGVsZ2FhcyA8Ymhl
bGdhYXNAZ29vZ2xlLmNvbT4gKGZvciBkcml2ZXJzL3BjaSkKPiAKPiBJIHN0aWxsIHRoaW5rIGl0
IG1heSBiZSBhIGJhZCBpZGVhIGZvciBhbGwgYmVsb3cgZHJpdmVycy4gUGxlYXNlIHNlZSBteQo+
IHByZXZpb3VzIGUtbWFpbDoKPiBSZTogW1JFU0VORCBQQVRDSCA2LzldIGFybTY0OiBiY21iY2E6
IE1ha2UgQkNNNDkwOCBkcml2ZXJzIGRlcGVuZCBvbiBBUkNIX0JDTUJDQQo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvZWVlOGM4NTY1MmU2ZGFjNjk0MjBhODc2ZDAz
ZjY3YzRAbWlsZWNraS5wbC8KPiAKPiBJIHRoaW5rIHdlIHNob3VsZDoKPiAxLiBLZWVwIEFSQ0hf
QkNNNDkwOCBmb3IgNDkwOCBzcGVjaWZpYyBkcml2ZXJzIChlLmcuIG10ZCwgcGluY3RybCwgbmV0
KQo+IDIuIFVzZSBBUkNIX0JDTUJDQSBmb3IgbW9yZSBnZW5lcmljIGRyaXZlcnMgKGUuZy4gSTJD
LCBQQ0ksc2VyaWFsLCBXRCkKCklNSE8gaGVyZSBpcyBubyBwb2ludCBpbiBrZWVwaW5nIGFuIEFS
Q0hfQkNNNDkwOCBhbnltb3JlIHdoZW4gdGhlIHdob2xlIHBvaW50IG9mIHRoZSBwYXRjaCBzZXJp
ZXMgaXMgdG8gZG8gYSBicm9hZCBjb252ZXJzaW9uIG9mIEFSQ0hfQkNNNDkwOCBpbnRvIEFSQ0hf
QkNNQkNBLiBFdmVuIGlmIHNvbWUgb2YgdGhlIGRyaXZlcnMgYXJlIGNvbnNpZGVyZWQgb3IgdGhv
dWdodCB0byBiZSA0OTA4LXNwZWNpZmljLCB0aGlzIGlzIG5vdCBnb2luZyB0byBiZSBhbiBpc3N1
ZSBpbiBwcmFjdGljZSBiZWNhdXNlIHRoZXJlIG91Z2h0IHRvIGJlIGFwcHJvcHJpYXRlIGNvbXBh
dGlibGUgc3RyaW5ncyBzdWNoIHRoYXQgZXZlbiBpZiB5b3UgYnVpbHQgYSA0OTA4LXNwZWNpZmlj
IGRyaXZlciBpbnRvIGEgZ2VuZXJpYyBBUkNIX0JDTUNBIGtlcm5lbCwgdGhlIGFjdHVhbCBwcm9i
aW5nIHdvdWxkIG9ubHkgaGFwcGVuIG9uIDQ5MDguCgpOb3cgbGV0IHVzIGZsaXAgaXQgdGhlIG90
aGVyIHdheSByb3VuZCwgbGV0J3Mgc2F5IHdlIGtlZXAgQVJDSF9CQ000OTA4IGFzIGEgc3ViLWFy
Y2ggb2YgQVJDSF9CQ01CQ0EsIHRoZW4gdGhpcyBzZXRzIGEgcHJlY2VkZW50IGZvciBhZGRpbmcg
bW9yZSBhbmQgbW9yZSBvZiB0aG9zZSBBUkNIX0JDTTQ5MDYsIEFSQ0hfQkNNNDkxMiBldGMuIGV0
YyB0byBmdXR1cmUga2VybmVscyB1bmRlciB0aGUgc2FtZSByZWFzb25zIHRoYXQgd2UgbWlnaHQg
d2FudCB0byBnYXRlIGNlcnRhaW4gZHJpdmVycyB0byBjZXJ0YWluIHN1Yi1hcmNoZXMuIEJ1dCB3
aGF0IGdvb2QgZG9lcyB0aGF0IGRvPwoKQXQgc29tZSBwb2ludCB3ZSBnb3QgdG8gbWFrZSBpdCBz
aW1wbGUgZm9yIHRoZSB1c2VycywgYW5kIHRoZSBzaW1wbGVzdCB3YXkgaXMgdG8gaGF2ZSBBUkNI
X0JDTUJDQSBvbmx5IGFuZCBsZXQgRFQgZGljdGF0ZSB0aGUgZGV2aWNlIHNwZWNpZmljIHByb2Jp
bmcuCi0tIApGbG9yaWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
