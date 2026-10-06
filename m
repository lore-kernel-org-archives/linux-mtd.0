Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A3FCA5FFC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2026 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvzax0BnvMJEmEghJ8vz/pcdeMU4M+Zzp77Kr4Hxu+s=; b=sCEi98Xpt8nn6j
	7/yGjcbRcKYJfUbvcL4n01hfOFHCYVN9WTd0lrHIQy1sD6Qcxf943cN4RNb0buPru9vULN8xM1h1M
	F8fTbTZTCYnzs0yDoJhZM2Yk5ifSWHnAEF1/GJLw2G/gt6DLev8WqhbsKaqDU1sx7fG4VLln70Je+
	9ELpP4qoyy/fLU3LPMkvG4HYeDp8N6pzeNREN4RsopGei8eh0muhZzX0WCoJA9tw30P3jOM87auKT
	q2IO0myl8S4TTx/7+GdIR3x7J34IO8TDQ0z6BDzZTn57XTfFbTE9H6rwJDgbM3tc0IDROy8by2+iM
	eBe69pbxLkMWM/LafygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2cA-00000000Xa2-2Uij;
	Tue, 06 Oct 2026 10:41:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2c7-00000000XZM-21JY
	for linux-mtd@lists.infradead.org;
	Tue, 06 Oct 2026 10:41:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso339519f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283297; x=1791888097; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u9EgTKWvY83NOreoEpihq3C4uu+WwUDt2rznQTC8D2g=;
        b=AHJi9vlRqRzze5WNcWOfDy2pLgBkFx7S4g2mwKDE+snsuXCYOhIOI++6I8s4ygDIp2
         g47CwdzdKLYDM3JikSAw4jHOG/DVYG7wehvA39Rolye9vm0S0TVU7pFCqSNw/STFzeto
         xHWa0UDzW+yobASJR90oqeKvHezaxLqvg3F0+m0ckTbU6njU8Otafc13jzS9R5FEN6tT
         qXT0GYMdtMD30m+Mg4dHRhhHONePm83P6jdMJ4sBgHK9qqP9e5dxj8QnD1/8zA8RQC9u
         DF4B6F/nsFso/HoudpaKBxpippGdq5qU4dwM5u4HVPOGN0zevolpHJLVwwRCLjAzbWtk
         dOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283297; x=1791888097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9EgTKWvY83NOreoEpihq3C4uu+WwUDt2rznQTC8D2g=;
        b=dOr+Z6gxoCjzGDXFrqKRy4z+S54zQVFCKWWwHMCELgIEY7lU7/zrf8jKgfDwABrlz5
         YUqrymMFgLYcWdB3pptuNAx9FIvfE4Q3yy0o8w93RfPQBq2SodeDqkB0NTJIMVpjq2UZ
         AfzyHKwnZmtyLZV8I2sDCr6j33HbULXT01NvpyF8AK9vkGL6wNtcA/GMJ/HNjaydyeR/
         tCjIhAdLRY5Wx9OsJj/O3T2ioLGxUKkgmST70KNPG0Cm8R1zT1Z1+YIeuWvDEIXIjbFZ
         r2tuclgzqWOFqX7CTlu6iu7mCoTrdOFMgWJqt+6lEkafdKd/5EGkQOS8sTz/myJtqx/b
         o+Ug==
X-Forwarded-Encrypted: i=1; AKwUvByASMxbXtRlPBzWwJ29M+FQ/euHzu8Mtfi6mupIqPiEAZq/Wv6Y4N556xMrEURZNotuZs4E2Q+/IA4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKaB23TENpnKc5LGIl5hn7fGHjT83UipuLAqL+hseMaIBTlRxz7
	46xFWKL7ttB8KaFBP9Q2GNbKjJPNqHFhX2GAoWyyIaA+9so4/xNsuZU=
X-Gm-Gg: AYBFou0Xzxfs5yZ8RA3XUmQFa6PItp/v0MLafWqFxoqOpF+x9TwJH6gwjYsM5K8SLec
	vbMXv2RywCT69frW3L4U8l2bVKDMnP6ufNNroWv6RnAeW7hkMd6l8r75Uj8+6b1nAkWmjvyZB5a
	HTLaAR3a/nfCu+akqC5hYAnyIZ+iM3CdqfJiIQDA5UziE67F9EtZgLTkS6GRHRbSozS8frwfEPx
	R0nobl2iTUBp56msu4kqrsuvxDztEtppqwoWpqV0ORbq6bP/8vrAwSbZsiLNVlXIkdsXewaJ7ZX
	lzkSZGQQDgoXT1dQ6VXZexFQe1njcl/AOqdzAnpB5km0QtdL2NAYif+cK0OiEKLvSNGBUADDgVa
	/OiCQIzcbxQAQiBOQG5U8Bv5UUSUTm6kRo4IjHgyvMtvy2oGpbxqAU4jmxbRJ7l0z3iDjLR2G8k
	R7XGdno5xikInHQNDKiD0tr43bMD2EmdUrsny0IsETqxKpT+q15iffaFB1ZquI1NC/nEtwaeY17
	MFvlfPhMMF8poh5y4otAWnDOqwhZGW59ShnvMzm8xrCuAadcA==
X-Received: by 2002:a05:6000:2dc7:b0:48c:41c2:46d6 with SMTP id ffacd0b85a97d-48c6d1c1c1amr2258645f8f.35.1791283296969;
        Tue, 06 Oct 2026 03:41:36 -0700 (PDT)
Received: from lithos ([2a02:810d:4a94:b300:d1f6:bf6:35f2:f07c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704a5sm22046834f8f.15.2026.10.06.03.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:41:36 -0700 (PDT)
Date: Tue, 6 Oct 2026 12:41:31 +0200
From: Florian Fuchs <fuchsfl@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Adrian McMenamin <adrianmcmenamin@gmail.com>,
	linux-kernel@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>,
	linux-input@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH 02/26] Input: maple_keyb - fix key press detection
Message-ID: <asTQW0F2nqp2Kj86@lithos>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
 <20260703-b4-maple-cleanup-v1-2-41e424964da5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703-b4-maple-cleanup-v1-2-41e424964da5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_034139_539544_77422C99 
X-CRM114-Status: GOOD (  24.71  )
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

On 03 Jul 22:57, Dmitry Torokhov wrote:
> The key press detection logic was using ptr instead of !ptr (where ptr is
> the result of memchr searching for the new key in the old keys).
> 
> If ptr is not NULL, it means the key was already pressed in the previous
> report, so it is not a new press. If ptr is NULL, it means the key was
> not pressed before, so it is a new press.
> 
> Using ptr instead of !ptr caused new presses to be ignored in the first
> poll cycle (only reported in the second cycle if still held, because
> then it was in 'old'), and caused redundant press events to be sent
> on every subsequent poll while the key was held.
> 
> Fix this by using !ptr for press detection, matching the release
> detection logic.
> 
> Fixes: b11d2127c489 ("Input: add support for SEGA Dreamcast keyboard")
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/maple_keyb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
> index 3d5538dd4f23..623d7951405b 100644
> --- a/drivers/input/keyboard/maple_keyb.c
> +++ b/drivers/input/keyboard/maple_keyb.c
> @@ -107,7 +107,7 @@ static void dc_scan_kbd(struct dc_kbd *kbd)
>  		}
>  		ptr = memchr(kbd->old + 2, kbd->new[i], 6);
>  		code = kbd->new[i];
> -		if (code > 3 && ptr) {
> +		if (code > 3 && !ptr) {
>  			keycode = kbd->keycode[code];
>  			if (keycode) {
>  				input_event(dev, EV_MSC, MSC_SCAN, code);
> 
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 

Hi Dmitry,
do you want to pick this patch as well? It improves key press detection,
so would be nice.

Tested-By: Florian Fuchs <fuchsfl@gmail.com>


Regards
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
