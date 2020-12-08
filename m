Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B344C4361B
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 10:42:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E067A23A5A
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 10:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E067A23A5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/iRfks2ujPf0jMWtmg8zNh56u11vxQBX9ahs74zxd7I=; b=Xg4EGz2QEIvm2L4Ssx20s8uQf
	FhzS/RiGmueKaTfit67FCx0D/kS3vs0L9sC3knGFhWZ2dSEOH28Nj5QwiYV9MEmNjniJzcDaL8XTQ
	U/QTw0yRIaOxgw85nUmrLgeGiuzVHxTRJbwqq9R+APybz5abg6ZQ04gzPgibuc818ztzwF4OXc5n+
	PUir49axQwV06+AoZwECKjPDM7JAbgJQDxTo18zkVW6DR32woLapEY6b74F+vIVpnJ3pXp0hfGWVw
	3/wbtsG8UYgKGTZ0mlyEWDFpYQm7YbYGC1/gAK8sZUaE3dJpWy9vRxEnXOircIJB1NX2lN6zZh3Zu
	tkxfspiJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmaQi-0003a7-S1; Tue, 08 Dec 2020 10:41:12 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmaQh-0003ZI-LW
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 10:41:12 +0000
Received: by mail-yb1-xb43.google.com with SMTP id u203so126577ybb.2
 for <linux-mtd@lists.infradead.org>; Tue, 08 Dec 2020 02:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p7rrbUd2GD8qSW4MR1E/gn6XTXa69KV3qccqhSvpT90=;
 b=qZ700TONe6wtSSOERiY7Wo59iFs3E7QSwaHUpbsfsu/Iuq/vAANipWoW2C8+7LDdYs
 RFUycp0spo4M4xFAc/a4L0yPdKFqPuOSIjJKg5ylus9uDSn4z4VIHJXvoGJOAaBZsUS5
 mMayD7Q8lGHnXAVm6ukPtUbLBWMpd5NLSb+HsiB+PvokgMBeeF2BLZANoX7ZifdNP+eC
 llpCYNdG5+Wr215Rhf4mAUIB6NIpxjqcPYbepEar//GGKuz7sR/81vQSmoNlqhvyyb8e
 fz58FtDYNbmroUwk0MUElCURKlzgfCDcyN/J+rfQjaF4cNutYBMSk0U829RTj3zQq6gq
 rp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p7rrbUd2GD8qSW4MR1E/gn6XTXa69KV3qccqhSvpT90=;
 b=Fbb02BuXj3VU0dQdXHJ2iW3Xbdm4nwjvFc8xvpwBssQ1Q/cEgjosGu6GIsS+lPAdc2
 G504LyYZy9JD1n/QCd0MEphr8CjSLrwjn25paUYdHMg5+v/mTMsNaYVOLBu3Uyg9ZjZc
 S78UMcxdGnwJQ2HdAN5WE+RP8AFFiXNka4K5i8YIuL/86lIAsPdFYMg0bQ7oQWMoUzLs
 SH/GR37iOxmz6YaxmuFr3GpWMyWXbowRa7GX90Xu7wL0V/BmPbyZzFhx0+DLXoLgcUOH
 U41JRsEqk6RvVLothabkgw4vOzSyZFQ8r3mYyP9ok+xEgOsid0VXLyVnjd5PxTWury8p
 hhVw==
X-Gm-Message-State: AOAM5312o9Za0uIfcy1HktkCS2oTDVYBxfRsUusON4cfxBUI5BbfUhbU
 aWDTFyhsCnwnM299s8K1aCVbv8a15qdjeedj88Q=
X-Google-Smtp-Source: ABdhPJzoiP8vkb53TcwcnNYltAkd/i5mNY3iOc6ozDjpmI+Zwa/A+32+zc4Q0zgAuvAdQZdmBPJT0zkSE/tF02Ee+7I=
X-Received: by 2002:a25:d486:: with SMTP id m128mr2073609ybf.214.1607424068476; 
 Tue, 08 Dec 2020 02:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <482d020e-bb1a-cf00-3f05-2bf26694ec16@microchip.com>
In-Reply-To: <482d020e-bb1a-cf00-3f05-2bf26694ec16@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Dec 2020 10:40:42 +0000
Message-ID: <CA+V-a8tCATgVYkxrzQGWg9GhD=70Hy=O_eESa5mcewt2PpUo7Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_054111_716246_A420E33C 
X-CRM114-Status: GOOD (  15.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpPbiBNb24sIERlYyA3LCAyMDIwIGF0IDU6MjcgUE0gPFR1ZG9yLkFtYmFydXNA
bWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBIaSwgTGFkLAo+Cj4gT24gMTAvMTYvMjAgMjo1NSBQ
TSwgTGFkIFByYWJoYWthciB3cm90ZToKPiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZQo+ID4KPiA+IFRoaXMgY2hpcCBpcyAobmVhcmx5KSBpZGVudGljYWwgdG8gdGhlIFdpbmJv
bmQgdzI1bTUxMmp2IHdoaWNoIGlzCj4gPiBhbHJlYWR5IHN1cHBvcnRlZCBieSBMaW51eC4gQ29t
cGFyZWQgdG8gdGhlIHcyNW01MTJqdiwgdGhlICdqdycKPiA+IGhhcyBhIGRpZmZlcmVudCBKRURF
QyBJRC4KPgo+IFcyNU01MTJKVy1JUSAoMiB4IDI1Nk0tYml0KSBTZXJpYWwgTUNQIChNdWx0aSBD
aGlwIFBhY2thZ2UpIEZsYXNoIG1lbW9yeSwKPiBpbnRyb2R1Y2VzIGEgbmV3IOKAnFNvZnR3YXJl
IERpZSBTZWxlY3QgKEMyaCnigJ0gaW5zdHJ1Y3Rpb24sIHdoaWNoIHdlIGRvbid0Cj4gc3VwcG9y
dC4gSSBndWVzcyB5b3UgY2FuJ3QgYWNjZXNzIHRoZSBzZWNvbmQgZGllIHdpdGggd2hhdCB3ZSBo
YXZlIGluCj4gbWFpbmxpbmUuIE9yIGFtIEkgd3Jvbmc/IFdlJ2xsIG5lZWQgdG8gYWRkIHN1cHBv
cnQgZm9yIG11bHRpLWRpZSBzdXBwb3J0Cj4gaWYgd2Ugd2FudCB0byBhZGQgbmV3IG11bHRpLWRp
ZSBmbGFzaGVzLgo+Ck15IGJhZCwgeWVzIG9ubHkgdGhlIGZpcnN0IGRpZSBpcyBhY2Nlc3NpYmxl
LiAgSSdsbCBwb3N0IGEgcGF0Y2gKZHJvcHBpbmcgdGhpcyBpZC4KCkNoZWVycywKUHJhYmhha2Fy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
