Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6957EC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 01:13:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E866143B
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 01:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E866143B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N+kcgLyy9HJmJbeM8CqebEAgNxcsbIxiHg5+mWU9ouM=; b=lIxJZxCLxnA3SGAKROGUMgstF
	PZGTZj9Em0SN0BCLtjtAHsMJCO75Z31X4iddhf/0fWsd2fvMRshGnzK+2h2IUbtFiav1OIDH/PQZ4
	tClD50REU3lIyMY+PAh2+jybRnBf9LkQlWHiaUNc6JAAgQ7HgEQQCQ7IETI6OtOLXSGh9+IqZq4IV
	194xy/9mg25/MdJOK9EXgqCOV0ohuFkDgN4Fgmaax1VB5Z7HTajqLR8zrLyZKSGUr1wuU/yXb7GsP
	tEhA3OxLLuHii2ETCeV3lRycmqGSoEmRENrvdQ0qglH1IA/IENfUB98Vu9hM+YbBgU2QcVeG1qTrF
	ytGGvdLow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbvDf-004bQu-2D; Thu, 29 Apr 2021 01:11:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbvDb-004bQ8-Qe
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 01:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B9WmxfQPgVB/G8qqdqqrH4JxR1XC119NUyqOOtSd7t0=; b=XDXNJAXy17PLdsCBMgfS5Os7W9
 y00T+/85RfiJ0A/+D+oXc2MOWJXObRyC/MbHFq3D/nB8Asp9F+JHSCnBLPbCaE0ywaggXd789Ksq5
 J2b3yDNMfd+yA702+OMAjbc06D9jVXUOklinKdkLwyP2ofT+bFgVW4Quj4Ue/PyPRBpQd1FCXCV4K
 ZMVEkJwkXyGEBdSTYB04oofEYVjb5of0t5oRHTlLJ1HZMuZwdUaZai2P+zocerLmBHTDu0BmFNyFM
 5g1zcd972NI0ndvI5u6foGclL4Sf5i2Dpwzg3Fx/s948zhj9MMLx3L3LsIt3djcSjE21OmwcBFegz
 8bR9vPBA==;
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbvDY-000J3B-SN
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 01:11:50 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id l7so1093348ybf.8
 for <linux-mtd@lists.infradead.org>; Wed, 28 Apr 2021 18:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B9WmxfQPgVB/G8qqdqqrH4JxR1XC119NUyqOOtSd7t0=;
 b=pkiPHPNLc8oPY1Rpg9s6MMH9zsVYb3Pu6hknNjJ97Hfi1mRnSBTaBnKpkK1xFjd1Qc
 cQcOSKlv6GspGLFBVFS0a2R7wfDy66R5CFpgbbx4KptsbtihfP16CiZn9rhGgXqx5QTW
 bT7wJSVgy86XNC/E1yQdfItBAZhtztfAwi05/r0kJhF9SMDdROLy1hNoB4qjsCCc7xWl
 mnFO4W/wNfSaDiAaT4Hzi7/2XKbK/+nwY+9Li/v4xqODqdRq+++/zwuK2aVSJ6jeZ06F
 W59O7/MT/99ty+gNnLuDf32EQ5etfkSEubBJ3iZEk34moqDnV4u5QwEcMfSvrieB519k
 avQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B9WmxfQPgVB/G8qqdqqrH4JxR1XC119NUyqOOtSd7t0=;
 b=jCnUFyTMWM8Sds/cPAZhHb+9BIBLu89Za33iGvkumfD8zg1FCo+yjKLabEF10teGvq
 0rQVbw7qi3rYNzetHs8dhrugexQSLedynLk4jpbFbJ4AQErC/i/IHm3VtG2bMVqTf/hM
 T2zlKsg7YAlzIG4oZjlxU88aMVngdU2HwNWWIjCpWYVq5wCxXw2Ggg0Bl3D3H75pQd41
 1XK7gvXuieR6SZL+ylkYtoLIc6sNoY+oOI49M8ZM0lBHat0vZSiB7FkcT6Zb/iAIu1mZ
 6ud2lzIYgpJW3NLrES3xQRBDAWw1qd3+a8Ei/9CZirwKjUED6ur1DtGxGpN5JPsx4uAe
 vYGw==
X-Gm-Message-State: AOAM531Puqap0weSOB5HQTOGJtYhVDE4C60y9yO53Mvp69qskrDoIuAh
 xb4jtyCXzGu+A4zESlkbEjJUXsOfTdN2VfvnLOBQmg==
X-Google-Smtp-Source: ABdhPJzGFBnav+DZBGGJcieg9JxgTULrcj3YfzoYD2uRXeNcTYI7rbQImezTdi5sUdA9XukgcMPYmupPisXhoBxFVf8=
X-Received: by 2002:a25:58d5:: with SMTP id m204mr47013043ybb.32.1619658706418; 
 Wed, 28 Apr 2021 18:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-2-sebastian.reichel@collabora.com>
In-Reply-To: <20210428222953.235280-2-sebastian.reichel@collabora.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 28 Apr 2021 18:11:10 -0700
Message-ID: <CAGETcx_YoYJkOgh=kX7tZf-oAWGMmTDT+Azm1A3thWD1SRy_4A@mail.gmail.com>
Subject: Re: [PATCHv2 1/5] rtc: m41t80: add support for fixed clock
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Collabora Kernel ML <kernel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_181148_978154_C8FADDB2 
X-CRM114-Status: GOOD (  27.66  )
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

On Wed, Apr 28, 2021 at 3:29 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock has undefined behaviour. For example when using
> the hardware watchdog the system will likely do arbitrary reboots.
>
> Referencing the m41t62 directly results in a deadlock. The kernel
> will see, that i.MX6 system clock needs the RTC clock and do probe
> deferral. But the i.MX6 I2C module never becomes usable without the
> i.MX6 CKIL clock and thus the RTC's clock will not be probed. So
> from the kernel's perspective this is a chicken-and-egg problem.
>
> Technically everything is fine by not touching anything, since
> the RTC clock correctly enables the clock on reset (i.e. on
> battery backup power loss) and also the bootloader enables it
> in case an something (e.g. an unpatched kernel) disabled this
> incorrectly.
>
> A workaround for this issue is describing the square wave pin
> as fixed-clock, which is registered early and basically how
> this pin is used on the i.MX6.
>
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-m41t80.txt |  9 +++++++++
>  drivers/rtc/rtc-m41t80.c                             | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> index c746cb221210..cdd196b1e9bd 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> @@ -21,10 +21,19 @@ Optional properties:
>                        clock name
>  - wakeup-source: Enables wake up of host system on alarm
>
> +Optional child node:
> +- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
> +
>  Example:
>         rtc@68 {
>                 compatible = "st,m41t80";
>                 reg = <0x68>;
>                 interrupt-parent = <&UIC0>;
>                 interrupts = <0x9 0x8>;
> +
> +               clock {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <32768>;
> +               };
>         };
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 89128fc29ccc..b3ece42b6f90 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -544,10 +544,22 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
>  {
>         struct i2c_client *client = m41t80->client;
>         struct device_node *node = client->dev.of_node;
> +       struct device_node *fixed_clock;
>         struct clk *clk;
>         struct clk_init_data init;
>         int ret;
>
> +       fixed_clock = of_get_child_by_name(node, "clock");
> +       if (fixed_clock) {
> +               /*
> +                * skip registering square wave clock when a fixed
> +                * clock has been registered. The fixed clock is
> +                * registered automatically when being referenced.
> +                */
> +               of_node_put(fixed_clock);
> +               return 0;
> +       }
> +
>         /* First disable the clock */
>         ret = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
>         if (ret < 0)

Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
