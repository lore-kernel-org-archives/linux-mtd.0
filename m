Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF505EB64D8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 04:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfVqjA5wWyvyXF/K0hyBMBiK7l0El79y9YhezoVmTz0=; b=lu1BMxL9bXU/u5
	qICd1R+YqhAXBBCKfhZUmU8eJO517JGuhQ1P+Y8dRR1T5kR2Bnauv5lIajU1e4GEOogEAxMgeKYRt
	hDfPxh+qdXPlA/2PoaVjcYM72CgYBOg7vps0kxQrH+tqAGKNYAuwanKIDYWNi9UEJz8D/cpT3hBdy
	1vJzUCMgIkdgUmQ+7vEFjq+ovgNDDj1x6oYZZL5QgINGu5365eI8a0K/eG5GMhUhjayLxunMxrHqI
	LsaL3MjL37M+/UTnHaGlTO5lyfaKEZr7/diE30nKQGo16xVGOkJij/VM9UMa4cLsxqkrSLK/g1p0Z
	znJrEPiRFya53++R+JMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCCC9-00Goxu-0V;
	Thu, 22 Jun 2023 04:45:21 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCCC6-00GoxL-1S
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 04:45:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so9257420e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2023 21:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687409116; x=1690001116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qm8/mZQVP55Q1thOjxl8dKSZZowSXbBBYLtO0ZEkgYY=;
        b=pGeWm47wBdPmBOuXJC42rWXnfNxxk8EB25KPKFVfQpSWt5Cd6WYujSPt93+2ISVRwW
         IWZQ83mIfawFhymM0xpNi2hbnD69xCfn4ZBUHxPLWBFJf3MPPQs7lwil3gerx6XKzLX6
         qjKnuRpLnx5vWsSCGJXbVlayj4X41rE/MLIsiujn2w2RoJhCw1RccvHDKO2DePK0WW6y
         XongM774DphX7EybaOyauau9A7+uijLaC+mH9e4NxcMoAX596AkSbz5ZVivqxnfCVePG
         z0YBW06thBfsvyvHyWkA1K4VjKdR1i6CNucMnfr4Hn7Xw/on7ZCmlwzKxru5BdiZSo/7
         mg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687409116; x=1690001116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qm8/mZQVP55Q1thOjxl8dKSZZowSXbBBYLtO0ZEkgYY=;
        b=SkBTuonP06Pg+Z8zpcDK9X21dHh2VHT5IY8suG9sZTLqET3HSr8zpqe2jrxi/Ykcl4
         Uluuw8/TjIIhe8ZZlPwPk5p/upq3w+A3cHnYPvSznyf6oOMWK90Li0eDM4aiPM7HaFhn
         pZ1S4wCNG1RNw+ofBXIBTXowiZNgN2suyOaytGHOfsQiee6eW0HE9rIwgq3tp2A8mDed
         97FJrjtsllz03XxjSu+PlStVbowOSoknb7rxP9fFfUIb/v4RnMp5+LVeqJHk+5iD2aaY
         Lj438xpqhsvLxX6T9Jx3rCPLfg2z+K02l0u9AUpLhrjUTjp4WzV47LUn1eB92zqzTbto
         ppbg==
X-Gm-Message-State: AC+VfDy9PMZJfGHVvPJZxZo/Z7mYTk4GIHZ3F+aYCtqHn6qERUWPh6oQ
	YxesKgwtzS0Tsaaoq7gfL865nZxBuYaw7nuGLe8=
X-Google-Smtp-Source: ACHHUZ6cXwDUBme6P/lXOu97eHRAY6k/Yw944fC86y/9nBNiZH+XgmdVZTVtCEwPuJROS5iarDLL9ogWUN9wvRzZAUc=
X-Received: by 2002:a05:6512:ad2:b0:4f9:5c6a:d4d3 with SMTP id
 n18-20020a0565120ad200b004f95c6ad4d3mr2625454lfu.1.1687409115406; Wed, 21 Jun
 2023 21:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMeyCbi16i4mdkOnqYhbW1tnqNwPwg2FVYqbdyhXt1fT10EaUw@mail.gmail.com>
 <20230621152556.qcjarclgbagkygdt@umbrella> <CAMeyCbgmiNTpV5_sbP3dq0TNJBBxcW8j0SRM+dxbjQXWAShDBg@mail.gmail.com>
In-Reply-To: <CAMeyCbgmiNTpV5_sbP3dq0TNJBBxcW8j0SRM+dxbjQXWAShDBg@mail.gmail.com>
From: Kegl Rohit <keglrohit@gmail.com>
Date: Thu, 22 Jun 2023 06:46:20 +0200
Message-ID: <CAMeyCbhb2wV8-kmjaihjT3vQsFs-zzix77ztG7Z9E4VdEZOHOQ@mail.gmail.com>
Subject: Re: mtd: raw: nand: gpmi-nand data corruption @ v5.10.184
To: "han.xu" <han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_214518_495117_13C783FF 
X-CRM114-Status: GOOD (  25.69  )
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

QWZ0ZXIgcmV2ZXJ0aW5nIHRoZSByZXZlcnQgOiksIHRoZSBkYXRhIGNvcnJ1cHRpb24gZGlkIG5v
dCBoYXBwZW4gYW55bW9yZSEKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3J0L2xpbnV4LXN0YWJsZS1ydC5naXQvY29tbWl0L2RyaXZlcnMvbXRkL25hbmQv
cmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYz9oPXY1LjEwLjE4NC1ydDkwJmlkPWNjNWVlMGUwZWVk
MGJlYzJiN2NjMWQwZmViOTQwNWU4ODRlYWNlN2QKCk9uIFdlZCwgSnVuIDIxLCAyMDIzIGF0IDc6
NTXigK9QTSBLZWdsIFJvaGl0IDxrZWdscm9oaXRAZ21haWwuY29tPiB3cm90ZToKPgo+IG9rLCBs
b29raW5nIGF0IHRoZSA1LjEwLjE4NCBncG1pLW5hbmQuYzoKPgo+ICNkZWZpbmUgQkZfR1BNSV9U
SU1JTkcxX0JVU1lfVElNRU9VVCh2KSBcCj4gKCgodikgPDwgQlBfR1BNSV9USU1JTkcxX0JVU1lf
VElNRU9VVCkgJiBCTV9HUE1JX1RJTUlORzFfQlVTWV9USU1FT1VUKQo+Cj4gaHctPnRpbWluZzEg
PSBCRl9HUE1JX1RJTUlORzFfQlVTWV9USU1FT1VUKGJ1c3lfdGltZW91dF9jeWNsZXMgKiA0MDk2
KTsKPgo+IGFuZCB0aGVuIDUuMTkgKHVwc3RyZWFtIHBhdGNoIHNvdXJjZSAwZmRkZjlhZDA2ZmQ5
ZjQzOWYxMzcxMzk4NjE1NTY2NzE2NzNlMzFjKQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ncmVna2gv
bGludXgvY29tbWl0LzBmZGRmOWFkMDZmZDlmNDM5ZjEzNzEzOTg2MTU1NjY3MTY3M2UzMWMjZGlm
Zi0wZGVjMmZhODY0MGVhMjA2Nzc4OWM0MDZhYjFlNDJjOTgwNWQwZDBmYzlmNzBhM2EyOWQxN2Y5
MzExZTIzY2EyTDg5Mwo+Cj4gaHctPnRpbWluZzEgPSBCRl9HUE1JX1RJTUlORzFfQlVTWV9USU1F
T1VUKERJVl9ST1VORF9VUChidXN5X3RpbWVvdXRfY3ljbGVzLAo+IDQwOTYpKTsKPgo+IGNvdWxk
IGJlIHRoZSBjYXVzZS4gRElWX1JPVU5EX1VQIGlzIG1vc3QgbGlrZWx5IGEgZGl2aXNpb24gYW5k
Cj4gYnVzeV90aW1lb3V0X2N5Y2xlcyAqIDQwOTYgYSBtdWx0aXBsaWNhdGlvbiEKPgo+IFRoZSBi
YWNrcG9ydCBpcyB3cm9uZywgYmVjYXVzZSBvbiB0aGUgNS4xMCBrZXJuZWwgdHJlZSBjb21taXQK
PiBjYzVlZTBlMGVlZDBiZWMyYjdjYzFkMGZlYjk0MDVlODg0ZWFjZTdkIHdhcyByZXZlcnRlZCBh
bmQgb24gbWFpbmxpbmUKPiBub3QuCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcnQvbGludXgtc3RhYmxlLXJ0LmdpdC9jb21taXQvZHJpdmVycy9tdGQv
bmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jP2g9djUuMTAuMTg0LXJ0OTAmaWQ9Y2M1ZWUw
ZTBlZWQwYmVjMmI3Y2MxZDBmZWI5NDA1ZTg4NGVhY2U3ZAo+Cj4gPT4gbm93IGluIDUuMTAuMTg0
IHRoaXMgbGluZSAiaHctPnRpbWluZzEgLi4uIiBpcyB3cm9uZyEKPgo+ICBJIHdpbGwgdGVzdCB0
aGlzIHRvbW9ycm93Lgo+Cj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgNToyNuKAr1BNIGhhbi54
dSA8aGFuLnh1QG54cC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDIzLzA2LzIxIDA0OjI3UE0sIEtl
Z2wgUm9oaXQgd3JvdGU6Cj4gPiA+IEhlbGxvIQo+ID4gPgo+ID4gPiBVc2luZyBpbXg3ZCBhbmQg
cnQgc3RhYmxlIGtlcm5lbCB0cmVlLgo+ID4gPgo+ID4gPiBBZnRlciB1cGdyYWRpbmcgdG8gdjUu
MTAuMTg0LXJ0OTAgdGhlIHJvb3RmcyB1YmlmcyBtdGQgcGFydGl0aW9uIGdvdCBjb3JydXB0ZWQu
Cj4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3J0
L2xpbnV4LXN0YWJsZS1ydC5naXQvdGFnLz9oPXY1LjEwLjE4NC1ydDkwCj4gPiA+Cj4gPiA+IEFm
dGVyIHJldmVydGluZyB0aGUgbGF0ZXN0IHBhdGNoCj4gPiA+IChlNGU0YjI0YjQyZTcxMGRiMDU4
Y2MyYTc5YTdjZjE2YmYwMmI0OTE1KSwgdGhlIHJvb3RmcyBwYXJ0aXRpb24gZGlkCj4gPiA+IG5v
dCBnZXQgY29ycnVwdGVkLgo+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9ydC9saW51eC1zdGFibGUtcnQuZ2l0L2NvbW1pdC9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmM/aD12NS4xMC4xODQtcnQ5MCZpZD1lNGU0YjI0
YjQyZTcxMGRiMDU4Y2MyYTc5YTdjZjE2YmYwMmI0OTE1Cj4gPiA+Cj4gPiA+IFRoZSBjb21taXQg
bWVzc2FnZSBzdGF0ZXMgdGhlIHRpbWVvdXQgY2FsY3VsYXRpb24gd2FzIGNoYW5nZWQuCj4gPiA+
IEhlcmUgYXJlIHRoZSBjYWxjdWxhdGVkIHRpbWVvdXRzIGBidXN5X3RpbWVvdXRfY3ljbGVzYCBi
ZWZvcmUgKF9vbGQpCj4gPiA+IGFuZCBhZnRlciB0aGUgcGF0Y2ggKF9uZXcpOgo+ID4gPgo+ID4g
PiBbICAgIDAuNDkxNTM0XSBidXN5X3RpbWVvdXRfY3ljbGVzX29sZCA0MzUzCj4gPiA+IFsgICAg
MC40OTE2MDRdIGJ1c3lfdGltZW91dF9jeWNsZXNfbmV3IDE0MjQ3MDUKPiA+ID4gWyAgICAwLjQ5
MjMwMF0gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4YzIsIENoaXAgSUQ6
IDB4ZGMKPiA+ID4gWyAgICAwLjQ5MjMxMF0gbmFuZDogTWFjcm9uaXggTVgzMExGNEcyOEFDCj4g
PiA+IFsgICAgMC40OTIzMTZdIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtp
QiwgcGFnZSBzaXplOgo+ID4gPiAyMDQ4LCBPT0Igc2l6ZTogMTEyCj4gPiA+IFsgICAgMC40OTI0
ODhdIGJ1c3lfdGltZW91dF9jeWNsZXNfb2xkIDQzNTMKPiA+ID4gWyAgICAwLjQ5MjQ5M10gYnVz
eV90aW1lb3V0X2N5Y2xlc19uZXcgMTQyNDcwNQo+ID4gPiBbICAgIDAuNDkyODYzXSBidXN5X3Rp
bWVvdXRfY3ljbGVzX29sZCAyNTEwCj4gPiA+IFsgICAgMC40OTI4NzJdIGJ1c3lfdGltZW91dF9j
eWNsZXNfbmV3IDM1MDAwMAo+ID4gPgo+ID4gPiBUaGUgbmV3IHRpbWVvdXRzIGFyZSBzZXQgYSBs
b3QgaGlnaGVyLiBIaWdoZXIgdGltZW91dHMgc2hvdWxkIG5vdCBiZQo+ID4gPiBhbiBpc3N1ZS4g
TG93ZXIgdGltZW91dHMgY291bGQgYmUgYW4gaXNzdWUuCj4gPiA+IEJ1dCBiZWNhdXNlIG9mIHRo
aXMgaGlnaCB0aW1lb3V0cyBncG1pLW5hbmQgaXMgYnJva2VuIGZvciB1cy4KPiA+ID4KPiA+ID4g
Rm9yIG5vdyB3ZSBzaW1wbGUgcmV2ZXJ0ZWQgdGhlIGNoYW5nZS4KPiA+ID4gVGhlIG5ldyBjYWxj
dWxhdGlvbnMgc2VlbSB0byBiZSBmbGFreSwgYSBwcmV2aW91cyAiZml4IGJhY2twb3J0IiB3YXMK
PiA+ID4gYWxyZWFkeSByZXZlcnRlZCBiZWNhdXNlIG9mIGRhdGEgY29ycnVwdGlvbi4KPiA+ID4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcnQvbGludXgt
c3RhYmxlLXJ0LmdpdC9jb21taXQvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWkt
bmFuZC5jP2g9djUuMTAuMTg0LXJ0OTAmaWQ9Y2M1ZWUwZTBlZWQwYmVjMmI3Y2MxZDBmZWI5NDA1
ZTg4NGVhY2U3ZAo+ID4gPgo+ID4gPiBBbnkgZ3Vlc3NlcyB3aHkgdGhlIGhpZ2ggdGltZW91dCBj
YXVzZXMgaXNzdWVzPwo+ID4KPiA+IGhpZ2ggdGltZW91dCB3aXRoIHdyb25nIGNhbGN1bGF0aW9u
IG1heSBvdmVyZmxvdyBhbmQgY2F1c2VzIERFVklDRV9CVVNZX1RJTUVPVVQKPiA+IHJlZ2lzdGVy
IHR1cm5zIHRvIGJlIDAuCj4gPgo+ID4gPgo+ID4gPgo+ID4gPiBUaGFua3MgaW4gYWR2YW5jZSEK
PiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiA+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+ID4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
