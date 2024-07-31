Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA9BC3DA7F
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2024 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJEF864MJ+qZti1tno6aQ/Bre2nBw45YOmKpXprOM3w=; b=vtqo5uGe+4VAy+
	MumvhBvmGdAf/ndWqeiZ2V10CjLH9w5oSmuExEtepG2EN/OC6VdPz+DhS23pTJZwmkIXSMhxv202U
	Js65PpbPLNpmIRimKbh2+9OKhtXpGnviDEUy/Y2o6jQHFjy5Mu+sEw4jjSMRl1ccs/3uwrzpRmhZd
	837mj/vpzwXX4aCitE2diT/ULaugfQeHc29x1z/rkKKrMKEW1vzgAp97zYD96aMNn9pjxObnd0K42
	1tfv12qub6kFnKZcDJDSw8w8TreeqQ1VXOlQCp3VF1WmhCSLauoOpclau4uT+NZaHUXLvUFmX0moQ
	ADDafq2KVulDGMGO41Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ53f-00000000Nqh-0RRV;
	Wed, 31 Jul 2024 08:51:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ53c-00000000Npr-1YWq
	for linux-mtd@lists.infradead.org;
	Wed, 31 Jul 2024 08:51:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a7ac449a0e6so433744366b.1
        for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2024 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722415898; x=1723020698; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNoo9e14DIpmapZul3KnyFsnnEqyQO+m3ZF4ksesUrk=;
        b=ChSqBrHZGE7T9nuLDi3JIUYb/eFzKwWYhofoUjL6dR0N6/L0i3sF7/koSwwbIeiw+N
         JRdx3M/+sejXu0uD//M2SrnR94oXCmjvd1EEc5gq0UXLb3RTtexWZkLQoLAWlFqQkulj
         Hy2CYVqaZAUvpNI0Q9UjfUFhDQjQ0GkhteLXmCVsK5b/xZ3E5PNNMwtyXRWGmhd573Fc
         VwaeqXE+M++F4l0thKgLwxQB22NzyMqRJUltNpk0lHZ136eag+PsidnfvNl1Fd+87LO9
         Xql0dG+JjWvyOywHh8xCnyWXjkAmwWmkp4rwOZJk4fbW+9Gtnoq/GgfZ8HGYQ5c5RCqt
         zc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722415898; x=1723020698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNoo9e14DIpmapZul3KnyFsnnEqyQO+m3ZF4ksesUrk=;
        b=hlSYRF2Yx/uFfN0fIf3DLQAU2P38KmRet1UHYyWa/Wxy1mnM/+tnlOohCK82ln3HKF
         cRYiSmOHbN5ylm1naBYzHgNhnWm01X9Ul2IKJZhH7790NpH7TATkmgDnpO0FGoxs28eP
         Em8AUkT56/n45l6032H4oQ+M214R0mAZJLitTybl30nZEqH0qxysGXUVNMASPKLVgxL0
         Cd3epsIHmobiWBfQLTf+tASMEbpogcDXLhZhmw5CM9bd2Ox8VoBwsQAoBZVDHD45eX7J
         Hy1JSedIsLAynDbG3rJ/pZsmaRP3q9LVDVmNHgI3jUzhsUnvoQUQa0ODRH8+RAgbeiiU
         ZrsA==
X-Forwarded-Encrypted: i=1; AJvYcCXtT81BbuFQicRTkSV23HB+97CzyHJj20FDdbqRLyXs6/NlfHKmH5NJESJsNeCZyztHfd2kYNBa9TLURZ+aVMMSITi735lW1DI+fGSMpw==
X-Gm-Message-State: AOJu0YwRISuI+KGO6Do+lUab81RN2ffr6ouJr6z1/tb8Ya8IJg0MdCTP
	icAUOfxkhL49bAEWEIsz8uPjAuE47zP6JgPZZm5RIsD1iuBPU2+fzzfJlIGOFOA=
X-Google-Smtp-Source: AGHT+IG945t6LY25eGW9SyhtTpAlfIEfUmxmvjqe2lF9c9d0dCEse5FNHlIKVzI0omov5yjI2nDqMg==
X-Received: by 2002:a17:907:3eaa:b0:a7a:a7b8:adb1 with SMTP id a640c23a62f3a-a7d40073465mr920952166b.36.1722415898317;
        Wed, 31 Jul 2024 01:51:38 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad4acbfsm735831166b.100.2024.07.31.01.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 01:51:37 -0700 (PDT)
Message-ID: <0685ef1b-b0e1-4c53-94dc-4d5de5be8e94@linaro.org>
Date: Wed, 31 Jul 2024 09:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
To: Brian Norris <computersforpeace@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20240726185825.142733-1-computersforpeace@gmail.com>
 <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org>
 <454deacb-88cc-4ab0-80b4-006d863a56d2@linaro.org>
 <CAN8TOE8-9=P7p8Tkc+5kG5Sqan+RAWAc7k2VH-p5W9hR-bb_Xg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAN8TOE8-9=P7p8Tkc+5kG5Sqan+RAWAc7k2VH-p5W9hR-bb_Xg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_015140_458642_0913382D 
X-CRM114-Status: GOOD (  34.82  )
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

CgpPbiA3LzMwLzI0IDY6MjggUE0sIEJyaWFuIE5vcnJpcyB3cm90ZToKPiBIaSBUdWRvciwgTWlj
aGFlbCwKCkhpLCBCcmlhbiEKPiAKPiBPbiBUdWUsIEp1bCAzMCwgMjAyNCBhdCA0OjMz4oCvQU0g
VHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPj4gT24gNy8z
MC8yNCA3OjUxIEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4gT24gRnJpIEp1bCAyNiwgMjAy
NCBhdCA4OjU4IFBNIENFU1QsIEJyaWFuIE5vcnJpcyB3cm90ZToKPj4+PiBUaGVzZSBmbGFzaCBj
aGlwcyBhcmUgdXNlZCBvbiBHb29nbGUgLyBUUC1MaW5rIC8gQVNVUyBPbkh1YiBkZXZpY2VzLCBh
bmQKPj4+PiBPbkh1YiBkZXZpY2VzIGFyZSB3cml0ZS1wcm90ZWN0ZWQgYnkgZGVmYXVsdCAoc2Ft
ZSBhcyBhbnkgb3RoZXIKPj4+PiBDaHJvbWVPUy9DaHJvbWVib29rIHN5c3RlbSkuIEkndmUgcmVm
ZXJyZWQgdG8gZGF0YXNoZWV0cywgYW5kIHRlc3RlZCBvbgo+Pj4+IE9uSHViIGRldmljZXMuCj4+
Pgo+Pj4gT3V0IG9mIGN1cmlvc2l0eSwgdGhlcmUgaXMgYWxzbyBhIGhhcmR3YXJlIHdyaXRlIHBy
b3RlY3Qgc3dpdGNoCj4+PiBzb21laG93LCByaWdodD8gQXQgbGVhc3QgdGhhdCdzIG15IHVuZGVy
c3RhbmRpbmcgaG93IHZlcmlmeSBib290Cj4+PiB3b3Jrcy4KPiAKPiBUaGVyZSdzIGEgd2hvbGUg
ZG9jIG9uIHRoaXM6Cj4gaHR0cHM6Ly93d3cuY2hyb21pdW0ub3JnL2Nocm9taXVtLW9zL2RldmVs
b3Blci1saWJyYXJ5L3JlZmVyZW5jZS9zZWN1cml0eS93cml0ZS1wcm90ZWN0aW9uLwo+IAo+IFNo
b3J0IGFuc3dlcjogeWVzLgo+IAo+IElmIHlvdSB3YW50IHRvIHNlZSBob3cgdGhpcyBmaXRzIHRv
Z2V0aGVyIGluIHByYWN0aWNlIG9uIGEKPiBub24tQ2hyb21pdW1PUyBzeXN0ZW0sIHlvdSBjYW4g
c2VlIG15IGNvbXBhbmlvbiBPcGVuV3J0IHdvcmsgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20v
b3BlbndydC9vcGVud3J0L3B1bGwvMTYwMTQKPiAKPiBCYXNpY2FsbHksIEkganVzdCB0cnkgdG8g
bWFrZSBpdCBlYXNpZXIgZm9yIHRvb2xzIChpbiB0aGlzIGNhc2UsIHRoZQo+IENyT1MgdmJvb3Qg
dG9vbHMpIHRvIGZpbmQgdGhlIHdyaXRlLXByb3RlY3QgR1BJTywgYW5kIGNyb3NzLXJlZmVyZW5j
ZQo+IHRoYXQgd2l0aCB0aGUgc29mdHdhcmUgKE1URCAibG9ja2VkIiBpb2N0bHMpIHByb3RlY3Rp
b24gc3RhdHVzLiBXZQo+IG5lZWQgdG8gdW5kZXJzdGFuZCBhbmQgbWFuaXB1bGF0ZSBib3RoIGlm
IHdlIHdhbnQgdG8gKHRlbXBvcmFyaWx5KQo+IHJlbW92ZSB3cml0ZSBwcm90ZWN0aW9uLCB3aGls
ZSBvdGhlcndpc2UgcmV0YWluaW5nIHZlcmlmaWVkIGJvb3QKPiBpbnRlZ3JpdHkuCj4gCj4+Pj4g
U2lnbmVkLW9mZi1ieTogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+
Cj4+Pgo+Pj4gVGhpcyBsb29rcyBnb29kOgo+Pj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgV2FsbGUg
PG13YWxsZUBrZXJuZWwub3JnPgo+Pj4KPj4+IEJ1dCBjb3VsZCB5b3UgaGF2ZSBhIGxvb2sgd2hl
dGhlciB0aGlzIGZsYXNoIHN1cHBvcnRzIFNGRFAuCj4+PiBBY2NvcmRpbmcgdG8gdGhlIGRhdGFz
aGVldCBpdCBsb29rcyBsaWtlIGl0IGRvZXMuIEluIHRoYXQgY2FzZSwKPj4+IGNvdWxkIHlvdSBw
bGVhc2UgZHVtcCBpdCBhY2NvcmRpbmcgdG86Cj4+PiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9k
cml2ZXItYXBpL210ZC9zcGktbm9yLmh0bWwKPiAKPiBTb3JyeSwgSSBkaWRuJ3Qgbm90aWNlIHRo
aXMgZG9jLiBJdCdzIG5vdCB0ZWNobmljYWxseSBhICJuZXciIGZsYXNoLAo+IHNvIGl0IGRvZXNu
J3QgbmVjZXNzYXJpbHkgYXBwbHksIGJ1dCBmb3IgdGhlIG1haWwtYXJjaGl2ZSByZWNvcmQ6Cj4g
Cj4gIyB4eGQgLXAgL3N5cy9idXMvc3BpL2RldmljZXMvc3BpMC4wL3NwaS1ub3Ivc2ZkcAo+IDUz
NDY0NDUwMDAwMTAwZmYwMDAwMDEwOTMwMDAwMGZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
Zgo+IGZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmU1MjBmMWZmZmZmZmZmMDMy
OWViMjc2Ygo+IDA4M2IyN2JiZmZmZmZmZmZmZmZmMjdiYmZmZmYyOWViMGMyMDEwZDgwMDAwMDAw
MAo+IAoKVGhhbmtzISBXZSBrZWVwIGEgZGF0YWJhc2Ugb2YgU0ZEUCBkdW1wcyBhbmQgd2hlbiB3
ZSB0b3VjaCBhIGZsYXNoLCB3ZQpjb21wYXJlIHRoZSBTRkRQIGR1bXBzIG9mIHRoZSBmbGF2b3Jz
IG9mIHRoYXQgZmxhc2ggSUQgdG8gbWFrZSBpbmZvcm1lZApkZWNpc2lvbnMuIFRoZXJlIGFyZSBs
b3RzIG9mIGZsYXNoZXMgdGhhdCBoYXZlIHdyb25nIFNGRFAgZGF0YSwgc28gd2UKaW50cm9kdWNl
ZCBzb21lIFNGRFAgZml4dXBzLCB3aGVyZSB3ZSB0d2VhayB0aGUgaW5jb3JyZWN0IHBhcmFtZXRl
cnMuCkFsc28sIHdlIGVuY291bnRlcmVkIGNhc2VzIHdoZXJlIGZsYXNoZXMgd2l0aCBzYW1lIElE
IGhhdmUgZGlmZmVyZW50ClNGRFAgZGF0YSBhbmQgd2UgZW5kZWQgdXAgZGlmZmVyZW50aWF0aW5n
IHRoZSB0d28gYmFzZWQgb24gYSBTRkRQCmRpZmZlcmVuY2UuIFNvIHdlIHNob3VsZCBrbm93IHRo
ZSBTRkRQIGV2ZW4gZm9yIGZsYXNoIHVwZGF0ZXMsIGl0IGhlbHAKdXMgaGF2aW5nIGEgbW9yZSBy
ZWxldmFudCBkYXRhYmFzZS4KCldpdGggdGltZSB3ZSdsbCBhZGQgYSBTRkRQIGRlY29kZXIsIGJ1
dCB3ZSBjb3VsZG4ndCBhbGxvY2F0ZSB0aW1lIGZvcgp0aGF0IHlldC4KCkEgc2hhc3VtIG9uIHRo
ZSBTRkRQIGR1bXAgd291bGQgYmUgZ29vZCB0byBoYXZlIHNvbWUgc29ydCBvZiBpbnRlZ3JpdHkK
YXNzdXJhbmNlLCBlLmcuOgpzaGEyNTZzdW0gL3N5cy9idXMvc3BpL2RldmljZXMvc3BpMC4wL3Nw
aS1ub3Ivc2ZkcAoKPj4gVGhpcyB3b3VsZCBoZWxwIGdldHRpbmcgcmlkIG9mIHRoZSBub19zZmRw
X2ZsYWdzIGFuZCBzaXplIGZyb20gdGhlIGZsYXNoCj4+IGRlZmluaXRpb24uIEFub3RoZXIgcmVh
c29uIGlzIHRoYXQgdGhlIFNGRFAgZHVtcCBjYW4gaGVscCB1cwo+PiBkaWZmZXJlbnRpYXRlIGJl
dHdlZW4gZmxhdm9ycyBvZiB0aGUgc2FtZSBmbGFzaCwgaWYgaXQnbGwgZXZlciBiZSB0aGUKPj4g
Y2FzZSwgYW5kIGhlbHAgdXMga2VlcCBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Lgo+IAo+IEkgd29u
ZGVyLCBzaW5jZSBtYW51ZmFjdHVyZXJzIHNlZW0gdG8gcmV1c2UgSURzIHNvbWV0aW1lcywgaXMg
aXQKPiBwb3NzaWJsZSAob3IsIGxpa2VseSkgZm9yIFNGRFAgYW5kIG5vbi1TRkRQIHZlcnNpb25z
IG9mIHRoZSBzYW1lIGZsYXNoCj4gdG8gZXhpc3Q/IEknbSBub3QgcmVhbGx5IHN1cmUgd2hldGhl
ciBJIGNhbiB0cnVseSBkcm9wIHRoZSBub24tU0ZEUAo+IGRlZmluaXRpb25zLgoKSXQncyBwb3Nz
aWJsZSwgeWVzLiBXZSBsZWFuIHRvd2FyZHMgdXNpbmcgb25seSBTRkRQIGlmIHBvc3NpYmxlLiBU
aGUKbWVjaGFuaXNtIHRvIGRldGVybWluZSB0aGUgY29ycmVjdCBmbGFzaCBwYXJhbWV0ZXJzIHdo
ZW4gd2UgaGF2ZSBhIGZsYXNoCklEIHdpdGggMiBmbGF2b3JzLCBvbmUgd2l0aCBTRkRQIGFuZCBv
bmUgd2l0aG91dCwgaXMgaW4gZGlzY3Vzc2lvbiwKd2UnbGwgZ2V0IHRvIGEgY29uY2x1c2lvbiBz
b29uLiBJJ20gd2lsbGluZyB0byBicmVhayBiYWNrd2FyZApjb21wYXRpYmlsaXR5IGZvciBub24t
U0ZEUCBmbGFzaGVzLCBhbmQgaWYvd2hlbiBjb21wbGFpbnMgYXJpc2UsIHdlJ2xsCnVzZSB0aGUg
ZmFsbGJhY2sgbWVjaGFuaXNtIHRvIG5vbi1TRkRQIHBhcmFtcy4gQnV0IGFmdGVyIHdlJ2xsIGhh
dmUgc3VjaAptZWNoYW5pc20uCj4gCj4+IEFsc28sIGlmIHlvdSBjYXJlLCB3b3VsZCBiZSBnb29k
IHRvIGV4dGVuZCB0aGUgU1BJIE5PUiBkb2N1bWVudGF0aW9uIG9uCj4+IGhvdyBvbmUgc2hhbGwg
dGVzdCB0aGUgQmxvY2sgUHJvdGVjdGlvbi4KPiAKPiBUaGF0IHNvdW5kcyB0b3VnaGVyLiBJIGRv
bid0IGtub3cgdGhhdCB0aGVyZSdzIHJlYWxseSBhIHN0YW5kYXJkCj4gdG9vbHNldCBmb3IgaGFu
ZGxpbmcgcHJvdGVjdGlvbiAtLSBJIGd1ZXNzIHRoZSAnZmxhc2hfe3VuLH1sb2NrJwo+IHV0aWxp
dGllcyBpbiBtdGQtdXRpbHMgcXVhbGlmeSwgYnV0IHRoZXkgYXJlbid0IGV2ZW4gcGFja2FnZWQg
YnkKPiByZWxldmFudCBkaXN0cm9zIChlLmcuLCBPcGVuV3J0OyBidXQgSSBndWVzcyB0aGV5J3Jl
IGluIERlYmlhbikuIEkKPiB0eXBpY2FsbHkgdXNlIGZsYXNocm9tLCBzaW5jZSB0aGF0J3Mgd2hh
dCBDaHJvbWl1bU9TIHVzZXMsIGFuZCBpdCdzCj4gYXZhaWxhYmxlIGluIE9wZW5XcnQgLS0gd291
bGQgdGhhdCBiZSBhbiBPSyBiYXNpcyBmb3IgZG9jcz8KCnllcywgd2h5IG5vdC4gQXQgbGVhc3Qg
Zm9yIHBlb3BsZSB1c2luZyBPcGVuV3J0Lgo+IAo+IEl0J3MgYWxzbyBoaWdobHkgY29uZGl0aW9u
YWwgb24gd2hhdCBzb3J0IG9mIHJhbmdlKHMpIHRoZSBmbGFzaAo+IHN1cHBvcnRzLiBTbyBpdCdz
IGFsbW9zdCBsaWtlIHdlIG1pZ2h0IHdhbnQgYSBwcm9ncmFtbWF0aWMKPiB3cml0ZS1wcm90ZWN0
aW9uIHRlc3Qgc3VpdGUgYXMgcGFydCBvZiBtdGQtdXRpbHMvdGVzdHMvLCByYXRoZXIgdGhhbiBh
Cj4gYmVzcG9rZSBuYXJyYXRpdmUgZG9jdW1lbnQuIFdoaWNoIC4uLiBpcyBnZXR0aW5nIGEgbGl0
dGxlIGxhcmdlciB0aGFuCj4gSSBzaWduZWQgdXAgZm9yLgo+IAoKU29tZSB0ZXN0IGluIG10ZC11
dGlscyB3b3VsZCBiZSBnb29kIGluZGVlZCwgYnV0IG5hcnJhdGl2ZSBzaGFsbCBiZSBhbHNvCm9r
IGZvciBub3cuIFdoYXQgSSBmZWFyIGlzIHRoYXQgcGVvcGxlIGp1c3QgdXNlIGp1c3QgYSBmbGFz
aCBsb2NrL3VubG9jawphbGwgc2VjdG9ycyB0ZXN0LCB3aGljaCBpcyBub3QgaWRlYWwuIFdlIHNo
YWxsIGFsc28gdGVzdCBsb2NraW5nIG9uIHNvbWUKc2VjdG9ycyBmcm9tIHRoZSB0b3AgYW5kIGJv
dHRvbSwgdG8gdmVyaWZ5IHRoZSBjb3JyZWN0bmVzcyBvZiB0aGUgVEIKYml0LCBjaGVjayBpZiBC
UDMgaXMgd29ya2luZyBieSBsb2NraW5nIHNvbWUgc2VjdG9ycyBpbiB0aGF0IGFyZWEuCkhhdmVu
J3QgbG9va2VkIGF0IHRoZSBCUCBhcmVhIGluIGEgd2hpbGUsIGJ1dCB5b3UgZ2V0IG15IHBvaW50
LCBJIGZlZWwKdGVzdGluZyBpcyBub3QgaWRlYWwgYW5kIGEgZ3VpZGVsaW5lIHdvdWxkIGhlbHAu
CgpJZiB5b3UgZXZlciBmZWVsIHRoYXQgeW91IGNhbiBzcGVuZCBzb21lIHRpbWUgb24gdGhpcywg
aGVscCBpcyBhcHByZWNpYXRlZC4KClRoYW5rcywKdGEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
