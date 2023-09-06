Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50FEB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uZS1TrV3L1efklysD0Q9hzZDjTZgrQ45HkiCy/8qYI=; b=T3r3mi9HepJduw
	o8nGaNFb3pDzvnnTkp0DmSlS+s/B6A+zZwvpfuHtfzUZk4JyYRwcWg3izmoVgTXzDOxIVDGtIAqpy
	b6HUfcmas0Xb1MTB6HMFq0IsgiHNQ/K0PUErCHhMeY5yfqAIZMW2On3nJ2Qumhnw1Bm60DVLVfc+d
	n2x/WRgsWZLcHGHZAE9Czxrp7Mh5LNYNj3d52Vffq8sa1+3+bqHQum10/WIgENwDQtykK+k/fl8HD
	Cqt+Oz/so0GXbquVlxRq//9GDycAPuhVon1G2UVgTRA4d4dWYdtHNcsE0LTklhxBBvDDFzvbinbgL
	FWp6xqvIM112JSJXVC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmwu-007UuY-0s;
	Wed, 06 Sep 2023 07:27:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmwr-007Utb-1G
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:27:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31c63cd4ec2so2727008f8f.0
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693985256; x=1694590056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX/weMQ3J6ww3ffgmD4NdLSK/iRDp7usNY4rR9fYha8=;
        b=ct4Be31rEuNQxZNt+yvSfGbBGGaXaNNv0772W6Li+kj53nwz89td1vEQOLVN4K/qcz
         kulXcZWR2kKHuBa86tMsw1emnlgTPN9nKs2ifNti8/I/DeyT8dlAXPpsZppcGsxPmXCK
         Y7X1egMTs32AqgryU/zugIyNyXCuNhJDwaIauolqH2xf5xAczKjDIFe5umYbXwpzcYh4
         S40eg2ed/erRBX/G2Mr9NL1V8ZtO+6STI1ErXDUAvJeD7rDk+EejegogyF8bzaUmdvpN
         JhWCWOvQhWbEZ5tEoAcnILWaW16lHN8ctF+pzzhpXkXONhegi1LRcvQd8g/MATZRznkX
         hF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693985256; x=1694590056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hX/weMQ3J6ww3ffgmD4NdLSK/iRDp7usNY4rR9fYha8=;
        b=RtRvpByhxr95ZaLdLq0S+Ag3tFXtktOSgbMnE8UweqQT6BpP07OBWYoIWgvNb6MYFr
         p29zWFehaZwC+P4eMsaPv5Q2kXaIs64xVx/QOqntwzLPOFtcx9NJE2BTUJprOjcDLqrp
         YmHp2hY4MGo8XKdiB29ZumJ19WXAKSV5vystYS28JLJrYoIC60OAjN8HWEUS/6P4DFqo
         BnWZnvI2lFIjiPQSOb7Zi2MDeZG++cLXlN30zDFzC9cu722XujuFXslAJXFCKvx41JAg
         MU6lsIi095j/qZ8s7yMCQsaKOUJln7+v1FnhH5WGLXBQhYTYmP4dsrOeGmFLr4U3x17T
         6bYQ==
X-Gm-Message-State: AOJu0YxShZrdw+kVuNRT6uPQeElS9irLzc7xb5q9eGbzKvl2WcszVCo/
	P0O0qGvRNMYPrUZNUb7yP974Pp6m/MgL3WdYUb8Uh17d5bE=
X-Google-Smtp-Source: AGHT+IFkfSPhimej8VnmrqTX8vU6gGjPVvI98II2VZsohAfCFaV9u7OWrzvp1ir+blFo+1kkRRkLiSmxIPbG0FOGqO8=
X-Received: by 2002:adf:e610:0:b0:318:f7a:e3c8 with SMTP id
 p16-20020adfe610000000b003180f7ae3c8mr1428890wrm.57.1693985255711; Wed, 06
 Sep 2023 00:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
 <dd4b7c09-64cf-4041-4dad-cd3d43340f98@huawei.com> <52ba4755-ade0-4b4a-f4a2-13160bb6129b@huawei.com>
 <CAM===sQ+-2A=R_Rn4iiLyaVsBh0Y1Dp8QDeT2fevEiWCfLtmnw@mail.gmail.com> <212e499d-324a-d553-2a2c-35bec47195db@huawei.com>
In-Reply-To: <212e499d-324a-d553-2a2c-35bec47195db@huawei.com>
From: Leon Pollak <leon.pollak@gmail.com>
Date: Wed, 6 Sep 2023 10:27:24 +0300
Message-ID: <CAM===sSTKnmRdRx-LwJ50G4P4Er8+gfQ0vznEYOsqi63_UFaQQ@mail.gmail.com>
Subject: Re: Can't find correct configuration
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_002737_447380_D02B7EE7 
X-CRM114-Status: GOOD (  28.34  )
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

SSB3b3JrIG9uIGVtYmVkZGVkIGRldmljZS4gVGhlIHJlc3Qgb2YgdGhlIE5BTkQgaXMgdXNlZCBm
b3IgU1BMLApVLUJvb3QsIFUtQm9vdCBlbnZpcm9ubWVudCBhbmQga2VybmVsLgpXaGF0IGlzIGxl
ZnQgaXMgMjQ4TWlCLgpJIGFtIG5vdCBzdXJlIEkgY2FuIHVzZSB0aGUgd2hvbGUgc3BhY2UgZm9y
IFVCSSAtIGhvdyB3aWxsIHRoZSBTUEwvVS1Cb290IHdvcms/CgpPbiBXZWQsIDYgU2VwdCAyMDIz
IGF0IDEwOjIxLCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToK
Pgo+IOWcqCAyMDIzLzkvNiAxNDo1NywgTGVvbiBQb2xsYWsg5YaZ6YGTOgo+ID4gVGhvdXNhbmRz
IG9mIHRoYW5rcywgWmhpaGFvIENoZW5nISEhCj4gPiBJdCB3b3JrZWQgZXhhY3RseSBhcyB5b3Ug
d3JvdGUuCj4gPiBUaGUgb25seSBxdWVzdGlvbiByZW1haW5lZCBpczoKPiA+IE15IHBhcnRpdGlv
biBzaXplIGlzIDI0OE1pQi4KPiA+IEkgdGhvdWdodCB0aGF0IGxlYXZpbmcgOE1pQiAic3BhcmUn
IHdpbGwgYmUgdXNlZCBqdXN0IGZvciB0aGVzZQo+ID4gcmVzZXJ2ZWQgUEVCcywgYnV0IG5vdyBJ
IHVuZGVyc3RhbmQgdGhpcyB3YXMgaW5jb3JyZWN0Lgo+ID4gU28sIG1heSBJIHV0aWxpemUgdGhl
c2UgOE1pQiBiYWNrIG9yIHdpbGwgdGhleSBzdGlsbCBiZSB1c2VkIGJ5IFVCSQo+ID4gZm9yIHNv
bWV0aGluZz8KPiA+Cj4KPiBJIGJlbGlldmUgeW91IGhhdmUgdHdvIG10ZCBkZXZpY2VzLCAyNDhN
KG10ZDAgZm9yIHViaSkgYW5kIDhNKHJlc2VydmVkLAo+IHdvbid0IGJlIGFjY2Vzc2VkIGJ5IFVC
SSkgbm93LiBQbGVhc2UgZG9uJ3Qgc3BsaXQgdGhlIDI1Nk0gaW50byB0d28gbXRkCj4gZGV2aWNl
cyBpZiB5b3Ugb25seSBuZWVkIDEgVUJJIGRldmljZSwganVzdCBmb3JtYXQgdGhlIHdob2xlIGZs
YXNoKDI1Nk0pCj4gaW50byBVQkksIGFuZCBVQkkgaXRzZWxmIHdpbGwgaGFuZGxlIGl0cyByZXNl
cnZhdGlvbiB3aXRob3V0IHVzZXIKPiBpbnRlcnZlbmluZy4KPgo+ID4gT24gV2VkLCA2IFNlcHQg
MjAyMyBhdCAwNTo1MCwgWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3Jv
dGU6Cj4gPj4KPiA+PiDlnKggMjAyMy85LzYgMTA6NDIsIFpoaWhhbyBDaGVuZyDlhpnpgZM6Cj4g
Pj4+IOWcqCAyMDIzLzkvNSAyMjo0NSwgTGVvbiBQb2xsYWsg5YaZ6YGTOgo+ID4+PiBIaQo+ID4+
Pj4gSGVsbG8sIGFsbC4KPiA+Pj4+IEkgd2lsbCBiZSB2ZXJ5IHZlcnkgdGhhbmtmdWwgZm9yIHRo
ZSBoZWxwIHRvIGZpbmQgdGhlIGNvcnJlY3QKPiA+Pj4+IGNvbmZpZ3VyYXRpb24gZm9yIG15IE5B
TkQuCj4gPj4+PiBJIHBhc3NlZCB0aHJvdWdoIGEgbG90IG9mIG1haWxzIGluIHRoZSBsaXN0cyBh
bmQgZ29vZ2xlIGFuZCBDaGF0R1BUIC0KPiA+Pj4+IG5vIHN1Y2Nlc3MuCj4gPj4+PiBJIGhhdmUg
MjU2TUIgTkFORCBhbmQgMjQ4TUIgcGFydGl0aW9uIGZvciBVQklGUy4gSSBydW46Cj4gPj4+PiBt
a2ZzLnViaWZzIC12IC1yIHJvb3RmcyAtRiAtbSAyMDQ4IC1lIDEyNjk3NiAtYyAxOTgxIC1vIC4v
dWJpZnMuaW1nCj4gPj4+PiB1YmluaXplIC12IC1vIHJvb3Rmcy5pbWcgLW0gMjA0OCAtcCAxMjhL
aUIgLXMgNTEyIC1PIDIwNDggdWJpbml6ZS5jZmcKPiA+Pj4+IC0tLS0tCj4gPj4+PiBhbmQgdWJp
bml6ZS5jZmcgbG9va3MgbGlrZToKPiA+Pj4+IFt1Ymlmc10KPiA+Pj4+IG1vZGU9dWJpCj4gPj4+
PiBpbWFnZT0uL3ViaWZzLmltZwo+ID4+Pj4gdm9sX2lkPTAKPiA+Pj4+IHZvbF9zaXplPTI0ME1p
Qgo+ID4+Pj4gdm9sX3R5cGU9ZHluYW1pYwo+ID4+Pj4gdm9sX25hbWU9dWJpX3Jvb3Rmcwo+ID4+
Pj4gdm9sX2FsaWdubWVudD0xCj4gPj4+PiB2b2xfZmxhZ3M9YXV0b3Jlc2l6ZQo+ID4+Pj4gLS0t
LS0tCj4gPj4+PiBLZXJuZWwgY29uZmlndXJhdGlvbiAgd2FzIHdpdGggQ09ORklHX01URF9VQklf
QkVCX0xJTUlUPTIwLgo+ID4+Pj4gYW5kIGhlcmUgaXMgdGhlIGtlcm5lbCBsb2c6Cj4gPj4+PiBb
ICAgIDIuNjk1NjU5XSB1YmkwOiBhdHRhY2hpbmcgbXRkNAo+ID4+Pj4gWyAgICAzLjM3MjM0M10g
dWJpMDogc2Nhbm5pbmcgaXMgZmluaXNoZWQKPiA+Pj4+IFsgICAgMy4zODMwNjZdIHViaTAgd2Fy
bmluZzogdWJpX2ViYV9pbml0OiBjYW5ub3QgcmVzZXJ2ZSBlbm91Z2ggUEVCcwo+ID4+Pj4gZm9y
IGJhZCBQRUIgaGFuZGxpbmcsIHJlc2VydmVkIDQsIG5lZWQgNDAKPiA+Pj4+IFsgICAgMy40MDQz
MjBdIHViaTA6IHZvbHVtZSAwICgidWJpX3Jvb3RmcyIpIHJlLXNpemVkIGZyb20gMTk4MiB0bwo+
ID4+Pj4gMTk4MiBMRUJzCj4gPj4+PiBbICAgIDMuNDExNjY3XSB1YmkwOiBhdHRhY2hlZCBtdGQ0
IChuYW1lICJGUyIsIHNpemUgMjQ4IE1pQikKPiA+Pj4+IFsgICAgMy40MTcwOTVdIHViaTA6IFBF
QiBzaXplOiAxMzEwNzIgYnl0ZXMgKDEyOCBLaUIpLCBMRUIgc2l6ZToKPiA+Pj4+IDEyNjk3NiBi
eXRlcwo+ID4+Pj4gWyAgICAzLjQyNDAwNl0gdWJpMDogbWluLi9tYXguIEkvTyB1bml0IHNpemVz
OiAyMDQ4LzIwNDgsIHN1Yi1wYWdlCj4gPj4+PiBzaXplIDUxMgo+ID4+Pj4gWyAgICAzLjQzMDc0
MF0gdWJpMDogVklEIGhlYWRlciBvZmZzZXQ6IDIwNDggKGFsaWduZWQgMjA0OCksIGRhdGEKPiA+
Pj4+IG9mZnNldDogNDA5Ngo+ID4+Pj4gWyAgICAzLjQzNzczNF0gdWJpMDogZ29vZCBQRUJzOiAx
OTkwLCBiYWQgUEVCczogMCwgY29ycnVwdGVkIFBFQnM6IDAKPiA+Pj4+IFsgICAgMy40NDM4NjBd
IHViaTA6IHVzZXIgdm9sdW1lOiAxLCBpbnRlcm5hbCB2b2x1bWVzOiAxLCBtYXguIHZvbHVtZXMK
PiA+Pj4+IGNvdW50OiAxMjgKPiA+Pj4+IFsgICAgMy40NTExMTddIHViaTA6IG1heC9tZWFuIGVy
YXNlIGNvdW50ZXI6IDEvMCwgV0wgdGhyZXNob2xkOiA0MDk2LAo+ID4+Pj4gaW1hZ2Ugc2VxdWVu
Y2UgbnVtYmVyOiAxNTkwNTcwMDczCj4gPj4+PiBbICAgIDMuNDYwMjk1XSB1YmkwOiBhdmFpbGFi
bGUgUEVCczogMCwgdG90YWwgcmVzZXJ2ZWQgUEVCczogMTk5MCwKPiA+Pj4+IFBFQnMgcmVzZXJ2
ZWQgZm9yIGJhZCBQRUIgaGFuZGxpbmc6IDQKPiA+Pj4+IFsgICAgMy40Njk1NzVdIHViaTA6IGJh
Y2tncm91bmQgdGhyZWFkICJ1YmlfYmd0MGQiIHN0YXJ0ZWQsIFBJRCAxMzEKPiA+Pj4+IFsgICAg
NC42NDg3MThdIFVCSUZTICh1YmkwOjApOiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpZnNfYmd0MF8w
Igo+ID4+Pj4gc3RhcnRlZCwgUElEIDEzNgo+ID4+Pj4gWyAgICA0LjY3NjY0MF0gVUJJRlMgKHVi
aTA6MCk6IHN0YXJ0IGZpeGluZyB1cCBmcmVlIHNwYWNlCj4gPj4+PiBbICAgMTAuMjUwMDk5XSBV
QklGUyAodWJpMDowKTogZnJlZSBzcGFjZSBmaXh1cCBjb21wbGV0ZQo+ID4+Pj4gWyAgIDEwLjI2
OTA0Nl0gVUJJRlMgKHViaTA6MCk6IFVCSUZTOiBtb3VudGVkIFVCSSBkZXZpY2UgMCwgdm9sdW1l
IDAsCj4gPj4+PiBuYW1lICJ1Ymlfcm9vdGZzIgo+ID4+Pj4gWyAgIDEwLjI3NjgzMF0gVUJJRlMg
KHViaTA6MCk6IExFQiBzaXplOiAxMjY5NzYgYnl0ZXMgKDEyNCBLaUIpLAo+ID4+Pj4gbWluLi9t
YXguIEkvTyB1bml0IHNpemVzOiAyMDQ4IGJ5dGVzLzIwNDggYnl0ZXMKPiA+Pj4+IFsgICAxMC4y
ODY3OTRdIFVCSUZTICh1YmkwOjApOiBGUyBzaXplOiAyNTAxNDI3MjAgYnl0ZXMgKDIzOCBNaUIs
IDE5NzAKPiA+Pj4+IExFQnMpLCBqb3VybmFsIHNpemUgOTAyMzQ4OCBieXRlcyAoOCBNaUIsIDcy
IExFQnMpCj4gPj4+PiBbICAgMTAuMjk3NTQwXSBVQklGUyAodWJpMDowKTogcmVzZXJ2ZWQgZm9y
IHJvb3Q6IDAgYnl0ZXMgKDAgS2lCKQo+ID4+Pj4gWyAgIDEwLjMwMzQwNl0gVUJJRlMgKHViaTA6
MCk6IG1lZGlhIGZvcm1hdDogdzQvcjAgKGxhdGVzdCBpcyB3NS9yMCksCj4gPj4+PiBVVUlEIEEx
NEQ1ODZBLTMyRTItNDVENy1BMDdFLUJEQzQ3MkZERjMxRCwgc21hbGwgTFBUIG1vZGVsCj4gPj4+
Pgo+ID4+Pj4gTXkgcXVlc3Rpb24gaXM6IHdoeSBkb2VzIHRoaXMgd2FybmluZyBhYm91dCByZXNl
cnZlZCA0LCBuZWVkZWQgNDAKPiA+Pj4+IGFwcGVhcj8gSG93IGNhbiBJIHNvbHZlIHRoaXM/Cj4g
Pj4+Pgo+ID4+Pgo+ID4+PiBTb2x1dGlvbjogTW9kaWZ5IHViaW5pemUuY2ZnLCAgdm9sX3NpemU9
MjQwTWlCIC0+IHZvbF9zaXplPTIzNU1pQgo+ID4+Pgo+ID4+PiBXaHkgZG9lcyB0aGlzIHdhcm5p
bmcgYWJvdXQgcmVzZXJ2ZWQgNCwgbmVlZGVkIDQwIGFwcGVhcj8KPiA+Pj4gVGhlIGNvdW50IG9m
IGJhZCBQRUJzIHJlc2VydmVkIGJ5IFVCSSBpczogdG90YWxfcGVicyhuYW5kIGNoaXApICoKPiA+
Pj4gQ09ORklHX01URF9VQklfQkVCX0xJTUlULzEwMjQgPSAyMDQ4ICogIDIwIC8gMTAyNCA9IDQw
Cj4gPj4+IFdoZW4gZmFzdG1hcCBpcyBub3QgZW5hYmxlZCwgdGhlIGNvdW50IG9mIGludGVybmFs
IFBFQnMgcmVzZXJ2ZWQgYnkgVUJJCj4gPj4+IGlzOiBVQklfTEFZT1VUX1ZPTFVNRV9FQlNbMl0g
KyBXTF9SRVNFUlZFRF9QRUJTWzFdICsKPiA+Pj4gRUJBX1JFU0VSVkVEX1BFQlNbMV0gPSA0Cj4g
Pj4+Cj4gPj4+IFRvdGFsIFBFQnMgZm9yIFVCSSBpcyAxOTkwKGdvb2QgUEVCczogMTk5MCksIHRo
ZSBtYXggY291bnQgb2YgdXNlcgo+ID4+PiB2b2x1bWUgUEVCcyBpcyAxOTkwIC0gNDAgLSA0ID0g
MTk0Ngo+ID4+Pgo+ID4+PiBJbiB1YmluaXplLmNmZywgdm9sX3NpemU9MjQwTWlCLCB0aGUgY291
bnQgb2YgdXNlciB2b2x1bWUgUEVCcyBpcyhzZWUKPiA+Pj4gdWJpbml6ZS5jIGluIG10ZHVpdGxz
KTogdmlfc2l6ZSArIChsZWJfc2l6ZSAtIDEpIC8gbGViX3NpemUKPiA+Pj4gdmlfc2l6ZSA9IDI0
ME0gPSAyNDAgKiAxMDI0ICogMTAyNAo+ID4+PiBsZWJfc2l6ZSA9IDEyOEsgLSAySyhlYykgLSAy
Syh2aWQpID0gMTI0ICogMTAyNAo+ID4+PiByZXN1bHQgPSAxOTgyCj4gPj4+Cj4gPj4+IFNvIHRo
ZXJlIGFyZSAxOTkwIC0gMTk4MiAtIDQgPSA0IFBFQnMgcmVzZXJ2ZWQgZm9yIGJhZCBQRUIgaGFu
ZGxpbmcsCj4gPj4+IHdoaWNoIGlzIGxlc3MgdGhhbiA0MC4KPiA+Pj4KPiA+Pj4gV2hlbiB3ZSBz
ZXQgIHZvbF9zaXplPTIzNU1pQiwgdGhlIGNvdW50IG9mIHVzZXIgdm9sdW1lIFBFQnMgaXM6ICgy
MzUgKgo+ID4+PiAxMDI0ICogMTAyNCArIDEyNCAqIDEwMjQgLSAxKSAvICgxMjQgKiAxMDI0KSA9
IDE5NDEKPiA+Pj4gMTk5MCAtIDQgLSA0MCA9IDE5NDYsIGZpbmFsbHkgbWF5YmUgdGhlcmUgaXMg
bWVzc2FnZSBmcm9tIGtlcm5lbCBsaWtlCj4gPj4+ICIoInViaV9yb290ZnMiKSByZS1zaXplZCBm
cm9tIDE5NDEgdG8gMTk0NiBMRUJzIi4KPiA+Pgo+ID4+IEFjdXRhbGx5LCB0aGUgJ3ZvbF9zaXpl
JyBpbiB1YmluaXplLmNmZyBtZWFucyB0aGUgc2l6ZSBvZiBkYXRhIG9uCj4gPj4gdm9sdW1lKGV4
Y2x1ZGUgdmlkL2VjKSwgbm90IHRoZSBzaXplIG9mIHZvbHVtZShpbmNsdWRlIHZpZC9lYykuCj4g
Pj4KPiA+Cj4gPiAuCj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
