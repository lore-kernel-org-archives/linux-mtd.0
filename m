Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BACC169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:36:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A107221917
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 08:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LptwEiPN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="gl6TpMEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A107221917
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pLI7Xs/Z04NLcfOlV9NzZ94fZUx6/xX5ulqVvj4eqk=; b=LptwEiPN4VjUCN
	LS3/26uFgsFpSRVgi19p6Q7d+WaPzc/U+C4/icDGcb8YWAHKxjKon2rw04x3NmyVFPzzbR6q+BGRE
	k4XxWeOUz3HIN9xiL4evRMfoIoKPGhcZRHZxr2So5TPyNsUypUY2Mgfngz/2mPfjMcrrnQ2kKQtXi
	QKS25w63kyrLcIsGIcUnB8FAlrKDK7QReSa79IXLULy0yRHSArDG/WvwR+6gqrGa/ttptpS32oBCp
	laml8UcuN/Ch5jxp+72VgUibhNywWByq+NrrPw4f93Mq3tT/lq4Ofh/AA6FPSfwnCSzYu/Qk5aRck
	0JrX+l/odiZ3gLFfpiqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs1eH-00032t-0g; Fri, 08 Feb 2019 08:36:37 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs1eD-000327-HG
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 08:36:35 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x188a9dp019973
 for <linux-mtd@lists.infradead.org>; Fri, 8 Feb 2019 17:36:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x188a9dp019973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549614970;
 bh=PpHo9P0D09VD5/dyO22w85nqV153LJU03tZXAAWBYiM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gl6TpMEnIXEX8docnt9el5eM1Dn8aOQlJNUFlr7Xv0gVaaQtq62MD5mtnmA3Do5zS
 4PIQNV8opjcjiwws/r33vpQYAMPZhBbN3AjAkx1h0uR6GcQ3SVymIXgCJxqe5pachv
 xgbugfB6gJVFW61TCsHnabBDd7rO0IK9ExT2VXL3drQzlOmb5PRV2YDg0rHSYR95wR
 ZdJ+l3WlFpbonOs/h7maRLqGhgI1K/QI+UdvY3QeaxeDwX2mjEX0wMnKFCPhYNBoRt
 01TeRSxnlXWXv9wbyihqvo6xRRq4G2oS/98mTdLcMJ11C4AC2wFJN09ZWECWOXSp8e
 a7c8GDaamqs0g==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id u11so1615558vsp.11
 for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2019 00:36:10 -0800 (PST)
X-Gm-Message-State: AHQUAuZfjLmnVJGWWmtSwOZd5JDZa3+YuVU25CFn+gmefRvhWuZr0KWS
 IVUNmTHYANEjdDoAN3v4ICi1/zwISBV8avy0VCA=
X-Google-Smtp-Source: AHgI3IZCLBk6hds9PIW/wT0loACA9VmSYVFfLSO5Iv3D3d/XbliBS8ImEeK+snQAV89GTnlzJyD0bkTzk51mO6u2tZY=
X-Received: by 2002:a67:f759:: with SMTP id w25mr2731202vso.215.1549614968903; 
 Fri, 08 Feb 2019 00:36:08 -0800 (PST)
MIME-Version: 1.0
References: <1549533476-3742-1-git-send-email-yamada.masahiro@socionext.com>
 <20190207111606.6b72dc34@xps13>
 <CAK7LNASEvAUeJsBcp4eh+XW+gaVp921SU-d1m-DEs+Hs+YA8TA@mail.gmail.com>
 <20190207140136.2ae62982@xps13>
In-Reply-To: <20190207140136.2ae62982@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Feb 2019 17:35:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7P8iEkhyRBbHLdt6yN-dDgpLZOs256qwk2BpADiGcGw@mail.gmail.com>
Message-ID: <CAK7LNAQ7P8iEkhyRBbHLdt6yN-dDgpLZOs256qwk2BpADiGcGw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: call onfi_fill_data_interface() once again
 after nand_detect
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_003633_789517_5AD5EF9F 
X-CRM114-Status: GOOD (  29.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SEkgTWlxdWVsLAoKT24gVGh1LCBGZWIgNywgMjAxOSBhdCAxMDowMiBQTSBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIE1hc2FoaXJvLAo+Cj4g
TWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gd3JvdGUgb24g
VGh1LCA3IEZlYgo+IDIwMTkgMTk6NDY6NTQgKzA5MDA6Cj4KPiA+IE9uIFRodSwgRmViIDcsIDIw
MTkgYXQgNzoxNiBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gSGkgTWFzYWhpcm8sCj4gPiA+Cj4gPiA+IE1hc2FoaXJvIFlhbWFk
YSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlIG9uIFRodSwgIDcgRmViCj4g
PiA+IDIwMTkgMTg6NTc6NTYgKzA5MDA6Cj4gPiA+Cj4gPiA+ID4gbmFuZF9zY2FuX2lkZW50KCkg
Y2FsbHMgb25maV9maWxsX2RhdGFfaW50ZXJmYWNlKCkgYXQgaXRzIGVudHJ5Cj4gPiA+ID4gdG8g
c2V0IHVwIHRoZSBpbml0aWFsIHRpbWluZyBwYXJhbWV0ZXJzLgo+ID4gPiA+Cj4gPiA+ID4gVGhl
IHRpbWluZyBwYXJhbWV0ZXJzIGFyZSBuZWVkZWQgbm90IG9ubHkgZm9yIC0+c2V0dXBfZGF0YV9p
bnRlcmZhY2UoKSwKPiA+ID4gPiBidXQgYWxzbyBmb3IgZ2l2aW5nIHRoZSBjb3JyZWN0IGRlbGF5
IHRvIE5BTkRfT1BfV0FJVF9SRFksIGZvciBleGFtcGxlLgo+ID4gPiA+Cj4gPiA+ID4gSWYgdGhl
IGRyaXZlciBzZXRzIHRoZSBOQU5EX0tFRVBfVElNSU5HUyBmbGFnLCBvciBkb2VzIG5vdCBzdXBw
b3J0Cj4gPiA+ID4gLT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpIGhvb2ssIHRob3NlIHBhcmFtZXRl
cnMgd2lsbCBuZXZlciB1cGRhdGVkLgo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGJlCj4gPgo+ID4gV2lsbCBm
aXggKGlmIHYyIGlzIHdlbGNvbWUpCj4gPgo+ID4KPiA+ID4gPgo+ID4gPiA+IEJlZm9yZSBuYW5k
X2RldGVjdCgpLCB3ZSBuZXZlciBrbm93IHdoZXRoZXIgdGhlIGNoaXAgaXMgT05GaSBvciBub3Qu
Cj4gPiA+ID4gU28sIG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpIGhhcyB0byBhc3N1bWUgdGhl
IHdvcnN0IGNhc2UsIGkuZS4KPiA+ID4gPiBub24tT05GaS4KPiA+ID4KPiA+ID4gcy9PTkZpL09O
RkkvPwo+ID4KPiA+IFdpbGwgZml4Lgo+ID4KPiA+IExvb2tzIGxpa2UgSSB3YXMgbWlzdW5kZXJz
dGFuZGluZwo+ID4gbWF5YmUgYmVjYXVzZSB0aGUgbGV0dGVyICdJJyBpbiB0aGUgbG9nbwo+ID4g
KGh0dHA6Ly93d3cub25maS5vcmcvKQo+ID4gbG9va3MgbGlrZSBhIGxvd2VyY2FzZS4uLgo+ID4K
PiA+Cj4KPiBPaCByaWdodC4gSSBkb24ndCBrbm93IHdoYXQncyBiZXN0LiBQaWNrIHlvdXIgZmF2
b3JpdGUgOikKPgo+ID4KPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBBZnRlciBuYW5kX2RldGVj
dCgpLCBpZiB0aGUgY2hpcCB0dXJucyBvdXQgdG8gYmUgT05GaS1jb21wbGlhbnQsCj4gPiA+ID4g
d2UgY2FuIG9wdGltaXplIHRQUk9HX21heCwgdEJFUlNfbWF4LCBldGMuCj4gPiA+ID4KPiA+ID4g
PiBDYWxsIG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpIG9uY2UgYWdhaW4uCj4gPiA+Cj4gPiA+
IFNvcnJ5IGJ1dCBJIGRvbid0IGdldCB3aHkgdGhpcyBpcyBuZWVkZWQgYXMgdGhlcmUgaXMgdGhl
IHNhbWUgY2FsbCBhdAo+ID4gPiB0aGUgdG9wIG9mIHRoaXMgZnVuY3Rpb24uIENhbiB5b3UgYmUg
bW9yZSBzcGVjaWZpYyBvbiB3aGVyZS93aGVuIHRoZQo+ID4gPiBtaXNzaW5nIGNhbGwgcHJvZHVj
ZXMgYSBmYWlsdXJlPwo+ID4KPiA+Cj4gPiBvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoKSBzZXRz
IGRpZmZlcmVudCB2YWx1ZXMKPiA+IGZvciB0UFJPR19tYXgsIHRCRVJfbWF4LCB0Ul9tYXgsIHRD
Q1NfbWluCj4gPiBkZXBlbmRpbmcgb24gd2hldGhlciB0aGUgY2hpcCBpcyBPTkZJIG9yIG5vdC4K
PiA+Cj4gPiBGb3IgdGhlIGZpcnN0IGNhbGwsIG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpCj4g
PiBjaG9vc2VzIHRoZSBlbHNlLXBhcnQgc2luY2Ugd2UgbmV2ZXIga25vdwo+ID4gdGhlIGNoaXAg
c3BlY2lmaWNhdGlvbiBhdCB0aGlzIHBvaW50Lgo+ID4KPiA+IElmIHdlIGNhbGwgb25maV9maWxs
X2RhdGFfaW50ZXJmYWNlKCkgb25jZSBhZ2Fpbgo+ID4gYWZ0ZXIgbmFuZF9kZXRlY3QoKSwgaXQg
bWF5IGNob29zZSB0aGUgaWYtcGFydC4KPiA+Cj4gPgo+ID4gSWYgYSBkcml2ZXIgc3VwcG9ydHMg
LT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpLAo+ID4gbmFuZF9pbml0X2RhdGFfaW50ZXJmYWNlKCkg
d2lsbCBzZXQgdGhlIG9wdGltYWwKPiA+IHRpbWluZyBwYXJhbWV0ZXJzIGFueXdheS4KPiA+Cj4g
PiBCdXQsIGlmIGEgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgLT5zZXR1cF9kYXRhX2ludGVyZmFj
ZSgpLAo+ID4gaXQgd2lsbCBub3QgaGFwcGVuIHNpbmNlIG5hbmRfaGFzX3NldHVwX2RhdGFfaWZh
Y2UoKSByZXR1cm5zIGZhbHNlLgo+Cj4gQW5kIEkgdGhpbmsgdGhpcyBpcyB0aGUgZXhwZWN0ZWQg
YmVoYXZpb3IuIENhbGxpbmcgYWdhaW4KPiBvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoKSB3b3Vs
ZCBwcm9iYWJseSBlbmhhbmNlIGEgYml0IHRoZSB0aW1pbmdzLgo+IFRoZSBlZmZlY3QgaXMgdGhh
dCBsYXRlciBleGNoYW5nZXMgd2l0aCB0aGUgTkFORCBjaGlwIHdvdWxkIGJlIGp1c3QgYQo+IGJp
dCBmYXN0ZXIuIEJ1dCBpZiB5b3UgY2FyZSBhYm91dCBwZXJmb3JtYW5jZSwgdGhlbiB3aHkgbm90
IGltcGxlbWVudGluZwo+IC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKT8gRXZlbiBhIGR1bW15IGlt
cGxlbWVudGF0aW9uIHdvdWxkIGRvIHRoZQo+IHRyaWNrOiBvbmx5IGFjY2VwdCB0aW1pbmcgbW9k
ZSAwIHdpdGhvdXQgYW55IGNoYW5nZXMgb24gdGhlIGNvbnRyb2xsZXIKPiBzaWRlLgoKCk15IGRy
aXZlciAoZGVuYWxpKSBkb2VzIGltcGxlbWVudCAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkuCgpX
aGVuIEkgd2FzIHRlc3RpbmcgdGhpcyB0aG9yb3VnaGx5IG9uIG15IGJvYXJkLApJIG5vdGljZWQg
dGhlIHRpbWluZyBwYXJhbWV0ZXJzIHdlcmUgc2xpZ2h0bHkgY2hhbmdlZAphZnRlciBuYW5kX2Rl
dGVjdCgpIGRldGVjdGVkIE9ORkkgY2hpcC4KCj4gVW5sZXNzIHlvdSBnaXZlIG1lIGEgdXNlIGNh
c2Ugd2hlcmUgdGhpcyBpcyBub3QgcG9zc2libGUsIEkgZG9uJ3QgdGhpbmsKPiBpdCBpcyB3b3J0
aCBjaGFuZ2luZyB0aGlzIHBhdGguCgpPbmx5IHRoZSB1c2UgY2FzZSBJIGNhbiBjb21lIHVwIHdp
dGggaXMgd2hlbiBOQU5EX0tFRVBfVElNSU5HUyB3YXMgc2V0LgpCdXQsIGl0IGlzIGp1c3QgYSBt
YXR0ZXIgb2YgdGltZW91dCB2YWx1ZXMuCgpTbywgcGxlYXNlIHRocm93IGF3YXkgdGhpcyBwYXRj
aC4KCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
