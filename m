Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B784C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 06:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdVUxodK5gcMBAVisbVOfl3D9g9+BnJqDb/7cqOM7fU=; b=ggwm1ttLjOwWqo
	L4zJ8naHyz5qTCkZ2EBxC+5VK+9mqFG7+ojZTFeOy1+IM1zeWREBcy8770aK+Nf+LPq1NgwAwcGQD
	8ef9j0ZmQR2vHe6I15HR65excjSLrnek8RuwppFPo2z5skCzsdev4Ja/jb0/dKfBS+VFqIUucwlEe
	YcpuJ35p4tlhoILW9n5Lz9HN4FhlRoyPiKvFq64B1rAjKgxBRamMPfrBX1cmjSAdiB+ayyRLw4yX3
	gEwqYO+lpuYka9KKdyTobpCAbV4/gKs8R0Zl4fMc/D5B5Rxq1jihw6IxQwpvjNKEvrcEPMjyza2Ai
	bt9YboqzpswYOol9C2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrCne-00HJ7G-6e; Wed, 18 May 2022 06:04:46 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrCna-00HJ6V-KU
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 06:04:44 +0000
Received: by mail-pg1-x534.google.com with SMTP id 202so1222350pgc.9
 for <linux-mtd@lists.infradead.org>; Tue, 17 May 2022 23:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=SZMBh4U3Ex3VJiE5DDuZYhfGpu+xzn6WtiAcg7puBmQ=;
 b=ZyL2Fp6QnDPHRjJQofNx2qSFOsXArZ4uEnBpz9Tgda49jiSFLASzza1+zgYli86b/Z
 YUP5yMQt8f2b4mtdDrRA/eq2JqrdZc9K7eVdCsAwPog5Jiv7AyiH0bjNncLkObG8nDPN
 XeX5f0yxkJSf5/Y+I5JQQn86Bd65IP8ExTAIBfwne+v92i0SHNdmekAchgGrT5sZzw0u
 iSd0kIV2Yta9VmI/j7S9O6RVBKj0lSRO+dMmd7U+wKN94rXQRBhUy7TgJLB+eAZY/nkn
 Kfd17NefA+sHpSA4nL10FB5ohX3u7pi5/sgfyuAHIEg6rCmuruRk2HHyDULTHzCPJHkN
 Ae6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=SZMBh4U3Ex3VJiE5DDuZYhfGpu+xzn6WtiAcg7puBmQ=;
 b=UgJaUu7LNChXW9VHoWhQ9itwATw8mxH8sgQR/loUi5dCvwvvLTQRWxlRTSZ7DLfa2g
 9m5dBOtMH6LBP0P490Nnyi1+11n+A5NyXwedVF4sk4FtvHkeOW2po0i17IIAk1tqick2
 8Zk0cLH8IVpwo+k7jO02cxX4Fp2snV4cPOvOXxLGFSI+OvG6QGSin0ylzLg2BJzh/9RO
 B1tIQ1H7tSEi8bEEENV2+3GdD7AkZJNDJio0/0zcoulcWoGlmwdv2bBvP8J5c+LseDlU
 WHMUza9LIHwQ431f6L35SmkTu9lGjuxb4cQFn2RBGcx3c6XyXGBX9kbZFFNWOsGuw0tm
 PpHA==
X-Gm-Message-State: AOAM532oUqvAB28iiYCmSWpWrwxBwLmmuRfgMBlGMbA5FaxK9B8BIK1K
 JYZQDE4wl8GWChFL0pKT5+g=
X-Google-Smtp-Source: ABdhPJwTwdu02t86+3FDF9enGgmfqIZFzUm5Im/d4PrD2w5EM2q1/UaY3rVpzvLJthlaI7PmPDgidQ==
X-Received: by 2002:a63:6602:0:b0:3c6:60e1:865d with SMTP id
 a2-20020a636602000000b003c660e1865dmr23253843pgc.236.1652853878397; 
 Tue, 17 May 2022 23:04:38 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a1709026bc100b00161ac982b52sm669512plt.95.2022.05.17.23.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 23:04:38 -0700 (PDT)
Message-ID: <03b554e5-2182-f1e6-3954-e0128d21b840@gmail.com>
Date: Wed, 18 May 2022 15:04:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Takahiro Kuwano <tkuw584924@gmail.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
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
Content-Language: en-US
In-Reply-To: <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_230442_734289_715735D8 
X-CRM114-Status: GOOD (  27.46  )
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

SGVsbG8sCgpBbnkgY29tbWVudHMgb24gaG93IHRvIGhhbmRsZSB0aGlzPwoKT24gNS8xNC8yMDIy
IDEyOjUxIFBNLCBUYWthaGlybyBLdXdhbm8gd3JvdGU6Cj4gT24gNS8xMy8yMDIyIDY6NDAgUE0s
IE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IFtidHcgdGhlIHN1YmplY3Qgc3RpbGwgaGFzIHRoZSBv
bGQgbmFtZSBvZiB0aGUgYWRkcl93aWR0aF0KPj4KPiBZZXMsIGl0IG11c3QgYmUgZml4ZWQgaW4g
bmV4dCByZXYuCj4gCj4+IEFtIDIwMjItMDUtMTMgMDM6MjYsIHNjaHJpZWIgVGFrYWhpcm8gS3V3
YW5vOgo+Pj4gT24gNS8xMy8yMDIyIDc6MTQgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4g
QW0gMjAyMi0wNS0xMCAwMDoxMCwgc2NocmllYiB0a3V3NTg0OTI0QGdtYWlsLmNvbToKPj4+Pj4g
RnJvbTogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+Pj4+
Pgo+Pj4+PiBJbiA0QkFJVCBwYXJzZSwga2VlcCBub3ItPnBhcmFtcy0+YWRkcl93aWR0aCBiZWNh
dXNlIGl0IG1heSBiZSB1c2VkIGFzCj4+Pj4+IGN1cnJlbnQgYWRkcmVzcyBtb2RlIGluIFNNUFQg
cGFyc2UgbGF0ZXIgb24uCj4+Pj4KPj4+PiBNaCBJJ20gbm90IHN1cmUgdGhpcyBpcyBuZWVkZWQg
YXQgYWxsLgo+Pj4+Cj4+Pj4gU0ZEUCBzcGVjIHNheXMKPj4+PiDCoCBWYXJpYWJsZSBhZGRyZXNz
IGxlbmd0aCAodGhlIGN1cnJlbnQgc2V0dGluZyBvZiB0aGUgYWRkcmVzcwo+Pj4+IMKgIGxlbmd0
aCBtb2RlIGRlZmluZXMgdGhlIGFkZHJlc3MgbGVuZ3RoKQo+Pj4+Cj4+Pj4gYW5kCj4+Pj4gwqAg
V2hlbiB0aGUgbGVuZ3RoIGlzIGRlZmluZWQgYXMgdmFyaWFibGUsIHRoZSBzb2Z0d2FyZSBvciBo
YXJkd2FyZQo+Pj4+IMKgIGNvbnRyb2xsaW5nIHRoZSBtZW1vcnkgaXMgYXdhcmUgb2YgdGhlIGFk
ZHJlc3MgbGVuZ3RoIG1vZGUgbGFzdAo+Pj4+IMKgIHNldCBpbiB0aGUgbWVtb3J5IGRldmljZSBh
bmQgdGhpcyBzYW1lIGxlbmd0aCBvZiBhZGRyZXNzLgo+Pj4+Cj4+Pj4gV2UgZG9uJ3Qgc2V0IGFu
eSBhZGRyZXNzIG1vZGUgdW50aWwgYWxsIHRoZSBTRkRQIHBhcnNpbmcgaXMKPj4+PiBvdmVyLiBU
aGVyZWZvcmUgd2Ugc2hvdWxkIGFsd2F5cyBiZSBpbiAzIGJ5dGUgbW9kZSwgbm8/Cj4+Pj4KPj4+
IEFjdHVhbGx5IHRoZXJlIGFyZSBzb21lIGRldmljZXMgdGhhdCBoYXZlIHZhcmlhYmxlIGFkZHJl
c3MgbGVuZ3RoIGJ1dAo+Pj4gNCBieXRlIG1vZGUgYnkgZGVmYXVsdCAoSSB3aWxsIHdvcmsgb24g
dGhvc2UgZGV2aWNlcyBhZnRlciB0aGlzIHNlcmllcwo+Pj4gaXMgc2V0dGxlZCkuIFRvIHN1cHBv
cnQgc3VjaCBjYXNlLCBJIHByZWZlciB0byB1c2UgcGFyYW1zLT5hZGRyX25ieXRlcwo+Pj4gYXMg
Y3VycmVudCBhZGRyZXNzIG1vZGUgc28gdGhhdCBJIGNhbiBmaXggaXQgaW4gcG9zdF9iZnB0X2Zp
eHVwKCkgaG9vay4KPj4KPj4gQXJlIHRoZXJlIHB1YmxpYyBkYXRhc2hlZXRzIGF2YWlsYWJsZT8g
U28gdGhlc2UgZGV2aWNlcyBoYXZlIGEgMyBieXRlCj4gSSB3aWxsIHNlbmQgZGF0YXNoZWV0cyB0
byB5b3UgaW4gYW5vdGhlciBlbWFpbC4gQXQgdGhpcyBwb2ludCwgb25seQo+IHN1bW1hcnkgZGF0
YXNoZWV0IGlzIGF2YWlsYWJsZSBpbiB3ZWJzaXRlLgo+IAo+PiBhbmQgYSA0IGJ5dGUgbW9kZSwg
YnV0IGFmdGVyIHJlc2V0LCB0aGV5IGFyZSBpbiB0aGUgNCBieXRlIG1vZGU/IExvb2tzCj4gWWVz
Lgo+IAo+PiBsaWtlIGl0IHNob3VsZCBiZSBmaXhlZCBpbiBhIGRpZmZlcmVudCB3YXkuIEknbSBu
b3Qgc3VyZSB0aGUgImN1cnJlbnQKPj4gbW9kZSIgaGFuZGxpbmcgaXMgY29ycmVjdC4KPj4KPiBZ
ZXMsIHdlIG1heSB3YW50IHRvIGludHJvZHVjZSBhIG5ldyBmbGFnIGxpa2UgU1BJX05PUl80QkFN
X0RFRkFVTFQgYW5kIGNoZWNrCj4gdGhlIGZsYWcgaW4gQkZQVCBwYXJzZS4gT25jZSBJIHNlbmQg
YW5vdGhlciBzZXJpZXMsIHBsZWFzZSByZXZpZXcuCj4gCj4+IFdlIG5lZWQgdG8gZGlmZmVyZW50
aWF0ZSBiZXR3ZWVuIHRoZSBtb2RlIHRoZSBmbGFzaCBjdXJyZW50bHkgaXMgdXNpbmcKPj4gKG5v
ci0+YWRkcl9uYnl0ZXMpIGFuZCB0aGUgbW9kZSBwYXJzZWQgYnkgU0ZEUCAocGFyYW1zLT5hZGRy
X25ieXRlcykuCj4+Cj4gVGhlIGZsYXNoJ3MgYWRkcmVzcyBtb2RlIGFmZmVjdHMgdGhlIGFkZHJl
c3MgbGVuZ3RoIG9mIE5vbi00QiBvcGNvZGVzLAo+IGluY2x1ZGluZyByZWFkL3dyaXRlIGFueSBy
ZWdpc3RlciBvcHMgdXNlZCBpbiBTTVBUIHBhcnNlIGFuZCBJbmZpbmVvbgo+IChzcGFuc2lvbikg
c3BlY2lmaWMgaG9va3MuCj4gCj4gVGhlIDRCIG9wY29kZXMgYWx3YXlzIHRha2UgYWRkcmVzcyBs
ZW5ndGggb2YgNCByZWdhcmRsZXNzIG9mIGZsYXNoJ3MKPiBhZGRyZXNzIG1vZGUuIEluIHRoZXNl
IEluZmluZW9uIGNoaXBzLCA0QiBvcGNvZGVzIGZvciByZWFkL3Byb2dyYW0vCj4gZXJhc2UgYXJl
IGF2YWlsYWJsZSBhbmQgNEJBSVQgYWR2ZXJ0aXNlcyB0aGVtLiBXZSBkb24ndCBoYXZlIHRvIGVu
dGVyCj4gNCBieXRlIGFkZHJlc3MgbW9kZSBmb3IgcmVhZC9wcm9ncmFtL2VyYXNlLgo+IAo+IFNv
LCBJIHRoaW5rIHdlIG5lZWQgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGFkZHJlc3MgbGVuZ3Ro
IGZvcgo+IHJlYWQvcHJvZ3JhbS9lcmFzZSBhbmQgZmxhc2gncyBkZWZhdWx0IGFkZHJlc3MgbW9k
ZS4KPiAKPiBPYnZpb3VzbHkgd2UgYXJlIHVzaW5nIG5vci0+YWRkcl9uYnl0ZXMgYXMgYWRkcmVz
cyBsZW5ndGggZm9yIHJlYWQvCj4gcHJvZ3JhbS9lcmFzZSBhbmQgc2hvdWxkIGtlZXAgdGhpcyB1
c2FnZS4KPiAKPiBGb3IgZmxhc2gncyBkZWZhdWx0IGFkZHJlc3MgbW9kZSwgbXkgcHJlZmVyZW5j
ZSBpcyB0byB1c2UKPiBwYXJhbXMtPmFkZHJfbmJ5dGVzLCBidXQgSSBzaG91bGQgcmVuYW1lIGl0
IHRvIHNvbWV0aGluZyBsaWtlCj4gcGFyYW1zLT5kZWZfYWRkcl9uYnl0ZXMgYW5kIHJld29yayBz
cGlfbm9yX3NldF9hZGRyX25ieXRlcygpLgo+IAo+ICBzdGF0aWMgaW50IHNwaV9ub3Jfc2V0X2Fk
ZHJfbmJ5dGVzKHN0cnVjdCBzcGlfbm9yICpub3IpCj4gIHsKPiAJaWYgKG5vci0+ZmxhZ3MgJiBT
Tk9SX0ZfSEFTXzRCQUlUKSB7Cj4gCQlub3ItPmFkZHJfbmJ5dGVzID0gNDsKPiAJfSBlbHNlIGlm
IChub3ItPnBhcmFtcy0+ZGVmX2FkZHJfbmJ5dGVzKSB7Cj4gIAkJbm9yLT5hZGRyX25ieXRlcyA9
IG5vci0+cGFyYW1zLT5kZWZfYWRkcl9uYnl0ZXM7Cj4gCj4+IEF0IHNvbWUgcG9pbnQsIHRoZSBt
b2RlIGlzIHN3aXRjaGVkIGFuZCBub3ItPmFkZHJfbmJ5dGVzIGJlY29tZXMKPj4gcGFyYW1zLT5h
ZGRyX25ieXRlcy4gSXQgc2VlbXMgaW4geW91ciBjYXNlIG5vci0+YWRkcl9uYnl0ZXMgc2hvdWxk
Cj4+IGJlIDQgcmlnaHQgZnJvbSB0aGUgYmVnaW5uaW5nLiBXaGljaCBhbHNvIG1lYW5zIG5vci0+
YWRkcl9uYnl0ZXMKPj4gc2hvdWxkIGJlIDMgZm9yIHRoZSBvdGhlciBjYXNlcyAoYW5kIHByb2Jh
Ymx5IG5vdCAwKS4KPj4KPiBXaXRoIHBhcmFtLT5kZWZfYWRkcl9uYnl0ZXMsIEkgdGhpbmsgd2Ug
Y2FuIGtlZXAgbm9yLT5hZGRyX25ieXRlcyA9IDAKPiBkdXJpbmcgU0ZEUCBwYXJzZS4KPiAKPiBU
aGFua3MsCj4gVGFrYWhpcm8KPiAKPiAKPiAgCj4gCj4gCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
