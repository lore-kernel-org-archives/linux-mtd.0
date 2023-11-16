Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBA0C5AE4B
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Nov 2023 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51JHNABOH1Jx5h3lIoXXuP4q7/DJQj05Oio9DIILW3E=; b=nAqkgTcquj1i+9
	9RK89boqglFTNewzp5qZ6AU8ksBDk1+wvbKwitzxO8lIVouOLn+SilZVGputHumoeOO8ZEqiawICO
	JVri6DjzHxxlE0UyyrlEx4RfnOxcYDJMMhWsZjnt7b1dndWxvcI6mpgZ5yHY681t3DwkERs4jLulB
	ajHHvR6RTdjhq1ANQP9k9Wvdjsv76kMqWgrskwppHHX3hNtW/Pk905G72JJX5GcGT0/zQw/W+ncvq
	Aj01Oc0w3f9vltp8Zvxxz6jpA1Tcu6quIETxM8gpHJ0fFJ6LAl8ct7RrMEaR+/h5pOPQJ6a4GRVri
	QmHNqz7nxTqHNpEoNW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gB0-0048GR-1c;
	Thu, 16 Nov 2023 17:29:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gAy-0048Fg-2g
	for linux-mtd@bombadil.infradead.org;
	Thu, 16 Nov 2023 17:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sbuu/h0AoaC0z3nDtNhgNQ0tUOdrcyZNu90tL3+QkP8=; b=Nj4O/Cv3TxXbe8H1wWwf6kQNjY
	zkzteZ8qH91JwTk9yfEL3hxxfNMiGj6HkYe2vHsk81AKLw2GkXmgrzwWWaZZIkWWL7VmCyCW1PjXG
	anHxms/nO9byVcND37sVqAmtawe9kUhrHJxXKL4IwmmZgPRavT6uHbTBD1hNXr80u66k2+eH43phx
	IA4Kb+zh5XwgiNhpruT6tkIDOdYORMKqyLub3tYIj+jVxU+DckllhwIJZivvYYnS6XGGKWsKJgrTu
	BJLeKbseloqj/LGBguDpYIKmOFwwyJNRNH7MS79C+VvvYir4ulPYtZAQXCgYRrY1ESKhGnSkZqOgB
	95zvz7mg==;
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gAv-005iOV-06
	for linux-mtd@lists.infradead.org;
	Thu, 16 Nov 2023 17:29:11 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35743e88193so3952775ab.3
        for <linux-mtd@lists.infradead.org>; Thu, 16 Nov 2023 09:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700155746; x=1700760546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sbuu/h0AoaC0z3nDtNhgNQ0tUOdrcyZNu90tL3+QkP8=;
        b=QjDIPvrNjXZxaHzZA8ug+iPphqh0g2LovMarts8anS0N3x0Wlul1xDHawlATJLN4Kw
         EVcWJmW6xwj322EUPbS0I6ZKhGqyEE1A2Qu3t2RtsAgxPdAjJGktYD+450vkmUtS9cVj
         o5OZxqdYOn70j2jCdEwsKrPGBkCqsNG97fJb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700155746; x=1700760546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sbuu/h0AoaC0z3nDtNhgNQ0tUOdrcyZNu90tL3+QkP8=;
        b=uhAbVYmAKNw0lo9elf84Flvjh/jNQxZU5spcGxg/tLvyMkQikkDW8D9SyM9le8fuIw
         1+KnUADsSSsXtfms+5Z5Lmw3HUvBMsqwMlLP1vuB0zcSF0WMf1IhgdSaKTDrjkjaFzKa
         FGOPNwqZ0fzMz8yMdoub9XVIxhj4s7ziFtpP253zr9oAA+h94paJQBQ36ZjTYZHq55cz
         QJUidBRio+n5ffe4SBNTz5Qgm3cWtnJDoUH2Ggp/kbu7oVPVpjxcAg9P+JqDf0w7W0il
         KV20aCm+d3Q5z1hu+jaFR2/0WM01WiFsj7U+MLVM3pQ0AOexkzRuegMjLDlSD0Ee1IxA
         UBFA==
X-Gm-Message-State: AOJu0Yw/K7rQKnCViQT0TDw4qw2kldbtbSRxlaAC8xhonUOoNcffF603
	WI5aWQegVfUEmaHLSUbjYZopmg==
X-Google-Smtp-Source: AGHT+IE9Yfv/30lHqDUpMHSfiZOMWk3dnHo8Xmo7XHjmfFGyS0UQeo20uO84tddH2390/4yYVU+Aig==
X-Received: by 2002:a05:6e02:216a:b0:357:a049:91c4 with SMTP id s10-20020a056e02216a00b00357a04991c4mr17861655ilv.22.1700155746310;
        Thu, 16 Nov 2023 09:29:06 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id o8-20020a056e02092800b0035ab8cc4a4bsm1914348ilt.17.2023.11.16.09.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 09:29:06 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] dt-bindings: mtd: binman-partitions: Add alignment properties
Date: Thu, 16 Nov 2023 10:28:52 -0700
Message-ID: <20231116172859.393744-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
In-Reply-To: <20231116172859.393744-1-sjg@chromium.org>
References: <20231116172859.393744-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_172909_298069_54423243 
X-CRM114-Status: GOOD (  23.03  )
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

QWRkIHRocmVlIHByb3BlcnRpZXMgZm9yIGNvbnRyb2xsaW5nIGFsaWdubWVudCBvZiBwYXJ0aXRp
b25zLCBha2EKJ2VudHJpZXMnIGluIGJpbm1hbi4KCkZvciBub3cgdGhlcmUgaXMgbm8gZXhwbGlj
aXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCmp1c3QgdGhlICdiaW5t
YW4nIG5vZGUuCgpUaGVzZSBuZXcgcHJvcGVydGllcyBhcmUgaW5wdXRzIHRvIHRoZSBwYWNrYWdp
bmcgcHJvY2VzcywgYnV0IGFyZSBhbHNvCm5lZWRlZCBpZiB0aGUgZmlybXdhcmUgaXMgcmVwYWNr
ZWQsIHRvIGVuc3VyZSB0aGF0IGFsaWdubWVudApjb25zdHJhaW50cyBhcmUgbm90IHZpb2xhdGVk
LiBUaGVyZWZvcmUgdGhleSBhcmUgcHJvdmlkZWQgYXMgcGFydCBvZgp0aGUgc2NoZW1hLgoKU2ln
bmVkLW9mZi1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Ci0tLQoKQ2hhbmdlcyBp
biB2NjoKLSBDb3JyZWN0IHNjaGVtYS12YWxpZGF0aW9uIGVycm9ycyBtaXNzZWQgZHVlIHRvIG9s
ZGVyIGR0LXNjaGVtYQogIChlbnVtIGZpeCBhbmQgcmVnIGFkZGl0aW9uKQoKQ2hhbmdlcyBpbiB2
NToKLSBBZGQgdmFsdWUgcmFuZ2VzCi0gQ29uc2lzdGVudGx5IG1lbnRpb24gYWxpZ25tZW50IG11
c3QgYmUgcG93ZXItb2YtMgotIE1lbnRpb24gdGhhdCBhbGlnbm1lbnQgcmVmZXJzIHRvIGJ5dGVz
CgpDaGFuZ2VzIGluIHYyOgotIEZpeCAnYScgdHlwbyBpbiBjb21taXQgbWVzc2FnZQoKIC4uLi9t
dGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwgICAgICB8IDU0ICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi1w
YXJ0aXRpb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKaW5kZXggODMyMjJhYzlhYTc4Li4yYmM4MGMy
NGJiOWIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbApAQCAt
MzMsNiArMzMsNTcgQEAgcHJvcGVydGllczoKICAgICBtaW5JdGVtczogMQogICAgIG1heEl0ZW1z
OiAyCiAKKyAgYWxpZ246CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvdWludDMyCisgICAgbWluaW11bTogMQorICAgIG1heGltdW06IDB4ODAwMDAwMDAKKyAgICBt
dWx0aXBsZU9mOiAyCisgICAgZGVzY3JpcHRpb246CisgICAgICBUaGlzIHNldHMgdGhlIGFsaWdu
bWVudCBvZiB0aGUgZW50cnkgaW4gYnl0ZXMuCisKKyAgICAgIFRoZSBlbnRyeSBvZmZzZXQgaXMg
YWRqdXN0ZWQgc28gdGhhdCB0aGUgZW50cnkgc3RhcnRzIG9uIGFuIGFsaWduZWQKKyAgICAgIGJv
dW5kYXJ5IHdpdGhpbiB0aGUgY29udGFpbmluZyBzZWN0aW9uIG9yIGltYWdlLiBGb3IgZXhhbXBs
ZSDigJhhbGlnbiA9CisgICAgICA8MTY+4oCZIG1lYW5zIHRoYXQgdGhlIGVudHJ5IHdpbGwgc3Rh
cnQgb24gYSAxNi1ieXRlIGJvdW5kYXJ5LiBUaGlzIG1heQorICAgICAgbWVhbiB0aGF0IHBhZGRp
bmcgaXMgYWRkZWQgYmVmb3JlIHRoZSBlbnRyeS4gVGhlIHBhZGRpbmcgaXMgcGFydCBvZgorICAg
ICAgdGhlIGNvbnRhaW5pbmcgc2VjdGlvbiBidXQgaXMgbm90IGluY2x1ZGVkIGluIHRoZSBlbnRy
eSwgbWVhbmluZyB0aGF0CisgICAgICBhbiBlbXB0eSBzcGFjZSBtYXkgYmUgY3JlYXRlZCBiZWZv
cmUgdGhlIGVudHJ5IHN0YXJ0cy4gQWxpZ25tZW50CisgICAgICBtdXN0IGJlIGEgcG93ZXIgb2Yg
Mi4gSWYg4oCYYWxpZ27igJkgaXMgbm90IHByb3ZpZGVkLCBubyBhbGlnbm1lbnQgaXMKKyAgICAg
IHBlcmZvcm1lZC4KKworICBhbGlnbi1zaXplOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIG1pbmltdW06IDEKKyAgICBtYXhpbXVtOiAweDgw
MDAwMDAwCisgICAgbXVsdGlwbGVPZjogMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBz
ZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5IHNpemUgaW4gYnl0ZXMuIEl0IG11c3QgYmUg
YSBwb3dlcgorICAgICAgb2YgMi4KKworICAgICAgRm9yIGV4YW1wbGUsIHRvIGVuc3VyZSB0aGF0
IHRoZSBzaXplIG9mIGFuIGVudHJ5IGlzIGEgbXVsdGlwbGUgb2YgNjQKKyAgICAgIGJ5dGVzLCBz
ZXQgdGhpcyB0byA2NC4gV2hpbGUgdGhpcyBkb2VzIG5vdCBhZmZlY3QgdGhlIGNvbnRlbnRzIG9m
IHRoZQorICAgICAgZW50cnkgd2l0aGluIGJpbm1hbiBpdHNlbGYgKHRoZSBwYWRkaW5nIGlzIHBl
cmZvcm1lZCBvbmx5IHdoZW4gaXRzCisgICAgICBwYXJlbnQgc2VjdGlvbiBpcyBhc3NlbWJsZWQp
LCB0aGUgZW5kIHJlc3VsdCBpcyB0aGF0IHRoZSBlbnRyeSBlbmRzCisgICAgICB3aXRoIHRoZSBw
YWRkaW5nIGJ5dGVzLCBzbyBtYXkgZ3Jvdy4gSWYg4oCYYWxpZ24tc2l6ZeKAmSBpcyBub3QgcHJv
dmlkZWQsCisgICAgICBubyBhbGlnbm1lbnQgaXMgcGVyZm9ybWVkLgorCisgIGFsaWduLWVuZDoK
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBt
aW5pbXVtOiAxCisgICAgbWF4aW11bTogMHg4MDAwMDAwMAorICAgIG11bHRpcGxlT2Y6IDIKKyAg
ICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IChpbiBieXRlcykg
b2YgdGhlIGVuZCBvZiBhbiBlbnRyeSB3aXRoIHJlc3BlY3QKKyAgICAgIHRvIHRoZSBjb250YWlu
aW5nIHNlY3Rpb24uIEl0IG11c3QgYmUgYSBwb3dlciBvZiAyLgorCisgICAgICBTb21lIGVudHJp
ZXMgcmVxdWlyZSB0aGF0IHRoZXkgZW5kIG9uIGFuIGFsaWdubWVudCBib3VuZGFyeSwKKyAgICAg
IHJlZ2FyZGxlc3Mgb2Ygd2hlcmUgdGhleSBzdGFydC4gVGhpcyBkb2VzIG5vdCBtb3ZlIHRoZSBz
dGFydCBvZiB0aGUKKyAgICAgIGVudHJ5LCBzbyB0aGUgY29udGVudHMgb2YgdGhlIGVudHJ5IHdp
bGwgc3RpbGwgc3RhcnQgYXQgdGhlIGJlZ2lubmluZy4KKyAgICAgIEJ1dCB0aGVyZSBtYXkgYmUg
cGFkZGluZyBhdCB0aGUgZW5kLiBXaGlsZSB0aGlzIGRvZXMgbm90IGFmZmVjdCB0aGUKKyAgICAg
IGNvbnRlbnRzIG9mIHRoZSBlbnRyeSB3aXRoaW4gYmlubWFuIGl0c2VsZiAodGhlIHBhZGRpbmcg
aXMgcGVyZm9ybWVkCisgICAgICBvbmx5IHdoZW4gaXRzIHBhcmVudCBzZWN0aW9uIGlzIGFzc2Vt
YmxlZCksIHRoZSBlbmQgcmVzdWx0IGlzIHRoYXQgdGhlCisgICAgICBlbnRyeSBlbmRzIHdpdGgg
dGhlIHBhZGRpbmcgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhhbGlnbi1lbmTigJkgaXMgbm90
CisgICAgICBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KKwogYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgpAQCAtNDUsMTAgKzk2LDEzIEBAIGV4YW1w
bGVzOgogICAgICAgICBwYXJ0aXRpb25AMTAwMDAwIHsKICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAidS1ib290IjsKICAgICAgICAgICAgIHJlZyA9IDwweDEwMDAwMCAweGYwMDAwMD47CisgICAg
ICAgICAgICBhbGlnbi1zaXplID0gPDB4MTAwMD47CisgICAgICAgICAgICBhbGlnbi1lbmQgPSA8
MHgxMDAwMD47CiAgICAgICAgIH07CiAKICAgICAgICAgcGFydGl0aW9uQDIwMDAwMCB7CiAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInRmYS1ibDMxIjsKICAgICAgICAgICAgIHJlZyA9IDwweDIw
MDAwMCAweDEwMDAwMD47CisgICAgICAgICAgICBhbGlnbiA9IDwweDQwMDA+OwogICAgICAgICB9
OwogICAgIH07Ci0tIAoyLjQzLjAucmMwLjQyMS5nNzg0MDZmOGQ5NC1nb29nCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
