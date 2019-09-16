Return-Path: <SRS0=la4X=XL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC798C49ED7
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 05:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 935B0206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 05:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="euEUgm8u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOmnIQti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 935B0206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mX68LX2Aswmr5VCkCZv3ZxYzmNOIIJZaTZQYPix1KXY=; b=euEUgm8uNX4hvc
	be07U8nsX9wTOFQq8J/Yzz3aAWdexldhdK9c/sTDp79FpbsfkOngvNFAPgee5egBTbHRLOocvsZBb
	b0LDy3qK9PTAbwPA113fQWgSH1o4uhtkNIU1Ey4NUlotJdEQ6WoqZEEIUAC8WTpCrdESupg/cz/ge
	8vVjwpUOOmFs5VZ88c8D65DC3vFq/bs9o5eCcQJGbUnkGcBgN052/R8+jyuaaRs0K4E85voou+P+7
	DkmvXO5agICXp99RFO2vRokosdpBLkOsyWoaGJEy6uQaSz9YKXXQvhoU+IzxvHlrXP6n6KHn6BACM
	D+KxAyzeHXlldkMq6I2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9k2M-0005SH-LB; Mon, 16 Sep 2019 05:58:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9k2J-0005Rg-P9
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2019 05:58:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5so2729171wmg.0
 for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2019 22:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCO8lvZ9eTy3WmVOqfO5aPcLrtX++eKbV07o7f10XM0=;
 b=hOmnIQtiuLFh1Wl6bPZ4WWhB0Z4D/sFTS7t6dghpK3j11rlm8CRtK1UTBAYM4pXGsE
 2RUurrrlXYXRUcGUR685qY53L0sV4P7czcRPDo0lS60xA1wcb+r+8ILpsd7Cs2PbSGTC
 A2+KdtjLCTpGTlDtPQArZKL7kNH+gpIMe4F294iFZynQhj0XHIj/uTfWxRky0C0CXjYJ
 oTMtnf7BM8TjvyruUF+OJ0j79NiHi4S1XpPoROl6m6BQeaztRt8AGPQAykrUyjnGreDX
 vhrXyMuAEmewgSahgJJAMDdr51s0P+fPVf5VtP7slxELYHdwplbjPXq+azXinkW2gjiF
 tYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCO8lvZ9eTy3WmVOqfO5aPcLrtX++eKbV07o7f10XM0=;
 b=ocVXOIhNGbBSdQBMxP18yOAGjgmtlkIWtjFTdPDMNOUDeEOMSZq08NqUm5po45H1A3
 AdG+Og7ROziRESuzUHX5DcKec9PnA7SPj+vWmp0FQZh6Sy/59K/kJ6fqXdWOblGvGgDi
 t4ViBbNHE8bLd0pC9f9ixD0O7nmg5lEkO55gshJB+llX2A6Dh8zxwq8495SrfYqZKFD9
 S6QCd/9EiE4AEYWNtEBvrOCZWWEMgsrW+45FG7MaZekkxiLsVsURsOHLsynFTPaGfpxK
 VR6nnd/VBraxNCEmYcomMriGVqRxfviwFOSPCWzhFDVVqMX+BK95ElRfE2395lM3qSr8
 JWGg==
X-Gm-Message-State: APjAAAUWytyu1KC0CcHG0mXzWD+8+UESi2drb5nVvHD1pjZjD9qeJG1i
 GgZQhNYVDp+4YnocQQcWyUiIgeTm+p/kgTekYX0=
X-Google-Smtp-Source: APXvYqwK1+bDQXwgIJTDhicWZB6r7tlAgIoYMrsUXTpjneavW9x9TjbyJ0tE3kr/MEQ/r15vmTjVfIWP2l/xgvfNsQg=
X-Received: by 2002:a1c:234e:: with SMTP id j75mr13392986wmj.9.1568613534161; 
 Sun, 15 Sep 2019 22:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <5b0fbde6-7245-92f9-7336-3d376389e0b7@ti.com>
In-Reply-To: <5b0fbde6-7245-92f9-7336-3d376389e0b7@ti.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Sep 2019 07:58:42 +0200
Message-ID: <CAFLxGvx4AP1y6qeYPN8jUfQv6bnKntZ7jSk9FJb+QMVVV18upw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: CFI changes for v5.4-rc1
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190915_225855_810816_E0527BCE 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2019 at 11:09 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi Richard,
>
> Here is the CFI flash related PR for v5.4-rc1

Pulled. :-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
