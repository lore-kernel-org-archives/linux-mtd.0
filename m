Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E1BC79F99
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 19:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gs965hEoz5pFflhP6r/TJOnERcV4T/s90oMMw2L7H+0=; b=f/PVD6B343AT+c
	bbqWmdznXMJKrIneaPV/K4tH/AOzfNufolS292BWScN5vmBfyerHiWeLxquXloY45H18VpfNiwEEN
	KLlfHO1nxh9RDg7tjI+farjuHgVHTlMw2Cg9uhdjaZ3jtnL8b+lkY9JhyKQ/74I/8/LycHaQYm79v
	3eLeET2x2kThhMOYDtjvOLjekQobTcbgYsJ0+7XSLF17G5ejfSDoOttVaO75XPjt7n+Bp+QrY8s2g
	DCql03lh9dmPWOm59YOX9XRs7AEP8GAnJggDGx6ptzTEhRvZ53r5F38OIZ5m5inK1gFYnvPoRhRlC
	T/UXLtR+3Fn7Fgu9Addw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41FP-0000000A2oI-1qzq;
	Tue, 08 Sep 2026 19:12:47 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41FM-0000000A2nx-3yN1
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 19:12:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a9879ada9fso835311a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2026 12:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894763; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4uJ7dCT+39bEZ57pCK+h1Xwis1go2cwxUThUEUAkOEBdWX1XygYl1oUZuqjBY1RXF
         scFBofnAFGb4CMWvYSipdXuEgQp5Sw6SSee7IqMeU+Mtvz2tuc5S++pn8s3ynJHY8pK3
         xd+sCSBFohWOhTl9v+RYfNLFm96h9uMPHmp583utFYBF4X7Fo4cx8eyHCJQ+8mv7dwqF
         Ft+2KV9wG8RN0v8N+hfx/Wl+pXIBvmVpKOdcsxdDIYENfyUIcPhImVZj5AAuDCaPh3HW
         X/cZLkKj3Paf9FucQoyDcy/v1QhrOZNg/q6clbIT3RiG90eEowsc1nH3R1CZ2+iAQrSB
         U9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fTpduZF7+5E5805hBjETRwhIo89Y65bImr+ySr2fmTw=;
        fh=VNrNbCEyVFFWG+T4z9mdPmCPCKRvHsxEWjY++MrdBOE=;
        b=m8wWaTrvr5XRKA7JKQ0ThdV77ENJ+YKC3A0PJn2kwDnCbDJVlQVrkVEmXKHY+Ube8o
         PFCwiFuTzW4Rj2UdjF+m3l6yiJpGiOIAymWK2wXqjTdlie1mpJPgVdwDo6m45xsCOSnH
         GljDVmZEAAsg0nxeyrp+AtKYoR8EFKAlo1OiHdyoSlE+ElawOTUwoxIIOBv0fyKzGgwr
         qyOzmojnQtxko/Dczdded6O2xlkAFJ6UjtLxN3MMkNfVYyi44Rk4skPREz9+jGycR68I
         nyVplIa2dxr2u/v1uAKgRcnYgLwk8xvj37jc8M7+gvdUmBRmiMUoXdwoFbRyVDWw0IdZ
         qeAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894763; x=1789499563; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTpduZF7+5E5805hBjETRwhIo89Y65bImr+ySr2fmTw=;
        b=Mdb4JAafG0OlSOKSG9KrX6laHfqRJqaZ535XwZh62iOEhYdfCif5QyXnX7WYdR9STS
         mH1vq8kF2sPHBhgKbJGtDAT0mc1lvsz3uPEzMu/sCVWz357NHNNrRd4Hq17oAILDzq1g
         k808pd1lWysG3Yz/IV8jJvyxDhb+3NqjNw20bHNGNeOzW4vOdcgYkHZmc5Wic5mFWuVG
         du7erEGcg8oGBU3eiaBuV9bBrA/h0+xE9URx3cfHpgld8+G9wdc5LnJzYZGd0/ra6NzO
         t0g4uZMwpbjnDt+97eicsvO5tQIfhRw6D+hDVAm8Fzp0sAFS0OWewFO0hc0fP5Qo0wUZ
         iTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894763; x=1789499563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTpduZF7+5E5805hBjETRwhIo89Y65bImr+ySr2fmTw=;
        b=c17J+nptEb7VX28nMGbM3ftqaQUxWixSXn/j/yBHxQruRCusjd0z1s2Ost2KPqTHI+
         vyoSR7seurCUmMuFHD5BY4Gs7FraG5PE8kIzE8+XCGbJukBXWAvVO8tMxE5QUwV2JVqa
         uACgssvoW4wk/oCxdZ+rqhn6MLMCJScvtOIMAuo67e2PcKdagJQQCRin1h0Qwk+Anb22
         0qtN4sqYvRZ2wyEepREMg4gqW2Gvbu6O1IFNhRuvAwUOxKkbt8n1NjFq5WuLV1nd0Hwg
         R6n5rk4jhxyxmnGsT1I9k9GdCuwLqA+Df+4Ee8U6qP095QFENeA1JiwOSkDdKUy5c7W2
         kDsg==
X-Gm-Message-State: AFuF++kmSNre9TanJpC/zDKz9mqct46XRM4iN2jgLmRMZxLVD9kxUbp2
	eLGSMdGweE+G13tvWi5TdydBkK5goxIyNo3ICm8KaqLX1uZLPF5GUybtY+D0kEh7yd5Dud0Jd8R
	mlIH0L3bknLXXglqu1xR7jtBw8+yiT9E=
X-Gm-Gg: AYBFou2D69MH2dCNuncPY+iA7U6IUEhXHPs3wZx0jrpIuyQsNCN1bSpplQwsgTXsYRO
	RXwlabNf+GojbiPs0sQ9zjPvsKl2hJ9cHTgUH29wkav6899uySL1YlDC/jnfwwoDyjHsSMsFKf0
	H02ydspfUx2Rhty+YTKHKZgGnzcZ5ol+3VJa+v84nJluO+o1oCnTyUbCiduIqdpVf0PQuyVn/5B
	6QxOLR37d6Ni9a/0vQaVSsmvLMUEM8D76hV5CHlQP9vkOdBqaQiP4k/58NjS7uCYQc3SIY2EIiR
	0VvVZaVS2k97LEH2Ov0DGAPTPenX7dcvbnFRNF2gtei34c7Hgqt7WZuafJZumOhJtctIMGo6fXF
	VDGgR12TIEem4I9wnzcbRCebPpdj9Yrnhcu93rDMHKnydNZWeX9o6oudSyXWij3LsVzY4PhVa4V
	1YJ2ckHEyfTPw0AdvSBNUmIT8hZWx4Zb6RODzLTsArL2q5jUhS992Z+bE=
X-Received: by 2002:a05:6402:24d6:b0:6a7:ee55:dcca with SMTP id
 4fb4d7f45d1cf-6a7ee55de92mr8094766a12.25.1788894762554; Tue, 08 Sep 2026
 12:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260908060111.41244-1-rosenp@gmail.com> <87h5k0ulrs.fsf@bootlin.com>
In-Reply-To: <87h5k0ulrs.fsf@bootlin.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 8 Sep 2026 12:12:31 -0700
X-Gm-Features: AcwNN1Us1izf2ljyq5QVn61BBp3Tn2wyNhDInrJ2Ii_Yz4lsyPudsCZvl0GhLIo
Message-ID: <CAKxU2N_+jdT80OHrkaiiE687frsrxrEhub90nmkoFM=0fvvJFQ@mail.gmail.com>
Subject: Re: [PATCHv2] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_121245_003231_F6692E14 
X-CRM114-Status: GOOD (  22.07  )
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCAyOjM34oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAwNy8wOS8yMDI2IGF0IDIzOjAxOjExIC0w
NywgUm9zZW4gUGVuZXYgPHJvc2VucEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBBbGxvY2F0ZSB0
aGUgc2hhcmVkIGZzbF9pZmNfbmFuZF9jdHJsIHN0cnVjdHVyZSBhZ2FpbnN0IHRoZSBjb250cm9s
bGVyCj4gPiBkZXZpY2UsIHdoaWNoIG91dGxpdmVzIGFsbCBOQU5EIGNoaWxkIGRldmljZXMsIHNv
IGl0IGlzIGZyZWVkCj4gPiBhdXRvbWF0aWNhbGx5LiAgVGhpcyBkcm9wcyB0aGUgbWFudWFsIGtm
cmVlKCkgYW5kIHRoZSBicm9rZW4gY2hpcAo+ID4gY291bnRlciB0aGF0IHdhcyBkZWNyZW1lbnRl
ZCBpbiByZW1vdmUoKSBidXQgbmV2ZXIgaW5jcmVtZW50ZWQKPiA+IGFueXdoZXJlLCBsZWFraW5n
IHRoZSBzdHJ1Y3R1cmUgYW5kIGxlYXZpbmcgdGhlIGZyZWVkIHBvaW50ZXIgaW4KPiA+IGN0cmwt
Pm5hbmQgb24gcmUtcHJvYmUuCj4gPgo+ID4gQXNzaXN0ZWQtYnk6IG9wZW5jb2RlOmJpZy1waWNr
bGUKPiA+IFNpZ25lZC1vZmYtYnk6IFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgdjI6IHJlYmFzZS4KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfaWZjX25h
bmQuYyB8IDE1ICsrLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9mc2xfaWZjX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9pZmNfbmFu
ZC5jCj4gPiBpbmRleCBhODhhYzJjZmFjY2QuLjRjMmQ5NTQ2MWMyZSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9pZmNfbmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9mc2xfaWZjX25hbmQuYwo+ID4gQEAgLTUwLDcgKzUwLDYgQEAgc3RydWN0IGZz
bF9pZmNfbmFuZF9jdHJsIHsKPiA+ICAgICAgIHVuc2lnbmVkIGludCBpbmRleDsgICAgIC8qIFBv
aW50ZXIgdG8gbmV4dCBieXRlIHRvICdyZWFkJyAgICAgICAqLwo+ID4gICAgICAgdW5zaWduZWQg
aW50IG9vYjsgICAgICAgLyogTm9uIHplcm8gaWYgb3BlcmF0aW5nIG9uIE9PQiBkYXRhICAgICov
Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgZWNjcmVhZDsgICAvKiBOb24gemVybyBmb3IgYSBmdWxs
LXBhZ2UgRUNDIHJlYWQgICAgKi8KPiA+IC0gICAgIHVuc2lnbmVkIGludCBjb3VudGVyOyAgIC8q
IGNvdW50ZXIgZm9yIHRoZSBpbml0aWFsaXphdGlvbnMgICAgICAqLwo+ID4gICAgICAgdW5zaWdu
ZWQgaW50IG1heF9iaXRmbGlwczsgIC8qIFNhdmVkIGR1cmluZyBSRUFEMCBjbWQgICAgICAgICAg
ICovCj4gPiAgfTsKPiA+Cj4gPiBAQCAtMTAzMywxNSArMTAzMiwxMyBAQCBzdGF0aWMgaW50IGZz
bF9pZmNfbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCj4gPgo+ID4gICAg
ICAgbXV0ZXhfbG9jaygmZnNsX2lmY19uYW5kX211dGV4KTsKPiA+ICAgICAgIGlmICghZnNsX2lm
Y19jdHJsX2Rldi0+bmFuZCkgewo+ID4gLSAgICAgICAgICAgICBpZmNfbmFuZF9jdHJsID0ga3ph
bGxvY19vYmooKmlmY19uYW5kX2N0cmwpOwo+ID4gKyAgICAgICAgICAgICBpZmNfbmFuZF9jdHJs
ID0gZGV2bV9remFsbG9jKGZzbF9pZmNfY3RybF9kZXYtPmRldiwgc2l6ZW9mKCppZmNfbmFuZF9j
dHJsKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBf
S0VSTkVMKTsKPgo+IFRoaXMgaXMgYSBnbG9iYWwgb2JqZWN0LiBJIGRvbid0IGdldCB3aHkgaXQn
cyBnbG9iYWwuIEJ1dCBpdCBzZWVtcyBub3QKPiByZWxldmFudCB0byB0aWUgd2l0aCBjdHJsX2Rl
di0+ZGV2IChzZWUgU2FzaGlrbyByZXBvcnQpLiBDYW4geW91IHBsZWFzZQo+IGdvIG9uZSBzdGVw
IGZ1cnRoZXIgaW4gdGhpcyBjbGVhbnVwPwpUaGUgcHJvYmxlbSBpcywgdGhhdCBnbG9iYWwgY29t
ZXMgZnJvbSBkcml2ZXJzL21lbW9yeS9mc2xfaWZjLmMgLiBOb3RlCnRoZSBmb3J3YXJkIGRlY2xh
cmF0aW9uIGluIGZzbF9pZmNfbmFuZC5jCgpJIGhhdmVuJ3QgaGFkIGx1Y2sgZ2V0dGluZyBhbnl0
aGluZyBtZXJnZWQgdGhlcmUuCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
