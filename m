Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12029C54E67
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvqM7lb7o9SVKMWbjZSpikjT8mQTRt15YFLVReFBBD4=; b=hXDmKOZhlftBu1
	o3Ik9XVxaxnaC2m5dRX0+EHxFTkMCF7vjJO52rQUDSq62aC2Al9tNwi1L5sFY8NrV/6J0LoRRGS/4
	Lxcj9UuKKNW5pHtzYXwQLHVe6/JoIw5Vk8aGBf+qrQz0MrT8jAMaOwO84KobivdJpdpvjyHz+Ur9b
	brM2/bPa9CynglA84DG5CrqYT2S7IjREQm6IY3iMoH72MeMPQQpxDxn8p7vXDwHKCZG7w9c+bmW4Q
	VOlYKSznFS78XeVu/ee8C1Ir7g4d459IsHlh2tqYP05+gL76lOx/eijsE/KeAThZ5+lPYTHHOM6GL
	/QfflrbrD+I+zEEI5uCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqcQ-0000000EIpI-40gR;
	Thu, 28 Mar 2024 14:20:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqcO-0000000EIo7-2sBF
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 14:20:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-34261edaf7eso656293f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2024 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711635634; x=1712240434; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FNCcePXE5FzwzG6BnzCkSEJiu6TlTQYchrGdLQhulyQ=;
        b=fwSe/52BEvB0YkSpvgOtYnHxOeJOYzNVhb8PEF7EYur/j4h64DJ/diRh1LxtGXk9f5
         mmXQAfj0edqPnJgEjUJAZQXMiWsorxoGICY9ip2AVu3IDzWQ5QBAPJgR1yihCOdj0RHA
         LbWWLDxktUChpo8ByDu9PjWvsAuX/C+vm5q5UEuTzFXXqHn8JaiVR/N69uLDsCyYOxSt
         N5+soEa3ltdS4qXOkeBE74XHceEBH34xWjWT11EQb83leIivTOHUT3k5fZItPqsGjyxp
         zNIi1u4R9VQnkdw5X0NtWas8rUY8PyKsNdCiHzMniYx4f4v+PHInTSUv7ChmsFxyJpuC
         OEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711635634; x=1712240434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNCcePXE5FzwzG6BnzCkSEJiu6TlTQYchrGdLQhulyQ=;
        b=dNHUJYZ9W7XpE+HYeI75bLGql2SmOsUm932YqKnSA/ZkZlNRXkPz+2syulOBGW9NN8
         q/fM4C1Z9y466c9Swb/vM7qNf3DhSOX8zT0BsQSY1WoZDdJ0iCs0gNw71b9h3yKK7//d
         n14gyP4x9+46K/oslhpG+txq7r50dRot9b4AuDsfwvn5Th55v2bx3cACRCjpgRQrjZvq
         78xH0Fw0fAT8YF/5GaPhtVjuEtWSoFKo+8tzA9oy4SvJdSpXUL2Fo3i1QMisbvY9xXV3
         MOWWKPCv3RshPJ+R/+1oWipraNjyr/LioYBPR+ZWk02z7t06m9ixW1LhlR+ZViCrbLCA
         bLPg==
X-Forwarded-Encrypted: i=1; AJvYcCXdE67jJX7l4IcPUv5K4IPikLKj+m+047nf8yR+sqWSHrDzjgIOj/1G12I9NEb00WoleAGDi5f3ZskaXd7y6AOJLTfoMy/IUf1j6ggpdg==
X-Gm-Message-State: AOJu0YyzrRBBK1P1SmITCRb5/GN9xv7TnKeU3hkK/hO/4E+3V6lgW4a8
	I7+XI1TaxmnHJFUobwf/LcyTxg/UBmm47W7elSHyT1K9uiNykxKl
X-Google-Smtp-Source: AGHT+IGfQLk8jtmCdcy+/N2UZ2hPobovqUovkG1ihPFWtaN1VE308abwCnD9v+ubcZPF66caCh1HUQ==
X-Received: by 2002:adf:ea81:0:b0:341:afa0:6d10 with SMTP id s1-20020adfea81000000b00341afa06d10mr2291731wrm.61.1711635633876;
        Thu, 28 Mar 2024 07:20:33 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-248-55.retail.telecomitalia.it. [87.1.248.55])
        by smtp.gmail.com with ESMTPSA id bp8-20020a5d5a88000000b00343300a4eb8sm1528932wrb.49.2024.03.28.07.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:20:33 -0700 (PDT)
Message-ID: <66057cb1.5d0a0220.b68f2.5cbf@mx.google.com>
X-Google-Original-Message-ID: <ZgV8rZBCXn_BLvE7@Ansuel-XPS.>
Date: Thu, 28 Mar 2024 15:20:29 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: limit OTP NVMEM Cell parse to non Nand devices
References: <20240322040951.16680-1-ansuelsmth@gmail.com>
 <44a377b11208ff33045f12f260b667dd@milecki.pl>
 <66042f0a.050a0220.374bd.5e4a@mx.google.com>
 <20240327163129.18c95cfe@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327163129.18c95cfe@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_072036_849394_D752A091 
X-CRM114-Status: GOOD (  37.25  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMDQ6MzE6MjlQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBDaHJpc3RpYW4sCj4gCj4gYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24g
V2VkLCAyNyBNYXIgMjAyNCAxNTozNjo1NCArMDEwMDoKPiAKPiA+IE9uIFdlZCwgTWFyIDI3LCAy
MDI0IGF0IDAzOjI2OjU1UE0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPiA+ID4gT24g
MjAyNC0wMy0yMiAwNTowOSwgQ2hyaXN0aWFuIE1hcmFuZ2kgd3JvdGU6ICAKPiA+ID4gPiBNVEQg
T1RQIGxvZ2ljIGlzIHZlcnkgZnJhZ2lsZSBhbmQgY2FuIGJlIHByb2JsZW1hdGljIHdpdGggc29t
ZSBzcGVjaWZpYwo+ID4gPiA+IGtpbmQgb2YgZGV2aWNlcy4KPiA+ID4gPiAKPiA+ID4gPiBOVk1F
TSBhY3Jvc3MgdGhlIHllYXJzIGhhZCB2YXJpb3VzIGl0ZXJhdGlvbiBvbiBob3cgQ2VsbHMgY291
bGQgYmUKPiA+ID4gPiBkZWNsYXJlZCBpbiBEVCBhbmQgTVREIE9UUCBwcm9iYWJseSB3YXMgbGVm
dCBiZWhpbmQgYW5kCj4gPiA+ID4gYWRkX2xlZ2FjeV9maXhlZF9vZl9jZWxscyB3YXMgZW5hYmxl
ZCB3aXRob3V0IHRoaW5raW5nIG9mIHRoZQo+ID4gPiA+IGNvbnNlcXVlbmNlcy4gIAo+ID4gPiAK
PiA+ID4gRXIuLi4gdGhhbmsgeW91Pwo+ID4gPiAgCj4gPiAKPiA+IFByb2JhYmx5IG1hZGUgc29t
ZSBiYWQgYXNzdW1wdGlvbiBhbmQgc29ycnkgZm9yIGl0IQo+IAo+IFdlbGwsICJub3QgdGhpbmtp
bmcgYWJvdXQgYWxsIGNvbnNlcXVlbmNlcyIgc2VlbXMgYWx3YXlzIGxlZ2l0aW1hdGUgdG8KPiBt
ZSwgd2UgYXJlIG5vdCByb2JvdHMuIEFueXdheSwgSSBhZ3JlZSB3ZSBzaG91bGQgZHJvcCB0aGlz
IHNlbnRlbmNlLgo+Cj4gPiA+ID4gVGhhdCBvcHRpb24gZW5hYmxlcyBOVk1FTSB0byBzY2FuIHRo
ZSBwcm92aWRlZCBvZl9ub2RlIGFuZCB0cmVhdCBlYWNoCj4gPiA+ID4gY2hpbGQgYXMgYSBOVk1F
TSBDZWxsLCB0aGlzIHdhcyB0byBzdXBwb3J0IGxlZ2FjeSBOVk1FTSBpbXBsZW1lbnRhdGlvbgo+
ID4gPiA+IGFuZCBkb24ndCBjYXVzZSByZWdyZXNzaW9uLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMg
aXMgcHJvYmxlbWF0aWMgaWYgd2UgaGF2ZSBkZXZpY2VzIGxpa2UgTmFuZCB3aGVyZSB0aGUgT1RQ
IGlzCj4gPiA+ID4gdHJpZ2dlcmVkIGJ5IHNldHRpbmcgYSBzcGVjaWFsIG1vZGUgaW4gdGhlIGZs
YXNoLiBJbiB0aGlzIGNvbnRleHQgcmVhbAo+ID4gPiA+IHBhcnRpdGlvbnMgZGVjbGFyZWQgaW4g
dGhlIE5hbmQgbm9kZSBhcmUgcmVnaXN0ZXJlZCBhcyBPVFAgQ2VsbHMgYW5kCj4gPiA+ID4gdGhp
cyBjYXVzZSBwcm9iZSBmYWlsIHdpdGggLUVJTlZBTCBlcnJvci4KPiA+ID4gPiAKPiA+ID4gPiBU
aGlzIHdhcyBuZXZlciBub3RpY2UgZHVlIHRvIHRoZSBmYWN0IHRoYXQgdGlsbCBub3csIG5vIE5h
bmQgc3VwcG9ydGVkCj4gPiA+ID4gdGhlIE9UUCBmZWF0dXJlLiBXaXRoIGNvbW1pdCBlODcxNjEz
MjFhNDAgKCJtdGQ6IHJhd25hbmQ6IG1hY3Jvbml4OiBPVFAKPiA+ID4gPiBhY2Nlc3MgZm9yIE1Y
MzBMRnhHMThBQyIpIHRoaXMgY2hhbmdlZCBhbmQgY29pbmNpZGVudGFsbHkgdGhpcyBOYW5kIGlz
Cj4gPiA+ID4gdXNlZCBvbiBhbiBGcml0ekJveCA3NTMwIHN1cHBvcnRlZCBvbiBPcGVuV3J0LiAg
Cj4gPiA+IAo+ID4gPiBTbyBhcyB5b3Ugbm90aWNlZCB0aGlzIHByb2JsZW0gd2FzICpleHBvc2Vk
KiBieSBhZGRpbmcgT1RQIHN1cHBvcnQgZm9yCj4gPiA+IE1hY3Jvbml4IE5BTkQgY2hpcHMuCj4g
PiA+IAo+ID4gPiAgIAo+ID4gPiA+IEFsdGVybmF0aXZlIGFuZCBtb3JlIHJvYnVzdCB3YXkgdG8g
ZGVjbGFyZSBPVFAgQ2VsbHMgYXJlIGFscmVhZHkKPiA+ID4gPiBwcm9zc2libGUgYnkgdXNpbmcg
dGhlIGZpeGVkLWxheW91dCBub2RlIG9yIGJ5IGRlY2xhcmluZyBhIGNoaWxkIG5vZGUKPiA+ID4g
PiB3aXRoIHRoZSBjb21wYXRpYmxlIHNldCB0byAib3RwLXVzZXIiIG9yICJvdHAtZmFjdG9yeSIu
Cj4gPiA+ID4gCj4gPiA+ID4gVG8gZml4IHRoaXMgYW5kIGxpbWl0IGFueSByZWdyZXNzaW9uIHdp
dGggb3RoZXIgTVREIHRoYXQgbWFrZXMgdXNlIG9mCj4gPiA+ID4gZGVjbGFyaW5nIE9UUCBhcyBk
aXJlY3QgY2hpbGQgb2YgdGhlIGRldiBub2RlLCBkaXNhYmxlCj4gPiA+ID4gYWRkX2xlZ2FjeV9m
aXhlZF9vZl9jZWxscyBpZiB3ZSBkZXRlY3QgdGhlIE1URCB0eXBlIGlzIE5hbmQuCj4gPiA+ID4g
Cj4gPiA+ID4gV2l0aCB0aGUgZm9sbG93aW5nIGxvZ2ljLCB0aGUgT1RQIE5WTUVNIGVudHJ5IGlz
IGNvcnJlY3RseSBjcmVhdGVkIHdpdGgKPiA+ID4gPiBubyBDZWxscyBhbmQgdGhlIE1URCBOYW5k
IGlzIGNvcnJlY3RseSBwcm9iZWQgYW5kIHBhcnRpdGlvbnMgYXJlCj4gPiA+ID4gY29ycmVjdGx5
IGV4cG9zZWQuCj4gPiA+ID4gCj4gPiA+ID4gRml4ZXM6IDJjYzNiMzdmNWI2ZCAoIm52bWVtOiBh
ZGQgZXhwbGljaXQgY29uZmlnIG9wdGlvbiB0byByZWFkIG9sZAo+ID4gPiA+IHN5bnRheCBmaXhl
ZCBPRiBjZWxscyIpICAKPiA+ID4gCj4gPiA+IEl0J3Mgbm90IHRoYXQgY29tbWl0IGhvd2V2ZXIg
dGhhdCBpbnRyb2R1Y2VkIHRoZSBwcm9ibGVtLiBJbnRyb2R1Y2luZwo+ID4gPiAiYWRkX2xlZ2Fj
eV9maXhlZF9vZl9jZWxscyIganVzdCBhZGRlZCBhIGNsZWFuIHdheSBvZiBlbmFibGluZyBwYXJz
aW5nCj4gPiA+IG9mIG9sZCBjZWxscyBzeW50YXguIEV2ZW4gYmVmb3JlIG15IGNvbW1pdCBOVk1F
TSBzdWJzeXN0ZW0gd2FzIGxvb2tpbmcKPiA+ID4gZm9yIE5WTUVNIGNlbGxzIGluIE5BTkQgZGV2
aWNlcy4KPiA+ID4gCj4gPiA+IEkgYm9vdGVkIGtlcm5lbCA2LjYgd2hpY2ggaGFzIGNvbW1pdCBl
ODcxNjEzMjFhNDAgKCJtdGQ6IHJhd25hbmQ6Cj4gPiA+IG1hY3Jvbml4OiBPVFAgPiBhY2Nlc3Mg
Zm9yIE1YMzBMRnhHMThBQyIpIGJ1dCBkb2VzIE5PVCBoYXZlIGNvbW1pdAo+ID4gPiAyY2MzYjM3
ZjViNmQgKCJudm1lbTogYWRkIGV4cGxpY2l0IGNvbmZpZyBvcHRpb24gdG8gcmVhZCBvbGQgc3lu
dGF4Cj4gPiA+IGZpeGVkIE9GIGNlbGxzIikuCj4gPiA+IAo+ID4gPiBMb29rIGF0IHRoaXMgbG9n
IGZyb20gQnJvYWRjb20gTm9ydGhzdGFyIChMaW51eCA2LjYpOgo+ID4gPiBbICAgIDAuNDEwMTA3
XSBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHhjMiwgQ2hpcCBJRDogMHhk
Ywo+ID4gPiBbICAgIDAuNDE2NTMxXSBuYW5kOiBNYWNyb25peCBNWDMwTEY0RzE4QUMKPiA+ID4g
WyAgICAwLjQyMDQwOV0gbmFuZDogNTEyIE1pQiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBw
YWdlIHNpemU6IDIwNDgsIE9PQgo+ID4gPiBzaXplOiA2NAo+ID4gPiBbICAgIDAuNDI4MDIyXSBp
cHJvY19uYW5kIDE4MDI4MDAwLm5hbmQtY29udHJvbGxlcjogZGV0ZWN0ZWQgNTEyTWlCIHRvdGFs
LAo+ID4gPiAxMjhLaUIgYmxvY2tzLCAyS2lCIHBhZ2VzLCAxNkIgT09CLCA4LWJpdCwgQkNILTgK
PiA+ID4gWyAgICAwLjQzODk5MV0gU2Nhbm5pbmcgZGV2aWNlIGZvciBiYWQgYmxvY2tzCj4gPiA+
IFsgICAgMC44NzM1OThdIEJhZCBlcmFzZWJsb2NrIDczOCBhdCAweDAwMDAwNWM0MDAwMAo+ID4g
PiBbICAgIDEuMDMwMjc5XSByYW5kb206IGNybmcgaW5pdCBkb25lCj4gPiA+IFsgICAgMS44NTQ4
OTVdIEJhZCBlcmFzZWJsb2NrIDI0MTQgYXQgMHgwMDAwMTJkYzAwMDAKPiA+ID4gWyAgICAyLjY1
NzM1NF0gQmFkIGVyYXNlYmxvY2sgMzc4MyBhdCAweDAwMDAxZDhlMDAwMAo+ID4gPiBbICAgIDIu
NjYyOTY3XSBCYWQgZXJhc2VibG9jayAzNzg1IGF0IDB4MDAwMDFkOTIwMDAwCj4gPiA+IFsgICAg
Mi44NDg0MThdIG52bWVtIHVzZXItb3RwMTogbnZtZW06IGludmFsaWQgcmVnIG9uCj4gPiA+IC9u
YW5kLWNvbnRyb2xsZXJAMTgwMjgwMDAvbmFuZEAwCj4gPiA+IFsgICAgMi44NTYxMjZdIGlwcm9j
X25hbmQgMTgwMjgwMDAubmFuZC1jb250cm9sbGVyOiBlcnJvciAtRUlOVkFMOiBGYWlsZWQgdG8K
PiA+ID4gcmVnaXN0ZXIgT1RQIE5WTUVNIGRldmljZQo+ID4gPiAKPiA+ID4gU28gdG8gc3VtbWFy
eSBpdCB1cDoKPiA+ID4gMS4gUHJvYmxlbSBleGlzdHMgc2luY2UgbXVjaCBlYXJsaWVyIGFuZCB3
YXNuJ3QgaW50cm9kdWNlZCBieSAyY2MzYjM3ZjViNmQKPiA+ID4gMi4gQ29tbWl0IDJjYzNiMzdm
NWI2ZCBqdXN0IGdpdmVzIHlvdSBhIGNsZWFuIHdheSBvZiBzb2x2aW5nIHRoaXMgaXNzdWUKPiA+
ID4gMy4gUHJvYmxlbSB3YXMgZXhwb3NlZCBieSBjb21taXQgZTg3MTYxMzIxYTQwCj4gPiA+IDQu
IFdlIG1pc3MgZml4IGZvciB2Ni42IHdoaWNoIGRvZXNuJ3QgaGF2ZSAyY2MzYjM3ZjViNmQgKGl0
IGhpdCB2Ni43KQo+ID4gPiAgIAo+ID4gCj4gPiBTbyB0aGUgdGhpbmcgd2FzIGJyb2tlbiBhbGwg
YWxvbmc/IE1heWJlIHRoZSByZWdyZXNzaW9uIHdhcyBpbnRyb2R1Y2VkCj4gPiB3aGVuIE9GIHN1
cHBvcnQgZm9yIE5WTUVNIGNlbGwgd2FzIGludHJvZHVjZWQ/IChhbmQgT0Ygc2NhbiB3YXMgZW5h
YmxlZAo+ID4gYnkgZGVmYXVsdD8pCj4gPiAKPiA+IEFueXdheSBTb3JyeSBmb3IgYWRkaW5nIHRo
ZSB3cm9uZyBmaXhlcywgbWF5YmUgTWlxdWVsIGNhbiByZW1vdGUgdGhlCj4gPiBjb21taXQgZnJv
bSBtdGQvZml4ZXMgYW5kIGZpeCB0aGUgcHJvYmxlbWF0aWMgZml4ZXMgdGFnPwo+IAo+IFllcywg
cGxlYXNlIHNlbmQgYSB2NCAod2l0aCB0aGUgc2VudGVuY2UgYWJvdmUgdXBkYXRlZCkgYW5kIEkg
d2lsbCBkcm9wCj4gdjMuCj4gCgpUaGFua3MgYSBsb3QhIEkgYXNrZWQgUmFmYWwgc29tZSBzdWdn
ZXN0aW9uIGZvciBhIGJldHRlciBmaXhlcyB0YWcgYW5kIEkKd2lsbCBzZW5kIHY0LgoKLS0gCglB
bnN1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
