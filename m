Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59359C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 16 May 2023 18:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqeyT1kBuh3c+dqhGj6P+iGuhNw79agc1egF3skdjDo=; b=KyqpfGSLl6lMTc
	ng6g9Yt6dZCjtJgBVjaSLjuIMpYzzxq24jdXmlPtGuGYetQBWBrQ1eADy/qjt19vTJ9ds+l95kPT8
	zhvDRx3SmcYxfKnzLajD6EprUanYO86sNAk5aOGajv7UY8MEawC2EZc0SbPznjDwSehytOStiFx8r
	166LSUADdn+U1HNHg52gEwV7Rlr5bMQFlr2VP4YkNBBVDgezWEGr+TaO1C8gYFoDOnl8Pwhkese4V
	fHK/NRcCLQtndtpEYns6JquBy3TP6BI6BfQRzkQg2nA3m11jp2i6ndQcfBEm5OS7RDORkyiEo8tXK
	Nm8kHpGojteBKsuhUh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyzsu-006q4U-1v;
	Tue, 16 May 2023 18:58:56 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyzsr-006q3H-17
	for linux-mtd@lists.infradead.org;
	Tue, 16 May 2023 18:58:55 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-52c6f8ba7e3so13410307a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 16 May 2023 11:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684263530; x=1686855530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7EO4n2Laz1C8qlwm0BP2KlWTOgG8jnlCRu8xYXVkBlM=;
        b=MLdDUCoUXgY3VBc/rG1vVKVuaE1Q0o8/k3HGC2dyqrjZRlmTTkH8Lg1E4Zi0qE9ko4
         AKGMH3/QCg70BRCEqyjyq2Z5GdWjCcpI+BQrdiKVNnts3+LlsBxk7F5NmILLGJzWznv/
         E7M+lc52SvCc9pyjHrxtvETLbOK5xHSbEu3fbBwgRnbp5KVP8gqEd6IrkTZbIOWHq/53
         3rp/VrPbNU1r+KwhSRLM7n+EOiJJR42SKrEkve/XkFNIAqDc8VT6bdHYRta0TcpK97cL
         qGEP8lszoL3GfSkb3b63V2grpmNueF4f5omuGTEbcnW1sSaD5py89A3zLVXy4snIAx6u
         7Nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684263530; x=1686855530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EO4n2Laz1C8qlwm0BP2KlWTOgG8jnlCRu8xYXVkBlM=;
        b=PHGFMTCUUdk/Ydmcq9wTF3VAqqZ9ycc6lYZZREKJICGS9+/MZv7o1dGDq+ezlB3KvU
         4Fz8pRJujgITZuy5ky5m9IGu6CNGLpGwYPY7HEM6/WSkjCbFlWqv9zZ5gMz1Qi/6da5Y
         nkqBmKFGTcMHPAKaD/QZhaLYqBwFpKVemsKmQSvSgczc31rvbg1gJaqCdDY0Ud7jcbu0
         oP2IjoXqglRHcuh7VwBdFYcMd/vmyjtjKQ9y0Owzpko5p82kfB8rUaeLEWPPeWAWVi7G
         zOrF8RPIVCp/NzF75nEToY9g5GrFibkG6qKo6hZJuulC+pigXNwBgWuXXee/sVAO23RE
         4N2Q==
X-Gm-Message-State: AC+VfDy/SCHqY+it7cTYYy+D8jav01BnHUJH5Db1XwOht+YTBwQZCNxT
	F7ZjA9sIapDjn/BbzIPkJjU=
X-Google-Smtp-Source: ACHHUZ5CUsECtgNKu55O5QVrBpZTCG2cVdRZpXkmGOKliZK8PRC4JUHzZkvrgQg1GcCsCLTIZ6wUaQ==
X-Received: by 2002:a05:6a21:6d8b:b0:104:961d:9e6d with SMTP id wl11-20020a056a216d8b00b00104961d9e6dmr18591524pzb.37.1684263530149;
        Tue, 16 May 2023 11:58:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id m26-20020aa78a1a000000b0063b7f3250e9sm13836231pfa.7.2023.05.16.11.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 11:58:49 -0700 (PDT)
Message-ID: <d0543f48-6f0b-58e0-cc18-695a28c493fc@gmail.com>
Date: Tue, 16 May 2023 11:58:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nand: Macronix: document new
 binding
Content-Language: en-US
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 liao jaime <jaimeliao.tw@gmail.com>,
 "William (Zhenghao) Zhang" <william.zhang@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAAQoYRm3766SG7+VuwVzu_xH8aWihoKWMEp8xQGNgJ6oOtC9+g@mail.gmail.com>
 <CAAQoYRmXdMp7b2r+yCRUtGrbfQH-Cb8gMAVo7YscuQEM5kgajw@mail.gmail.com>
 <CAKR-sGdiLzZ7iVbLmz1uPwYoUXQZ2qGwmCBAq_-OKXfVT=Pj-A@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAKR-sGdiLzZ7iVbLmz1uPwYoUXQZ2qGwmCBAq_-OKXfVT=Pj-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_115853_386869_4EA65CA4 
X-CRM114-Status: GOOD (  41.42  )
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

K1dpbGxpYW0sCgpPbiA1LzE2LzIzIDExOjU1LCDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgd3Jv
dGU6Cj4gSGkgSmFpbWUsCj4gCj4gSSd2ZSByZXByb2R1Y2VkIHRoZSBpc3N1ZSBvbiBhIENvbXRy
ZW5kIFZSLTMwMzJ1IChNWDMwTEYxRzA4QUEpLiBBZnRlcgo+IGZvcmNpbmcgaXQgdG8gY2hlY2sg
YmxvY2sgcHJvdGVjdGlvbiAoaXQncyBub3Qgc3VwcG9ydGVkIG9uIHRoYXQKPiBkZXZpY2UpLCB0
aGUgTkFORCBjb250cm9sbGVyIHN0b3BzIHJlYWRpbmcvd3JpdGluZyBhbnl0aGluZy4KPiAKPiBA
RmxvcmlhbiBpcyBpdCBwb3NzaWJsZSB0aGF0IGxvdyBsZXZlbCBvcHMgKEdFVF9GRUFUVVJFUy9T
RVRfRkVBVFVSRVMpCj4gYXJlbid0IHN1cHBvcnRlZCBvbiBCQ002MzI2OCBOQU5EIGNvbnRyb2xs
ZXJzIGFuZCB0aGlzIGlzIGNhdXNpbmcgdGhlCj4gaXNzdWU/CgpZZXMsIHRoaXMgbG9va3MgbGlr
ZSB3aGF0IHdlIGhhdmUgc2VlbiBhcyB3ZWxsIGV2ZW4gd2l0aCBuZXdlciBOQU5EIApjb250cm9s
bGVycyBhY3R1YWxseS4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gb2J0YWluIGEgZnVsbCBsb2cg
ZnJvbSAKZWl0aGVyIG9mIHlvdT8KCldpbGxpYW0sIGlzIHRoaXMgc29tZXRoaW5nIHlvdSBoYXZl
IHNlZW4gYmVmb3JlIGFzIHdlbGw/Cgo+IAo+IEJlc3QgcmVnYXJkcywKPiDDgWx2YXJvLgo+IAo+
IEVsIG1pw6ksIDI2IGFiciAyMDIzIGEgbGFzIDk6MjQsIGxpYW8gamFpbWUgKDxqYWltZWxpYW8u
dHdAZ21haWwuY29tPikgZXNjcmliacOzOgo+Pgo+PiBIaSDDgWx2YXJvCj4+Cj4+IEluIG5hbmRf
c2Nhbl90YWlsKCksIGVhY2ggbWFudWZhY3R1cmVyIGluaXQgZnVuY3Rpb24gY2FsbCB3aWxsIGJl
IGV4ZWN1dGUuCj4+IEluIG1hY3Jvbml4X25hbmRfaW5pdCgpLCBibG9jayBwcm90ZWN0IHdpbGwg
YmUgZXhlY3V0ZSBhZnRlciBmbGFzaCBkZXRlY3QuCj4+IEkgaGF2ZSB2YWxpZGF0ZSBNWDMwTEYx
RzE4QUMgaW4gTGludXgga2VybmVsIHY1LjE1Lgo+PiBJIGRpZG4ndCBnb3Qgc2l0dWF0aW9uICJk
ZXZpY2UgaGFuZ3MiICBvbiBteSBzaWRlLgo+PiBCUCBpcyB0byBwcmV2ZW50IGluY29ycmVjdCBv
cGVyYXRpb25zLgo+PiBQbGVhc2UgY2hlY2sgdGhlIGNvbnRyb2xsZXIgc2V0dGluZ3MgZm9yIHRy
YWNpbmcgdGhpcyBpc3N1ZS4KPj4KPj4gVGhhbmtzCj4+IEphaW1lCj4+Cj4+Pgo+Pj4gSGVsbG8g
WW91Q2hpbmcgYW5kIEphaW1lLAo+Pj4KPj4+IEkgc3RpbGwgZGlkbid0IGdldCBhbnkgZmVlZGJh
Y2sgZnJvbSB5b3UgKG9yIE1hY3Jvbml4KSBvbiB0aGlzIGlzc3VlLgo+Pj4gRGlkIHlvdSBoYXZl
IHRpbWUgdG8gbG9vayBpbnRvIGl0Pwo+Pj4KPj4+IFRoYW5rcywKPj4+IMOBbHZhcm8uCj4+Pgo+
Pj4gRWwgdmllLCAyNCBtYXIgMjAyMyBhIGxhcyAxODowNCwgw4FsdmFybyBGZXJuw6FuZGV6IFJv
amFzCj4+PiAoPG5vbHRhcmlAZ21haWwuY29tPikgZXNjcmliacOzOgo+Pj4+Cj4+Pj4gSGkgTWlx
dcOobCwKPj4+Pgo+Pj4+IDIwMjMtMDMtMjQgMTU6MzYgR01UKzAxOjAwLCBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPj4+Pj4gSGkgw4FsdmFybywKPj4+Pj4KPj4+
Pj4gKyBZb3VDaGluZyBhbmQgSmFpbWUgZnJvbSBNYWNyb25peAo+Pj4+PiBUTERSIGZvciB0aGVt
OiB0aGVyZSBpcyBhIG1pc2JlaGF2aW9yIHNpbmNlIE1hc29uIGFkZGVkIGJsb2NrCj4+Pj4+IHBy
b3RlY3Rpb24gc3VwcG9ydC4gSnVzdCBjaGVja2luZyBpZiB0aGUgYmxvY2tzIGFyZSBwcm90ZWN0
ZWQgc2VlbXMgdG8KPj4+Pj4gbWlzY29uZmlndXJlIHRoZSBjaGlwIGVudGlyZWx5LCBzZWUgYmVs
b3cuIEFueSBoaW50cz8KPj4+Pgo+Pj4+IENvdWxkIGl0IGJlIHRoYXQgdGhlIE5BTkQgaXMgc3R1
Y2sgZXhwZWN0aW5nIGEgcmVhZCAweDAwIGNvbW1hbmQgd2hpY2gKPj4+PiBpc27igJl0IHNlbnQg
YWZ0ZXIgZ2V0dGluZyB0aGUgZmVhdHVyZXM/Cj4+Pj4KPj4+Pj4KPj4+Pj4gbm9sdGFyaUBnbWFp
bC5jb20gd3JvdGUgb24gRnJpLCAyNCBNYXIgMjAyMyAxNToxNTo0NyArMDEwMDoKPj4+Pj4KPj4+
Pj4+IEhpIE1pcXXDqGwsCj4+Pj4+Pgo+Pj4+Pj4gMjAyMy0wMy0yNCAxNDo0NSBHTVQrMDE6MDAs
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ogo+Pj4+Pj4+IEhpIMOB
bHZhcm8sCj4+Pj4+Pj4KPj4+Pj4+PiBub2x0YXJpQGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDI0
IE1hciAyMDIzIDEyOjIxOjExICswMTAwOgo+Pj4+Pj4+Cj4+Pj4+Pj4+IEVsIHZpZSwgMjQgbWFy
IDIwMjMgYSBsYXMgMTE6NDksIE1pcXVlbCBSYXluYWwKPj4+Pj4+Pj4gKDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPikgZXNjcmliacOzOgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEhpIMOBbHZhcm8s
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gbm9sdGFyaUBnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAyNCBN
YXIgMjAyMyAxMTozMToxNyArMDEwMDoKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSGkgTWlxdcOobCwK
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEVsIHZpZSwgMjQgbWFyIDIwMjMgYSBsYXMgMTA6NDAsIE1p
cXVlbCBSYXluYWwKPj4+Pj4+Pj4+PiAoPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+KSBlc2Ny
aWJpw7M6Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEhpIMOBbHZhcm8sCj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+IG5vbHRhcmlAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMjMgTWFyIDIwMjMgMTM6
NDU6MDkgKzAxMDA6Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBBZGQgbmV3ICJteGljLGRpc2Fi
bGUtYmxvY2stcHJvdGVjdGlvbiIgYmluZGluZyBkb2N1bWVudGF0aW9uLgo+Pj4+Pj4+Pj4+Pj4g
VGhpcyBiaW5kaW5nIGFsbG93cyBkaXNhYmxpbmcgYmxvY2sgcHJvdGVjdGlvbiBzdXBwb3J0IGZv
cgo+Pj4+Pj4+Pj4+Pj4gdGhvc2UKPj4+Pj4+Pj4+Pj4+IGRldmljZXMgbm90Cj4+Pj4+Pj4+Pj4+
PiBzdXBwb3J0aW5nIGl0Lgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Cj4+Pj4+Pj4+Pj4+
PiAtLS0KPj4+Pj4+Pj4+Pj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9uYW5kLW1hY3Jvbml4LnR4dCB8IDMKPj4+Pj4+Pj4+Pj4+ICsrKwo+Pj4+Pj4+Pj4+Pj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4g
ZGlmZiAtLWdpdAo+Pj4+Pj4+Pj4+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL25hbmQtbWFjcm9uaXgudHh0Cj4+Pj4+Pj4+Pj4+PiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQKPj4+Pj4+Pj4+Pj4+IGluZGV4
IGZmYWIyOGEyYzRkMS4uMDNmNjVjYTMyY2QzIDEwMDY0NAo+Pj4+Pj4+Pj4+Pj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLW1hY3Jvbml4LnR4dAo+Pj4+
Pj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5k
LW1hY3Jvbml4LnR4dAo+Pj4+Pj4+Pj4+Pj4gQEAgLTE2LDYgKzE2LDkgQEAgaW4gY2hpbGRyZW4g
bm9kZXMuCj4+Pj4+Pj4+Pj4+PiAgIFJlcXVpcmVkIE5BTkQgY2hpcCBwcm9wZXJ0aWVzIGluIGNo
aWxkcmVuIG1vZGU6Cj4+Pj4+Pj4+Pj4+PiAgIC0gcmFuZG9taXplciBlbmFibGU6IHNob3VsZCBi
ZSAibXhpYyxlbmFibGUtcmFuZG9taXplci1vdHAiCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4g
K09wdGlvbmFsIE5BTkQgY2hpcCBwcm9wZXJ0aWVzIGluIGNoaWxkcmVuIG1vZGU6Cj4+Pj4+Pj4+
Pj4+PiArLSBibG9jayBwcm90ZWN0aW9uIGRpc2FibGU6IHNob3VsZCBiZQo+Pj4+Pj4+Pj4+Pj4g
Im14aWMsZGlzYWJsZS1ibG9jay1wcm90ZWN0aW9uIgo+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+PiBCZXNpZGVzIHRoZSBmYWN0IHRoYXQgbm93YWRheXMgd2UgcHJlZmVyIHRv
IHNlZSBiaW5kaW5nCj4+Pj4+Pj4+Pj4+IGNvbnZlcnNpb25zCj4+Pj4+Pj4+Pj4+IHRvCj4+Pj4+
Pj4+Pj4+IHlhbWwgYmVmb3JlIGFkZGluZyBhbnl0aGluZywgSSBkb24ndCB0aGluayB0aGlzIHdp
bGwgZmx5Lgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBJJ20gbm90IHN1cmUgZXhhY3RseSB3aGF0
ICJkaXNhYmxlIGJsb2NrIHByb3RlY3Rpb24iIG1lYW5zLCB3ZQo+Pj4+Pj4+Pj4+PiBhbHJlYWR5
IGhhdmUgc2ltaWxhciBwcm9wZXJ0aWVzIGxpa2UgImxvY2siIGFuZAo+Pj4+Pj4+Pj4+PiAic2Vj
dXJlLXJlZ2lvbnMiLAo+Pj4+Pj4+Pj4+PiBub3QKPj4+Pj4+Pj4+Pj4gc3VyZSB0aGV5IHdpbGwg
Zml0IGJ1dCBJIHRoaW5rIGl0J3Mgd29ydGggY2hlY2tpbmcuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
PiBBcyBleHBsYWluZWQgaW4gMi8yLCBjb21taXQgMDNhNTM5YzdhMTE4IGludHJvZHVjZWQgYSBy
ZWdyZXNzaW9uCj4+Pj4+Pj4+Pj4gb24KPj4+Pj4+Pj4+PiBTZXJjb21tIEg1MDAtcyAoQkNNNjMy
NjgpIE9wZW5XcnQgZGV2aWNlcyB3aXRoIE1hY3Jvbml4Cj4+Pj4+Pj4+Pj4gTVgzMExGMUcxOEFD
Cj4+Pj4+Pj4+Pj4gd2hpY2ggaGFuZ3MgdGhlIGRldmljZS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
IFRoaXMgaXMgdGhlIGxvZyB3aXRoIGJsb2NrIHByb3RlY3Rpb24gZGlzYWJsZWQ6Cj4+Pj4+Pj4+
Pj4gWyAgICAwLjQ5NTgzMV0gYmNtNjM2OF9uYW5kIDEwMDAwMjAwLm5hbmQ6IHRoZXJlIGlzIG5v
dCB2YWxpZCBtYXBzCj4+Pj4+Pj4+Pj4gZm9yCj4+Pj4+Pj4+Pj4gc3RhdGUgZGVmYXVsdAo+Pj4+
Pj4+Pj4+IFsgICAgMC41MDQ5OTVdIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElE
OiAweGMyLCBDaGlwIElEOgo+Pj4+Pj4+Pj4+IDB4ZjEKPj4+Pj4+Pj4+PiBbICAgIDAuNTExNTI2
XSBuYW5kOiBNYWNyb25peCBNWDMwTEYxRzE4QUMKPj4+Pj4+Pj4+PiBbICAgIDAuNTE1NTg2XSBu
YW5kOiAxMjggTWlCLCBTTEMsIGVyYXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZToKPj4+Pj4+
Pj4+PiAyMDQ4LCBPT0Igc2l6ZTogNjQKPj4+Pj4+Pj4+PiBbICAgIDAuNTIzNTE2XSBiY202MzY4
X25hbmQgMTAwMDAyMDAubmFuZDogZGV0ZWN0ZWQgMTI4TWlCIHRvdGFsLAo+Pj4+Pj4+Pj4+IDEy
OEtpQiBibG9ja3MsIDJLaUIgcGFnZXMsIDE2QiBPT0IsIDgtYml0LCBCQ0gtNAo+Pj4+Pj4+Pj4+
IFsgICAgMC41MzU5MTJdIEJhZCBibG9jayB0YWJsZSBmb3VuZCBhdCBwYWdlIDY1NDcyLCB2ZXJz
aW9uIDB4MDEKPj4+Pj4+Pj4+PiBbICAgIDAuNTQ0MjY4XSBCYWQgYmxvY2sgdGFibGUgZm91bmQg
YXQgcGFnZSA2NTQwOCwgdmVyc2lvbiAweDAxCj4+Pj4+Pj4+Pj4gWyAgICAwLjk1NDMyOV0gOSBm
aXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZQo+Pj4+Pj4+Pj4+
IGJyY21uYW5kLjAKPj4+Pj4+Pj4+PiAuLi4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFRoaXMgaXMg
dGhlIGxvZyB3aXRoIGJsb2NrIHByb3RlY3Rpb24gZW5hYmxlZDoKPj4+Pj4+Pj4+PiBbICAgIDAu
NDk1MDk1XSBiY202MzY4X25hbmQgMTAwMDAyMDAubmFuZDogdGhlcmUgaXMgbm90IHZhbGlkIG1h
cHMKPj4+Pj4+Pj4+PiBmb3IKPj4+Pj4+Pj4+PiBzdGF0ZSBkZWZhdWx0Cj4+Pj4+Pj4+Pj4gWyAg
ICAwLjUwNDI0OV0gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4YzIsIENo
aXAgSUQ6Cj4+Pj4+Pj4+Pj4gMHhmMQo+Pj4+Pj4+Pj4+IFsgICAgMC41MTA3NzJdIG5hbmQ6IE1h
Y3Jvbml4IE1YMzBMRjFHMThBQwo+Pj4+Pj4+Pj4+IFsgICAgMC41MTQ4NzRdIG5hbmQ6IDEyOCBN
aUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOgo+Pj4+Pj4+Pj4+IDIwNDgs
IE9PQiBzaXplOiA2NAo+Pj4+Pj4+Pj4+IFsgICAgMC41MjI3ODBdIGJjbTYzNjhfbmFuZCAxMDAw
MDIwMC5uYW5kOiBkZXRlY3RlZCAxMjhNaUIgdG90YWwsCj4+Pj4+Pj4+Pj4gMTI4S2lCIGJsb2Nr
cywgMktpQiBwYWdlcywgMTZCIE9PQiwgOC1iaXQsIEJDSC00Cj4+Pj4+Pj4+Pj4gWyAgICAwLjUz
OTY4N10gQmFkIGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwCj4+Pj4+Pj4+Pj4gWyAg
ICAwLjU1MDE1M10gQmFkIGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwCj4+Pj4+Pj4+
Pj4gWyAgICAwLjU1NTA2OV0gU2Nhbm5pbmcgZGV2aWNlIGZvciBiYWQgYmxvY2tzCj4+Pj4+Pj4+
Pj4gWyAgICAwLjYwMTIxM10gQ1BVIDEgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJl
cXVlc3QgYXQKPj4+Pj4+Pj4+PiB2aXJ0dWFsCj4+Pj4+Pj4+Pj4gYWRkcmVzcyAxMDI3N2YwMCwg
ZXBjID09IDgwMzljZTcwLCByYSA9PSA4MDE2YWQ1MAo+Pj4+Pj4+Pj4+ICoqKiBEZXZpY2UgaGFu
Z3MgKioqCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBFbmFibGluZyBtYWNyb25peF9uYW5kX2Jsb2Nr
X3Byb3RlY3Rpb25fc3VwcG9ydCgpIG1ha2VzIHRoZSBkZXZpY2UKPj4+Pj4+Pj4+PiB1bmFibGUg
dG8gZGV0ZWN0IHRoZSBiYWQgYmxvY2sgdGFibGUgYW5kIGhhbmdzIGl0IHdoZW4gdHJ5aW5nIHRv
Cj4+Pj4+Pj4+Pj4gc2Nhbgo+Pj4+Pj4+Pj4+IGZvciBiYWQgYmxvY2tzLgo+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+IFBsZWFzZSB0cmFjZSBuYW5kX21hY3Jvbml4LmMgYW5kIGxvb2s6Cj4+Pj4+Pj4+PiAt
IGFyZSB0aGUgZ2V0X2ZlYXR1cmVzIGFuZCBzZXRfZmVhdHVyZXMgcmVhbGx5IHN1cHBvcnRlZCBi
eSB0aGUKPj4+Pj4+Pj4+ICAgIGNvbnRyb2xsZXIgZHJpdmVyPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBU
aGlzIGlzIHdoYXQgSSBjb3VsZCBmaW5kIGJ5IGRlYnVnZ2luZzoKPj4+Pj4+Pj4gWyAgICAwLjQ5
NDk5M10gYmNtNjM2OF9uYW5kIDEwMDAwMjAwLm5hbmQ6IHRoZXJlIGlzIG5vdCB2YWxpZCBtYXBz
IGZvcgo+Pj4+Pj4+PiBzdGF0ZSBkZWZhdWx0Cj4+Pj4+Pj4+IFsgICAgMC41MDUzNzVdIG5hbmQ6
IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweGMyLCBDaGlwIElEOgo+Pj4+Pj4+PiAw
eGYxCj4+Pj4+Pj4+IFsgICAgMC41MTIwNzddIG5hbmQ6IE1hY3Jvbml4IE1YMzBMRjFHMThBQwo+
Pj4+Pj4+PiBbICAgIDAuNTE1OTk0XSBuYW5kOiAxMjggTWlCLCBTTEMsIGVyYXNlIHNpemU6IDEy
OCBLaUIsIHBhZ2Ugc2l6ZToKPj4+Pj4+Pj4gMjA0OCwgT09CIHNpemU6IDY0Cj4+Pj4+Pj4+IFsg
ICAgMC41MjM5MjhdIGJjbTYzNjhfbmFuZCAxMDAwMDIwMC5uYW5kOiBkZXRlY3RlZCAxMjhNaUIg
dG90YWwsCj4+Pj4+Pj4+IDEyOEtpQiBibG9ja3MsIDJLaUIgcGFnZXMsIDE2QiBPT0IsIDgtYml0
LCBCQ0gtNAo+Pj4+Pj4+PiBbICAgIDAuNTM0NDE1XSBiY202MzY4X25hbmQgMTAwMDAyMDAubmFu
ZDogbGxfb3AgY21kIDB4YTAwZWUKPj4+Pj4+Pj4gWyAgICAwLjUzOTk4OF0gYmNtNjM2OF9uYW5k
IDEwMDAwMjAwLm5hbmQ6IGxsX29wIGNtZCAweDYwMGEwCj4+Pj4+Pj4+IFsgICAgMC41NDU2NTld
IGJjbTYzNjhfbmFuZCAxMDAwMDIwMC5uYW5kOiBsbF9vcCBjbWQgMHgxMDAwMAo+Pj4+Pj4+PiBb
ICAgIDAuNTUxMjE0XSBiY202MzY4X25hbmQgMTAwMDAyMDAubmFuZDogTkFORF9DTURfR0VUX0ZF
QVRVUkVTID0KPj4+Pj4+Pj4gMHgwMAo+Pj4+Pj4+PiBbICAgIDAuNTU3ODQzXSBiY202MzY4X25h
bmQgMTAwMDAyMDAubmFuZDogbGxfb3AgY21kIDB4MTAwMDAKPj4+Pj4+Pj4gWyAgICAwLjU2MzQ3
NV0gYmNtNjM2OF9uYW5kIDEwMDAwMjAwLm5hbmQ6IE5BTkRfQ01EX0dFVF9GRUFUVVJFUyA9Cj4+
Pj4+Pj4+IDB4MDAKPj4+Pj4+Pj4gWyAgICAwLjU2OTk5OF0gYmNtNjM2OF9uYW5kIDEwMDAwMjAw
Lm5hbmQ6IGxsX29wIGNtZCAweDEwMDAwCj4+Pj4+Pj4+IFsgICAgMC41NzU2NTNdIGJjbTYzNjhf
bmFuZCAxMDAwMDIwMC5uYW5kOiBOQU5EX0NNRF9HRVRfRkVBVFVSRVMgPQo+Pj4+Pj4+PiAweDAw
Cj4+Pj4+Pj4+IFsgICAgMC41ODIyNDZdIGJjbTYzNjhfbmFuZCAxMDAwMDIwMC5uYW5kOiBsbF9v
cCBjbWQgMHg4MDAxMDAwMAo+Pj4+Pj4+PiBbICAgIDAuNTg4MDY3XSBiY202MzY4X25hbmQgMTAw
MDAyMDAubmFuZDogTkFORF9DTURfR0VUX0ZFQVRVUkVTID0KPj4+Pj4+Pj4gMHgwMAo+Pj4+Pj4+
PiBbICAgIDAuNTk0NjU3XSBuYW5kOiBuYW5kX2dldF9mZWF0dXJlczogYWRkcj1hMCBzdWJmZWF0
dXJlX3BhcmFtPVswMAo+Pj4+Pj4+PiAwMCAwMCAwMF0gLT4gMAo+Pj4+Pj4+PiBbICAgIDAuNjAy
MzQxXSBtYWNyb25peF9uYW5kX2Jsb2NrX3Byb3RlY3Rpb25fc3VwcG9ydDoKPj4+Pj4+Pj4gT05G
SV9GRUFUVVJFX0FERFJfTVhJQ19QUk9URUNUSU9OPTAKPj4+Pj4+Pj4gWyAgICAwLjYxMDU0OF0g
bWFjcm9uaXhfbmFuZF9ibG9ja19wcm90ZWN0aW9uX3N1cHBvcnQ6ICE9Cj4+Pj4+Pj4+IE1YSUNf
QkxPQ0tfUFJPVEVDVElPTl9BTExfTE9DSwo+Pj4+Pj4+PiBbICAgIDAuNjI0NzYwXSBCYWQgYmxv
Y2sgdGFibGUgbm90IGZvdW5kIGZvciBjaGlwIDAKPj4+Pj4+Pj4gWyAgICAwLjYzNTU0Ml0gQmFk
IGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwCj4+Pj4+Pj4+IFsgICAgMC42NDAyNzBd
IFNjYW5uaW5nIGRldmljZSBmb3IgYmFkIGJsb2Nrcwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIGRvbid0
IGtub3cgaG93IHRvIHRlbGwgaWYgZ2V0X2ZlYXR1cmVzIC8gc2V0X2ZlYXR1cmVzIGlzIHJlYWxs
eQo+Pj4+Pj4+PiBzdXBwb3J0ZWQuLi4KPj4+Pj4+Pgo+Pj4+Pj4+IExvb2tzIGxpa2UgeW91ciBk
cml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBleGVjX29wIGJ1dCB0aGUgY29yZSBwcm92aWRlcyBhCj4+
Pj4+Pj4gZ2V0L3NldF9mZWF0dXJlIGltcGxlbWVudGF0aW9uLgo+Pj4+Pj4KPj4+Pj4+IEFjY29y
ZGluZyB0byBGbG9yaWFuLCBsb3cgbGV2ZWwgc2hvdWxkIGJlIHN1cHBvcnRlZCBvbiBicmNtbmFu
ZAo+Pj4+Pj4gY29udHJvbGxlcnMgPj0gNC4wCj4+Pj4+PiBBbHNvOgo+Pj4+Pj4gaHR0cHM6Ly9n
aXRodWIuY29tL25vbWlzL2JjbTk2M3h4XzQuMTJMLjA2Ql9jb25zdW1lci9ibG9iL2UyZjIzZGRi
YjIwYmY3NTY4OTM3MmI2ZTZhNWEwZGM2MTNmNmUzMTMvc2hhcmVkL29wZW5zb3VyY2UvaW5jbHVk
ZS9iY205NjN4eC82MzI2OF9tYXBfcGFydC5oI0wxNTk3Cj4+Pj4+Cj4+Pj4+IEp1c3QgdG8gYmUg
c3VyZSwgeW91J3JlIHVzaW5nIGEgbWFpbmxpbmUgY29udHJvbGxlciBkcml2ZXIsIG5vdCB0aGlz
Cj4+Pj4+IG9uZT8KPj4+Pgo+Pj4+IFllcywgdGhpcyB3YXMganVzdCB0byBwcm92ZSB0aGF0IHRo
ZSBIVyBJ4oCZbSB1c2luZyBoYXMgZ2V0L3NldCBmZWF0dXJlcyBzdXBwb3J0Lgo+Pj4+IEnigJlt
IHVzaW5nIE9wZW5XcnQsIHNvIGl04oCZcyBsaW51eCB2NS4xNSBkcml2ZXIuCj4+Pj4KPj4+Pj4K
Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gLSB3aGF0IGlzIHRoZSBzdGF0ZSBvZiB0aGUgbG9j
a2luZyBjb25maWd1cmF0aW9uIGluIHRoZSBjaGlwIHdoZW4KPj4+Pj4+Pj4+IHlvdQo+Pj4+Pj4+
Pj4gICAgYm9vdD8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVW5sb2NrZWQsIEkgZ3Vlc3MuLi4KPj4+Pj4+
Pj4gSG93IGNhbiBJIGNoZWNrIHRoYXQ/Cj4+Pj4+Pj4KPj4+Pj4+PiBJdCdzIGluIHlvdXIgZHVt
cCwgdGhlIGNoaXAgcmV0dXJucyAwLCBtZWFuaW5nIGl0J3MgYWxsIHVubG9ja2VkLAo+Pj4+Pj4+
IGFwcGFyZW50bHkuCj4+Pj4+Pgo+Pj4+Pj4gV2VsbCwgSSBjYW4gcmVhZC93cml0ZSB0aGUgZGV2
aWNlIGlmIGJsb2NrIHByb3RlY3Rpb24gaXNu4oCZdCBkaXNhYmxlZCwKPj4+Pj4+IHNvIEkgZ3Vl
c3Mgd2UgY2FuIGNvbmZpcm0gaXTigJlzIHVubG9ja2Vk4oCmCj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+
Pj4+PiAtIGlzIHRoZXJlIGFueXRoaW5nIHRoYXQgbG9ja3MgdGhlIGRldmljZSBieSBjYWxsaW5n
IG14aWNfbmFuZF9sb2NrKCkKPj4+Pj4+Pj4+ID8KPj4+Pj4+Pgo+Pj4+Pj4+IFNvIG5vYm9keSBs
b2NrcyB0aGUgZGV2aWNlIEkgZ3Vlc3M/IERpZCB5b3UgYWRkIHRyYWNlcyB0aGVyZT8KPj4+Pj4+
Cj4+Pj4+PiBJdCBkb2VzbuKAmXQgZ2V0IHRvIHRoZSBwb2ludCB0aGF0IGl0IGVuYWJsZWQgdGhl
IGxvY2svdW5sb2NrIGZ1bmN0aW9ucwo+Pj4+Pj4gc2luY2UgaXQgZmFpbHMgd2hlbiBjaGVja2lu
ZyBpZiBmZWF0dXJlIGlzIDB4MzgsIHNvIHRoZXJl4oCZcyBubyBwb2ludAo+Pj4+Pj4gaW4gYWRk
aW5nIHRob3NlIHRyYWNlc+KApgo+Pj4+Pgo+Pj4+PiBSaWdodCwgaXQgcmV0dXJucyBiZWZvcmUg
c2V0dGluZyB0aGVzZSBJIGd1ZXNzLgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+Pj4gLSBm
aW5kaW5nIG5vIGJidCBpcyBvbmUgdGhpbmcsIGhhbmdpbmcgaXMgYW5vdGhlciwgd2hlcmUgaXMg
aXQKPj4+Pj4+Pj4+IGhhbmdpbmcKPj4+Pj4+Pj4+ICAgIGV4YWN0bHk/IChvZmZzZXQgaW4gbmFu
ZC8gYW5kIGxpbmUgaW4gdGhlIGNvZGUpCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkndmUgZ290IG5vIGlk
ZWEuLi4KPj4+Pj4+Pgo+Pj4+Pj4+IFlvdSBjYW4gdXNlIGZ0cmFjZSBvciBqdXN0IGFkZCBwcmlu
dGtzIGEgYml0IGV2ZXJ5d2hlcmUgYW5kIHRyeSB0byBnZXQKPj4+Pj4+PiBjbG9zZXIgYW5kIGNs
b3Nlci4KPj4+Pj4+Cj4+Pj4+PiBJIHRoaW5rIHRoYXQgYWZ0ZXIgdHJ5aW5nIHRvIGdldCB0aGUg
ZmVhdHVyZSBpdCBqdXN0IHN0YXJ0IHJlYWRpbmcKPj4+Pj4+IG5vbnNlbnNlIGZyb20gdGhlIE5B
TkQgYW5kIGF0IHNvbWUgcG9pbnQgaXQgaGFuZ3MgZHVlIHRvIHRoYXQgZ2FyYmFnZeKApgo+Pj4+
Pgo+Pj4+PiBJdCBzaG91bGQgcmVmdXNlIHRvIG1vdW50IHRoZSBkZXZpY2Ugc29tZWhvdywgYnV0
IGluIG5vIGNhc2UgdGhlIGtlcm5lbAo+Pj4+PiBzaG91bGQgaGFuZy4KPj4+Pgo+Pj4+IFllcywg
SSB0aGluayB0aGF0IHRoaXMgaXMgYSBzaWRlIGVmZmVjdCAobWF5YmUgYSBkaWZmZXJlbnQgYnVn
IHNvbWV3aGVyZSBlbHNlKS4KPj4+Pgo+Pj4+Pgo+Pj4+Pj4gSXMgaXQgcG9zaWJsZSB0aGF0IHRo
ZSBOQU5EIHN0YXJ0cyBiZWhhdmluZyBsaWtlIHRoaXMgYWZ0ZXIgZ2V0dGluZwo+Pj4+Pj4gdGhl
IGZlYXR1cmUgZHVlIHRvIHNvbWUgc3BlY2lmaWMgY29uZmlnIG9mIG15IGRldmljZT8KPj4+Pj4+
Cj4+Pj4+Pj4KPj4+Pj4+PiBJIGxvb2tlZCBhdCB0aGUgcGF0Y2gsIEkgZG9uJ3Qgc2VlIGFueXRo
aW5nIHN0cmFuZ2UuIEJlc2lkZXMsIEkgaGF2ZSBhCj4+Pj4+Pj4gY2xvc2UgZW5vdWdoIGRhdGFz
aGVldCBhbmQgSSBkb24ndCBzZWUgd2hhdCBjb3VsZCBjb25mdXNlIHRoZSBkZXZpY2UuCj4+Pj4+
Pj4KPj4+Pj4+PiBBcmUgeW91IHJlYWxseSBzdXJlIHRoaXMgcGF0Y2ggaXMgdGhlIHByb2JsZW0/
IElzIHRoZSBXUCBwaW4gd2lyZWQgb24KPj4+Pj4+PiB5b3VyIGRlc2lnbj8KPj4+Pj4+Cj4+Pj4+
PiBUaGVyZeKAmXMgbm8gV1AgcGluIGluIGJyY21uYW5kIGNvbnRyb2xsZXJzIDwgNy4wCj4+Pj4+
Cj4+Pj4+IFdoYXQgYWJvdXQgdGhlIGNoaXA/Cj4+Pj4KPj4+PiBNYXliZSBpdCBoYXMgYSBHUElP
IGNvbnRyb2xsaW5nIHRoYXQsIGJ1dCBJIGRvbuKAmXQgaGF2ZSB0aGF0IGluZm/igKYKPj4+Pgo+
Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+IE1pcXXDqGwKPj4+Pj4KCi0tIApGbG9yaWFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
