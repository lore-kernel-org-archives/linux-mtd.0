Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF8CC00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Db3x0/lw307sBt3GnkRENOHMwQC22PmfT6k2rwhF0dA=; b=cd4zPh4nCKL2Bd
	ouUyTnZ5QQ0XtK/hL5NNFOp/SWufrzbrqxbSM9HWENw/DSULWm72G40NX1V39U6HYDwAHtfug9IYV
	LTJj6xopjeJy8J7AjwrxLXCLP8N/IBkTmS0rg0LYg6EtF72Byj9VP8/Lf7ECrTxBmMq+dQnwKGF3D
	Wnd9L+RSAjV3HHV9BUKUIjTpAjhkJNW4Y1sfPGb8Y0XU7j20vtevyprHnx+R05nR0Wi2Sp8aIwj0k
	FUwVz4f6G5cm+HUBLkxnRGr+01DQSx7NB351JDnENGSD3lRcFhPZkKVJXBvM6RoVgZP+dW/f+ZmN9
	i78EI4VJk2ykhg4UW0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvK9M-00AS73-03;
	Tue, 24 Oct 2023 16:21:00 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvK9G-00ARzj-0M
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 16:20:55 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-58962bf3f89so240512a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698164451; x=1698769251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsRJQiFxbxGOm8RZglwhZ4Xmss7Cw8PVrqOjVSH3hyM=;
        b=YfGo6b5dsnA0+UMhr/ZvdvHZaOrsCueMz34jeYywesKSuumySroihkMF3yExyYmOUI
         Ic0xrXfr1YXR/YCXQ9xOPyI5o0uhBfazqqypIFzeGlzXp546a4azggKklahPSyN+1SOX
         YS02L4FdK6SsqWzxEfwto/nd99DrqZCqhBgmYxNd+xl8pAQXS+4e5zsFqBDi74PjqqSr
         a0FQHQv5pDTK9j7YcTrHhoSmHH/cd+zYmCzIct6XXIxzh5gEqUoX/47WjqprmOVkIkCv
         z67EMpwJS8TQTJJWvlVvr1hHsY46+NtOZZy16vtqk9/adVL5mMVmpIjkk/9/FMIrCn/x
         +Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164451; x=1698769251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsRJQiFxbxGOm8RZglwhZ4Xmss7Cw8PVrqOjVSH3hyM=;
        b=cdEv47aKjletFYddWGkDFgiW9L046+NolFbc2zZJfvdbQNGaC5VXL1eXvqYetmRphY
         tUdKp5pk4yra794Sw0yqj2iGLA1RvyF+7RHHjIMEVKPebBNyps9fn87Kj6+LhcVRwZsS
         vYBYp94VdGUcMvM1Mf4jQzqB1nwR0xae+YZTtYhScs30dyx5plykCkDQSu4kCEVhc56H
         ZRSQL+QpfiTo/OtjaA1+Phfbr6cSbLt/RRhq/ARWJwim998G8vMnFjepp9xLYffk9x4q
         pAP5h0MuBOhoYCQLVeoHlRmhZ8D4gY6SgbnwJExBHSunbsQH3yxfRgkGG9MkJU2chhyr
         hryQ==
X-Gm-Message-State: AOJu0YwzvYrP04/4dg09Bu+RT/L7aIkjME415mabYf1BeY9thNnXYhql
	DtyRyxQ3lb5J0Tq5o8tXnuCQOHKcZ8Q0txYtPxQ=
X-Google-Smtp-Source: AGHT+IHbwuH1pArNU5KjylMKO985Xmr8aHT1UI8LRl8oCKCY1OLAHW5Q1u9E5MiU2ejKH+3/6aNG+MPWjWRM0ni5es8=
X-Received: by 2002:a17:90b:4d88:b0:27d:3b8:a08a with SMTP id
 oj8-20020a17090b4d8800b0027d03b8a08amr14190459pjb.1.1698164450809; Tue, 24
 Oct 2023 09:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231023213800.2599704-1-festevam@gmail.com> <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
 <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc> <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
 <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org>
In-Reply-To: <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Oct 2023 13:20:37 -0300
Message-ID: <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <michael@walle.cc>, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_092054_150486_07A01832 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgMTI6NTPigK9QTSBUdWRvciBBbWJhcnVzIDx0dWRvci5h
bWJhcnVzQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBkcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYywg
c2VhcmNoIGZvciBuX2RpY2UuIHNwaV9ub3JfcGFyc2Vfc2Njcl9tYygpCgpPbiBteSB0ZXN0cywg
c3BpX25vcl9wYXJzZV9zY2NyX21jKCkgbmV2ZXIgZ2V0cyBjYWxsZWQuCgpJbiB0aGUgJ3N3aXRj
aCAoU0ZEUF9QQVJBTV9IRUFERVJfSUQocGFyYW1faGVhZGVyKSknIHRoZSBmb2xsb3dpbmcKY2Fz
ZSBpcyByZWFjaGVkLgoKY2FzZSBTRkRQXzRCQUlUX0lEOgplcnIgPSBzcGlfbm9yX3BhcnNlXzRi
YWl0KG5vciwgcGFyYW1faGVhZGVyKTsKYnJlYWs7CgpzbyBzcGlfbm9yX3BhcnNlX3NjY3JfbWMo
KSBkb2VzIG5vdCBydW4uCgpXaGF0IHNob3VsZCBiZSBkb25lIHRvIGdldCBzcGlfbm9yX3BhcnNl
X3NjY3JfbWMoKSBjYWxsZWQ/CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
