Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC40AC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 04:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfL0VL/SGZh5q7w1tud6R6TjUWhKUAma4EZXV6HKcts=; b=SzDQfDb9/LekmN
	JNeccdqrz2ci+Brt5ty+jXNu12SnHRG4D3pohEo/KKDdhcUz71j7tNpHoPL63yUG5+nmvit0pOS6u
	9n901PzYhDexl0L6sYe1AjT2cTxdF71sgNmwl3/4Mq68anCKTcf31sn9HVHBwpj876iLEQW2puM/N
	btUaxt9dmgr+9MN7ilyeA2HjyjTFX6HTH6Exn0Dwa7+m+xxOuEeTyM6tpbMJoHsYizsWmtxsYaEs1
	cui25gkfnhN5y8Qo2vUI1gUWURrdDPFvAJDHFYbP+3/3k0Hsw/wARR0dG81akmYibblJQB4jrg7u7
	Ohwvi9yDUBoKDUOOuFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEjqI-00HMru-5z; Fri, 22 Jul 2022 04:00:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEjqF-00HMrS-I5
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 04:00:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id b10so3335524pjq.5
        for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2022 21:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+u3Prv0q+gDa8zQ8Jl2PImkSWakH7m1GYw/xXfugxFg=;
        b=a8mZK09Dq42IL0hIMJN+R4HvIBdIwpoxPLQjLWlCgdYwvYQVZ7eeLlk7J4PcLtaZas
         NpyOOvf0FyNrNvczxR/QPhuJj7jUgzqa4/Iy219BKS/eRk5kSZWf6P4Tp2SmCuEN4Ehx
         9/NuD3Q20S1hu71bZ/IR0A0ipcBREeKa+pEZtOAc/eqn1yVYgUpE/jC7zszOO/jjvIdv
         +1TU/PM8+DJSochXgitwG2zsOkdJVvnOrjcmKvKKJTaJp0e8vcoicE3b2ILtTsjOgqde
         5E81jtWXWONtRIpZyuIfD+dmGFrnifbw62eAG8EDeeoP8Yhgu5XSLfPWOyVEL2cC3jGa
         9DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+u3Prv0q+gDa8zQ8Jl2PImkSWakH7m1GYw/xXfugxFg=;
        b=vX5BlgtJu6puJQCum6eJuxcPlMhWBtrz982ogZ9PG5yDsNi0CPwFOtYTbX3iIr4+dk
         HQeeTyatWdD0eZS48aitUexHIU8WMjQEXzUJV7imq6ZHic0+CsTI39AE6zFZAIX7t2wQ
         +W/4x3NgxKFxrougIW5+Z+ybOayoy7ZSMFKuof6SwAfb5xAFNf5sFpDzzsMvWjCk2TDR
         7jc3gR0JgjlWcaXIwLX4757GByL3OLNQieisGc3qLITdl6qvTjrOhSegXmUpNqySVGj5
         OWFtBW8Tv3FcbYgxeNOiMJWP3FTphkfrDhtikjcoirjjj7c8ca5urBLQtIJ6RBgQWgXN
         Dajw==
X-Gm-Message-State: AJIora/vEJBL9GF1e3ZfRam3thV9Z1/ROqDVvB7RXF9X2mvDWroS1iyN
	cSovxEVrwyvsdRDk6TbnZIE=
X-Google-Smtp-Source: AGRyM1tc/4mrR7eSapTJrKj/EHcVd/0XA2KGqZnW1/S0zXVPDZcchQnWqyyg05qRE2XCiTWGCrkYCw==
X-Received: by 2002:a17:903:228b:b0:16b:ee10:b91 with SMTP id b11-20020a170903228b00b0016bee100b91mr1513399plh.27.1658462439942;
        Thu, 21 Jul 2022 21:00:39 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902680d00b0016d12adc282sm2545690plk.147.2022.07.21.21.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 21:00:39 -0700 (PDT)
Message-ID: <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
Date: Fri, 22 Jul 2022 13:00:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, michael@walle.cc
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_210043_644552_54F31859 
X-CRM114-Status: GOOD (  32.55  )
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

T24gNy8yMi8yMDIyIDE6MDYgQU0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToK
PiBPbiA1LzIzLzIyIDEwOjQ5LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gQW0gMjAyMi0wNS0xNCAwNTo1MSwgc2NocmllYiBU
YWthaGlybyBLdXdhbm86Cj4+PiBPbiA1LzEzLzIwMjIgNjo0MCBQTSwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPj4+PiBbYnR3IHRoZSBzdWJqZWN0IHN0aWxsIGhhcyB0aGUgb2xkIG5hbWUgb2YgdGhl
IGFkZHJfd2lkdGhdCj4+Pj4KPj4+IFllcywgaXQgbXVzdCBiZSBmaXhlZCBpbiBuZXh0IHJldi4K
Pj4+Cj4+Pj4gQW0gMjAyMi0wNS0xMyAwMzoyNiwgc2NocmllYiBUYWthaGlybyBLdXdhbm86Cj4+
Pj4+IE9uIDUvMTMvMjAyMiA3OjE0IEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4+Pj4gQW0g
MjAyMi0wNS0xMCAwMDoxMCwgc2NocmllYiB0a3V3NTg0OTI0QGdtYWlsLmNvbToKPj4+Pj4+PiBG
cm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4+Pj4+
Pj4KPj4+Pj4+PiBJbiA0QkFJVCBwYXJzZSwga2VlcCBub3ItPnBhcmFtcy0+YWRkcl93aWR0aCBi
ZWNhdXNlIGl0IG1heSBiZSB1c2VkCj4+Pj4+Pj4gYXMKPj4+Pj4+PiBjdXJyZW50IGFkZHJlc3Mg
bW9kZSBpbiBTTVBUIHBhcnNlIGxhdGVyIG9uLgo+Pj4+Pj4KPj4+Pj4+IE1oIEknbSBub3Qgc3Vy
ZSB0aGlzIGlzIG5lZWRlZCBhdCBhbGwuCj4+Pj4+Pgo+Pj4+Pj4gU0ZEUCBzcGVjIHNheXMKPj4+
Pj4+IMKgIFZhcmlhYmxlIGFkZHJlc3MgbGVuZ3RoICh0aGUgY3VycmVudCBzZXR0aW5nIG9mIHRo
ZSBhZGRyZXNzCj4+Pj4+PiDCoCBsZW5ndGggbW9kZSBkZWZpbmVzIHRoZSBhZGRyZXNzIGxlbmd0
aCkKPj4+Pj4+Cj4+Pj4+PiBhbmQKPj4+Pj4+IMKgIFdoZW4gdGhlIGxlbmd0aCBpcyBkZWZpbmVk
IGFzIHZhcmlhYmxlLCB0aGUgc29mdHdhcmUgb3IgaGFyZHdhcmUKPj4+Pj4+IMKgIGNvbnRyb2xs
aW5nIHRoZSBtZW1vcnkgaXMgYXdhcmUgb2YgdGhlIGFkZHJlc3MgbGVuZ3RoIG1vZGUgbGFzdAo+
Pj4+Pj4gwqAgc2V0IGluIHRoZSBtZW1vcnkgZGV2aWNlIGFuZCB0aGlzIHNhbWUgbGVuZ3RoIG9m
IGFkZHJlc3MuCj4+Pj4+Pgo+Pj4+Pj4gV2UgZG9uJ3Qgc2V0IGFueSBhZGRyZXNzIG1vZGUgdW50
aWwgYWxsIHRoZSBTRkRQIHBhcnNpbmcgaXMKPj4+Pj4+IG92ZXIuIFRoZXJlZm9yZSB3ZSBzaG91
bGQgYWx3YXlzIGJlIGluIDMgYnl0ZSBtb2RlLCBubz8KPj4+Pj4+Cj4+Pj4+IEFjdHVhbGx5IHRo
ZXJlIGFyZSBzb21lIGRldmljZXMgdGhhdCBoYXZlIHZhcmlhYmxlIGFkZHJlc3MgbGVuZ3RoIGJ1
dAo+Pj4+PiA0IGJ5dGUgbW9kZSBieSBkZWZhdWx0IChJIHdpbGwgd29yayBvbiB0aG9zZSBkZXZp
Y2VzIGFmdGVyIHRoaXMKPj4+Pj4gc2VyaWVzCj4+Pj4+IGlzIHNldHRsZWQpLiBUbyBzdXBwb3J0
IHN1Y2ggY2FzZSwgSSBwcmVmZXIgdG8gdXNlCj4+Pj4+IHBhcmFtcy0+YWRkcl9uYnl0ZXMKPj4+
Pj4gYXMgY3VycmVudCBhZGRyZXNzIG1vZGUgc28gdGhhdCBJIGNhbiBmaXggaXQgaW4gcG9zdF9i
ZnB0X2ZpeHVwKCkKPj4+Pj4gaG9vay4KPj4+Pgo+Pj4+IEFyZSB0aGVyZSBwdWJsaWMgZGF0YXNo
ZWV0cyBhdmFpbGFibGU/IFNvIHRoZXNlIGRldmljZXMgaGF2ZSBhIDMgYnl0ZQo+Pj4gSSB3aWxs
IHNlbmQgZGF0YXNoZWV0cyB0byB5b3UgaW4gYW5vdGhlciBlbWFpbC4gQXQgdGhpcyBwb2ludCwg
b25seQo+Pj4gc3VtbWFyeSBkYXRhc2hlZXQgaXMgYXZhaWxhYmxlIGluIHdlYnNpdGUuCj4+Pgo+
Pj4+IGFuZCBhIDQgYnl0ZSBtb2RlLCBidXQgYWZ0ZXIgcmVzZXQsIHRoZXkgYXJlIGluIHRoZSA0
IGJ5dGUgbW9kZT8gTG9va3MKPj4+IFllcy4KPj4+Cj4+Pj4gbGlrZSBpdCBzaG91bGQgYmUgZml4
ZWQgaW4gYSBkaWZmZXJlbnQgd2F5LiBJJ20gbm90IHN1cmUgdGhlICJjdXJyZW50Cj4+Pj4gbW9k
ZSIgaGFuZGxpbmcgaXMgY29ycmVjdC4KPj4+Pgo+Pj4gWWVzLCB3ZSBtYXkgd2FudCB0byBpbnRy
b2R1Y2UgYSBuZXcgZmxhZyBsaWtlIFNQSV9OT1JfNEJBTV9ERUZBVUxUIGFuZAo+Pj4gY2hlY2sK
Pj4+IHRoZSBmbGFnIGluIEJGUFQgcGFyc2UuIE9uY2UgSSBzZW5kIGFub3RoZXIgc2VyaWVzLCBw
bGVhc2UgcmV2aWV3Lgo+Pj4KPj4+PiBXZSBuZWVkIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0
aGUgbW9kZSB0aGUgZmxhc2ggY3VycmVudGx5IGlzIHVzaW5nCj4+Pj4gKG5vci0+YWRkcl9uYnl0
ZXMpIGFuZCB0aGUgbW9kZSBwYXJzZWQgYnkgU0ZEUCAocGFyYW1zLT5hZGRyX25ieXRlcykuCj4+
Pj4KPj4+IFRoZSBmbGFzaCdzIGFkZHJlc3MgbW9kZSBhZmZlY3RzIHRoZSBhZGRyZXNzIGxlbmd0
aCBvZiBOb24tNEIgb3Bjb2RlcywKPj4+IGluY2x1ZGluZyByZWFkL3dyaXRlIGFueSByZWdpc3Rl
ciBvcHMgdXNlZCBpbiBTTVBUIHBhcnNlIGFuZCBJbmZpbmVvbgo+Pj4gKHNwYW5zaW9uKSBzcGVj
aWZpYyBob29rcy4KPj4+Cj4+PiBUaGUgNEIgb3Bjb2RlcyBhbHdheXMgdGFrZSBhZGRyZXNzIGxl
bmd0aCBvZiA0IHJlZ2FyZGxlc3Mgb2YgZmxhc2gncwo+Pj4gYWRkcmVzcyBtb2RlLiBJbiB0aGVz
ZSBJbmZpbmVvbiBjaGlwcywgNEIgb3Bjb2RlcyBmb3IgcmVhZC9wcm9ncmFtLwo+Pj4gZXJhc2Ug
YXJlIGF2YWlsYWJsZSBhbmQgNEJBSVQgYWR2ZXJ0aXNlcyB0aGVtLiBXZSBkb24ndCBoYXZlIHRv
IGVudGVyCj4+PiA0IGJ5dGUgYWRkcmVzcyBtb2RlIGZvciByZWFkL3Byb2dyYW0vZXJhc2UuCj4+
Cj4+IGJ0dy4gdGhpcyBpcyBhIHBpdHkuIHlvdSBhcmUgdXNpbmcgdGhlIHN0YXRlbGVzcyA0YiBv
cGNvZGVzIGJ1dAo+PiB0aGVuIHlvdSBkb24ndCBwcm92aWRlIHN0YXRlbGVzcyBvcGNvZGVzIGZv
ciB0aGUgcmVhZCBhbnkgcmVnaXN0ZXIKPj4gb3AgOi8KPj4KPj4+IFNvLCBJIHRoaW5rIHdlIG5l
ZWQgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGFkZHJlc3MgbGVuZ3RoIGZvcgo+Pj4gcmVhZC9w
cm9ncmFtL2VyYXNlIGFuZCBmbGFzaCdzIGRlZmF1bHQgYWRkcmVzcyBtb2RlLgo+Pgo+PiBPciB3
ZSBrZWVwIHRoZW0gaW4gc3luYy4gRS5nLiBzd2l0Y2ggdG8gNGJ5dGVzIG1vZGUgaWYgd2UgYXJl
Cj4+IHVzaW5nIHRoZSA0IGJ5dGUuIEdyYW50ZWQsIHRoYXQgc291bmRzIGxpa2UgYSBoYWNrIDop
Cj4+Cj4+PiBPYnZpb3VzbHkgd2UgYXJlIHVzaW5nIG5vci0+YWRkcl9uYnl0ZXMgYXMgYWRkcmVz
cyBsZW5ndGggZm9yIHJlYWQvCj4+PiBwcm9ncmFtL2VyYXNlIGFuZCBzaG91bGQga2VlcCB0aGlz
IHVzYWdlLgo+Pgo+PiBZZXMsIEkgd2Fzbid0IGF3YXJlIHRoYXQgd2UgYWN0dWFsbHkgdHdvIGRp
ZmZlcmVudCBydW50aW1lCj4+IHBhcmFtZXRlcnM6Cj4+IMKgLSB0aGUgcmVhZC9wcm9ncmFtL2Vy
YXNlIGFkZHJlc3Mgd2lkdGgsIGFsc28gdXNlZCB3aXRoIHRoZQo+PiDCoMKgIDRiIG9wY29kZXMK
Pj4gwqAtIGludGVybmFsIG1vZGUgM2IvNGIuIFVwIHVudGlsIG5vdywgdGhpcyB3YXNuJ3QgYW4g
aXNzdWUKPj4gwqDCoCBiZWNhdXNlIGVpdGhlciB0aGUgbW9kZSB3YXMgc3dpdGNoZWQgb3IgdGhl
IDRiIG9wY29kZXMKPj4gwqDCoCB3ZXJlIHVzZWQuIFNvIHRoaXMgd2FzIG11dHVhbGx5IGV4Y2x1
c2l2ZS4gTm93IHdlIGhhdmUKPj4gwqDCoCBmbGFzaGVzIHdoaWNoIHVzZXMgNGIgb3Bjb2RlcyBf
YW5kXyB3ZSBuZWVkIHRoZSBzdGF0ZQo+PiDCoMKgIG9mIHRoZSBpbnRlcm5hbCBtb2RlLgo+Pgo+
PiBJIGNhbid0IHRoaW5rIG9mIGEgZ29vZCBzb2x1dGlvbiBmb3Igbm93LiBOZWVkIHRvIHRoaW5r
Cj4+IG1vcmUgYWJvdXQgdGhpcywgYnV0IEknbSBwcmV0dHkgYnVzeSBhdCB0aGUgbW9tZW50Lgo+
PiBXaGF0IEkgdGhpbmsgaXMgY2xlYXIgaXMgdGhhdCB3ZSBuZWVkIHR3byBkaWZmZXJlbnQgbW9k
ZXMKPj4gaGVyZSBpbiB0aGUgc3BpX25vciBzdHJ1Y3QuIG5vci0+YWRkcl9uYnl0ZXMgZm9yIHRo
ZQo+PiByZWFkL3Byb2dyYW0vZXJhc2Ugb3Bjb2RlcyBhbmQgbm9yLT5hZGRyZXNzX21vZGUgb3Ig
c2ltaWxhcgo+PiB3aGljaCB0cmFja3MgdGhlIFNQSSBmbGFzaCdzIGludGVybmFsIGFkZHJlc3Mg
bW9kZS4KPiAKPiBIaSwgVGFrYWhpcm8sCj4gCj4gQ2FuIHdlIGRldGVybWluZSB0aGUgZmxhc2gn
cyBpbnRlcm5hbCBhZGRyZXNzIG1vZGUgYnkgcXVlcnlpbmcKPiB0aGUgZmxhc2ggYXQgcnVuLXRp
bWU/IElzIHRoaXMgcG9zc2libGUgb24gU2VtcGVyIGZsYXNoZXM/Cj4gCkNGUjJWWzddIGhhcyBj
dXJyZW50IGFkZHJlc3MgbW9kZSwgYnV0IHRvIHJlYWQgdGhhdCwgd2UgbmVlZCB0bwppc3N1ZSBS
ZWFkIEFueSBSZWdpc3RlciB3aGljaCBhZGRyZXNzIGxlbmd0aCByZWxpZXMgb24gY3VycmVudAph
ZGRyZXNzIG1vZGUuIENoaWNrZW4tYW5kLWVnZy4uLgoKPiBUbyBleHRlbmQgdGhlIGlkZWEsIHdo
ZW4gdGhlIGZsYXNoIHN1cHBvcnRzIEJGUFQgYW5kIGRlZmluZXMKPiBCRlBUX0RXT1JEMV9BRERS
RVNTX0JZVEVTXzNfT05MWSBvciBCRlBUX0RXT1JEMV9BRERSRVNTX0JZVEVTXzRfT05MWQo+IHRo
ZSB0aGluZ3MgYXJlIGNsZWFyLCBhZGRyX25ieXRlcyBpcyBmaXhlZC4KPiBJZiB0aGUgZmxhc2gg
ZG9lcyBub3QgZGVmaW5lIEJGUFQgb3IgdXNlcwo+IEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNf
M19PUl80LCB0aGVuIHdlIGNvdWxkIGRldGVybWluZSB0aGUgYWRkcgo+IG1vZGUgYnkgcXVlcnlp
bmcgdGhlIGZsYXNoLgo+IAo+Pgo+Pj4gRm9yIGZsYXNoJ3MgZGVmYXVsdCBhZGRyZXNzIG1vZGUs
IG15IHByZWZlcmVuY2UgaXMgdG8gdXNlCj4+PiBwYXJhbXMtPmFkZHJfbmJ5dGVzLCBidXQgSSBz
aG91bGQgcmVuYW1lIGl0IHRvIHNvbWV0aGluZyBsaWtlCj4+PiBwYXJhbXMtPmRlZl9hZGRyX25i
eXRlcyBhbmQgcmV3b3JrIHNwaV9ub3Jfc2V0X2FkZHJfbmJ5dGVzKCkuCj4+Cj4+IElNSE8gcGFy
YW1zIHNob3VsZCBvbmx5IGJlIHVzZWQgdG8gc3RvcmUgdGhlIHBhcnNlZCAob3IKPj4gaGFyZGNv
ZGVkKSBwYXJhbWV0ZXJzLgo+IAo+IHllcCwgSSBzaGFyZSBNaWNoYWVsJ3Mgb3Bpbmlvbi4KPiAK
PiBDaGVlcnMsCj4gdGEKPiAKPj4KPj4gLW1pY2hhZWwKPj4KPj4+IMKgc3RhdGljIGludCBzcGlf
bm9yX3NldF9hZGRyX25ieXRlcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4gwqB7Cj4+PiDCoMKg
wqDCoMKgIGlmIChub3ItPmZsYWdzICYgU05PUl9GX0hBU180QkFJVCkgewo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5hZGRyX25ieXRlcyA9IDQ7Cj4+PiDCoMKgwqDCoMKgIH0g
ZWxzZSBpZiAobm9yLT5wYXJhbXMtPmRlZl9hZGRyX25ieXRlcykgewo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbm9yLT5hZGRyX25ieXRlcyA9IG5vci0+cGFyYW1zLT5kZWZfYWRkcl9u
Ynl0ZXM7Cj4+Pgo+Pj4+IEF0IHNvbWUgcG9pbnQsIHRoZSBtb2RlIGlzIHN3aXRjaGVkIGFuZCBu
b3ItPmFkZHJfbmJ5dGVzIGJlY29tZXMKPj4+PiBwYXJhbXMtPmFkZHJfbmJ5dGVzLiBJdCBzZWVt
cyBpbiB5b3VyIGNhc2Ugbm9yLT5hZGRyX25ieXRlcyBzaG91bGQKPj4+PiBiZSA0IHJpZ2h0IGZy
b20gdGhlIGJlZ2lubmluZy4gV2hpY2ggYWxzbyBtZWFucyBub3ItPmFkZHJfbmJ5dGVzCj4+Pj4g
c2hvdWxkIGJlIDMgZm9yIHRoZSBvdGhlciBjYXNlcyAoYW5kIHByb2JhYmx5IG5vdCAwKS4KPj4+
Pgo+Pj4gV2l0aCBwYXJhbS0+ZGVmX2FkZHJfbmJ5dGVzLCBJIHRoaW5rIHdlIGNhbiBrZWVwIG5v
ci0+YWRkcl9uYnl0ZXMgPSAwCj4+PiBkdXJpbmcgU0ZEUCBwYXJzZS4KPj4+Cj4+PiBUaGFua3Ms
Cj4+PiBUYWthaGlybwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
