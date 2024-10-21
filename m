Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB214D0E6C9
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ND5+V9MvGmgPcuW9SqowEtvdEOpsyOe4T+ggZdParo=; b=Yr7cq9Nmsr9gsq
	WkqE9XqyunU+A2RQ/U648MIP8F2GHlu/cv2UvgtyaUROOQf6wx/42jKHoDHtIWMgBJ8KxjwiIO62P
	WAUsLFF4vDd2BLsnS8x8Ln2fdkiywH8Q9XqszzcmMF4nXPnPPhQjaX68lnKokWgNq8RB2k133Q6bu
	KtNY8lkcXd/KVQbdVNpYEPoJl/NxJeB9JIrmnis77BqtPQoGp7bXuOaNUds4fGMeouETOaMAa967F
	Ud7AToyZNCYfVQME7y56SjKxqzjnVkiPpP5TEcaC4yS8Ugrx4sw5hRDzaYZEcY8USv5l/fIl6yxqk
	noLYpGhRSgo6kUDuBokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2noo-00000006YpJ-1KqY;
	Mon, 21 Oct 2024 08:31:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mnk-00000006Msj-3OrG
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 07:26:14 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so3092972a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2024 00:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729495563; x=1730100363; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riSNOYHYyitn4HEz/ZUed6KwnUQgSADxWxrkcSLcPik=;
        b=pRcVf9T5ZovDkoAaudf8BqxoApPEy/h+pJ/QQzFLD1iTJxz0Tx4llkqCDKeEZyWapS
         0ILTL6IoS3zytWOHEFtp/CANkGdOsmZggSYDKv5FbZIx+GyoxNN3vGAvXQ6w5M66zYsY
         OJnL6QoAs1Ov6XDBfiLuCWQzF2NlJNnZ40yzOuzUoKkmFvnAMmqGNreC8XQ0eJ2OkoTQ
         rbGu5NiSut15Qyc2IapbBSM0tExIEb5VOUooGYaBqMy1SAYJojjk7TSjs+lkLsyqFbYD
         Va+FHfY2aHI48clPzK8ayLa5BiaSsoWtcer21DtdNlH340d/SmZ2jLPD4xuHcu3PZ7eN
         3ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495563; x=1730100363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riSNOYHYyitn4HEz/ZUed6KwnUQgSADxWxrkcSLcPik=;
        b=sYFnGkVnfTbcFfpr1a86X+lE82r61X+nDfcIHDrUZP01Iz037MZ/chf/51jaAsFkqk
         PTFRSX01uKqced0xS0TqZVOZg3ryvovFrlKM/Te82jEKyHBRJltEsBTWwFm6Fn9NREJh
         V3p4H+fHTXvcQxQzfrXbS2/VioErY7ILF2hDcfXakoYJPFLNaxMux5+BN+HH2aZ/2QvV
         i4JA5AJmyqlrnWjoLJi+kOsfMrWZMFzYEIKgjugPQXMXiRXe4vBDek4w0ilTsRx8SXwy
         xc2q/+x5zBR9EH5uCSNpG7HBn0CeyvNRZ0Z9SlOpKFHfjX7K3Tfwx0j/MeinF/K5U2de
         +G5w==
X-Gm-Message-State: AOJu0YzjnKuDlKdzzvwPFQN5q+0zAmUk4AuvSmclihQV2Q7Ko1W36KvR
	btWM2y16suuqxGvliKG0j56+Llz4CoVJ6ptGUjxJ4RDntdfG0mRE9Pwusk/yphTVEWmhLmwv5ah
	zHWKskgDwm7qjJeyugWpaMwQuDxzUxP8gLyFY2w==
X-Google-Smtp-Source: AGHT+IFGf1Ktyy7MxB4aZc49mV0SYrg6hPff5eb+EBA6A4nZiQcncUr0r8w5/JXdPXS+OeuWFF4VbOJd2GiWctXxM+4=
X-Received: by 2002:a05:6300:44:b0:1d8:b8da:d658 with SMTP id
 adf61e73a8af0-1d92c501706mr13794945637.27.1729495562919; Mon, 21 Oct 2024
 00:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241007122350.75285-1-brgl@bgdev.pl>
In-Reply-To: <20241007122350.75285-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 21 Oct 2024 09:25:48 +0200
Message-ID: <CAMRc=MeVQVeXdMTk-ZjabkEv58VN=2vchcy3LZ24pEwwN1DTpw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: rawnand: davinci: order headers alphabetically
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_002604_872587_F630F431 
X-CRM114-Status: GOOD (  13.72  )
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

T24gTW9uLCBPY3QgNywgMjAyNCBhdCAyOjI04oCvUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cj4KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4KPiBGb3IgYmV0dGVyIHJlYWRhYmlsaXR5LCBwdXQg
YWxsIGluY2x1ZGVzIGluIGFscGhhYmV0aWNhbCBvcmRlci4KPgo+IFNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiAtLS0K
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMgfCAxMCArKysrKy0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9kYXZpbmNpX25hbmQuYwo+IGluZGV4IDM5MjY3ODE0M2EzNi4uNTUxMGIzOWMw
Yjk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RhdmluY2lfbmFuZC5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMKPiBAQCAtMTAsMTUgKzEw
LDE1IEBACj4gICAqICAgRGlyayBCZWhtZSA8RGlyay5CZWhtZUBnbWFpbC5jb20+Cj4gICAqLwo+
Cj4gLSNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
Pgo+IC0jaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9lcnIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgo+IC0jaW5jbHVkZSA8bGludXgv
bXRkL3Jhd25hbmQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsjaW5jbHVkZSA8
bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0aW9ucy5oPgo+IC0j
aW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICsjaW5jbHVkZSA8bGludXgvbXRkL3Jhd25hbmQuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPgo+ICAjZGVmaW5lIE5SQ1NSX09GRlNF
VCAgICAgICAgICAgMHgwMAo+ICAjZGVmaW5lIE5BTkRGQ1JfT0ZGU0VUICAgICAgICAgMHg2MAo+
IC0tCj4gMi40My4wCj4KCkl0J3MgYmVlbiB0d28gd2Vla3Mgc28gZ2VudGxlIHBpbmcuCgpCYXJ0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
