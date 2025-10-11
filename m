Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375DBCCA476
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Oct 2025 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x7w5yfgFekvaBnyTpcIsE4eGPy0o0bnu0rmBOVIhwI=; b=pjug6ncywJHi0z
	PFHgE4G35uY/3eDjduAP8ZB6gcJDzHz2xV+J+8/PkR2AiQdBp3cycMChSkeHNnOtFgdVH8h8FXJ3g
	z5/Cdr+6H7M59WIp3sRV5HZG1/mumjfb3ASoSYPuVliCFNVZ4310kmU84yzvtsobG6kUxAKvMig0x
	5KV6yNPfBvdlHJfLziSt3mqjuFcYQwu2nBKYzyb9nfuuAbDkgISvCw+y9URVfEJpRdXIeNNvb93NS
	QMTJVDSMLZ6ppOOqr8NvZoAyT3kCKjj2t9XDmfHt3tMUCAbBjJde+em3sX3AQlYgAd9gh567QyRzP
	KFKqNAnd7PR6Qg2x8Ufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7WpE-0000000A280-3Ubz;
	Sat, 11 Oct 2025 10:27:44 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7WpC-0000000A27H-1uvr
	for linux-mtd@lists.infradead.org;
	Sat, 11 Oct 2025 10:27:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-63994113841so5082380a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 11 Oct 2025 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178461; x=1760783261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZCFVzYHZ2h0JIUQU0arhlSFw5b6cu6XyQY71uLY2mU=;
        b=mbYebk9vYlJSfBMFxzECx1a1PQM5RUU23292JeJSFbkBJwZNK13c63IxOI3deai/dj
         emOtjTIaHgHAy/MmuAyHunNJQU+OTsvj7DuhILNLBQmKuXUQLPBDYSyK13hj2N9MhGPh
         HVVwZITN3DgzTYZ/tRC2zBj2xFWmil47sS7qOLq9PobqJxJHPuciF+kOEQBmmAGA2iV3
         zyLRTjqF0ILobBFYTMC4lOrp2Yg0+jPgEZCH4bW6OkIvU6llsQyLuE869YufSH5XFx6o
         E1J2e/CWCGwDADLBLS23I8S5TANgS7k5UQqG2kaqN8EcwgS1Ye2VRwvbTf9ND6FBOMTt
         uErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178461; x=1760783261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZCFVzYHZ2h0JIUQU0arhlSFw5b6cu6XyQY71uLY2mU=;
        b=QtksaTIOgKrfaAY1zQrVmMDhD3P+ihNk0YxoCkoIcekYO6sz/EX0ykAWTlzyQi6ua2
         d5iugMOaxeMLjA4h2K4RHzCSuBUDOMPqElSQDFDKIY6+QhkSKkKbwHsguuj5QVhWtp/h
         SsOWawaynjMMn1mYRO3jW4cKWJm5Vq9LSWgLfszqS+J4a6ys+ceqYg9LTL4ZUnlM7UTf
         jpsjYodlRo9BrYwxyV7AnQsdioXB/X62nn0jKbwqLQc4teChA0NQzeH0sINmaNE5MdfT
         ah5YZ4/TDVt15bGkkwvyW3rYm9D5MRcdnzqfUqooqSTPdQ2PJiToz7zLwCvXd7q2I8SJ
         1Lfg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ih8CQzGfx1nB3FmfzL2CCo3jc8yzarIGbUIJC1YkcwnBujXu89Q6damGsCSDoceqfksb+Oc8OgY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc3jQQj9ddPloiCR1HYQsZxCvA5N85mn6jVbzBL8+zSC/uZMz3
	1YeIgXpkdeqzu6Or/qq83BAm6iA0Tuhuior46NmQV5tU/SdnTDvnsqrB
X-Gm-Gg: ASbGncu7b4Atx2s++d4aWakaMhTEC2aeDyOQ7Nv74no2/yFxrTh6h/ug+PDs2r8M99+
	eVDCboQGccIzN3M2Q4/dyNLIWNxKy7UH47RWU5bZKQifgvneYhWOzXClOYMj/4AYhgGuNp2VnEy
	wy8cQoESZ6aLHSqfvGIgu2fkv68XtjWkKwO22whaiIA0RIgYRUlDPpNBJ4JZC/ucZpli9N3sQzW
	ay4Mt7sY/IsNJJueDxOvlb+6/cSyxr8qU8Mas1LPn7KpZOsD2WmhoMsVlDbNf6e7TXDxQKqWtUr
	syQVUn4L6/hKFzWgVxV00H8vcQBspKSKD/keXHiDyjrX82JSftm2V9T5ETmB3sO/TVtY3OWPb67
	ONVsSWXiUASF4XULrE6FG3JcOD0tpAMDMYfuiu4Umgarn359vvU44kMDyuQKuMvSoqNysvkzZ6w
	==
X-Google-Smtp-Source: AGHT+IGDpGQ1keH41V5u7okn0umUzJaDZ4pIXQPpFP/RgbssUfZTewtEXcOU16HUhZmJhf/y3/QSQg==
X-Received: by 2002:a05:6402:40c8:b0:62b:63f8:cdbb with SMTP id 4fb4d7f45d1cf-639d5c4c1e1mr12894658a12.25.1760178460551;
        Sat, 11 Oct 2025 03:27:40 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c132567sm4471906a12.33.2025.10.11.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:27:40 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Richard GENOUD <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
Date: Sat, 11 Oct 2025 12:27:38 +0200
Message-ID: <12756400.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
 <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_032742_529914_CFC8E0AF 
X-CRM114-Status: GOOD (  13.01  )
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

SGksCgpEbmUgcGV0ZWssIDEwLiBva3RvYmVyIDIwMjUgb2IgMTI6MTg6NTYgU3JlZG5qZWV2cm9w
c2tpIHBvbGV0bmkgxI1hcyBqZSBSaWNoYXJkIEdFTk9VRCBuYXBpc2FsKGEpOgo+IExlIDEwLzEw
LzIwMjUgw6AgMTA6NDksIEtyenlzenRvZiBLb3psb3dza2kgYSDDqWNyaXQgOgo+ID4gT24gMTAv
MTAvMjAyNSAxMDo0MCwgUmljaGFyZCBHZW5vdWQgd3JvdGU6Cj4gPj4gKwo+ID4+ICAgcHJvcGVy
dGllczoKPiA+PiAgICAgY29tcGF0aWJsZToKPiA+PiAgICAgICBlbnVtOgo+ID4+ICAgICAgICAg
LSBhbGx3aW5uZXIsc3VuNGktYTEwLW5hbmQKPiA+PiAgICAgICAgIC0gYWxsd2lubmVyLHN1bjhp
LWEyMy1uYW5kLWNvbnRyb2xsZXIKPiA+PiArICAgICAgLSBhbGx3aW5uZXIsc3VuNTBpLWg2MTYt
bmFuZC1jb250cm9sbGVyCj4gPiAKPiA+IAo+ID4gQWxzbzoKPiA+IDEuIG1pc3NpbmcgbmV3IGxp
bmUgLSB3aHkgZGlkIHlvdSByZW1vdmUgaXQ/Cj4gPiAyLiBLZWVwIGV4aXN0aW5nIHN1bnhpIHBy
ZWZlcnJlZCBvcmRlciBvZiBlbnRyaWVzLiBJbiBvdGhlciBwbGF0Zm9ybXMgaXQKPiA+IGlzIGFs
cGhhbnVtZXJpY2FsLCBub3QgbmF0dXJhbC4gSW4gY2FzZSBzdW54aSB1c2VzIHNvbWV0aGluZyBl
bHNlLCBqdXN0Cj4gPiBiZSBzdXJlIHlvdSB1c2Ugc3VueGkgb3JkZXIuCgpTdW54aSBvcmRlciBp
cyBmcm9tIG9sZGVzdCBnZW5lcmF0aW9uIHRvIG5ld2VzdCBhbmQgdGhlbiBhbHBoYWJldGljYWxs
eQpieSBzb2MgbmFtZS4KClRoaXMgaXMgYWxyZWFkeSBjb3JyZWN0bHkgb3JkZXJlZC4KCkJlc3Qg
cmVnYXJkcywKSmVybmVqCgo+IG9rLCBtYWtlIHNlbnMKPiAKPiBUaGFua3MhCj4gCj4gPiAKPiA+
IEJlc3QgcmVnYXJkcywKPiA+IEtyenlzenRvZgo+IAo+IAo+IAoKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
