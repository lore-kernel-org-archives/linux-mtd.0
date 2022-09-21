Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261C4ECAAD8
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Sep 2022 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBfZ0Ae5vy4NwGc2lcfRPHvIGU7y5zV3/XihEsl8iCI=; b=2A24QZCxYxiHH7
	OE+KqdXxHQqm2X0OZ8Xrxjm1NeXj9GGJduuHmNSNyjAOMRk/+5N+XtB5R+zVmZphf3x9UCzA3DC9Q
	F8L4EqhFu1BDCMdETYLB2uHrUKEo5XVnlvkstTXjKT3Q4EqkCO5Gnzw1sB8koV6NzX+WLWxIRIg3y
	yZHpDz3PvxzlVhzHMw2Wjflf7rz08UaBx3vrRfoDHheUFPYufBCK5tSl7002kFZLOm5wCvOcBV4Sl
	UwWkaVUbLrPYU9Y6nBYshquZSAYdvgtnpJPd6OMebXBMC6/GaTsmPVHh70Y4mWhCaGBOc7W61Osux
	H/WytolORwhfaV75HRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7Ib-00Cj0c-5E; Wed, 21 Sep 2022 21:30:29 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7IY-00Cizb-Sk
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2022 21:30:28 +0000
Received: by mail-ej1-x62b.google.com with SMTP id bj12so16562816ejb.13
        for <linux-mtd@lists.infradead.org>; Wed, 21 Sep 2022 14:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stonybrook.edu; s=sbu-gmail;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=S6OlODLlRXmKNL50YCQqt5lgeaLHQuWL/ZJMAREBJ0A=;
        b=Caf11FqlvGUab3Tifw+V44ztFnLp5/fDqGIpoMIQIDrWIIV7LaoLOZ9oRm1su2M8Lf
         I5Vt6IVH8xprpDrg12FVR8ObSewEwJI4qB01meW6l8CbPHshVLZtUGqggLApgIx19rUT
         GIAlPzpHLqHtP0KrHSv+EDv5Br/G+5nbjinIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=S6OlODLlRXmKNL50YCQqt5lgeaLHQuWL/ZJMAREBJ0A=;
        b=HsfS/53lyOA/BtD9+q0kW9jwVweQRtos1DLHnQXBrMBj14w8AeRDM3QSeM8oT540u8
         NVphpvbonJ7VcqS1MGy80VCeg7Tua58ZHyvZ1VQKe94/7UslA4Lt7nb4VIR2p4P1b70t
         mG4ciqn8ILIeiOmaXEQ78X/4JE1GQTRmjDPLwk2KQWTaFlgmYuejG3Qd0SF9kpapLgpe
         1qZqUsbE2CTtr4wVziV3svd7Q91dR3UHtpFiKkC+QQvBkctenMjpD57O+c5dHL3J9zeC
         ibcSwXdLdwX5ZeEmN+g8gGDWhnfwxvOX95H8FzeahNAD+N8AwJ324KGTwtCud7Jy0aqE
         8qfQ==
X-Gm-Message-State: ACrzQf3ILm8YbJz2FVfuZrK0b6zi8GtmRNRmwkqYUj8P5koGHKZFNtb1
	A/XKyVKPpmw58KBWZ7fsPBH1Vk+U86ODE4yrdheKUQ==
X-Google-Smtp-Source: AMsMyM78m/PWvYaqpBf48Y65NI+GdYJh6wJVzsI5jPhdy/wHwbA88IRaEy9tHXwgYnxZybuGcbowj1RObia+ntX3VuE=
X-Received: by 2002:a17:907:270b:b0:77b:17b3:f446 with SMTP id
 w11-20020a170907270b00b0077b17b3f446mr189422ejk.415.1663795822597; Wed, 21
 Sep 2022 14:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220803155315.2073584-1-yifeliu@cs.stonybrook.edu>
 <PH0PR10MB46153A784F27AE96DA69120DF46E9@PH0PR10MB4615.namprd10.prod.outlook.com>
 <513220739.132330.1661149559308.JavaMail.zimbra@nod.at> <CABHrer3ho5aAWN4KNSwF3iP=+4uLA1y9-=oF9-GzOwFewzK9Qw@mail.gmail.com>
In-Reply-To: <CABHrer3ho5aAWN4KNSwF3iP=+4uLA1y9-=oF9-GzOwFewzK9Qw@mail.gmail.com>
From: Yifei Liu <yifeliu@cs.stonybrook.edu>
Date: Wed, 21 Sep 2022 17:30:11 -0400
Message-ID: <CABHrer2ATkdEy-rb9H=qWeZ+r9C7sZ_Euxa=fOrHzi_97t2awg@mail.gmail.com>
Subject: Re: [PATCH] jffs2: correct logic when creating a hole in jffs2_write_begin
To: Richard Weinberger <richard@nod.at>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, ezk@cs.stonybrook.edu, 
	madkar@cs.stonybrook.edu, David Woodhouse <dwmw2@infradead.org>, 
	Matthew Wilcox <willy@infradead.org>, Kyeong Yoo <kyeong.yoo@alliedtelesis.co.nz>, 
	linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_143027_100585_A89BDF43 
X-CRM114-Status: GOOD (  13.84  )
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

QSByZW1pbmRlciBhYm91dCBhIEpGRlMyIHBhdGNoIHN1Ym1pdHRlZCBtb250aHMgYWdvLgoKQmVz
dCBSZWdhcmRzLApZaWZlaQoKCk9uIFN1biwgU2VwIDQsIDIwMjIgYXQgMzozOSBQTSBZaWZlaSBM
aXUgPHlpZmVsaXVAY3Muc3Rvbnlicm9vay5lZHU+IHdyb3RlOgo+Cj4gQSBnZW50bGUgcmVtaW5k
ZXIuCj4KPiBCZXN0IFJlZ2FyZHMsCj4gWWlmZWkKPgo+IEJlc3QgUmVnYXJkcywKPiBZaWZlaQo+
Cj4KPiBPbiBNb24sIEF1ZyAyMiwgMjAyMiBhdCAyOjI2IEFNIFJpY2hhcmQgV2VpbmJlcmdlciA8
cmljaGFyZEBub2QuYXQ+IHdyb3RlOgo+ID4KPiA+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwg
LS0tLS0KPiA+ID4gVm9uOiAiSm9ha2ltIFRqZXJubHVuZCIgPEpvYWtpbS5UamVybmx1bmRAaW5m
aW5lcmEuY29tPgo+ID4gPiBBbjogIllpZmVpIExpdSIgPHlpZmVsaXVAY3Muc3Rvbnlicm9vay5l
ZHU+Cj4gPiA+IENDOiBlemtAY3Muc3Rvbnlicm9vay5lZHUsIG1hZGthckBjcy5zdG9ueWJyb29r
LmVkdSwgIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJhZGVhZC5vcmc+LCAicmljaGFyZCIK
PiA+ID4gPHJpY2hhcmRAbm9kLmF0PiwgIk1hdHRoZXcgV2lsY294IiA8d2lsbHlAaW5mcmFkZWFk
Lm9yZz4sICJLeWVvbmcgWW9vIiA8a3llb25nLnlvb0BhbGxpZWR0ZWxlc2lzLmNvLm56PiwgImxp
bnV4LW10ZCIKPiA+ID4gPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtl
cm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiA+IEdlc2VuZGV0OiBTb25u
dGFnLCAyMS4gQXVndXN0IDIwMjIgMjA6MjE6MDQKPiA+ID4gQmV0cmVmZjogUmU6IFtQQVRDSF0g
amZmczI6IGNvcnJlY3QgbG9naWMgd2hlbiBjcmVhdGluZyBhIGhvbGUgaW4gamZmczJfd3JpdGVf
YmVnaW4KPiA+Cj4gPiA+IFdoYXQgaGFwcGVuZWQgd2l0aCB0aGlzIHBhdGNoPyBMb29rcyBsaWtl
IGEgaW1wb3J0YW50IGZpeCBidXQgSSBkb24ndCBzZWUgaXQKPiA+ID4gYXBwbGllZCA/Cj4gPgo+
ID4gSXQgd2lsbCBiZSBwYXJ0IG9mIHRoZSBuZXh0IGZpeGVzIFBSIGFmdGVyIEkgaGFkIGEgY2hh
bmNlIHRvIHJldmlldyBpdC4KPiA+Cj4gPiBUaGFua3MsCj4gPiAvL3JpY2hhcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
