Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C5BC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jun 2022 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PStR7zTikblnRQbvLvUM7WJjjitiE/mSies68tBG/gU=; b=4M0W/nui2lYPXa
	DfUDLUG0jrXmK5k5kJq5VWc05RzHo/C+YEehzMpYj1+cu3S2/n8geSMe/pWIDHXiAeS513vwv21VF
	CPMo1p9KntB/OLBWpEvi62PPN7h4Xg8M5Lvc9q/sNiNDiqnw5hkL7ycGRbMMGX8TyMQKheNxSFpqu
	ssm/KLT1I74bkhsdfrBM0j0QqTD6H5AbRf/O0xGiaCCN5boHiSLWuX0kjNwRMbF3fwnOuv8oP64IW
	wFG9PhpbBHOk7zgWLEwivHWmnK1aNdq/MeOlOkyYdA0Pu8zlwYTK9anE8a+BKZRkdr9uwe99MVRW/
	E52cQ/jlK8NmsxXqzeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12ZI-008a7R-Dv; Tue, 14 Jun 2022 09:10:36 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o12OX-008UBm-39
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2022 08:59:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 79B45240003;
	Tue, 14 Jun 2022 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655197164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMJOV52BAlX4b5o+f0kJ5JrF8o5vgl2uar3QLKl+bnI=;
	b=c27nnLLI3mnFAiIG5TuZ3JlsqHQpHtvybmqfZlOxtCfbTA/Y0l/Z+9/YX/NAN0Tg3/1Jcj
	/ci64Pa97Lik4IlsuKOvFhZozLj7pX9tTd8kMEuq6nG/CGSJPxyPA7vwhCruymIWYaaq9H
	Zz0+26cNnwzqg3e4J77b+okZkmvK2LUBxYy2Rp3W/FJBs4qS51IjusRYEz8VCmYPb+E6wv
	9sipQxb6rfWTSRjHK1Vt4KEVPdlfbIX5EWovHH/Rk7mIVNEhu36EMDslnxhd3nt7xS3rXp
	3uP97iB4gt0EOwzOQPMd+RJD7zScZ6zCY1eyiwLmo5TJ2+mtV4VkSO7eWXug4Q==
Date: Tue, 14 Jun 2022 10:59:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 kernel@pengutronix.de
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix setting busy timeout setting
Message-ID: <20220614105920.1ecab2e0@xps-13>
In-Reply-To: <20220614083437.GR1615@pengutronix.de>
References: <20220613113030.1622723-1-s.hauer@pengutronix.de>
	<20220613160738.1b833bac@xps-13>
	<20220614083437.GR1615@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_015929_478936_EBA952DA 
X-CRM114-Status: GOOD (  26.10  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUdWUsIDE0IEp1biAy
MDIyIDEwOjM0OjM3ICswMjAwOgoKPiBPbiBNb24sIEp1biAxMywgMjAyMiBhdCAwNDowNzozOFBN
ICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgU2FzY2hhLAo+ID4gCj4gPiBzLmhh
dWVyQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIE1vbiwgMTMgSnVuIDIwMjIgMTM6MzA6MzAgKzAy
MDA6Cj4gPiAgIAo+ID4gPiBUaGUgREVWSUNFX0JVU1lfVElNRU9VVCB2YWx1ZSBpcyBkZXNjcmli
ZWQgaW4gdGhlIFJlZmVyZW5jZSBNYW51YWwgYXM6Cj4gPiA+IAo+ID4gPiB8IFRpbWVvdXQgd2Fp
dGluZyBmb3IgTkFORCBSZWFkeS9CdXN5IG9yIEFUQSBJUlEuIFVzZWQgaW4gV0FJVF9GT1JfUkVB
RFkKPiA+ID4gfCBtb2RlLiBUaGlzIHZhbHVlIGlzIHRoZSBudW1iZXIgb2YgR1BNSV9DTEsgY3lj
bGVzIG11bHRpcGxpZWQgYnkgNDA5Ni4KPiA+ID4gCj4gPiA+IFNvIGluc3RlYWQgb2YgbXVsdGlw
bHlpbmcgdGhlIHZhbHVlIGluIGN5Y2xlcyB3aXRoIDQwOTYsIHdlIGhhdmUgdG8KPiA+ID4gZGl2
aWRlIGl0IGJ5IHRoYXQgdmFsdWUuIFVzZSBESVZfUk9VTkRfVVAgdG8gbWFrZSBzdXJlIHdlIGFy
ZSBvbiB0aGUKPiA+ID4gc2FmZSBzaWRlLCBlc3BlY2lhbGx5IHdoZW4gdGhlIGNhbGN1bGF0ZWQg
dmFsdWUgaW4gY3ljbGVzIGlzIHNtYWxsZXIKPiA+ID4gdGhhbiA0MDk2IGFzIHR5cGljYWxseSB0
aGUgY2FzZS4KPiA+ID4gCj4gPiA+IFRoaXMgYnVnIGxpa2VseSBuZXZlciB0cmlnZ2VyZWQgYmVj
YXVzZSBhbnkgdGltZW91dCAhPSAwIHVzdWFsbHkgd2lsbAo+ID4gPiBkby4gSW4gbXkgY2FzZSB0
aGUgYnVzeSB0aW1lb3V0IGluIGN5Y2xlcyB3YXMgb3JpZ2luYWxseSBjYWxjdWxhdGVkIGFzCj4g
PiA+IDI0MDgsIHdoaWNoIG11bHRpcGxpZWQgd2l0aCA0MDk2IGlzIDB4OTY4MDAwLiBUaGUgbG93
ZXIgMTYgYml0cyB3ZXJlCj4gPiA+IHRha2VuIGZvciB0aGUgMTYgYml0IHdpZGUgcmVnaXN0ZXIg
ZmllbGQsIHNvIHRoZSByZWdpc3RlciB2YWx1ZSB3YXMKPiA+ID4gMHg4MDAwLiBXaXRoIDI5NzBi
ZjVhMzJmMCAoIm10ZDogcmF3bmFuZDogZ3BtaTogZml4IGNvbnRyb2xsZXIgdGltaW5ncwo+ID4g
PiBzZXR0aW5nIikgaG93ZXZlciB0aGUgdmFsdWUgaW4gY3ljbGVzIGJlY2FtZSAyMzg0LCB3aGlj
aCBtdWx0aXBsaWVkCj4gPiA+IHdpdGggNDA5NiBpcyAweDk1MDAwMC4gVGhlIGxvd2VyIDE2IGJp
dCBhcmUgMHgwIG5vdyByZXN1bHRpbmcgaW4gYW4KPiA+ID4gaW50ZXJtZWRpYXRlIHRpbWVvdXQg
d2hlbiByZWFkaW5nIGZyb20gTkFORC4KPiA+ID4gCj4gPiA+IEZpeGVzOiBiMTIwNjEyMjA2OWFh
ICgibXRkOiByYXduYW5kOiBncG1pOiB1c2UgY29yZSB0aW1pbmdzIGluc3RlYWQgb2YgYW4gZW1w
aXJpY2FsIGRlcml2YXRpb24iKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1ZXIgPHMu
aGF1ZXJAcGVuZ3V0cm9uaXguZGU+ICAKPiA+IAo+ID4gU2hvdWxkbid0IHdlIGFkZCBhIENjOiBz
dGFibGUgaGVyZT8gIAo+IAo+IEkgYmVjYW1lIGEgYml0IGlnbm9yYW50IGFib3V0IENjOiBzdGFi
bGUgYmVjYXVzZSBldmVyeXRoaW5nIHdpdGggdGhlCj4ga2V5d29yZCAiRml4IiBpbiB0aGUgc3Vi
amVjdCBzZWVtcyB0byBlbmQgdXAgaW4gc3RhYmxlIGFueXdheSBubyBtYXR0ZXIKPiBpZiBJIHdh
bnQgaXQgb3Igbm90LgoKWWVhaCB3aXRoIHRoZSBBVVRPU0VMIGxvZ2ljIG1hbnkgZml4ZXMgYXJl
IGJhY2twb3J0ZWQsIGJ1dCBJIHRoaW5rIEkndmUKcmVhZCBHS0ggY29tcGxhaW5pbmcgdGhhdCB0
aGlzIHdhcyBub3QgYSByZWFzb24gZm9yIGZvcmdldHRpbmcgdGhlCnN0YWJsZSBDYyB3aGVuIGl0
IHdhcyByZWxldmFudC4uLiBTbyBJIGFzayBmb3IgaXQgYWdhaW4gbm93IDopCgo+IAo+IEJ1dCBy
aWdodCwgdGhpcyBvbmUgc2hvdWxkIGdvIGludG8gc3RhYmxlLCBJIGp1c3QgcmVzZW50Lgo+IAo+
IFNhc2NoYQo+IAo+IAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
