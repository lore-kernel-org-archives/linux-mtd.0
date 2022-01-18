Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C77C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 09:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGelcCoiNs/yt5Sl4ToPo4lEQqHBj0e7bDy+MMtT9o4=; b=G0oHyz3u1VX76q
	fM8ae48HK4vH1ZG7I/f75MCCITta4Nev//KWCHAqi6DW9AXkKbtlQD/UPO1tPoiuR02VBVs4JFBy4
	jEZ/oXGUty/JqllQrtdGNxX/5rvOUGkgq4MI3+2tyFW4CEklcWJl9Dy3LZu1oeDRfnyt9OAdoFBIm
	wzmI6yZRr1Mmq/AozNvJuOs0WeZ7oXW4T06iL3q1PkKxOeqyCNhNaUqnbTmIQD7eIw1RJodMiG+e8
	a2pvBOxgKX/cyckPiA48Iy3IwbQr8YzqXEUccw29x+vM5z9uSSWRx+z2L9LTQIrDXiVtlwJ2mZlMX
	V9srUV7JLZ7fcgq/jgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9lEK-0010jg-GD; Tue, 18 Jan 2022 09:56:44 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9lCr-0010A7-37
 for linux-mtd@lists.infradead.org; Tue, 18 Jan 2022 09:55:14 +0000
Received: by mail-ed1-x52c.google.com with SMTP id t24so76888711edi.8
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jan 2022 01:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gS+McM99BOsxvgHxeM4x0busg1n4mFja6rUY4zotoT4=;
 b=ZSEH8tiAoctr1Ec2wZ8zFylBCoSFuEj9+zg3vdt9ziHlmbbcDITIMOJN/df6wna54c
 j+8+LTG3J04j2sWDJMga11YnnHXzUPSaQLC1tC+R/LCSElwitRxA+xsoOov0NdfEdF7l
 DhF5/2gHDaXCg0o0SQN3CCp+S7v1HBSCYnEpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gS+McM99BOsxvgHxeM4x0busg1n4mFja6rUY4zotoT4=;
 b=Oh1vdK31bDaM/ZMEnTHM9DCezMnok37YzpsgeUJ6BkeNy4uGBuXQegyFRMseEMxvWN
 8TQYfBRjy/KDRfjNA1ncpKZJqqrtD0SCLdY8NvSF/cmmAq9wjsV+xLXmyNO+aEL8EuF3
 iI4tMKvMD4n3ujDBihDS00c0A+Vp/4NZOdH0+4XpEvThKhWz6lBeTOB8zQqFeqoXd9ja
 I075ZP2fXP5HWGTToEyFJj7XgtfpKnw10UZ74Bbe7G5ij9Uwva7cedZGPTB5g0pXKWSv
 oPiWGjSR7zUrmE2jUtM2IQWuGDimdRn/Ws5hr9OWmj2ka0FgkP3bjEdZFcYkcKYgey49
 5zGA==
X-Gm-Message-State: AOAM533IRpFsyij9SCC8u+aiZcB/6N+cJRGPZPSrPJqdedRqRvbIZoft
 4uQlmRRVWwe6I08eLBPM+nifOw==
X-Google-Smtp-Source: ABdhPJw7G96SDLNhtQf0/8gp+iDRI2d7IwV0mbK8W3Y3mEzeEuJ4ngwDBUWmFlLiOlbmnlKt2rK16g==
X-Received: by 2002:a05:6402:27c7:: with SMTP id
 c7mr5259157ede.116.1642499711260; 
 Tue, 18 Jan 2022 01:55:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id w3sm5173520eji.134.2022.01.18.01.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 01:55:10 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: rawnand: gpmi: support fast edo timings for mx28
Date: Tue, 18 Jan 2022 10:54:34 +0100
Message-Id: <20220118095434.35081-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220118095434.35081-1-dario.binacchi@amarulasolutions.com>
References: <20220118095434.35081-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_015513_166184_6049FF28 
X-CRM114-Status: GOOD (  14.76  )
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
dXRpb25zLmNvbT4KVGVzdGVkLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU+ClJldmlld2VkLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cgot
LS0KCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCmluZGV4IGNmMzVmNDIwNjAzMC4u
ZDk2ODk5ZmE5MGI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQv
Z3BtaS1uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFu
ZC5jCkBAIC03ODcsOCArNzg3LDggQEAgc3RhdGljIGludCBncG1pX3NldHVwX2ludGVyZmFjZShz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAogCWlmIChJU19FUlIoc2RyKSkKIAkJ
cmV0dXJuIFBUUl9FUlIoc2RyKTsKIAotCS8qIE9ubHkgTVg2IEdQTUkgY29udHJvbGxlciBjYW4g
cmVhY2ggRURPIHRpbWluZ3MgKi8KLQlpZiAoc2RyLT50UkNfbWluIDw9IDI1MDAwICYmICFHUE1J
X0lTX01YNih0aGlzKSkKKwkvKiBPbmx5IE1YMjgvTVg2IEdQTUkgY29udHJvbGxlciBjYW4gcmVh
Y2ggRURPIHRpbWluZ3MgKi8KKwlpZiAoc2RyLT50UkNfbWluIDw9IDI1MDAwICYmICFHUE1JX0lT
X01YMjgodGhpcykgJiYgIUdQTUlfSVNfTVg2KHRoaXMpKQogCQlyZXR1cm4gLUVOT1RTVVBQOwog
CiAJLyogU3RvcCBoZXJlIGlmIHRoaXMgY2FsbCB3YXMganVzdCBhIGNoZWNrICovCi0tIAoyLjMy
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
