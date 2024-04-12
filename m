Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266DEC4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LIOZCqSajYwYeQsSrKaM0zFAjzQcuAo4zdyaXaiIcd0=; b=D+dYRcR+YLjokw
	VF0St+tHYzVchoNJBjcaYrcn7bggadnsRDN5z38fP6XpcMgbwmMUuUhBPVOcHGhgswUjaU6eeJfsn
	nzVeHL9uo4nscnvrnybYfDbNQt6tJQgfre+EzBnv1zLnQROJzJXqvZE6Nwv1SIweDtowAjI89Tvdm
	yACh+A3DMdFrM1pOwm96jsup5/v+8R0D+dUk9uQKzjPkv1aHQwdLTmAjiL9oiqbzWdRqG9yGSUQbj
	fwickLnmUS2oBTGYlyclj1P2uzSNaE6RTqBGOiFrMRJjVItyCvgs01RR+mINIa4lfgcVXsI+HVtaG
	/71CG8HNtTkcuGCdj9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvItj-00000000FgS-1WzH;
	Fri, 12 Apr 2024 15:33:03 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvItg-00000000Fcs-1euC
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 15:33:02 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7d6b0c766e9so25110239f.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712935972; x=1713540772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqDcmcdfEAxpSmSYIoRjoyegxjm8YY6DAayxwa7eB28=;
        b=I3J71v+yeGfpt3uBdyr0VC2GfsD0301sRk8X8AYbnoJS4pdcIDK7hO1dKIExYSnJ5/
         J4XXFgsw10RQVpeps0RNgun9hY9CZz9+yqN7vxqxz8UGL8n3Cc9U4QBgvv/rRetl4fVr
         uJL6Rseo7dtTbEkfq9gYT3Kg5kdKCkabd9U+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712935972; x=1713540772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqDcmcdfEAxpSmSYIoRjoyegxjm8YY6DAayxwa7eB28=;
        b=XWbcLS2dUNYKNZ1EAvzv5lcEIVuP0/eLQovO/gd0TcWyo4BqGkUV9ZAJTXkNQMHt4Y
         2T52h2DhoaiQJkJpEuqWCEQgNLrZA9lesBv1jXeUQAfKO9jrS+zvxqnR03s6Wd+QWHEk
         L221luGrF7JDqmKw+p7fnUoVG3qAYzHJYaNQ+thjsoxHBAyvnHJx6TTifPcPpmAbPaDT
         ApZcGU2jKVhnGzJGuJTZWvM2lwaJLjmmlTv4BIvA1UycbFDbLOKKU7H5jCnuEPrmDYgE
         NZ9BnR6dyKPYFkIDUPDXZ5UB+FM2qus9tGa2jtqtHhlidrxn5wjaZR+HGclJlYddyG8I
         08Fg==
X-Forwarded-Encrypted: i=1; AJvYcCX8C440uzh4wNLXTil5AG8qoxI7X7CLc35BW5ZT5p+R/RM67PXzlC97CONDNEWAp5OeZn/cXvuRRPboiVhd8KJH+mRNc+03G47huw3otg==
X-Gm-Message-State: AOJu0Yxkr/LXDk13jOwJukjZiiurPxDHwNFShNtsNkHi+ilasjIc/aG3
	VWCfhG/mgmJExEvO6RRhKFcJhp97Qx0bfwVccWUktv4DqEoo8NrlZaTjfobhVA==
X-Google-Smtp-Source: AGHT+IHbtl8u5oM4YD0V1cyL9JOfCkw7w+xIl41C6otd6LoyoE8+lKTPybLQ5MBLMHKFw5O2MCIjbw==
X-Received: by 2002:a05:6602:1a98:b0:7d6:3f52:2f27 with SMTP id bn24-20020a0566021a9800b007d63f522f27mr3223842iob.0.1712935972439;
        Fri, 12 Apr 2024 08:32:52 -0700 (PDT)
Received: from chromium.org (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id ik14-20020a0566026c0e00b007d65a95d95csm1093828iob.42.2024.04.12.08.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 08:32:52 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/2] dt-bindings: mtd: fixed-partitions: Add alignment properties
Date: Fri, 12 Apr 2024 09:32:48 -0600
Message-Id: <20240412153249.100787-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_083300_475118_BC90814E 
X-CRM114-Status: GOOD (  21.52  )
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
b25zLCBha2EKJ2VudHJpZXMnIGluIGZpeGVkLXBhcnRpdGlvbi4KCkZvciBub3cgdGhlcmUgaXMg
bm8gZXhwbGljaXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCmp1c3Qg
dGhlICdmaXhlZC1wYXJ0aXRpb25zJyBub2RlLgoKVGhlc2UgbmV3IHByb3BlcnRpZXMgYXJlIGlu
cHV0cyB0byB0aGUgQmlubWFuIHBhY2thZ2luZyBwcm9jZXNzLCBidXQgYXJlCmFsc28gbmVlZGVk
IGlmIHRoZSBmaXJtd2FyZSBpcyByZXBhY2tlZCwgdG8gZW5zdXJlIHRoYXQgYWxpZ25tZW50CmNv
bnN0cmFpbnRzIGFyZSBub3QgdmlvbGF0ZWQuIFRoZXJlZm9yZSB0aGV5IGFyZSBwcm92aWRlZCBh
cyBwYXJ0IG9mCnRoZSBzY2hlbWEuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNo
cm9taXVtLm9yZz4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0t
LQoKQ2hhbmdlcyBpbiB2MTE6Ci0gRHJvcCBtZW50aW9uIG9mIEJpbm1hbgotIFVzZSAnY29udGVu
dCcgaW5zdGVhZCBvZiAnY29udGVudHMnCgpDaGFuZ2VzIGluIHYxMDoKLSBVcGRhdGUgdGhlIG1p
bmltdW0gdG8gMgoKQ2hhbmdlcyBpbiB2OToKLSBNb3ZlIGJpbmRpbmcgZXhhbXBsZSB0byBuZXh0
IGJhdGNoIHRvIGF2b2lkIGJ1aWxkIGVycm9yCgpDaGFuZ2VzIGluIHY3OgotIERyb3AgcGF0Y2gg
J0FkZCBiaW5tYW4gY29tcGF0aWJsZScKLSBQdXQgdGhlIGFsaWdubWVudCBwcm9wZXJ0aWVzIGlu
dG8gdGhlIGZpeGVkLXBhcnRpdGlvbiBiaW5kaW5nCgpDaGFuZ2VzIGluIHY2OgotIENvcnJlY3Qg
c2NoZW1hLXZhbGlkYXRpb24gZXJyb3JzIG1pc3NlZCBkdWUgdG8gb2xkZXIgZHQtc2NoZW1hCiAg
KGVudW0gZml4IGFuZCByZWcgYWRkaXRpb24pCgpDaGFuZ2VzIGluIHY1OgotIEFkZCB2YWx1ZSBy
YW5nZXMKLSBDb25zaXN0ZW50bHkgbWVudGlvbiBhbGlnbm1lbnQgbXVzdCBiZSBwb3dlci1vZi0y
Ci0gTWVudGlvbiB0aGF0IGFsaWdubWVudCByZWZlcnMgdG8gYnl0ZXMKCkNoYW5nZXMgaW4gdjI6
Ci0gRml4ICdhJyB0eXBvIGluIGNvbW1pdCBtZXNzYWdlCgogLi4uL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL3BhcnRpdGlvbi55YW1sICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwK
aW5kZXggMWViZTllMjM0N2VhLi4zMWJiZWIxNjEzOTYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0
aW9uLnlhbWwKQEAgLTU3LDYgKzU3LDU3IEBAIHByb3BlcnRpZXM6CiAgICAgICB1c2VyIHNwYWNl
IGZyb20KICAgICB0eXBlOiBib29sZWFuCiAKKyAgYWxpZ246CisgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisgICAgbWluaW11bTogMgorICAgIG1heGlt
dW06IDB4ODAwMDAwMDAKKyAgICBtdWx0aXBsZU9mOiAyCisgICAgZGVzY3JpcHRpb246CisgICAg
ICBUaGlzIHNldHMgdGhlIGFsaWdubWVudCBvZiB0aGUgZW50cnkgaW4gYnl0ZXMuCisKKyAgICAg
IFRoZSBlbnRyeSBvZmZzZXQgaXMgYWRqdXN0ZWQgc28gdGhhdCB0aGUgZW50cnkgc3RhcnRzIG9u
IGFuIGFsaWduZWQKKyAgICAgIGJvdW5kYXJ5IHdpdGhpbiB0aGUgY29udGFpbmluZyBzZWN0aW9u
IG9yIGltYWdlLiBGb3IgZXhhbXBsZSDigJhhbGlnbiA9CisgICAgICA8MTY+4oCZIG1lYW5zIHRo
YXQgdGhlIGVudHJ5IHdpbGwgc3RhcnQgb24gYSAxNi1ieXRlIGJvdW5kYXJ5LiBUaGlzIG1heQor
ICAgICAgbWVhbiB0aGF0IHBhZGRpbmcgaXMgYWRkZWQgYmVmb3JlIHRoZSBlbnRyeS4gVGhlIHBh
ZGRpbmcgaXMgcGFydCBvZgorICAgICAgdGhlIGNvbnRhaW5pbmcgc2VjdGlvbiBidXQgaXMgbm90
IGluY2x1ZGVkIGluIHRoZSBlbnRyeSwgbWVhbmluZyB0aGF0CisgICAgICBhbiBlbXB0eSBzcGFj
ZSBtYXkgYmUgY3JlYXRlZCBiZWZvcmUgdGhlIGVudHJ5IHN0YXJ0cy4gQWxpZ25tZW50CisgICAg
ICBtdXN0IGJlIGEgcG93ZXIgb2YgMi4gSWYg4oCYYWxpZ27igJkgaXMgbm90IHByb3ZpZGVkLCBu
byBhbGlnbm1lbnQgaXMKKyAgICAgIHBlcmZvcm1lZC4KKworICBhbGlnbi1zaXplOgorICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIG1pbmltdW06
IDIKKyAgICBtYXhpbXVtOiAweDgwMDAwMDAwCisgICAgbXVsdGlwbGVPZjogMgorICAgIGRlc2Ny
aXB0aW9uOgorICAgICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5IHNpemUg
aW4gYnl0ZXMuIEl0IG11c3QgYmUgYSBwb3dlcgorICAgICAgb2YgMi4KKworICAgICAgRm9yIGV4
YW1wbGUsIHRvIGVuc3VyZSB0aGF0IHRoZSBzaXplIG9mIGFuIGVudHJ5IGlzIGEgbXVsdGlwbGUg
b2YgNjQKKyAgICAgIGJ5dGVzLCBzZXQgdGhpcyB0byA2NC4gV2hpbGUgdGhpcyBkb2VzIG5vdCBh
ZmZlY3QgdGhlIGNvbnRlbnQgb2YgdGhlCisgICAgICBlbnRyeSBpdHNlbGYgKHRoZSBwYWRkaW5n
IGlzIHBlcmZvcm1lZCBvbmx5IHdoZW4gaXRzIHBhcmVudCBzZWN0aW9uIGlzCisgICAgICBhc3Nl
bWJsZWQpLCB0aGUgZW5kIHJlc3VsdCBpcyB0aGF0IHRoZSBlbnRyeSBlbmRzIHdpdGggdGhlIHBh
ZGRpbmcKKyAgICAgIGJ5dGVzLCBzbyBtYXkgZ3Jvdy4gSWYg4oCYYWxpZ24tc2l6ZeKAmSBpcyBu
b3QgcHJvdmlkZWQsIG5vIGFsaWdubWVudCBpcworICAgICAgcGVyZm9ybWVkLgorCisgIGFsaWdu
LWVuZDoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIK
KyAgICBtaW5pbXVtOiAyCisgICAgbWF4aW11bTogMHg4MDAwMDAwMAorICAgIG11bHRpcGxlT2Y6
IDIKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IChpbiBi
eXRlcykgb2YgdGhlIGVuZCBvZiBhbiBlbnRyeSB3aXRoIHJlc3BlY3QKKyAgICAgIHRvIHRoZSBj
b250YWluaW5nIHNlY3Rpb24uIEl0IG11c3QgYmUgYSBwb3dlciBvZiAyLgorCisgICAgICBTb21l
IGVudHJpZXMgcmVxdWlyZSB0aGF0IHRoZXkgZW5kIG9uIGFuIGFsaWdubWVudCBib3VuZGFyeSwK
KyAgICAgIHJlZ2FyZGxlc3Mgb2Ygd2hlcmUgdGhleSBzdGFydC4gVGhpcyBkb2VzIG5vdCBtb3Zl
IHRoZSBzdGFydCBvZiB0aGUKKyAgICAgIGVudHJ5LCBzbyB0aGUgY29udGVudCBvZiB0aGUgZW50
cnkgd2lsbCBzdGlsbCBzdGFydCBhdCB0aGUgYmVnaW5uaW5nLgorICAgICAgQnV0IHRoZXJlIG1h
eSBiZSBwYWRkaW5nIGF0IHRoZSBlbmQuIFdoaWxlIHRoaXMgZG9lcyBub3QgYWZmZWN0IHRoZQor
ICAgICAgY29udGVudCBvZiB0aGUgZW50cnkgaXRzZWxmICh0aGUgcGFkZGluZyBpcyBwZXJmb3Jt
ZWQgb25seSB3aGVuIGl0cworICAgICAgcGFyZW50IHNlY3Rpb24gaXMgYXNzZW1ibGVkKSwgdGhl
IGVuZCByZXN1bHQgaXMgdGhhdCB0aGUgZW50cnkgZW5kcworICAgICAgd2l0aCB0aGUgcGFkZGlu
ZyBieXRlcywgc28gbWF5IGdyb3cuIElmIOKAmGFsaWduLWVuZOKAmSBpcyBub3QgcHJvdmlkZWQs
CisgICAgICBubyBhbGlnbm1lbnQgaXMgcGVyZm9ybWVkLgorCiBpZjoKICAgbm90OgogICAgIHJl
cXVpcmVkOiBbIHJlZyBdCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
