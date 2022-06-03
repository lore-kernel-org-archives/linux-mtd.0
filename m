Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B5CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPobed+wAwW8pa0vGLAhQWaW0+452/fpOxKi+2haF9A=; b=16pRmYwILH25hv
	k+fDv/bWoIKlLc9VgDWPcHrodiK1pjREITvssBqOgzDcAPCeVmjcqJrdfWknnTccolQLqNvvx5hJy
	67mienPc+Mn4//Rd5G0cG0Oad7s1HIY1f0UgbAV6wEhebZljzrj1fYmyba5VVySC0EbKDuxjNjyFG
	4I7/02G9U8lNRHMhyVn/mRBMj+PKtvGhzxJcoK0xkkdaus6OrqInhG/zJCmboSO+RPG9co0vOivDH
	+5yj6kIuAsvzcXAEjhs5CuourO2CJVs2Qzbll7TKjMFGlUaXPyramtWAzMXpmui4d/9vnE5d4JdEI
	P0TmrgHY3rL5r1Wa+m0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx3gs-006qqD-5J; Fri, 03 Jun 2022 09:33:58 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx3gk-006qnW-86
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 09:33:52 +0000
Received: by mail-pf1-x431.google.com with SMTP id c196so6815739pfb.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jun 2022 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=ZgxBLhgs4VYc34mVAAts1dr/P70W+X1DK5RAji3VZRU=;
        b=l1cldK7o37EzAMoGGznpPLutcs1VBKeZgGErHBHVcHl8Bhxw8CRxgZDp/b1gm4VAgc
         EKOy5AcEjtZYBSDP0AiOabyVcmGwaPdil0DxoSwbzjgCi8lcJB2lzVNC965JhX9qdXnN
         02Lwqn4IOw3D8xbJAbRpdPlct1S7jeuEkN/hG63qifERZnPDcYxmR1uye+Ts0sD4e1CM
         gLuJt5JWzq/W17Z5v61mJnwKik/az8DPW46bvU878gaydALMuR/Z9i3m5Ji6vMeXYCS0
         AnAPQ9OjN1+XozsDV0tZ5Ssc3zWyqv37eYOqMsDjDWiPhkPA7U5Uzxex6PR89Gc+0LCI
         XN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=ZgxBLhgs4VYc34mVAAts1dr/P70W+X1DK5RAji3VZRU=;
        b=jZSqBCuvy8+691a4ZfY0xM8uVD+qs+yP2Aol1ZbTWtuVjWISPY9y665GPJNs/44m+M
         hNIZ3TaJ1mJeQw1vkRP46IA1mSG1psxNJHouNAQKGTM6rO4bxr5z2nrAj/SV588IsfJs
         GM31kwqQ677vChLFkJ72m6pe7bH8YQgfI6oSb6YdgimqlA+V2fAt7gu5eU1vt9zyz8cz
         mjjDaEgf+DvqFXr8KZA8gL5nwFKCCcnHESz37gsE8lU3X60PFTOVhG1ydAFBoPd1TbjJ
         s5Oe9CJLUPO4/OlH4KeyMBmhzWPo8RMbh+5ZB5Lcrfr8rjvDwqwQ/Tr3ehdOn/Bi8aR2
         wX7Q==
X-Gm-Message-State: AOAM531ksZGmJtz6kBVoW26NWYLBAxszihR4FLcAGieW03sxXysmpal9
	juo/tk9S0g26aVNpgtKU6SU=
X-Google-Smtp-Source: ABdhPJzowSxUxkqEZPqYMhwTqEcCi8uE3haicXHDc9n8qN1aMlFZR64C6AD2OAocaP+Q6vJJFNdC0g==
X-Received: by 2002:a05:6a00:16d2:b0:512:c652:a2f7 with SMTP id l18-20020a056a0016d200b00512c652a2f7mr9604896pfc.9.1654248827735;
        Fri, 03 Jun 2022 02:33:47 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001640aad2f71sm5090342pll.180.2022.06.03.02.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:33:47 -0700 (PDT)
Message-ID: <5f2e5c77-02a3-43aa-cb58-c1a145d13322@gmail.com>
Date: Fri, 3 Jun 2022 18:33:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
To: Michael Walle <michael@walle.cc>, tudor.ambarus@microchip.com,
 p.yadav@ti.com
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <b4870634-5b7f-de86-c1df-eaaafb05c7d7@gmail.com>
In-Reply-To: <b4870634-5b7f-de86-c1df-eaaafb05c7d7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_023350_327087_08CB3F19 
X-CRM114-Status: GOOD (  28.56  )
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

QW55IHRob3VnaHRzPwoKT24gNS8yMy8yMDIyIDY6NTYgUE0sIFRha2FoaXJvIEt1d2FubyB3cm90
ZToKPiAKPiAKPiBPbiA1LzIzLzIwMjIgNDo0OSBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4g
QW0gMjAyMi0wNS0xNCAwNTo1MSwgc2NocmllYiBUYWthaGlybyBLdXdhbm86Cj4+PiBPbiA1LzEz
LzIwMjIgNjo0MCBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+PiBbYnR3IHRoZSBzdWJqZWN0
IHN0aWxsIGhhcyB0aGUgb2xkIG5hbWUgb2YgdGhlIGFkZHJfd2lkdGhdCj4+Pj4KPj4+IFllcywg
aXQgbXVzdCBiZSBmaXhlZCBpbiBuZXh0IHJldi4KPj4+Cj4+Pj4gQW0gMjAyMi0wNS0xMyAwMzoy
Niwgc2NocmllYiBUYWthaGlybyBLdXdhbm86Cj4+Pj4+IE9uIDUvMTMvMjAyMiA3OjE0IEFNLCBN
aWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4+Pj4gQW0gMjAyMi0wNS0xMCAwMDoxMCwgc2NocmllYiB0
a3V3NTg0OTI0QGdtYWlsLmNvbToKPj4+Pj4+PiBGcm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2Fo
aXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBJbiA0QkFJVCBwYXJzZSwg
a2VlcCBub3ItPnBhcmFtcy0+YWRkcl93aWR0aCBiZWNhdXNlIGl0IG1heSBiZSB1c2VkIGFzCj4+
Pj4+Pj4gY3VycmVudCBhZGRyZXNzIG1vZGUgaW4gU01QVCBwYXJzZSBsYXRlciBvbi4KPj4+Pj4+
Cj4+Pj4+PiBNaCBJJ20gbm90IHN1cmUgdGhpcyBpcyBuZWVkZWQgYXQgYWxsLgo+Pj4+Pj4KPj4+
Pj4+IFNGRFAgc3BlYyBzYXlzCj4+Pj4+PiDCoCBWYXJpYWJsZSBhZGRyZXNzIGxlbmd0aCAodGhl
IGN1cnJlbnQgc2V0dGluZyBvZiB0aGUgYWRkcmVzcwo+Pj4+Pj4gwqAgbGVuZ3RoIG1vZGUgZGVm
aW5lcyB0aGUgYWRkcmVzcyBsZW5ndGgpCj4+Pj4+Pgo+Pj4+Pj4gYW5kCj4+Pj4+PiDCoCBXaGVu
IHRoZSBsZW5ndGggaXMgZGVmaW5lZCBhcyB2YXJpYWJsZSwgdGhlIHNvZnR3YXJlIG9yIGhhcmR3
YXJlCj4+Pj4+PiDCoCBjb250cm9sbGluZyB0aGUgbWVtb3J5IGlzIGF3YXJlIG9mIHRoZSBhZGRy
ZXNzIGxlbmd0aCBtb2RlIGxhc3QKPj4+Pj4+IMKgIHNldCBpbiB0aGUgbWVtb3J5IGRldmljZSBh
bmQgdGhpcyBzYW1lIGxlbmd0aCBvZiBhZGRyZXNzLgo+Pj4+Pj4KPj4+Pj4+IFdlIGRvbid0IHNl
dCBhbnkgYWRkcmVzcyBtb2RlIHVudGlsIGFsbCB0aGUgU0ZEUCBwYXJzaW5nIGlzCj4+Pj4+PiBv
dmVyLiBUaGVyZWZvcmUgd2Ugc2hvdWxkIGFsd2F5cyBiZSBpbiAzIGJ5dGUgbW9kZSwgbm8/Cj4+
Pj4+Pgo+Pj4+PiBBY3R1YWxseSB0aGVyZSBhcmUgc29tZSBkZXZpY2VzIHRoYXQgaGF2ZSB2YXJp
YWJsZSBhZGRyZXNzIGxlbmd0aCBidXQKPj4+Pj4gNCBieXRlIG1vZGUgYnkgZGVmYXVsdCAoSSB3
aWxsIHdvcmsgb24gdGhvc2UgZGV2aWNlcyBhZnRlciB0aGlzIHNlcmllcwo+Pj4+PiBpcyBzZXR0
bGVkKS4gVG8gc3VwcG9ydCBzdWNoIGNhc2UsIEkgcHJlZmVyIHRvIHVzZSBwYXJhbXMtPmFkZHJf
bmJ5dGVzCj4+Pj4+IGFzIGN1cnJlbnQgYWRkcmVzcyBtb2RlIHNvIHRoYXQgSSBjYW4gZml4IGl0
IGluIHBvc3RfYmZwdF9maXh1cCgpIGhvb2suCj4+Pj4KPj4+PiBBcmUgdGhlcmUgcHVibGljIGRh
dGFzaGVldHMgYXZhaWxhYmxlPyBTbyB0aGVzZSBkZXZpY2VzIGhhdmUgYSAzIGJ5dGUKPj4+IEkg
d2lsbCBzZW5kIGRhdGFzaGVldHMgdG8geW91IGluIGFub3RoZXIgZW1haWwuIEF0IHRoaXMgcG9p
bnQsIG9ubHkKPj4+IHN1bW1hcnkgZGF0YXNoZWV0IGlzIGF2YWlsYWJsZSBpbiB3ZWJzaXRlLgo+
Pj4KPj4+PiBhbmQgYSA0IGJ5dGUgbW9kZSwgYnV0IGFmdGVyIHJlc2V0LCB0aGV5IGFyZSBpbiB0
aGUgNCBieXRlIG1vZGU/IExvb2tzCj4+PiBZZXMuCj4+Pgo+Pj4+IGxpa2UgaXQgc2hvdWxkIGJl
IGZpeGVkIGluIGEgZGlmZmVyZW50IHdheS4gSSdtIG5vdCBzdXJlIHRoZSAiY3VycmVudAo+Pj4+
IG1vZGUiIGhhbmRsaW5nIGlzIGNvcnJlY3QuCj4+Pj4KPj4+IFllcywgd2UgbWF5IHdhbnQgdG8g
aW50cm9kdWNlIGEgbmV3IGZsYWcgbGlrZSBTUElfTk9SXzRCQU1fREVGQVVMVCBhbmQgY2hlY2sK
Pj4+IHRoZSBmbGFnIGluIEJGUFQgcGFyc2UuIE9uY2UgSSBzZW5kIGFub3RoZXIgc2VyaWVzLCBw
bGVhc2UgcmV2aWV3Lgo+Pj4KPj4+PiBXZSBuZWVkIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0
aGUgbW9kZSB0aGUgZmxhc2ggY3VycmVudGx5IGlzIHVzaW5nCj4+Pj4gKG5vci0+YWRkcl9uYnl0
ZXMpIGFuZCB0aGUgbW9kZSBwYXJzZWQgYnkgU0ZEUCAocGFyYW1zLT5hZGRyX25ieXRlcykuCj4+
Pj4KPj4+IFRoZSBmbGFzaCdzIGFkZHJlc3MgbW9kZSBhZmZlY3RzIHRoZSBhZGRyZXNzIGxlbmd0
aCBvZiBOb24tNEIgb3Bjb2RlcywKPj4+IGluY2x1ZGluZyByZWFkL3dyaXRlIGFueSByZWdpc3Rl
ciBvcHMgdXNlZCBpbiBTTVBUIHBhcnNlIGFuZCBJbmZpbmVvbgo+Pj4gKHNwYW5zaW9uKSBzcGVj
aWZpYyBob29rcy4KPj4+Cj4+PiBUaGUgNEIgb3Bjb2RlcyBhbHdheXMgdGFrZSBhZGRyZXNzIGxl
bmd0aCBvZiA0IHJlZ2FyZGxlc3Mgb2YgZmxhc2gncwo+Pj4gYWRkcmVzcyBtb2RlLiBJbiB0aGVz
ZSBJbmZpbmVvbiBjaGlwcywgNEIgb3Bjb2RlcyBmb3IgcmVhZC9wcm9ncmFtLwo+Pj4gZXJhc2Ug
YXJlIGF2YWlsYWJsZSBhbmQgNEJBSVQgYWR2ZXJ0aXNlcyB0aGVtLiBXZSBkb24ndCBoYXZlIHRv
IGVudGVyCj4+PiA0IGJ5dGUgYWRkcmVzcyBtb2RlIGZvciByZWFkL3Byb2dyYW0vZXJhc2UuCj4+
Cj4+IGJ0dy4gdGhpcyBpcyBhIHBpdHkuIHlvdSBhcmUgdXNpbmcgdGhlIHN0YXRlbGVzcyA0YiBv
cGNvZGVzIGJ1dAo+PiB0aGVuIHlvdSBkb24ndCBwcm92aWRlIHN0YXRlbGVzcyBvcGNvZGVzIGZv
ciB0aGUgcmVhZCBhbnkgcmVnaXN0ZXIKPj4gb3AgOi8KPj4KPj4+IFNvLCBJIHRoaW5rIHdlIG5l
ZWQgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGFkZHJlc3MgbGVuZ3RoIGZvcgo+Pj4gcmVhZC9w
cm9ncmFtL2VyYXNlIGFuZCBmbGFzaCdzIGRlZmF1bHQgYWRkcmVzcyBtb2RlLgo+Pgo+PiBPciB3
ZSBrZWVwIHRoZW0gaW4gc3luYy4gRS5nLiBzd2l0Y2ggdG8gNGJ5dGVzIG1vZGUgaWYgd2UgYXJl
Cj4+IHVzaW5nIHRoZSA0IGJ5dGUuIEdyYW50ZWQsIHRoYXQgc291bmRzIGxpa2UgYSBoYWNrIDop
Cj4+Cj4gWWVzLCB0aGUgZWFybGllciByZXZpc2lvbiBvZiB0aGUgc2VyaWVzIHN3aXRjaGVkIHRv
IDRieXRlIG1vZGUgaW4gZml4dXAKPiBob29rLCBidXQgd2UgZG9uJ3Qgd2FudCB0byBjaGFuZ2Ug
ZGV2aWNlIHNldHRpbmdzIGR1cmluZyBTRkRQIHBhcnNlLgo+IAo+Pj4gT2J2aW91c2x5IHdlIGFy
ZSB1c2luZyBub3ItPmFkZHJfbmJ5dGVzIGFzIGFkZHJlc3MgbGVuZ3RoIGZvciByZWFkLwo+Pj4g
cHJvZ3JhbS9lcmFzZSBhbmQgc2hvdWxkIGtlZXAgdGhpcyB1c2FnZS4KPj4KPj4gWWVzLCBJIHdh
c24ndCBhd2FyZSB0aGF0IHdlIGFjdHVhbGx5IHR3byBkaWZmZXJlbnQgcnVudGltZQo+PiBwYXJh
bWV0ZXJzOgo+PiDCoC0gdGhlIHJlYWQvcHJvZ3JhbS9lcmFzZSBhZGRyZXNzIHdpZHRoLCBhbHNv
IHVzZWQgd2l0aCB0aGUKPj4gwqDCoCA0YiBvcGNvZGVzCj4+IMKgLSBpbnRlcm5hbCBtb2RlIDNi
LzRiLiBVcCB1bnRpbCBub3csIHRoaXMgd2Fzbid0IGFuIGlzc3VlCj4+IMKgwqAgYmVjYXVzZSBl
aXRoZXIgdGhlIG1vZGUgd2FzIHN3aXRjaGVkIG9yIHRoZSA0YiBvcGNvZGVzCj4+IMKgwqAgd2Vy
ZSB1c2VkLiBTbyB0aGlzIHdhcyBtdXR1YWxseSBleGNsdXNpdmUuIE5vdyB3ZSBoYXZlCj4+IMKg
wqAgZmxhc2hlcyB3aGljaCB1c2VzIDRiIG9wY29kZXMgX2FuZF8gd2UgbmVlZCB0aGUgc3RhdGUK
Pj4gwqDCoCBvZiB0aGUgaW50ZXJuYWwgbW9kZS4KPj4KPj4gSSBjYW4ndCB0aGluayBvZiBhIGdv
b2Qgc29sdXRpb24gZm9yIG5vdy4gTmVlZCB0byB0aGluawo+PiBtb3JlIGFib3V0IHRoaXMsIGJ1
dCBJJ20gcHJldHR5IGJ1c3kgYXQgdGhlIG1vbWVudC4KPj4gV2hhdCBJIHRoaW5rIGlzIGNsZWFy
IGlzIHRoYXQgd2UgbmVlZCB0d28gZGlmZmVyZW50IG1vZGVzCj4+IGhlcmUgaW4gdGhlIHNwaV9u
b3Igc3RydWN0LiBub3ItPmFkZHJfbmJ5dGVzIGZvciB0aGUKPj4gcmVhZC9wcm9ncmFtL2VyYXNl
IG9wY29kZXMgYW5kIG5vci0+YWRkcmVzc19tb2RlIG9yIHNpbWlsYXIKPj4gd2hpY2ggdHJhY2tz
IHRoZSBTUEkgZmxhc2gncyBpbnRlcm5hbCBhZGRyZXNzIG1vZGUuCj4+Cj4gU28sIHVudGlsIHdl
IGNvbWUgdXAgd2l0aCBhIGdvb2Qgc29sdXRpb24sIGNhbiB3ZSBkaXJlY3RseSB1c2UgdGhlIGFk
ZHJlc3MKPiBsZW5ndGggb2YgMyBpbiBTTVBUIHBhcnNlIGFuZCB2ZW5kb3Igc3BlY2lmaWMgaG9v
a3M/IEJ5IGRvaW5nIHRoYXQsIHdlIGNhbgo+IHJlbW92ZSB0aGlzICg2LzgpIGFuZCBwcmV2aW91
cyAoNS84KSBwYXRjaGVzIChtaW5pbXVtIGNoYW5nZSB3b3VsZCBiZQo+IGJldHRlciBhcyBhIHRl
bXBvcmFyeSBzb2x1dGlvbikuCj4gCj4+PiBGb3IgZmxhc2gncyBkZWZhdWx0IGFkZHJlc3MgbW9k
ZSwgbXkgcHJlZmVyZW5jZSBpcyB0byB1c2UKPj4+IHBhcmFtcy0+YWRkcl9uYnl0ZXMsIGJ1dCBJ
IHNob3VsZCByZW5hbWUgaXQgdG8gc29tZXRoaW5nIGxpa2UKPj4+IHBhcmFtcy0+ZGVmX2FkZHJf
bmJ5dGVzIGFuZCByZXdvcmsgc3BpX25vcl9zZXRfYWRkcl9uYnl0ZXMoKS4KPj4KPj4gSU1ITyBw
YXJhbXMgc2hvdWxkIG9ubHkgYmUgdXNlZCB0byBzdG9yZSB0aGUgcGFyc2VkIChvcgo+PiBoYXJk
Y29kZWQpIHBhcmFtZXRlcnMuCj4+Cj4gT0ssIHVuZGVyc3Rvb2QuCj4gCj4gVGhhbmtzLAo+IFRh
a2FoaXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
