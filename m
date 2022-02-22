Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD09C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAbjDHCuNidcmbO1AngCPpjs20KSYYnU/c3PthvQQ24=; b=kEMakvzZ/k++5+a2fQSKrSRYCN
	tbrvCMtAOWhXM/UKT3WLPgeLEBG237Bh4vDicBRLZ9emPrrUn6USPXLk0MOfGSxLB+YjD6bnAyZV7
	p/DHNa6k1RbK+VK9lDxhkWJieXQ3eYOpu3vsGAWV03KNViFY2wzX1FWE8V0g8DtR8AXdb0PLGyk10
	/ywyf7z8bZZm9zihV6p3d0LHOkpvK2i+IBa0nHbn1SMmK/0eSP9o1tLxByluW5kIPbCuG/oHBN5f/
	S466Xr8U1fU5/H1+RAe8Mnby1hagf2Xpiytt/vSkhIunFoi2VmMzcTkueDdWySGlTBzBxiPsOtJ3y
	7Vxwfc1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMPwp-008NRK-0b; Tue, 22 Feb 2022 07:50:59 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMPwm-008NQK-3A
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 07:50:57 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B10BD22175;
 Tue, 22 Feb 2022 08:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645516251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGq+Oc5aD7EUYB4n828ghG01xMsEGGRgt8fg8Ih6798=;
 b=kwuCX5ruihrC3zbgci6X0EZ4+u1LNrbfUiFoLnb9hydgfhMmwuG7kljqM2cSQqsEmjuzIQ
 Tw8B5Unp4q5/nW0TIw+z6sibzt4vusLZwPqtJ4Y2HdV3dTHZk3VmGjWvmQhOGkj2q4tYIQ
 nUqOP4/NSI8gT6UBPy2H2leNVEgXXc8=
MIME-Version: 1.0
Date: Tue, 22 Feb 2022 08:50:50 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Potin_Lai_=28=E8=B3=B4=E6=9F=8F=E5=BB=B7=29?=
 <Potin.Lai@quantatw.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Patrick
 Williams <patrick@stwcx.xyz>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: winbond: Add support for w25q01jv-iq
In-Reply-To: <0b619d9e-4ca0-88ae-69a1-4cb07d2aeea4@quantatw.com>
References: <20220222064227.16724-1-potin.lai@quantatw.com>
 <aedb6f8e3d878f487aa7fef147e352b4@walle.cc>
 <0b619d9e-4ca0-88ae-69a1-4cb07d2aeea4@quantatw.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <ef3d0391d22ce472e7410a77af3e938d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_235056_337947_D062A10E 
X-CRM114-Status: GOOD (  10.51  )
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

QW0gMjAyMi0wMi0yMiAwODozNywgc2NocmllYiBQb3RpbiBMYWk6Cj4gTWljaGFlbCBXYWxsZSDm
lrwgMjAyMi8yLzIyIOS4i+WNiCAwMzoyNCDlr6vpgZM6Cj4+IEhpLAo+PiAKPj4gQW0gMjAyMi0w
Mi0yMiAwNzo0Miwgc2NocmllYiBQb3RpbiBMYWk6Cj4+PiBBZGQgc3VwcG9ydCBmb3Igd2luYm9u
ZCB3MjVxMDFqdi1pcSBjaGlwCj4+PiAKPj4+IHJvb3RAYmxldGNobGV5On4jIGNhdAo+Pj4gL3N5
cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi8xZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAu
MC9zcGktbm9yL2plZGVjX2lkCj4+PiBlZjQwMjEKPj4+IHJvb3RAYmxldGNobGV5On4jIGNhdAo+
Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi8xZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkw
L3NwaTAuMC9zcGktbm9yL21hbnVmYWN0dXJlcgo+Pj4gd2luYm9uZAo+Pj4gcm9vdEBibGV0Y2hs
ZXk6fiMgY2F0Cj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vYWhiLzFlNjIwMDAwLnNwaS9zcGlf
bWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3IvcGFydG5hbWUKPj4+IHcyNXEwMWp2LWlxCj4+PiBy
b290QGJsZXRjaGxleTp+IyBoZXhkdW1wIC1DCj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vYWhi
LzFlNjIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3Ivc2ZkcAo+Pj4gMDAw
MDAwMDAgNTMgNDYgNDQgNTAgMDYgMDEgMDEgZmYgMDAgMDYgMDEgMTAgODAgMDAgMDAgZmYgCj4+
PiB8U0ZEUC4uLi4uLi4uLi4uLnwKPj4+IDAwMDAwMDEwIDg0IDAwIDAxIDAyIGQwIDAwIDAwIGZm
IDAzIDAwIDAxIDAyIGYwIDAwIDAwIGZmIAo+Pj4gfC4uLi4uLi4uLi4uLi4uLi58Cj4+PiAwMDAw
MDAyMCBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAKPj4+
IHwuLi4uLi4uLi4uLi4uLi4ufAo+Pj4gKgo+Pj4gMDAwMDAwODAgZTUgMjAgZmIgZmYgZmYgZmYg
ZmYgM2YgNDQgZWIgMDggNmIgMDggM2IgNDIgYmIgfC4gCj4+PiAuLi4uLj9ELi5rLjtCLnwKPj4+
IDAwMDAwMDkwIGZlIGZmIGZmIGZmIGZmIGZmIDAwIDAwIGZmIGZmIDQwIGViIDBjIDIwIDBmIDUy
IAo+Pj4gfC4uLi4uLi4uLi5ALi4gLlJ8Cj4+PiAwMDAwMDBhMCAxMCBkOCAwMCAwMCAzNiAwMiBh
NiAwMCA4MiBlYSAxNCBlMiBlOSA2MyA3NiAzMyAKPj4+IHwuLi4uNi4uLi4uLi4uY3YzfAo+Pj4g
MDAwMDAwYjAgN2EgNzUgN2EgNzUgZjcgYTIgZDUgNWMgMTkgZjcgNGQgZmYgZTkgNzAgZjkgYTUg
Cj4+PiB8enV6dS4uLlwuLk0uLnAuLnwKPj4+IDAwMDAwMGMwIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIAo+Pj4gfC4uLi4uLi4uLi4uLi4uLi58Cj4+PiAw
MDAwMDBkMCBmZiAwYSBmMCBmZiAyMSBmZiBkYyBmZiB8Li4uLiEuLi58Cj4+PiAwMDAwMDBkOAo+
PiAKPj4gQ2FuIHlvdSBwbGVhc2UgcHJvdmlkZSBhbiBtZDVzdW0gb3Igc2hhMjU2c3VtIG9mIHRo
aXMgZmlsZT8KPiAKPiByb290QGJsZXRjaGxleTp+IyBtZDVzdW0KPiAvc3lzL2RldmljZXMvcGxh
dGZvcm0vYWhiLzFlNjIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3Ivc2Zk
cAo+IGE3YjlkYmY3NmU5OWEzM2RiOTllNTU3YjY2NzY1ODhhwqAKClRoYW5rcyEKCj4gL3N5cy9k
ZXZpY2VzL3BsYXRmb3JtL2FoYi8xZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMC9z
cGktbm9yL3NmZHAKPiAKPiBJcyBpdCByZXF1aXJlZCBpbiBjb21taXQgbWVzc2FnZSwgaWYgeWVz
LCBJIHdpbGwgdXBkYXRlIGl0LgoKT2hoLCBJIGFjdHVhbGx5IG1pc3NlZCB0aGF0LiBUaGVzZSBp
bmZvcm1hdGlvbiBzaG91bGQgZ28gYXMKYSBjb21tZW50LCB0aGF0IGlzIGJlbG93IHRoZSAiLS0t
IiBsaW5lLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
