Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B4FC76188
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 19:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5LXMnn/8x/paoYqjP0r2ZaxEpnjUHz7FF4OvFa6prc=; b=EwsAzEoXVoaAdP
	8gvqp3il307eoRlHRHiC5X6Nm8tvsgnRDzKGIzYKb5yON2OmNwC3wGRZIg1qUIim6oX18xUbfCkim
	fPpNz81sv12a5SEOMRDtfACIEqeGlqdc3i/t7ipZjCdOMPe8eK66z4IRt/xtB2Z2xa9L7TyYDkvEP
	/3nnv9fAGe1KYatZuPA8ylfESng/IqWDfgTcYG5s+zGdD6VkIuHGUSB35EnR1pdQBpk9J6CsOvXUk
	38mFpKMGyprReNCTcjKlx3izREwgg+KhmQTZqs3OkGbk2Bb9G/fD46OuBLuU1f7xw/17Yl+XP83eA
	5Cbs2qmOxeaDVSCfZkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQ89-00GSMw-12;
	Mon, 03 Apr 2023 19:46:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQ85-00GSKf-34;
	Mon, 03 Apr 2023 19:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OJp/UHUUVWepRPEy8J9qP7lkAX18u/uBn6W1djkz/+Q=; b=c1AAckLwgt21esteI7fLK7BVZI
	R8eIPxfHaPxspXwJPBQT233N1wcJh5CnWpjmF9l2Bbo+SEeoDc3BkfC4rZQMoWyeIJr/31SDOL1xf
	MaGTsXVRzWp0UEE1AqJviqxRpbZYvIUbX7/qrsUQfPbGKtjaooQ+qetW8U8+2ir266yLhJ5I0mWC8
	+9BvqM7q9ufH37WZv5E2PV633dh5ffKJ2Efs9MGL2QzlGgbgN4Vk/P4TaAhGtG+ndH7p8fEFABbuR
	ExexVGxP6jrpjTxmr6QakOkvSswKlzksaEwtakJcrMNYXEVrWwGAL2hpZajcyfol+lsBN2lkFtAut
	OTUndf2Q==;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjN3m-008w62-17;
	Mon, 03 Apr 2023 16:29:36 +0000
Received: by mail-yb1-f172.google.com with SMTP id cf7so35523344ybb.5;
        Mon, 03 Apr 2023 09:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680539366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJp/UHUUVWepRPEy8J9qP7lkAX18u/uBn6W1djkz/+Q=;
        b=qFEqX+QObyneFeb7kBlZFbv42Av8S4xC492jtfvibX0cDthX5xYhYaTlskRDPujaha
         AnyUXJsPI6Fub33jHe2cY1KtpgG+xw+waxb26k8ZqNOXIiTLuicuF9Ll5NsMDKkVkNAl
         I1LcAj1q7pStrNwwMVBIv19wFaq0JHJNUMGRXnDDsc8H7uUlh4iMIR/YHsqcnSljmdSl
         5HRaFSPuqy42977slaqdO6gfFSdP+41CYXc3q8Tc5oBBaLSOUg+bqUip7UzGezUoFg4C
         /3MD59knTcoS6pSJFUQtHhgOXEqCRfQxM6H4VedJQKZVPmRgmFrgtyOJwl9f46rifKp9
         PYgQ==
X-Gm-Message-State: AAQBX9fr/giRUulSUk8vWDBJJD/yOPJMSy0sWe9NZADcsnGLTHZ3HBjS
	rg6UDdK0ay4qvXP8uf1j3gA4l9nRM3+GegkN
X-Google-Smtp-Source: AKy350YEq4tLFuAXkwoZQaNtWie5miJ7fm+Iez/5vVvxIN+nL3uC/3m6dF3SCozukhGvWDmetZStqg==
X-Received: by 2002:a05:6902:1144:b0:a47:faae:1816 with SMTP id p4-20020a056902114400b00a47faae1816mr43659756ybu.50.1680539366186;
        Mon, 03 Apr 2023 09:29:26 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id z195-20020a0dd7cc000000b0054601bc6ce2sm2629035ywd.118.2023.04.03.09.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 09:29:25 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5419d4c340aso561634207b3.11;
        Mon, 03 Apr 2023 09:29:25 -0700 (PDT)
X-Received: by 2002:a81:a7c4:0:b0:546:264:a375 with SMTP id
 e187-20020a81a7c4000000b005460264a375mr13077370ywh.4.1680539365152; Mon, 03
 Apr 2023 09:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org> <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
 <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
In-Reply-To: <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Apr 2023 18:29:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
Message-ID: <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_172934_487640_A424EA0F 
X-CRM114-Status: GOOD (  28.91  )
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

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgNDowMeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDc6NTfi
gK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+
IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDY6MDTigK9QTSBUdWRvciBBbWJhcnVzIDx0dWRvci5h
bWJhcnVzQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPiBWaWduZXNoIHVzZWQgdG8gcmV2aWV3IENG
SSBjb2RlLCBtYXliZSBoZSBjYW4gaW50ZXJ2ZW5lLiBJJ3ZlIG5ldmVyCj4gPiA+IHdvcmtlZCB3
aXRoIENGSSwgYnV0IEkgY2FuIHRyeSB0byBoZWxwLiBJJ2xsIG5lZWQgbW9yZSBkZWJ1ZyBkYXRh
IHRob3VnaC4KPiA+ID4KPiA+ID4gT24gMy8yMC8yMyAxNjo0MywgR2VlcnQgVXl0dGVyaG9ldmVu
IHdyb3RlOgo+ID4gPiA+IEFkZCBhIGRldmljZSBub2RlIGZvciB0aGUgU3BhbnNpb24gUzI5R0w1
MTJOIE5PUiBGTEFTSCBvbiB0aGUgTWFyemVuCj4gPiA+ID4gZGV2ZWxvcG1lbnQgYm9hcmQuCj4g
PiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPgo+ID4gPiA+IC0tLQo+ID4gPiA+IEFsdGhvdWdoIHRoZSBTMjlHTDUx
Mk4gaXMgYSBDRkkgRkxBU0gsIHVzaW5nICJjZmktZmxhc2giIGluc3RlYWQgb2YKPiA+ID4gPiAi
bXRkLXJvbSIgZG9lcyBub3Qgd29yazoKPiA+ID4gPiAgIDEuIFByb2JpbmcgZmFpbHMgd2l0aCAi
cGh5c21hcC1mbGFzaCAwLmZsYXNoOiBtYXBfcHJvYmUgZmFpbGVkIiwKPiA+ID4KPiA+ID4gSSB3
b3VsZCBmaXJzdCB0cnkgdG8gdW5kZXJzdGFuZCB3aHkgdGhlIHByb2JlIGZhaWxzLgoKPiBJIHN1
ZGRlbmx5IHJlbWVtYmVyZWQgSSBoYXZlIGEgZGlmZmVyZW50IGJvYXJkIChBUEU2LUVWTSksIHdo
ZXJlCj4gdGhlIENGSS1GTEFTSCBzdG9wcGVkIHdvcmtpbmcgYWZ0ZXIgYWRkaW5nIHN1cHBvcnQg
Zm9yIHNlY29uZGFyeQo+IENQVXMuIEkgYWx3YXlzIHRob3VnaHQgdGhhdCB3YXMgYSBoYXJkd2Fy
ZSBxdWlyay4uLgo+Cj4gVHVybnMgb3V0IHRoZSBDRkktRkxBU0ggb24gTWFyemVuIChxdWFkIENv
cnRleC1BOSkgaXMgZGV0ZWN0ZWQgd2hlbgo+IGJvb3Rpbmcgd2l0aCAibm9zbXAiOgoKPiBNeSBm
aXJzdCBndWVzcyB3YXMgdGhhdCB0aGUgcHJvYmluZyBwcm9jZXNzIGlzIG1pZ3JhdGVkIHRvIGEg
ZGlmZmVyZW50Cj4gQ1BVIGNvcmUgZHVyaW5nIHByb2JpbmcsIGJ1dCBwcmludGluZyBzbXBfcHJv
Y2Vzc29yX2lkKCkgZGlkbid0Cj4gY29uZmlybSB0aGF0OyBpdCdzIGp1c3QgcnVubmluZyBvbiBh
IGRpZmZlcmVudCBDUFUgY29yZSB0aGFuIENQVTAuCj4gV3JhcHBpbmcgdGhlIGJvZHkgb2YgY2Zp
X3FyeV9tb2RlX29uKCkgaW5zaWRlIGEgZ2V0X2NwdSgpL3B1dF9jcHUoKQo+IHBhaXIgdG8gcHJl
dmVudCBtaWdyYXRpb24gYWxzbyBkaWRuJ3QgZml4IGl0Lgo+Cj4gSXMgQ0ZJLUZMQVNIIGtub3du
LWJyb2tlbiBvbiBTTVA/CgpBZnRlciBhY3RpdmVseSBsb29raW5nIGZvciBtb3JlIGJvYXJkcyB3
aXRoIENGSSBGTEFTSGVzLCBhbmQgZmluZGluZyBvbmUKbW9yZSBib2FyZCB3aGVyZSBGTEFTSCBw
cm9iaW5nIGZhaWxzIG9uIFNNUCwgSSBkdWcgZGVlcGVyLgpUdXJucyBvdXQgdGhleSBhbGwgaGF2
ZSBpbiBjb21tb24gdGhhdCAoYSkgdGhlIENGSSBGTEFTSCBpcyBsb2NhdGVkIGF0CnBoeXNpY2Fs
IGFkZHJlc3MgemVybywgYW5kIChiKSB0aGUgc2Vjb25kYXJ5IENQVSBicmluZ3VwIGNvZGUgcmVs
aWVzCm9uIG1hcHBpbmcgKGJ5IHNwZWNpYWwgaGFyZHdhcmUpIHRoZSByZWdpb24gYXQgYWRkcmVz
cyB6ZXJvIHRvIHRoZQpDUFUgYm9vdCBjb2RlLi4uCgpIZW5jZSBmaXhpbmcgdGhpcyBpbnZvbHZl
cyBtYWtpbmcgc3VyZSB0aGF0IGFjY2Vzc2luZyBGTEFTSCBhbmQgYnJpbmdpbmcKQ1BVIGNvcmVz
IG9ubGluZSBkbyBub3QgaGFwcGVuIGNvbmN1cnJlbnRseS4uLgoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
