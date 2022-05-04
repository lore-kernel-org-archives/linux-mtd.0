Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397B2C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uxxF3U0gTKe/zhHMRlIBDjy0vuuBU5qdEGMuhZEl7Q=; b=HgJv8BkWw//bsD
	1MEEKPQ5R0N60H7/plBMBi3peBtxFAzcoEJ4YgcQZM3H2nHlRexZc2JT3/rTk6l1BBBc3NY035OIL
	tI+pkK9tSQj4kZBIL3AxdyykLuRhb0f5APFGDOWwiRqbeeueeiSK9qAxfgTG16LoMa0JdMQ57aE5U
	NfmTRu8ey0v5/KF2LWEpXi5IKHSwpQvl71qhWZKXsj6ZUkwkXxn1GXXSwcQDzkZ8/4RyivddAF94C
	PdyyOGqOphLINlDzqsAGELWlcXUOGwBYaDK4JjXmwGpOCmFvyjRotrnSRrKXYajgD+6nwGO194Sap
	g3clPxNNyms0Inqg9yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmFFX-00B8Wq-E3; Wed, 04 May 2022 13:41:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmFFU-00B8Si-6W; Wed, 04 May 2022 13:41:01 +0000
Received: by mail-ed1-x52e.google.com with SMTP id k27so1746619edk.4;
 Wed, 04 May 2022 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=suVw3tSzbwyZSam3QbzRJHAkBAls+2hu9csRGskWjWw=;
 b=bk9kOJqOLJTxShNzNja788BQ2B6hxHftCjyH0aVxO0vJypv6yv1bMzkGh7Qu8+7ccE
 Y2XQdNv3VZEdvDWkWuimAcjeExlT3lFCmgTValt3KEPauGhwXBQkHqC2zZanUpv7heF7
 kb8xaW5XRYSzxtRbRl3jtjMBTHZj4JB+o0azkG6bN1VZbmUVp05G2SFu8BdSc4Ayu/3+
 cwV20fCW68AQh17TdOtQWun/2JxzAyXY00ENFuUquQYIcc0eLoQXSaTduF3/FHmJiNK9
 +hJK3W5lulfnGCf9T1CuZQcWCIWcroGoMGeAnqKk5DJzeABcTvx1JM/69AmyBog9jtlR
 1Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=suVw3tSzbwyZSam3QbzRJHAkBAls+2hu9csRGskWjWw=;
 b=lwjFNB+jPQ52n33XzhJZDxeu00AhuKp/USdE/+bGsk8dDq+Gp2MLhy6swc+duiyCiB
 SFzE/Ie0nsZLBgOSZ9E23OG30z//WEMy8nyxd2DxlRlnWaY+biC/RioLv/XZnNouPP04
 pbLhSG0Y9eVBcjffZyd+8HrTtEMFHMbo2nrRG0u4LAfahUqfzttoZ2uPWY928hnkT3bI
 nY771NJVUxjuk7ixXc1NnCrwSwmu29aCT1FtOygd1fcUd1h8BavPqIK+QxCvUqskMWeH
 r0/2M+8WMj6DjHgzHomyl0Zq2KR1Df7qUVdlB9a4USauPQgm6yeY3ycDtBI/HIF3lJ8b
 Kq8w==
X-Gm-Message-State: AOAM530CKEntPiaEx1N8SW+1YA49SjAyFnaPgT+gGV0IVPKV/zIgsEG9
 05bVDz+IeTIhPk+YBLjBBCE=
X-Google-Smtp-Source: ABdhPJwV+5IUc2JZSq1pNUPzHy8aTwwTASBzecl/CgmJrjO0BveOXuEoDT+ZmXE7LkjGMGFzYy/nkA==
X-Received: by 2002:a05:6402:5108:b0:427:e323:4c67 with SMTP id
 m8-20020a056402510800b00427e3234c67mr8686804edd.326.1651671657228; 
 Wed, 04 May 2022 06:40:57 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 t26-20020a05640203da00b0042617ba6383sm9088126edw.13.2022.05.04.06.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 06:40:56 -0700 (PDT)
Message-ID: <63cb6fe1-5abe-ebfe-7d94-34dff86f1a81@gmail.com>
Date: Wed, 4 May 2022 15:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: Regression? [PATCH 1/2] mtd: call of_platform_populate() for MTD
 partitions
To: Daniel Golle <daniel@makrotopia.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220406143225.28107-1-zajec5@gmail.com>
 <20220411090032.10999-1-miquel.raynal@bootlin.com>
 <YmX3Yn9cS1YjWOjs@makrotopia.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <YmX3Yn9cS1YjWOjs@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_064100_277414_78A09118 
X-CRM114-Status: GOOD (  23.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjUuMDQuMjAyMiAwMzoyMCwgRGFuaWVsIEdvbGxlIHdyb3RlOgo+IE9uIE1vbiwgQXByIDEx
LCAyMDIyIGF0IDExOjAwOjMyQU0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIFdl
ZCwgMjAyMi0wNC0wNiBhdCAxNDozMjoyNCBVVEMsID0/dXRmLTg/Yj9VbUZtWWNXQ0lFMXB4WUps
WTJ0cD89IHdyb3RlOgo+Pj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
Pgo+Pj4KPj4+IFVudGlsIHRoaXMgY2hhbmdlIE1URCBzdWJzeXN0ZW0gc3VwcG9ydGVkIGhhbmRs
aW5nIHBhcnRpdGlvbnMgb25seSB3aXRoCj4+PiBNVEQgcGFydGl0aW9ucyBwYXJzZXJzLiBUaGF0
J3MgYSBzcGVjaWZpYyAvIGxpbWl0ZWQgQVBJIGRlc2lnbmVkIGFyb3VuZAo+Pj4gcGFydGl0aW9u
cy4KPj4+Cj4+PiBTb21lIE1URCBwYXJ0aXRpb25zIG1heSBob3dldmVyIHJlcXVpcmUgZGlmZmVy
ZW50IGhhbmRsaW5nLiBUaGV5IG1heQo+Pj4gY29udGFpbiBzcGVjaWZpYyBkYXRhIHRoYXQgbmVl
ZHMgdG8gYmUgcGFyc2VkIGFuZCBzb21laG93IGV4dHJhY3RlZC4gRm9yCj4+PiB0aGF0IHB1cnBv
c2UgTVREIHN1YnN5c3RlbSBzaG91bGQgYWxsb3cgYmluZGluZyBvZiBzdGFuZGFyZCBwbGF0Zm9y
bQo+Pj4gZHJpdmVycy4KPj4+Cj4+PiBBbiBleGFtcGxlIGNhbiBiZSBVLUJvb3QgKHN1YilwYXJ0
aXRpb24gd2l0aCBlbnZpcm9ubWVudCB2YXJpYWJsZXMuCj4+PiBUaGVyZSBleGlzdCBhICJ1LWJv
b3QsZW52IiBEVCBiaW5kaW5nIGZvciBNVEQgKHN1YilwYXJ0aXRpb24gdGhhdAo+Pj4gcmVxdWly
ZXMgYW4gTlZNRU0gZHJpdmVyLgo+Pj4KPj4+IFJlZjogNWRiMWMyZGJjMDRjICgiZHQtYmluZGlu
Z3M6IG52bWVtOiBhZGQgVS1Cb290IGVudmlyb25tZW50IHZhcmlhYmxlcyBiaW5kaW5nIikKPj4+
IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4g
QXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0aGFua3MuCj4gCj4gSSdtIHRyeWluZyB0byB1c2Ug
bmV4dC0yMDIyMDQyMiBhbmQgbm90aWNlZCBhIGZldyBuZXcgb29wcydlcy4KPiBUdXJucyBvdXQg
aXQgY291bGQgYmUgYSBwcm9ibGVtIHdpdGggdGhpcyBjb21taXQgYWNjb3JkaW5nIHRvCj4gCj4g
W2RhbmllbEBib3ggbGludXguZ2l0XSQgZ2l0IGJpc2VjdCBnb29kCj4gNjg0NzE1MTdlODgzOTAy
Y2RmZjZlYTM5OWQwNDNiMTdmODAzYjFhOCBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdAo+IGNvbW1p
dCA2ODQ3MTUxN2U4ODM5MDJjZGZmNmVhMzk5ZDA0M2IxN2Y4MDNiMWE4Cj4gQXV0aG9yOiBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gRGF0ZTogICBXZWQgQXByIDYgMTY6MzI6
MjQgMjAyMiArMDIwMAo+IAo+ICAgICAgbXRkOiBjYWxsIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkg
Zm9yIE1URCBwYXJ0aXRpb25zCj4gWy4uLl0KPiAtLS0KPiAKPiBTbyB3aGVuIGV2ZXIgdGhlcmUg
aXMgYXQgbGVhc3Qgb25lICdjb21wYXRpYmxlJyBub2RlIGZvciBhbnkgb2YgdGhlCj4gbXRkIHBh
cnRpdGlvbnMgSSBnZXQgdGhlIG9vcHMgbWVzc2FnZXMgYmVsb3cuIEl0IGRvZXNuJ3QgcmVhbGx5
IG1hdHRlcgo+IHdoYXQgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGlzLCAibnZtZW0tY2VsbHMiIGFz
IHdlbGwgYXMgImRlbngsZml0Igo+ICh1c2VkIGZvciBPcGVuV3J0IG10ZHNwbGl0IG5vdCBldmVu
IHByZXNlbnQgaW4gbGludXgtbmV4dCwgc28ganVzdCBhCj4gZGVhZCBoaW50IGluIERUUykgbWFr
ZSB0aGUga2VybmVsIHRvIG9vcHMuCj4gCj4gRGVzcGl0ZSB0aGUgbWVzc2FnZXMgYmVpbmcgc2hv
d24sIGJvdGggYWNjZXNzaW5nIE1URCBwYXJ0aXRpb25zIGFuZAo+IGFsc28gZXRoMCBNQUMgYWRk
cmVzcyBwb3B1bGF0ZWQgdmlhIE5WTUVNIHNlZW0gdG8gd29yayB3aXRob3V0Cj4gcHJvYmxlbXMg
KGF0IGxlYXN0IGxvb2tzIGxpa2UgaXQgb24gZmlyc3Qgc2lnaHQpLgo+IAo+IEZpbmQgdGhlIGZ1
bGwgZGV2aWNlIHRyZWUgaGVyZToKPiAKPiBodHRwczovL2dpdC5vcGVud3J0Lm9yZy8/cD1vcGVu
d3J0L29wZW53cnQuZ2l0O2E9YmxvYjtmPXRhcmdldC9saW51eC9tZWRpYXRlay9kdHMvbXQ3NjIy
LXVibnQtdW5pZmktNi1sci11Ym9vdG1vZC5kdHMKCkkgZm91bmQgaXQhIEl0IHVzZWQgdG8gaGFw
cGVuIChiZWZvcmUgZHJvcHBpbmcgcGF0Y2gpIHdpdGg6CiMgQ09ORklHX01URF9QQVJUSVRJT05F
RF9NQVNURVIgaXMgbm90IHNldAoKSSdsbCB3b3JrIG9uIFYyIHdoaWNoIGRvZXNuJ3QgcmVxdWly
ZQpDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj15CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
