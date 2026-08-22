Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D5FC5DF97
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2026 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrcnmfrGi/9epyCWStUGi6Flhmw8aLKxVQ+CK69APRw=; b=KXPduS7Ui6ggkm
	XF6j4YsawbCGxcTDEvBKjOy2ArHvFwinLIeX9NtGf2hli22cEgNIcXjbuSE9RJmlGb9hxkpjrIVzR
	silB4FUuu0IamVQyr0N/3XhJjGHm2I3MMoxJ1CCKBw4lZ+7OyviY65z2+Bx1wXbK9pepWOUxJi37S
	3LfvGO4KuscIfKDe2Fu7FHgNOH6rNvEeLLjRKCX+6wME3GtV6K7s/89U6u10AkhvdBGgq2NgO80oN
	jyZsdyToZBjxY6IxDlTxq0CGPOwy8Re+GVwCHSEJ7R5AXOIbwNuJBRlyu1Cwc911iqS1vxmjNzviC
	LJmct3VazbA/ATtmxA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnLi-0000000Ecm3-0SL7;
	Sat, 22 Aug 2026 15:09:34 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnLf-0000000Ecle-0Hf8
	for linux-mtd@lists.infradead.org;
	Sat, 22 Aug 2026 15:09:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc1469c1b83so2627521a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 22 Aug 2026 08:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787411370; cv=none;
        d=google.com; s=arc-20260327;
        b=I0A2YwHuOguV3hMHJQz0FezYYWvYX0LNkJtRhP664lJLkYhfdL2TgVukL04WU6QunT
         bvZGIB36G5X7qBWuEYojdxLATX0ZrIPDXWPZklgy3g2WjDghwXW0dZ5a+6X9qc1V17R5
         rDh+Ptgv6AhvEYwJVjoDtcW3c/GqtOtrx5aFYt0LieI8wuDuUo+8s3D7/2ZKtnqCowN9
         9R91g3Gb9UCWirbayP8cBp6xjx0H6eiPL3tLm5nU9OXHX/7ID5apUs2ocDsCIK+CqtXc
         iOR3zhF0R5MXUFnwa39MBv0fpuTagwxA711gQlya4AeIcR9Cp0gi8VMmX/KRnHgagOht
         FdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4FKhssDHDLD6z3Uz6hCJqOnkZNP8H/cOc+rhZgblwqo=;
        fh=RQaTMlshYsi3Ot5budhBbjfBarP8x3GcUOcFtAjckA0=;
        b=m/i+3TcPdt/Bf7ftskBVeccCGwDT/p2aT98HkE4eaiLbleWp9wyOwnC2XNyx1xsC54
         LyC42GxlNK8QxKW7NkuufsPTr8Ml1vDE1uTFttJNnuBdPH7f2qUr1SOvdkG1D6lO+Wah
         x31hC+WSoUSqrhJlBuDlCU/GLAGav0qLb6QtG3SzuA+zcM2YkStmUdUMOgsrfSz3F8fa
         PTo9nkbPxpZmwpIS32M4I5eZnOMAIWwaynFdesaTjbvaggvjbhH8r/0n0rME+DkpxyI8
         EBQp8MsLmdbbwZ0lrcryQ1QKpYPNvVIe4o7hxSpKTcLyfhmGlqa3oePSDduWReCz9NRp
         eVsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787411370; x=1788016170; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FKhssDHDLD6z3Uz6hCJqOnkZNP8H/cOc+rhZgblwqo=;
        b=ju52p1lacERbY+we2ThaKLIe3+32dHviTznKdmf7AaRn2iDT9ed9MVvjXHUfZqZAas
         QigvxJ2fxKrqcz9iNCnfJNVCFBRTobAqlOqtjucyIarXI4o87aXk1n1wbxwvMr8SXGhU
         Sn1bxwmAHyXIefFNyH0sU2USSaNVkElQK0cMXNzKVL2nJMh17GARkat6Uq73AmjV7et0
         rln/otqYNBVRa6I7KbAgi+HrL4TpOUGJGuORbCkOrvdq+KN4W5qBg1j/t576PFJBn+ps
         7hYSkFeK46WLQwsDpqfvD+iVJSvibPLV0N/F+p7C4sFHopvIpqSDCTSI6s66WaxAXyvx
         NxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787411370; x=1788016170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FKhssDHDLD6z3Uz6hCJqOnkZNP8H/cOc+rhZgblwqo=;
        b=JJKtKDnBWofIIDAjD4Uo1k5NroHeigOEyO9VvqaTiTSUPqT6a7isR+kmBcQpjkdmAk
         zXq9ib0/DFSg+AyN40NjEiIENfzg26PYKnfm8fG/u4zQtFs6UqJz4O+FlJeSPKp6Rthv
         rASQZSmTPoiFhpOkaQ78pIPyIoK2j9SlEpP/144UOYM87b2Jbvsj0evbc65Ip3IF/clD
         Of+GpbG/LQUZUOy2LAYvqVjf3XgK3V2QpG+lgEDUKRnrGDzh/gW0LQbP2DHiQ/ZeCdSw
         J2ebMK6s8xXSeB/r8B78IBRsuS+Hb1xSBPOE0XnODu8YC44QZ2okhwtiS0uhWxePGogt
         7HJw==
X-Forwarded-Encrypted: i=1; AHgh+RrxIHfekSSh5uRmjMDohZxhEZ8tK4JxzL2NzxChfPlVlAJDzoOa9tphbF+ThUVeFrKqX/lNBYF7nOU=@lists.infradead.org
X-Gm-Message-State: AFuF++nyHtRj07hpKYL7ZBp2wlMnkWE7QHMGqQ5LC9Bi94SPcnyBa1OV
	sSnckNcr4HtrsDZRyAjCk+TW/fDTl7lMwVOYDVwJ+caCV+s9qSYIxFM5Kg3INvrufA/AnNkGAWE
	XWWjdlt1r3bjtVX6OiGWLoqboEOPuLiY=
X-Gm-Gg: AR+sD12R0Yxe7iVqDeLtnyBoJ7AK57VfkIfFf2Lb5pHDY0MujAW5c4OoJPjvxgA16Sd
	9LXDxDeIKCZXEa8RQLdr5LuUlgfx84MQMQxDpjePhLdUSMqfJzDfMPqM/SWYtApLdyOlWUGwxA6
	yHazjxLgDzXgorj3lFT1tEGPJ7/8k4ZQIXAMRG2tE2n8WDlmd9JIH4b0KvFJbUoT9lX6nllnFFv
	jR1RGudF0q3kU/Fl6Sv+wOmbqivgQvT8W8sALLIbpQ37PrKYgImSA1iUCOutuiqOFENeIM3CqkV
	xVHN59GcGlTRtxKgMqitL2leP5UwDsLixFA8dreZo9KMR40JbkdH4NhewnSPWg0q6Am1FTnJU9c
	wnrdbG5FuGHuW9Q==
X-Received: by 2002:a05:6a00:179a:b0:847:8449:2ba6 with SMTP id
 d2e1a72fcca58-851f9f66789mr21261925b3a.8.1787411369706; Sat, 22 Aug 2026
 08:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260605084837.1875896-2-linchengming884@gmail.com> <OSZPR01MB77956D321DA7F2F6E17853A2BCA22@OSZPR01MB7795.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB77956D321DA7F2F6E17853A2BCA22@OSZPR01MB7795.jpnprd01.prod.outlook.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Sat, 22 Aug 2026 23:09:18 +0800
X-Gm-Features: AcwNN1X0qNB96WVvMDj8lOFOIhIncMh-u1tXgVTsDhUQ9LoAEfhLslvgYjQa1vI
Message-ID: <CAAyq3Saf5rCfZaR8oSKTU5i=GNJuKK-ny=V1afzO=d7qo5m2-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
To: Shiji Yang <yangshiji66@outlook.com>
Cc: alvinzhou@mxic.com.tw, chengminglin@mxic.com.tw, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, mwalle@kernel.org, pratyush@kernel.org, 
	richard@nod.at, takahiro.kuwano@infineon.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_080931_111705_064759A0 
X-CRM114-Status: GOOD (  27.42  )
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

SGksCgpTaGlqaSBZYW5nIDx5YW5nc2hpamk2NkBvdXRsb29rLmNvbT4g5pa8IDIwMjblubQ45pyI
MjLml6XpgLHlha0g5LiL5Y2IODowN+Wvq+mBk++8mgo+Cj4gT24gRnJpLCAgNSBKdW4gMjAyNiAx
Njo0ODozNiArMDgwMCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4KPiA+IEZyb206IENoZW5nIE1p
bmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPgo+ID4gQWRkIHN1cHBvcnQgZm9y
IE1hY3Jvbml4IE1YMjVMMTI4MzNGIGFuZCBNWDI1TDEyODQ1RyBTUEkgTk9SIGZsYXNoZXMuCj4g
PiBUaGVzZSBwYXJ0cyBzaGFyZSB0aGUgc2FtZSBKRURFQyBJRCAoMHhjMiwgMHgyMCwgMHgxOCkg
YXMgdGhlIGxlZ2FjeQo+ID4gTVgyNUwxMjgwNUQuCj4gPgo+ID4gVGhlIG5ld2VyIGZsYXNoZXMg
c3VwcG9ydCBTRkRQIGFuZCAxLTQtNCBQYWdlIFByb2dyYW0gaW4gMy1ieXRlIGFkZHJlc3MKPiA+
IG1vZGUsIGJ1dCB0aGlzIDRQUCBjYXBhYmlsaXR5IGlzIG5vdCBkZWZpbmVkIGluIHRoZWlyIFNG
RFAgdGFibGVzLgo+ID4gQ29udmVyc2VseSwgdGhlIGxlZ2FjeSBNWDI1TDEyODA1RCBsYWNrcyBT
RkRQIHN1cHBvcnQgZW50aXJlbHkgYW5kIGRvZXMKPiA+IG5vdCBzdXBwb3J0IDRQUC4KPiA+Cj4g
PiBUbyBzYWZlbHkgZW5hYmxlIDRQUCBmb3IgdGhlIG5ld2VyIGZsYXNoZXMgd2l0aG91dCBicmVh
a2luZyB0aGUgbGVnYWN5Cj4gPiBwYXJ0LCBpbnRyb2R1Y2UgYSBwb3N0X3NmZHAgZml4dXAuIFNp
bmNlIHRoZSBsZWdhY3kgTVgyNUwxMjgwNUQgZG9lcwo+ID4gbm90IHN1cHBvcnQgU0ZEUCwgaXQg
ZmFsbHMgYmFjayB0byBzdGF0aWMgcGFyYW1ldGVycyBhbmQgd2lsbCBuZXZlcgo+ID4gZXhlY3V0
ZSB0aGUgcG9zdF9zZmRwIGhvb2suIFRoZSBuZXdlciBmbGFzaGVzIHdpbGwgc3VjY2Vzc2Z1bGx5
IHBhcnNlCj4gPiB0aGUgU0ZEUCwgdHJpZ2dlciB0aGUgaG9vaywgYW5kIHNhZmVseSBhcHBlbmQg
dGhlIFNOT1JfSFdDQVBTX1BQXzFfNF80Cj4gPiBjYXBhYmlsaXR5Lgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXgu
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gaW5kZXggZTk3ZjVjYmQ5Li4x
YWRiNzk4MzIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMK
PiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gQEAgLTgzLDYgKzgz
LDI1IEBAIG14MjVsMzI1NWVfbGF0ZV9pbml0X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+
ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW50Cj4gPiArbXgyNWwx
MjgwNWRfNHBwM2JfcG9zdF9zZmRwX2ZpeHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ID4gK3sK
PiA+ICsgICAgIHN0cnVjdCBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlciAqcGFyYW1zID0gbm9yLT5w
YXJhbXM7Cj4gPiArCj4gPiArICAgICAvKgo+ID4gKyAgICAgICogSkVERUMgSUQgMHhjMjIwMTgg
aXMgc2hhcmVkIGJ5IE1YMjVMMTI4MDVEIChubyBTRkRQLCBubyA0UFApIGFuZAo+ID4gKyAgICAg
ICogTVgyNUwxMjgzM0YvTVgyNUwxMjg0NUcgKHN1cHBvcnQgU0ZEUCBhbmQgNFBQIGluIDMtYnl0
ZSBtb2RlKS4KPiA+ICsgICAgICAqIFRoZSBsZWdhY3kgMDVEIGxhY2tzIFNGRFAgYW5kIHdpbGwg
bm90IGV4ZWN1dGUgdGhpcyBob29rLiBGb3IKPiA+ICsgICAgICAqIHRoZSBuZXdlciBmbGFzaGVz
LCAzLWJ5dGUgMS00LTQgUFAgaXMgbm90IGRlZmluZWQgaW4gU0ZEUCwgc28KPiA+ICsgICAgICAq
IHdlIHNhZmVseSBlbmFibGUgaXQgaGVyZS4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgcGFyYW1z
LT5od2NhcHMubWFzayB8PSBTTk9SX0hXQ0FQU19QUF8xXzRfNDsKPiA+ICsgICAgIHNwaV9ub3Jf
c2V0X3BwX3NldHRpbmdzKCZwYXJhbXMtPnBhZ2VfcHJvZ3JhbXNbU05PUl9DTURfUFBfMV80XzRd
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1BJTk9SX09QX1BQXzFfNF80LCBT
Tk9SX1BST1RPXzFfNF80KTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsK
PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBzIG14MjVsMjU2MzVfZml4dXBz
ID0gewo+ID4gICAgICAgLnBvc3RfYmZwdCA9IG14MjVsMjU2MzVfcG9zdF9iZnB0X2ZpeHVwcywK
PiA+ICAgICAgIC5wb3N0X3NmZHAgPSBtYWNyb25peF9xcHA0Yl9wb3N0X3NmZHBfZml4dXBzLAo+
ID4gQEAgLTk2LDYgKzExNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBz
IG14MjVsMzI1NWVfZml4dXBzID0gewo+ID4gICAgICAgLmxhdGVfaW5pdCA9IG14MjVsMzI1NWVf
bGF0ZV9pbml0X2ZpeHVwcywKPiA+ICB9Owo+ID4KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNw
aV9ub3JfZml4dXBzIG14MjVsMTI4MDVkXzRwcDNiX2ZpeHVwcyA9IHsKPiA+ICsgICAgIC5wb3N0
X3NmZHAgPSBteDI1bDEyODA1ZF80cHAzYl9wb3N0X3NmZHBfZml4dXBzLAo+Cj4gSXQgc2VlbXMg
dGhhdCB0aGlzIGZpeHVwIHdvbid0IGJlIGNhbGxlZCBhdCBhbGwgYmVjYXVzZSB0aGUgZHVhbC9x
dWFkCj4gaW8gc3VwcG9ydCBpcyBtaXNzaW5nLiBTZWU6CgpTaW5jZSB0aGUgTVgyNUwxMjgwNUQg
b25seSBzdXBwb3J0cyBzaW5nbGUgSS9PIHJlYWQsIHRoZXNlIGZsYWdzIGNhbm5vdApiZSBhZGRl
ZC4gUGxlYXNlIHJlZmVyIHRvIHRoZSBkYXRhc2hlZXQgZm9yIGRldGFpbHM6CgpMaW5rOiBodHRw
czovL3d3dy5hbGxkYXRhc2hlZXQuY29tL2RhdGFzaGVldC1wZGYvdmlldy8yNjc5MTYvTUNOSVgv
TVgyNUwxMjgwNUQuaHRtbAoKQWRkaXRpb25hbGx5LCBwbGVhc2UgcmVmZXIgdG8gdGhpcyBwYXRj
aCwgd2hpY2ggbWFpbmx5IGFkZHJlc3NlcyB0aGUKZGVwcmVjYXRlZCBTRkRQIHBhcnNpbmcgaXNz
dWU6CgpMaW5rOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRk
L2NvdmVyLzIwMjYwNzEzMDkxMjA2LjI0MTQ0MDAtMS1td2FsbGVAa2VybmVsLm9yZy8iCgpUaGVy
ZWZvcmUsIG15IHBhdGNoIGlzIGV4cGVjdGVkIHRvIGJlIG1lcmdlZCBhbG9uZ3NpZGUgdGhlICdS
ZXdvcmsgZmxhc2gKcGFyYW1ldGVyIGluaXRpYWxpemF0aW9uJyBwYXRjaCwgd2hpY2ggc2hvdWxk
IHJlc29sdmUgdGhlIGlzc3VlIHlvdSBicm91Z2h0CnVwLgoKPgo+ICAgICAgICAgaWYgKG5vci0+
aW5mby0+bm9fc2ZkcF9mbGFncyAmIChTUElfTk9SX0RVQUxfUkVBRCB8Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNQSV9OT1JfUVVBRF9SRUFEIHwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1BJX05PUl9PQ1RBTF9SRUFEIHwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1BJX05PUl9PQ1RBTF9EVFJf
UkVBRCkpCj4gICAgICAgICAgICAgICAgIHNwaV9ub3Jfc2ZkcF9pbml0X3BhcmFtc19kZXByZWNh
dGVkKG5vcik7Cj4KPiA+ICt9Owo+ID4gKwo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hf
aW5mbyBtYWNyb25peF9ub3JfcGFydHNbXSA9IHsKPiA+ICAgICAgIHsKPiA+ICAgICAgICAgICAg
ICAgLmlkID0gU05PUl9JRCgweGMyLCAweDIwLCAweDEwKSwKPiA+IEBAIC0xMzAsOSArMTUzLDEw
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBtYWNyb25peF9ub3JfcGFydHNbXSA9
IHsKPiA+ICAgICAgICAgICAgICAgLnNpemUgPSBTWl84TSwKPiA+ICAgICAgICAgICAgICAgLm5v
X3NmZHBfZmxhZ3MgPSBTRUNUXzRLLAo+ID4gICAgICAgfSwgewo+ID4gLSAgICAgICAgICAgICAv
KiBNWDI1TDEyODA1RCAqLwo+ID4gKyAgICAgICAgICAgICAvKiBNWDI1TDEyODA1RCwgTVgyNUwx
MjgzM0YsIE1YMjVMMTI4NDVHICovCj4gPiAgICAgICAgICAgICAgIC5pZCA9IFNOT1JfSUQoMHhj
MiwgMHgyMCwgMHgxOCksCj4gPiAgICAgICAgICAgICAgIC5mbGFncyA9IFNQSV9OT1JfSEFTX0xP
Q0sgfCBTUElfTk9SXzRCSVRfQlAsCj4gPiArICAgICAgICAgICAgIC5maXh1cHMgPSAmbXgyNWwx
MjgwNWRfNHBwM2JfZml4dXBzLAo+ID4gICAgICAgfSwgewo+ID4gICAgICAgICAgICAgICAvKiBN
WDI1TDI1NjM1RSwgTVgyNUwyNTY0NUcgKi8KPiA+ICAgICAgICAgICAgICAgLmlkID0gU05PUl9J
RCgweGMyLCAweDIwLCAweDE5KSwKPiA+IC0tCj4gPiAyLjI1LjEKPiA+Cj4KPiBSZWdhcmRzLAo+
IFNoaWppIFlhbmcKCkJlc3QgUmVnYXJkcywKQ2hlbmcgTWluZyBMaW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
