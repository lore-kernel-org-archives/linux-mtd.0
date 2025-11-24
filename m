Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431FBCFD313
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 13:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4wVzFLijPuYY2cOETWkCyLTM3CoytetAIHgwjvTF6w=; b=LVHBcGqJLJby0K
	m7STeSsY6/l2AqVT3satFCJedlp3+TGyqXczVUoHgarshXByA5RaKPwDE4a7jx8ywjhODC6egOb3I
	THx0Mm1puiC253PGnFq2qOkEoLRcqXFC+Pg++voJumD1K4ZNyJ1XxR+yRO3D2rQS0pquM3ZlxQIqC
	fNXjEJcNZX2M6kvbNV2055ZgICAvCgzzdeQ2A/ZR/At38Pzr10WL8e7dweg2m5Ky/m46nUtmXEf+U
	EQPEHVLt0hj7Rl34spnrduM485e2Zo4RxT8x37Q4bIAf6Qr5XBGD/D1ioyjvMTTMklSQnFrpDD/p4
	65MwSHBozaEenDxrpHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWOd-0000000BiQs-3jZh;
	Mon, 24 Nov 2025 13:14:23 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWOa-0000000BiPu-2mo1
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 13:14:22 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b1dde0961so2903816e0c.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2025 05:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763990059; x=1764594859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bHE9e9lyhwQFjGP9yIqci5PhFl7iYu+8qK6gTUGgmE=;
        b=eLUd+UoMniNtPVcb/GfbGiuMFE6PI6IIlf+h0+O0aDxlIruBCPASO7EUaZI6uLDmql
         CwfbhJs+woH2r9r0Yf1PxEV/KUuADtVG5IjE7FEsqHrRVlsuNFBZI8qKhV4NdebF5cGL
         zLaDhiI39LjgrpGqKK6l5T69CIQ9xkuDMwj6Os9kUwyyVQWYaaTAyr0VmmABAORY4cCo
         ZtXnnV8RCQC3gqELxgpX2IdIcyJVVg+FfF5UF3IJUbyZMHX+x9kxP0Tmzt2KHmQTecPo
         5Hn6We4gibH0lYz5QeePJLJ9Ctp+KSsC7NXeGyc+IrUuTPK3eS4dXjH6Vxkkh4t//eHB
         ON6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeWCpx09REw9DgLv3ZqKS2KxQ1VCKQwLCgsNSboNaKOFgwso3k32a6yHJY0Yb850/5Q2xapC911Kw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr6/qHbD/m5qSFJ0CchpjnRLpRWf3LRrTRLTyyhiv8sWmawMD9
	IziCZLOb2ulRduy3jI2uL2trrUBJz0HK+4Fekjwp4ZD01HNXPYAOin1UTq0UGzYm
X-Gm-Gg: ASbGnct0ZNxG31kjhQgyFBiU131bGgZHnrsvusLcVpQ60tGyIw6BGX2G7Ad0qhY9kxH
	CgmaCMvw0JZK19O35n8ioQrSgOWVwS8choQdrEr6L8oIhuJzavWGJ0EsRGghn/14gql2OeMrWRq
	5rJTY5qfmiZyqF6MS/RVa9XWimFZCKF5jZu8BVL3HP4VSApEtrDLQRSB6gjoQofPB1K6sWZ1sVk
	IuTw2bZGluTshIBfTvXftpDEF8CS3xax9Wx1AeZ8iTM6ZfQgkRTAm9MBCo3d9FF6w6iolZMrkC7
	Pyuy7srhxnliq76ntXaqFRPpJw1os2CtF0DCDxtXad6fMrSHEbCWh2qu/2MAYHrO0u12l+w1eqZ
	qR3iosv2l037m6VLHizDXLWsrtfluSsiXJ2rcK4MOttjya1Bs4XxjUhB74oqy7JwOB4Rm6Bvzen
	3gdea0mWKTTcEF5dLqkSnZ23AX60hQknG9uyxpKHJMIWTTNJdf
X-Google-Smtp-Source: AGHT+IHvWKF9OkNbYwW13JYmpiJAOYWo9ci/JFwzrKwMIdbY/mjv4iUkvXjCXGIk9LH5WS/MSLyZ3g==
X-Received: by 2002:a05:6122:3bcd:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-55b8d6ec7a8mr3649726e0c.4.1763990058913;
        Mon, 24 Nov 2025 05:14:18 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b806c3b4asm5564208e0c.0.2025.11.24.05.14.18
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:14:18 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dfae681ff8so3044641137.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2025 05:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0O+zYzRAwm7B0nBtakzfTvW0UC23Yw4Vb6+Fv7TfAEDEC8tgFWmSaPwV2rhDncmTZQQiEV2uFL54=@lists.infradead.org
X-Received: by 2002:a05:6102:418c:b0:5dd:b2a0:ac6a with SMTP id
 ada2fe7eead31-5e1de0099ccmr3268164137.9.1763990058356; Mon, 24 Nov 2025
 05:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20251123163551.1781-1-vulab@iscas.ac.cn>
In-Reply-To: <20251123163551.1781-1-vulab@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:14:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUP+8ZWsTP-PHBOuNSTL7jeRHsXwf5Gg21vHL1=St-cxQ@mail.gmail.com>
X-Gm-Features: AWmQ_blEpUB3KHQH888MRi9b9TpaEf5WWmlFZbr6ESxPlHyyvt-aFINqUoOx-oo
Message-ID: <CAMuHMdUP+8ZWsTP-PHBOuNSTL7jeRHsXwf5Gg21vHL1=St-cxQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_051420_708899_AECCF92D 
X-CRM114-Status: GOOD (  23.68  )
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

Hi Haotian,

On Sun, 23 Nov 2025 at 17:36, Haotian Zhang <vulab@iscas.ac.cn> wrote:
> devm_pm_runtime_enable() can fail due to memory allocation failures.
> The current code ignores its return value and proceeds with
> pm_runtime_resume_and_get(), which may operate on incorrectly
> initialized runtime PM state.
>
> Check the return value of devm_pm_runtime_enable() and return the
> error code if it fails.
>
> Fixes: 6a2277a0ebe7 ("mtd: rawnand: renesas: Use runtime PM instead of the raw clock API")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Thanks for your patch!

> --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
> @@ -1336,7 +1336,9 @@ static int rnandc_probe(struct platform_device *pdev)
>         if (IS_ERR(rnandc->regs))
>                 return PTR_ERR(rnandc->regs);
>
> -       devm_pm_runtime_enable(&pdev->dev);
> +       ret = devm_pm_runtime_enable(&pdev->dev);
> +       if (ret)
> +               return ret;

Perhaps insert a blank line here?

>         ret = pm_runtime_resume_and_get(&pdev->dev);
>         if (ret < 0)
>                 return ret;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
