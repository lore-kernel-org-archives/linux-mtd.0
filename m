Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A248C07E95
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 00:06:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 083EA613D1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 00:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 083EA613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BffA4OhcRLt7hnuHQQVSsGFDN+pKzZX5X/NvsaHyeOc=; b=mJYqEri3jVCEjM
	lyNGqCqKNPBdqXV35aturb9+RDzRiF5YNcbRvbZAh70sBvygvD8rahkRprl5cEoox8KG7uT4hzc8W
	yYiqIwMZpo9gVggdWhjClnptHnpu1BVtz5WOBcmXx8tQhIrLd+eFGx+TuV9hdTNzdY5Q2hjg+LbPy
	P1mIn8nNPkBtys+tJpjUY2Vjn+7m155MH7anAJRlLFkBfP8oKknTpU4I0QZFLFoblEMroJ04BPnS0
	9PJDGiOGAiWP6VASMELXN3/1OHq5eS8b52nAj3I60+FqBo5LwB3eqMbLmNVMSkE1/VE9jFFFYjj4Z
	K/qoDSffKWlaKCdXowLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0C7Q-007NGy-6M; Mon, 05 Jul 2021 00:05:48 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Bbo-0077rz-9S
 for linux-mtd@lists.infradead.org; Sun, 04 Jul 2021 23:33:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id bu19so29159882lfb.9
 for <linux-mtd@lists.infradead.org>; Sun, 04 Jul 2021 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gTm2A7ibgQ3e28ydh3Ded5QurMsV9SerKRCbFyiWwjg=;
 b=MVSrijijak+qtCEaVC1btikMIX8cLj5ukVzkeWzNOYFTr1D47YslT6mVGEpn29hexe
 00422XeuW41z+qelfKCHSm9lmJsrVkEy5uyK/pe6WV8CW8yHizX1ljLuQcXeSsPn6YPw
 iCzen5uXIhqySzPQr90dmnz3cx4CRySVKpLg6I5mUk77Pu6YrL4QQl/iJsQGBqx/dUEo
 /2ia9gYJN9gDavx9fiwdX2fVPsRKgiUj9lvSLuuxG3Cpe/LVHkG3NVFMc1Ycq5/gatZz
 d8hqM6BG0Ll8Vdgn5BZtn+5j2pgdK1eEEd490na+fs2mg7sEuA0QU46ANkdjnmVNAayp
 YCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gTm2A7ibgQ3e28ydh3Ded5QurMsV9SerKRCbFyiWwjg=;
 b=Zu0vnPKcEw6GU13pxjMsE6s859n8FOQbGoo+6pvozk9zF9ara74Uq7l9NDdhNKStPy
 YEMJrH94PYqtC41cLT6WG9ADeOoKG7rD1S8QAUvpqVoCyivRGB54DRiTzUxVdPHczzb2
 2gk8Voto5L3mzDaw/M3HDm1+ECayfS/z8q8CWwmPrrL+BrGjZlSnVHwpglimqZUnw6w5
 DG/GZt+cCYQSOtfA+1LKvjxATVhhGQ3eDlTS6BFvrYX+AiZ5izD1jOotuj0f19TZXZdP
 jG2M3GHhWwGCR8cX0+SvGRddyF1FAOdzhXUtJkoeW+W0crQRw3jk0N56M86VofojW1PU
 pjEA==
X-Gm-Message-State: AOAM531i4a53MY6MVuchmShTBfY41OdJDRqyvlrH17cGv05mgSOFPDic
 HIMm2jNM26Qg2pVxg9atxMat4AblaCP+rvT3/OnZDw==
X-Google-Smtp-Source: ABdhPJzHBVSn3DCxq/UwwLLJ3pQ6m6/ni3OVRb137FHXyXohsJpIBm/Ydm2kvT4Sp4+nKR7J4qfWPOR6ywfkhH5x0Co=
X-Received: by 2002:ac2:55af:: with SMTP id y15mr8683741lfg.29.1625441586652; 
 Sun, 04 Jul 2021 16:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210628191440.2823024-1-clabbe@baylibre.com>
In-Reply-To: <20210628191440.2823024-1-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Jul 2021 01:32:55 +0200
Message-ID: <CACRpkdayenaEWvXCvU9pwMVs7C1O=5US3LYAMxS1EVtDSTs_EA@mail.gmail.com>
Subject: Re: [PATCH v2] dt_bindings: mtd: partitions: redboot: convert to YAML
To: Corentin Labbe <clabbe@baylibre.com>
Cc: =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh R <vigneshr@ti.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_163308_406285_569395E5 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jun 28, 2021 at 9:14 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> Converts mtd/partitions/redboot-fis.txt to YAML.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Looks good to me! Thanks for doing this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
