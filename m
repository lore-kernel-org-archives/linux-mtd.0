Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE852EB64DC
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jun 2023 17:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajhTkNwAXjBlpgGRBpS030ViyDn0rT7yG3Hirf60IIM=; b=n7x9wDXQni9tAL
	W+F1A4fM5gX6+NUlfi1qKqR/X5XAU9FnAni//igqv3cBXKB+aOWcIMQi/YoOwIvbrNIJj4IfPgmET
	ZP5tF9OKnVU1F676pHxK2SzMz3jSAwSLmP0uujx7FlfQp3HuGiyR1smh3ERn7tmzujR39O+nXR/t/
	lGqo4ud95gsjXy2Lzan/FBPNAJTBMyQ5aG2+IH9JsP6bg6MJVwfLSyN481O2cwZakltyZYCWFCv9M
	VZ4MCRxWKPxujbO+aczcXqk05FQkjL/qS01i02sLa7/i28tL0MzPQkMe7kM0W4jWrDE0cZExZv1o6
	19EPoGxhsgu/UwycVfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC22b-00FJRq-0I;
	Wed, 21 Jun 2023 17:54:49 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC22Y-00FJQp-07
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jun 2023 17:54:47 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b466066950so76039241fa.2
        for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2023 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687370083; x=1689962083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2o4bGn7jOjzZnBJERcRak/bZj6MAViV36y/MktNSG2M=;
        b=BW2xQnRcWkvYiHqlWhIsExUOCC/t5VhwrzqsSOe7wqnMCt25mBTj8+FD5gPQF/0D/h
         vSskI1+Y3UNOE1iYbAxN7vjCZ3dzIxT2v3N+7Tq3PMZzTKhD6Sc3VULnF7tWHAQlmhUi
         ih04tI3OOPmeeIHObxMDmZCFSlLM9CVS8TpxyjNBujA9mxp/DhiLBt5A5QhVRzUoSVCh
         jTDROqo3G2D1x0FA6XaDWW8UmMMY4GIV1u9jzrrpnZp0l6SI6FLzHws92uSVYir4mnDB
         JU9pao2sJvgO92XxjblrLg4rZ77vdiYnyECRy21fu+EgDrF/QgF+zLHFl/e9ea/Hv7Gs
         gb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687370083; x=1689962083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2o4bGn7jOjzZnBJERcRak/bZj6MAViV36y/MktNSG2M=;
        b=ck8ZLHkCwGTJd8q+IsvdRrZNSZsMwxnCoMDqvYW66XDLBZfDwhz+kBrKqWFOmmsIxy
         hX0720ji/jvqs3Hi60c7Lf2OZZouX5KbRaazSdH+qK54wrQ8KKum5TGC5G/dzqxpHYd4
         4JayOCMniz/GGvUCKzIhG1j7S4Pk5R49i4dOnG/Ce7qm9MURbHVfpXa7jpxc3BFeLvDE
         Hzou3pWOge5r0EvLeBPoScebzqt4KX0pAjOT9HPk8cmoZ0pXpqVA6mY4yr/RsvojcmB5
         WOgJKuFwQvT4NBqVS/PJVV4hppkkISoJKC/8jouzwGe/XdzeNAOhQCoR210ZWkRAbNzt
         RyiA==
X-Gm-Message-State: AC+VfDw66rsbP2NI6nrfu6Eko+NBBPxhn/zMVhHT8KxtkNVR9yhdPAxx
	Pwy5WV0xK9YirMDLRGhC2YTb+zrq/miyRE1CH34=
X-Google-Smtp-Source: ACHHUZ5rMIbWN68vEkj6Pv8UT5vTuo97sTVqRPO3Z+XxavLMGk6+IlizMtk/Q/YGbIbCPr/hKzeV1jWV7cFiXyED0ZU=
X-Received: by 2002:a2e:9bd8:0:b0:2b4:5c1a:dd7c with SMTP id
 w24-20020a2e9bd8000000b002b45c1add7cmr10456827ljj.41.1687370083315; Wed, 21
 Jun 2023 10:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAMeyCbi16i4mdkOnqYhbW1tnqNwPwg2FVYqbdyhXt1fT10EaUw@mail.gmail.com>
 <20230621152556.qcjarclgbagkygdt@umbrella>
In-Reply-To: <20230621152556.qcjarclgbagkygdt@umbrella>
From: Kegl Rohit <keglrohit@gmail.com>
Date: Wed, 21 Jun 2023 19:55:47 +0200
Message-ID: <CAMeyCbgmiNTpV5_sbP3dq0TNJBBxcW8j0SRM+dxbjQXWAShDBg@mail.gmail.com>
Subject: Re: mtd: raw: nand: gpmi-nand data corruption @ v5.10.184
To: "han.xu" <han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_105446_075546_F2EAC31D 
X-CRM114-Status: GOOD (  21.21  )
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

b2ssIGxvb2tpbmcgYXQgdGhlIDUuMTAuMTg0IGdwbWktbmFuZC5jOgoKI2RlZmluZSBCRl9HUE1J
X1RJTUlORzFfQlVTWV9USU1FT1VUKHYpIFwKKCgodikgPDwgQlBfR1BNSV9USU1JTkcxX0JVU1lf
VElNRU9VVCkgJiBCTV9HUE1JX1RJTUlORzFfQlVTWV9USU1FT1VUKQoKaHctPnRpbWluZzEgPSBC
Rl9HUE1JX1RJTUlORzFfQlVTWV9USU1FT1VUKGJ1c3lfdGltZW91dF9jeWNsZXMgKiA0MDk2KTsK
CmFuZCB0aGVuIDUuMTkgKHVwc3RyZWFtIHBhdGNoIHNvdXJjZSAwZmRkZjlhZDA2ZmQ5ZjQzOWYx
MzcxMzk4NjE1NTY2NzE2NzNlMzFjKQpodHRwczovL2dpdGh1Yi5jb20vZ3JlZ2toL2xpbnV4L2Nv
bW1pdC8wZmRkZjlhZDA2ZmQ5ZjQzOWYxMzcxMzk4NjE1NTY2NzE2NzNlMzFjI2RpZmYtMGRlYzJm
YTg2NDBlYTIwNjc3ODljNDA2YWIxZTQyYzk4MDVkMGQwZmM5ZjcwYTNhMjlkMTdmOTMxMWUyM2Nh
Mkw4OTMKCmh3LT50aW1pbmcxID0gQkZfR1BNSV9USU1JTkcxX0JVU1lfVElNRU9VVChESVZfUk9V
TkRfVVAoYnVzeV90aW1lb3V0X2N5Y2xlcywKNDA5NikpOwoKY291bGQgYmUgdGhlIGNhdXNlLiBE
SVZfUk9VTkRfVVAgaXMgbW9zdCBsaWtlbHkgYSBkaXZpc2lvbiBhbmQKYnVzeV90aW1lb3V0X2N5
Y2xlcyAqIDQwOTYgYSBtdWx0aXBsaWNhdGlvbiEKClRoZSBiYWNrcG9ydCBpcyB3cm9uZywgYmVj
YXVzZSBvbiB0aGUgNS4xMCBrZXJuZWwgdHJlZSBjb21taXQKY2M1ZWUwZTBlZWQwYmVjMmI3Y2Mx
ZDBmZWI5NDA1ZTg4NGVhY2U3ZCB3YXMgcmV2ZXJ0ZWQgYW5kIG9uIG1haW5saW5lCm5vdC4KaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcnQvbGludXgtc3Rh
YmxlLXJ0LmdpdC9jb21taXQvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFu
ZC5jP2g9djUuMTAuMTg0LXJ0OTAmaWQ9Y2M1ZWUwZTBlZWQwYmVjMmI3Y2MxZDBmZWI5NDA1ZTg4
NGVhY2U3ZAoKPT4gbm93IGluIDUuMTAuMTg0IHRoaXMgbGluZSAiaHctPnRpbWluZzEgLi4uIiBp
cyB3cm9uZyEKCiBJIHdpbGwgdGVzdCB0aGlzIHRvbW9ycm93LgoKT24gV2VkLCBKdW4gMjEsIDIw
MjMgYXQgNToyNuKAr1BNIGhhbi54dSA8aGFuLnh1QG54cC5jb20+IHdyb3RlOgo+Cj4gT24gMjMv
MDYvMjEgMDQ6MjdQTSwgS2VnbCBSb2hpdCB3cm90ZToKPiA+IEhlbGxvIQo+ID4KPiA+IFVzaW5n
IGlteDdkIGFuZCBydCBzdGFibGUga2VybmVsIHRyZWUuCj4gPgo+ID4gQWZ0ZXIgdXBncmFkaW5n
IHRvIHY1LjEwLjE4NC1ydDkwIHRoZSByb290ZnMgdWJpZnMgbXRkIHBhcnRpdGlvbiBnb3QgY29y
cnVwdGVkLgo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvcnQvbGludXgtc3RhYmxlLXJ0LmdpdC90YWcvP2g9djUuMTAuMTg0LXJ0OTAKPiA+Cj4gPiBB
ZnRlciByZXZlcnRpbmcgdGhlIGxhdGVzdCBwYXRjaAo+ID4gKGU0ZTRiMjRiNDJlNzEwZGIwNThj
YzJhNzlhN2NmMTZiZjAyYjQ5MTUpLCB0aGUgcm9vdGZzIHBhcnRpdGlvbiBkaWQKPiA+IG5vdCBn
ZXQgY29ycnVwdGVkLgo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvcnQvbGludXgtc3RhYmxlLXJ0LmdpdC9jb21taXQvZHJpdmVycy9tdGQvbmFuZC9y
YXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jP2g9djUuMTAuMTg0LXJ0OTAmaWQ9ZTRlNGIyNGI0MmU3
MTBkYjA1OGNjMmE3OWE3Y2YxNmJmMDJiNDkxNQo+ID4KPiA+IFRoZSBjb21taXQgbWVzc2FnZSBz
dGF0ZXMgdGhlIHRpbWVvdXQgY2FsY3VsYXRpb24gd2FzIGNoYW5nZWQuCj4gPiBIZXJlIGFyZSB0
aGUgY2FsY3VsYXRlZCB0aW1lb3V0cyBgYnVzeV90aW1lb3V0X2N5Y2xlc2AgYmVmb3JlIChfb2xk
KQo+ID4gYW5kIGFmdGVyIHRoZSBwYXRjaCAoX25ldyk6Cj4gPgo+ID4gWyAgICAwLjQ5MTUzNF0g
YnVzeV90aW1lb3V0X2N5Y2xlc19vbGQgNDM1Mwo+ID4gWyAgICAwLjQ5MTYwNF0gYnVzeV90aW1l
b3V0X2N5Y2xlc19uZXcgMTQyNDcwNQo+ID4gWyAgICAwLjQ5MjMwMF0gbmFuZDogZGV2aWNlIGZv
dW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4YzIsIENoaXAgSUQ6IDB4ZGMKPiA+IFsgICAgMC40OTIz
MTBdIG5hbmQ6IE1hY3Jvbml4IE1YMzBMRjRHMjhBQwo+ID4gWyAgICAwLjQ5MjMxNl0gbmFuZDog
NTEyIE1pQiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBwYWdlIHNpemU6Cj4gPiAyMDQ4LCBP
T0Igc2l6ZTogMTEyCj4gPiBbICAgIDAuNDkyNDg4XSBidXN5X3RpbWVvdXRfY3ljbGVzX29sZCA0
MzUzCj4gPiBbICAgIDAuNDkyNDkzXSBidXN5X3RpbWVvdXRfY3ljbGVzX25ldyAxNDI0NzA1Cj4g
PiBbICAgIDAuNDkyODYzXSBidXN5X3RpbWVvdXRfY3ljbGVzX29sZCAyNTEwCj4gPiBbICAgIDAu
NDkyODcyXSBidXN5X3RpbWVvdXRfY3ljbGVzX25ldyAzNTAwMDAKPiA+Cj4gPiBUaGUgbmV3IHRp
bWVvdXRzIGFyZSBzZXQgYSBsb3QgaGlnaGVyLiBIaWdoZXIgdGltZW91dHMgc2hvdWxkIG5vdCBi
ZQo+ID4gYW4gaXNzdWUuIExvd2VyIHRpbWVvdXRzIGNvdWxkIGJlIGFuIGlzc3VlLgo+ID4gQnV0
IGJlY2F1c2Ugb2YgdGhpcyBoaWdoIHRpbWVvdXRzIGdwbWktbmFuZCBpcyBicm9rZW4gZm9yIHVz
Lgo+ID4KPiA+IEZvciBub3cgd2Ugc2ltcGxlIHJldmVydGVkIHRoZSBjaGFuZ2UuCj4gPiBUaGUg
bmV3IGNhbGN1bGF0aW9ucyBzZWVtIHRvIGJlIGZsYWt5LCBhIHByZXZpb3VzICJmaXggYmFja3Bv
cnQiIHdhcwo+ID4gYWxyZWFkeSByZXZlcnRlZCBiZWNhdXNlIG9mIGRhdGEgY29ycnVwdGlvbi4K
PiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3J0L2xp
bnV4LXN0YWJsZS1ydC5naXQvY29tbWl0L2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9n
cG1pLW5hbmQuYz9oPXY1LjEwLjE4NC1ydDkwJmlkPWNjNWVlMGUwZWVkMGJlYzJiN2NjMWQwZmVi
OTQwNWU4ODRlYWNlN2QKPiA+Cj4gPiBBbnkgZ3Vlc3NlcyB3aHkgdGhlIGhpZ2ggdGltZW91dCBj
YXVzZXMgaXNzdWVzPwo+Cj4gaGlnaCB0aW1lb3V0IHdpdGggd3JvbmcgY2FsY3VsYXRpb24gbWF5
IG92ZXJmbG93IGFuZCBjYXVzZXMgREVWSUNFX0JVU1lfVElNRU9VVAo+IHJlZ2lzdGVyIHR1cm5z
IHRvIGJlIDAuCj4KPiA+Cj4gPgo+ID4gVGhhbmtzIGluIGFkdmFuY2UhCj4gPgo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
