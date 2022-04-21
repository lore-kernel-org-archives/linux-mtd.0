Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3268C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tESvSg80ujAa5zohyabXjGA5aWPVydfJ56in/VLDLo8=; b=fp7eXPzx60M/ZU
	vTrv7OiDrJEy82txydpPX8kt25pi6s+jskXMx/8RZlTvvR/n+pth6Gj4G3nvYlI4QlkRGwlgjIVWs
	/3tuin3Z/v6f4BFIUiCVJbtpypZiM6o/T7rEPRfBeOYkW8Zx40gOw8RMH9G6PvdzmjD3KGgrHQAk1
	rfXuiEVyCsP62ZtTOkKjykdaWxYhzHNyt4yWGurtxXKFkRLKR34HT6j/1Hzv7QbgP98yo9pug8hUm
	knxk6rjDHi5Vc9JVmoMeIuujZYpr+h7DcYP2WHbuw/N+DaC4Hk6m/HhAvADs2rUx7nUAIIGg4j5YG
	8ltChaNIwSp6ik4nThbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZtp-00EHpc-It; Thu, 21 Apr 2022 16:43:21 +0000
Received: from louie.mork.no ([2001:41c8:51:8a:feff:ff:fe00:e5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZtl-00EHlA-Tx
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 16:43:20 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9d:7e00:0:0:0:1])
 (authenticated bits=0)
 by louie.mork.no (8.15.2/8.15.2) with ESMTPSA id 23LGh5M71103094
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 17:43:07 +0100
Received: from miraculix.mork.no ([IPv6:2a01:799:c9d:7e02:9be5:c549:1a72:4709])
 (authenticated bits=0)
 by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 23LGh27Z195694
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 21 Apr 2022 18:43:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
 t=1650559385; bh=dzA/TfQMba7XUvNejzBkv5bimJjRhEdbjti2NIqrxDw=;
 h=From:To:Cc:Subject:References:Date:Message-ID:From;
 b=XjxcjbC+4pAEp7RV768eRoGb7YNmZ2aYrGantR8IjifAZmlzG0xrSDle3y5EgurqO
 UtqNu+Xmpy1Yd92+wc/HMxoZlYXdSAXCjM7GtVDI5W/EtOW2j0bIPbOt1zqDitv7U8
 IeDTA3C7teokLRPZYXUNK+9ntl8EZZ+1Rrlcm4LY=
Received: (nullmailer pid 937847 invoked by uid 1000);
 Thu, 21 Apr 2022 16:43:02 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: <Tudor.Ambarus@microchip.com>
Cc: <miquel.raynal@bootlin.com>, <ezequiel@vanguardiasur.com.ar>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtdblock: warn if opened on NAND
Organization: m
References: <20220328161108.87757-1-bjorn@mork.no>
 <c98f728f-2fef-6174-714e-0d31ebe4c43c@microchip.com>
Date: Thu, 21 Apr 2022 18:43:02 +0200
In-Reply-To: <c98f728f-2fef-6174-714e-0d31ebe4c43c@microchip.com> (Tudor
 Ambarus's message of "Thu, 21 Apr 2022 14:27:47 +0000")
Message-ID: <877d7io0a1.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_094318_468610_127CD942 
X-CRM114-Status: GOOD (  20.60  )
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

PFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPiBJIGRvbid0IHNlZSB0aGlz
IGFzIGEgZml4LCB5b3UganVzdCBtYXNrIG91dCB0aGUgd2FybmluZywgeW91IGFzc3VtZQo+IHRo
YXQgbXRkYmxvY2sgaXMgbm90IHVzZWQKCk5vLCBJIGRvbid0LiAgTm8gcmVhbCB3YXJuaW5ncyBh
cmUgbWFza2VkLiAgT25seSBib2d1cyB3YXJuaW5ncy4KCkkgbWFrZSBubyBhc3N1bXB0aW9uIGFi
b3V0IG10ZGJsb2NrIHVzYWdlLiBJIG1vdmVkIHRoZSB3YXJuaW5nIHRvIG9wZW4oKQpzbyB0aGF0
IHRoZSBkcml2ZXIgY29tcGxhaW5zIHdoZW4gYSBOQU5EIG10ZGJsb2NrIHBhcnRpdGlvbiBpcyBt
b3VudGVkLgpJIGFtIHN1cmUgdGhpcyBkb2VzIGhhcHBlbiBmcm9tIHRpbWUgdG8gdGltZSwgYW5k
IGFncmVlIDEwMCUgdGhhdCBhCndhcm5pbmcgaXMgYXBwcm9wcmlhdGUgaW4gdGhvc2UgY2FzZXMu
CgpDb21taXQgZTA3NDAzYThjNmJlIGlzIGJhc2VkIG9uIHR3byBmYWxzZSBhc3N1bXB0aW9uczoK
MSkgdGhlIHByZXNlbmNlIG9mIHRoZSBtdGRibG9jayBkcml2ZXIgaXMgYSBwcm9ibGVtCjIpIGFs
bCBwYXJ0aXRpb25zIHdpbGwgYmUgbW91bnRlZCBhcyBtdGRibG9jayBkZXZpY2VzCgpFeHRlbnNp
dmUgbG9nIG5vaXNlIGlzIGEgcHJvYmxlbSBmb3IgZW5kIHVzZXJzLiAgV2UgY2FuIG9idmlvdXNs
eSBhcmd1ZQppZiBpdCBpcyBhIGJ1ZyBvciBub3QuICBJIGNsYWltIHRoYXQgaXQgaXMgYmVjYXVz
ZSByZWFsIHdhcm5pbmdzIGRyb3duCmluIHRoZSBub2lzZSwgbWFraW5nIHJlYWwgYnVncyBtdWNo
IGhhcmRlciB0byBzcG90LgoKPiBidXQgeW91IHN0aWxsIGtlZXAgaXQgaW4geW91ciBjb25maWcs
IHdoaWNoCj4gaXMgd3JvbmcuIFlvdSBzaG91bGQgaW5zdGVhZCB1cGRhdGUgeW91ciBjb25maWcs
IHJlbW92ZSBtdGRibG9jaywgYW5kCj4gZml4IHRoZSBjYXVzZSBpZiBpdCdzIHBvc3NpYmxlLgoK
U28gaWYgeW91IGhhdmUgYSBkZXZpY2Ugd2l0aCBib3RoIE5PUiBhbmQgTkFORCBmbGFzaCwgdGhl
biB3aGF0PyAgTm90CnRoYXQgdW51c3VhbC4KCj4+IHN0YXJ0IG5vdGljaW5nIG5vdyB0aGF0IE9w
ZW5XcnQgaXMgbW92aW5nIHRvIDUuMTUuICBBcyB5b3UgbWF5IG9yCj4+IG5vdCBrbm93LCBPcGVu
V3J0IHVuY29uZGl0aW9uYWxseSBpbmNsdWRlcyBtdGRibG9jayB3aGV0aGVyIHRoZQo+PiB0YXJn
ZXQgaXMgTkFORCBvciBOT1IuICBTbyB0aGlzIHdpbGwgY2F1c2UgbG90cyBvZiBub2lzZSBvbiBh
bnkKPgo+IFdoeSBkb2VzIE9wZW53cnQgaW5jbHVkZSBtdGRibG9jaz8KCkkgZG9uJ3Qga25vdyBh
bmQgSSBkb24ndCBzcGVhayBmb3IgT3BlbldydCwgYmVpbmcgb25seSBhbiBlbmQgdXNlci4gIEJ1
dApJIGFzc3VtZSBpdCdzIGJlY2F1c2UgT3BlbldydCBidWlsZHMgc2VtaS1nZW5lcmljIGltYWdl
cyBmb3IgYm90aCBOT1IKYW5kIE5BTkQgZGV2aWNlcywgYXMgd2VsbCBhcyBkZXZpY2VzIHdpdGgg
Ym90aCBmbGFzaCB0eXBlcy4gVGhleSBhcmUKYWxzbyB0cnlpbmcgdG8gbWFpbnRhaW4gZmxhc2gg
bGF5b3V0IGNvbXBhdGliaWxsdHkgd2l0aCBPRU0gZmlybXdhcmUsCndoaWNoIG9mdGVuIGRvZXMg
cmVhbGx5IHN0dXBpZCB0aGluZ3MuCgpTdXJlLCBPcGVuV3J0IGNvdWxkIHByb2JhYmx5IHN0cmlw
IG10ZGJsb2NrIGZyb20gTkFORCBvbmx5IGRldmljZXMuIEJ1dApJIGd1ZXNzIHRoZSBwcmlvcml0
eSBpcyBsb3cgc2luY2UgaXQgZG9lc24ndCBmaXggYW55IHByb2JsZW0sIGFuZCBpdAp3aWxsIGNv
bXBsaWNhdGUgdGhlaXIgYnVpbGQgc2xpZ2h0bHkuIEknbSBzdXJlIHBhdGNoZXMgYXJlIHdlbGNv
bWUKdGhvdWdoLgoKPiBJIGhhdmUgZW5jb3VudGVyZWQgdGhlc2UgbWVzc2FnZXMgaW4gc29tZSBj
b25maWdzIHRoYXQgSSdtIHVzaW5nIGFuZCBJCj4gZW5kZWQgdXAgY2xlYW5pbmcgdGhlbS4gVGhl
c2UgbWVzc2FnZXMgaGVscGVkIG1lIGlkZW50aWZ5IHRoZSBwcm9ibGVtIGFuZAo+IHVsdGltYXRl
bHkgdG8gZml4IGl0LiBMZXQncyBnaXZlIG90aGVycyB0aGUgY2hhbmNlIHRvIGRvIHRoZSBzYW1l
LgoKT3RoZXJzIHdpbGwgc3RpbGwgZ2V0IHRoZSB3YXJuaW5nIGlmZiB0aGVyZSBpcyBhIHByb2Js
ZW0uCgpUaGUgZml4IGlzIHRvIHByZXZlbnQgd2FybmluZ3Mgd2hlbiB0aGVyZSBpc24ndCBvbmUu
ICBJZiB5b3Ugd2FybiAyMDAKdGltZXMgKHdoaWNoIElNSE8gaXMgYSBsb3cgZXN0aW1hdGUgaGVy
ZSkgZm9yIGV2ZXJ5IHJlYWwgcHJvYmxlbSwgdGhlbgpubyBvbmUgd2lsbCBjYXJlIGluIHRoZSBl
bmQuICJPaCwgaXQncyBqdXN0IG10ZGJsb2NrIHdoaW5pbmcgYWdhaW4uICBJdApkb2VzIHRoYXQg
YWxsIHRoZSB0aW1lIgoKCkJqw7hybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
