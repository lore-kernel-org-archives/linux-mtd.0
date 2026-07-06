Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ECBC44500
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 18:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8KlVvIWCNZJp27nZH9mIO0BEhB1Lpwa9IbJQnaYVp0=; b=Cgdyl/kgRchBOk
	tRvrUlcIynLQOaYWx3TaxXrcRbLRXU1aeJvS8svDIcWRPQdtsk2iDSROgiwCKCJ41rdhSGsBtCk6r
	hajcmYV+cLX5cxPq0dJmN74F4hbazJgPo+zAaHrOw0gX7MpWzJVNTYCJO105Zgq02RoxW6356V4M+
	yzESZwY6RCAgXrqT3KFlmQrCh3tJQwAbKLZNYz1y2lNru0+0rGnR8M1o7DMcMd+x0sncmzXNaBtLJ
	hOoSKftJXtlhX/fh9uVSJAC83IZcWRIq/vFNjaGJA9/5gZ6oqRlE/sKQtmcNi4wxpgKX2/TBEq+Q7
	Sl6onQmcCKtXdY5WPInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnki-0000000DIp8-1WfC;
	Mon, 06 Jul 2026 18:09:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnkf-0000000DIoT-0WY4
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 18:09:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493b691cb44so24050445e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2026 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783361343; x=1783966143; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPaGqcrIwUHb7Vzhi3ZnBUWMwxvshiDblLgHxtklATA=;
        b=CuZi30eiCNcvCAhYSoHtwZIZLvtFxVc/BCfNEBuJy4x+E2vOwNTjD+SBVqE5pRReKE
         tNiu0/OJGNUTPYORtweA4M99A7qy1DaXDY25ihow5WLQf9/7NhPC50ZJnwtN5R3TPtCn
         Dgkx5wcoS0wCJP/iF5WYWwc0yYFUAb2DQs3lqq5FLMOgvrqWn5a6uuxRvogpNBVOPXer
         PWFT/lubHwDy5jF8Di8eYNZPHe26PGcMrxK4+FzKPtB0zHF+BO6hZqBoZYFqAaEGMsNT
         V7spiQUUSQTm5TyWdDRsOfZ43ACjfXsGGNqTpuSXRAkg7UR5z3K2bsXbQxsMv60UPWTu
         nTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361343; x=1783966143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPaGqcrIwUHb7Vzhi3ZnBUWMwxvshiDblLgHxtklATA=;
        b=A+5+BiGIL26nBkdokS5b9tS0Hb7JB4oCqRQB96XhntDPq0BO3Vwlkv6oPR2qL/cGQY
         WpWNiY+VgsWTcOzSecnNP+wS2yj753oxfD1bapIvWdYEVDg2SfAlSUwCfOtDiXSlYvyS
         0lwzgk5P7IF2YlbtCHxDCSOCUkPjdWeRxuDE6IQw796XmraAJlMagS1Cr4bB4IxadUeF
         1ae/KqNXU0Y/4tyytoYjQAF6y6+xybReK8yIGHU8Pi2ye48ul/9+jUFESuLeeVf0r+6+
         NxkGbAJ0YD9hxBpyuANq5jEyLn+ZyDgwHwOzxA806Q9hXwdUy4jqryIqiDm/zKyzQXyX
         304g==
X-Forwarded-Encrypted: i=1; AHgh+RrNib/+NJBufR5CzR7Q0ojiksfO7mesVP0dEeLe4awWNBjWJKMVmHSuCP0XjBZgT89GgpdsD5bi0ko=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7yyrN8BNRsBiWJqbfNj1fqOywsu4oOhvidolxGxMu+zoILt68
	2dGgDyCayOG/6TWszUumuSW8dSFPCGDjTDEs9NcqHI98wUFIQoyqonc=
X-Gm-Gg: AfdE7cljgvEKgSpHhQ2pPshsBy8BYzyvigtRrO01XYqCFU5dFmNBPbmhnnIVgV1VWvy
	RgGO+cThrRHXGpVyKevK7Pnav5ivHwOStXnZXWSsYh077+uC+1HZudfMCTL4ozl6/sa0e0uaFra
	EyOC4zQy1fLPKYPo3TQyQ+oWPrfFUpSZy965kH8NW+BBHaJH/y1GXxwZ4dk2xp0HYS2WUK547N6
	h2yyZbxaC6tjpCb89BE/Ya/uToPv+0tQGBJGDrt4tT48xAs7deX+Ktzvine5xq9O2FGCKEVoh6h
	4+jGcUDQFaMpaK2+N7rvsbxaf7iuAjrNVl1SoMsOo4oNE/U8ixJ/VvrRnzmIfbr3cjjXinrtN0l
	iUZYo0Nd5o2EEdo5c5cmo3ITwMVHLuPamvrr5vDmp+nAkcIg2xZmGkKhKvRrBKrbltxHcHHTXYP
	E6AlL7amyaQXAEU0WpRT72U1Gd86BYxLj5gRTAhRRqlj9Wl22RId8laQ9jX8yHu8+myw==
X-Received: by 2002:a05:600c:4585:b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-493df09e3cbmr20223435e9.38.1783361342554;
        Mon, 06 Jul 2026 11:09:02 -0700 (PDT)
Received: from lithos ([2a02:810d:4a94:b300:2d45:3978:fa0d:bf54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e01c00afsm1353555e9.4.2026.07.06.11.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:09:02 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:08:56 +0200
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
Message-ID: <akvvOA972XsT9Ifo@lithos>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
 <20260703-b4-maple-cleanup-v1-2-41e424964da5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703-b4-maple-cleanup-v1-2-41e424964da5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_110905_182746_9A647863 
X-CRM114-Status: GOOD (  25.50  )
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

Hi Dmitry,

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

For patches 1-17, 21, 22, 24, 25 you can add:
Tested-by: Florian Fuchs <fuchsfl@gmail.com>

I applied the patches without the mutex-related ones, and dropped
the 18, 19 (the mutex ones) and the depending 20, 23, 26 (as didn't
apply then).

The mouse, keyboard, controller is still detected and working like
expected. All buttons, sticks, wheel and knobs work. Patch 2 seems
indeed to make the keyboard feel more reliable while typing.

Thank you,
Regards
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
