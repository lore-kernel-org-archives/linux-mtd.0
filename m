Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34138C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iw2PtEfMTZWmV8LFV+dHFLIOtPoPdGBkWzRkxWMqXEE=; b=Q7xnVVn9Rtj5Zu
	4m7Li4ssqD9uMZJxwMSgLOvNoeI78EA3wznEh3/Uz9gOPuQA7V2C0PBfuT8KrQZVbRu1h73msoomY
	088kNwJ4kzFqHngNcmqEDk6ormzTLW4+yyekVBR8hOBYKrJkHEHOFVfxF1tmcsW7awcf5IBg8mDeL
	0jRXUn1PRjTIYKat5svCzIihJHkCThJxbxhSiKK/E9U7N0GU7/E0tXvMA/ebdyiRsKYXdJ06GDfUp
	s1nhGczcNY62KbIPhZDDtNAUZdERd/FRimJeqrflv32L3k4faEUWLgigIB9yJ6j5HDsmY4vcVWrja
	Sq5UyEQCEXK1dVvFnfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Uj1-00FYhm-Bk; Mon, 17 Jan 2022 16:19:19 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Ui2-00FYRc-Bk
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 16:18:19 +0000
Received: by mail-ed1-x52d.google.com with SMTP id j7so19348914edr.4
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 08:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XLwG7XRfre6R+aQSdeErC+1iFRSY828R4VD71xP5o0w=;
 b=MiN7ibyXaw8dNl1iR4wiSvvN1GMlk9PZOGdk4g7mr7DrP1/Th/2U4RbDWc/BBnGvfP
 dl23vitA6D3p4CrilUxRiWqONsoZTTyT1M/J1k1kMMyKQllo7JI6Gvo2QonGAdlpvP3q
 LdjaIE5eRd7bJqDeBzFvYmFEC1uRw7gtVPy28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XLwG7XRfre6R+aQSdeErC+1iFRSY828R4VD71xP5o0w=;
 b=S7KA24YORSYYXcqv1LCcU8xAbWsO+GWAY62UoT9FTFdo5IguFwtAzGFnmyYJso6KKu
 UdjATlqJe/zAMCgZZT+c7wHuV5qISxcbugiLtAPn9P2zcAnM6DC8AvIWilu7cqfHBlld
 685tC4Wdgxx2fvJgXrjSN0USzImLwGGUPKISqBKPYqADphQABCzZX9xd6z/gN9jsOJqR
 5ZR+s2AeOTPHNCHT67rpf+T24x1OUsCaS1gp4xprohaxcJC5kncUypZ5jsTeMAywgjwl
 Fe4iHyJp7wXo0ZJGdBF/wm9m4wni/xjm9LV64oUdezZ8jyXz5FjoG4j8gVuGVE1hf58A
 DQRQ==
X-Gm-Message-State: AOAM533RhsBXTt5oEz4vkZNqELz2X1N1LQ+6G7X7EnydThYVpOSIOVFP
 7qNYErBXDHT0VUykoDL7MK+8HKw4Ac7B1w==
X-Google-Smtp-Source: ABdhPJzivBEVN9pJF+YeJqeoaLhyI85GbGL/0qRS9Y5rLC/zDWRgTEerETio7ZlsXLA7FE9MoLWzVQ==
X-Received: by 2002:aa7:c79a:: with SMTP id n26mr14887264eds.350.1642436295531; 
 Mon, 17 Jan 2022 08:18:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id s4sm4147652ejm.146.2022.01.17.08.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 08:18:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH v3 4/4] mtd: rawnand: gpmi: support fast edo timings for
 mx28
Date: Mon, 17 Jan 2022 17:17:55 +0100
Message-Id: <20220117161755.1863579-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117161755.1863579-1-dario.binacchi@amarulasolutions.com>
References: <20220117161755.1863579-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_081818_432444_DC5A4865 
X-CRM114-Status: GOOD (  15.50  )
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

SW4gdGhlIGkuTVgyOCBtYW51YWwgKE1DSU1YMjhSTSwgUmV2LiAxLCAyMDEwKSB5b3UgY2FuIGZp
bmQgYW4gZXhhbXBsZQooMTUuMi40IEhpZ2gtU3BlZWQgTkFORCBUaW1pbmcpIG9mIGhvdyB0byBj
b25maWd1cmUgdGhlIEdQTUkgY29udHJvbGxlcgp0byBtYW5hZ2UgSGlnaC1TcGVlZCDigIvigItO
QU5EIGRldmljZXMsIHNvIGl0IHdhcyB3cm9uZyB0byBhc3N1bWUgdGhhdCBvbmx5CmkuTVg2IGNh
biBhY2hpZXZlIEVETyB0aW1pbmdzLgoKVGhpcyBwYXRjaCBoYXMgYmVlbiB0ZXN0ZWQgb24gYSAy
MDQ4LzY0IGJ5dGUgTkFORCAoTWljcm9uIE1UMjlGMkcwOEFCQUVBSDQpLgpLZXJuZWwgbXRkIHRl
c3RzOgogLSBtdGRfbmFuZGJpdGVycnMKIC0gbXRkX25hbmRlY2N0ZXN0CiAtIG10ZF9vb2J0ZXN0
CiAtIG10ZF9wYWdldGVzdAogLSBtdGRfcmVhZHRlc3QKIC0gbXRkX3NwZWVkdGVzdAogLSBtdGRf
c3RyZXNzdGVzdAogLSBtdGRfc3VicGFnZXRlc3QKIC0gbXRkX3RvcnR1cmV0ZXN0IFtjeWNsZXNf
Y291bnQgPSAxMDAwMDAwMF0KcnVuIHdpdGhvdXQgZXJyb3JzLgoKQmVmb3JlIHRoaXMgcGF0Y2gg
KG1vZGUgMCk6Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQplcmFzZWJsb2NrIHdyaXRlIHNw
ZWVkIGlzIDIwOTggS2lCL3MKZXJhc2VibG9jayByZWFkIHNwZWVkIGlzIDI2ODAgS2lCL3MKcGFn
ZSB3cml0ZSBzcGVlZCBpcyAxNjg5IEtpQi9zCnBhZ2UgcmVhZCBzcGVlZCBpcyAyNTIyIEtpQi9z
CjIgcGFnZSB3cml0ZSBzcGVlZCBpcyAxODk5IEtpQi9zCjIgcGFnZSByZWFkIHNwZWVkIGlzIDI1
NzkgS2lCL3MKZXJhc2Ugc3BlZWQgaXMgMTI4MDAwIEtpQi9zCjJ4IG11bHRpLWJsb2NrIGVyYXNl
IHNwZWVkIGlzIDczMTQyIEtpQi9zCjR4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDIwNDgw
MCBLaUIvcwo4eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAgS2lCL3MKMTZ4IG11
bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIvcwozMnggbXVsdGktYmxvY2sgZXJh
c2Ugc3BlZWQgaXMgMjU2MDAwIEtpQi9zCjY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAy
NTYwMDAgS2lCL3MKCkFmdGVyIHRoaXMgcGF0Y2ggKG1vZGUgNSk6Ci0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KZXJhc2VibG9jayB3cml0ZSBzcGVlZCBpcyAzMzkwIEtpQi9zCmVyYXNlYmxvY2sg
cmVhZCBzcGVlZCBpcyA1Njg4IEtpQi9zCnBhZ2Ugd3JpdGUgc3BlZWQgaXMgMjY4MCBLaUIvcwpw
YWdlIHJlYWQgc3BlZWQgaXMgNDg3NiBLaUIvcwoyIHBhZ2Ugd3JpdGUgc3BlZWQgaXMgMjkwOSBL
aUIvcwoyIHBhZ2UgcmVhZCBzcGVlZCBpcyA1MjI0IEtpQi9zCmVyYXNlIHNwZWVkIGlzIDE3MDY2
NiBLaUIvcwoyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyMDQ4MDAgS2lCL3MKNHggbXVs
dGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2MDAwIEtpQi9zCjh4IG11bHRpLWJsb2NrIGVyYXNl
IHNwZWVkIGlzIDI1NjAwMCBLaUIvcwoxNnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2
MDAwIEtpQi9zCjMyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAgS2lCL3MKNjR4
IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIvcwoKQ28tZGV2ZWxvcGVkLWJ5
OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+
ClNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbT4KCi0tLQoKKG5vIGNoYW5nZXMgc2luY2UgdjIpCgpDaGFuZ2VzIGluIHYyOgot
IEltcHJvdmUgdGhlIGNvbW1pdCBtZXNzYWdlLgotIE1vdmUgdGhlIHBhdGNoIHRvIHRoZSBlbmQg
b2YgdGhlIHNlcmllcy4KCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5k
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFu
ZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCmluZGV4IGNm
MzVmNDIwNjAzMC4uZDk2ODk5ZmE5MGI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1u
YW5kL2dwbWktbmFuZC5jCkBAIC03ODcsOCArNzg3LDggQEAgc3RhdGljIGludCBncG1pX3NldHVw
X2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAogCWlmIChJU19F
UlIoc2RyKSkKIAkJcmV0dXJuIFBUUl9FUlIoc2RyKTsKIAotCS8qIE9ubHkgTVg2IEdQTUkgY29u
dHJvbGxlciBjYW4gcmVhY2ggRURPIHRpbWluZ3MgKi8KLQlpZiAoc2RyLT50UkNfbWluIDw9IDI1
MDAwICYmICFHUE1JX0lTX01YNih0aGlzKSkKKwkvKiBPbmx5IE1YMjgvTVg2IEdQTUkgY29udHJv
bGxlciBjYW4gcmVhY2ggRURPIHRpbWluZ3MgKi8KKwlpZiAoc2RyLT50UkNfbWluIDw9IDI1MDAw
ICYmICFHUE1JX0lTX01YMjgodGhpcykgJiYgIUdQTUlfSVNfTVg2KHRoaXMpKQogCQlyZXR1cm4g
LUVOT1RTVVBQOwogCiAJLyogU3RvcCBoZXJlIGlmIHRoaXMgY2FsbCB3YXMganVzdCBhIGNoZWNr
ICovCi0tIAoyLjMyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
