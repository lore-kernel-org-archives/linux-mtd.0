Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE37C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plLEdzks+9L9SweFuR+p/Pv6+gkLJOjF5RUyXjbnomg=; b=TVP5S3pRISEycF
	6jJb46iujxY3Om0enQnpj7l0vCxegV/Q3QaPgYVZSpmmkVrQzRjVSYBTrieTsrfVzl6o1QtO09+6j
	fUB8uRi3glPvBqITmmCxedq/ry70G6tYoteijJIoFjZ3Agwn9QTtBZtSdG2DuGjT3ittsPrWavauh
	1on6YStqmr3IFEmq0UtMTCpMH/xBeQb5aXPY9JkDSH6RxeuFxVaCQveFTC2UIUAwjZ2Haev9PZTwS
	GZIQa7QKFlGVJv97q7hChhMLl5EuGLfYH+T/fqL0s90VyL4c/APeSSjoK6IjDdmlHeXOyEdziWl49
	lIBn515H2d4lUimviWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1radEL-0000000GeHj-0pK6;
	Thu, 15 Feb 2024 15:00:53 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1radEJ-0000000GeGh-0O8d
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 15:00:52 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-607c4fbae6dso7095847b3.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 07:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708009250; x=1708614050; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ0BMQ4fbAPxFZIL+ExAw2UZkWvzvacKzKpaYXVa9bs=;
        b=VMUWnwBcyhUjPbckAGGFI04B+j8QGk3oVMzbPf0gHsxYl2tH2xxtaA0EECzlM09jjR
         +nnugcXijsgvsrc934gHb+xa9GyE4KAx8LCn4jpSoyKPZUKqY1fcT5uRxf3JkSH72vQj
         r2mF0a6D8RH4L2NVT5Qoo6UvQyaXWVkqw77Gkds7j2dPnfIsDsIK7R8qnFg5KOJZTExL
         P/gAo1VC3FSbVTCg+edkRxJ4wgZ380nIqZ9Zj0PnWzOJakUUSirYAPlBt6Mh/REU+IBs
         7lB5jyeTc3X/shtz8C9WXsTEjfhcFwMoiwxeONnoz6TqApnUWFTQot5gIOTWR4oWkvT3
         IttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708009250; x=1708614050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ0BMQ4fbAPxFZIL+ExAw2UZkWvzvacKzKpaYXVa9bs=;
        b=LbNDNCDCNV1SunldKRC2VsANHtVyxyR5IFnRwSrzo90FME+WqOhIJxNkD17OXku6Te
         HeXx7pLHr4KG6VCQl68X/Jv+FtSs1XCRj3OAW38RBXHLQpIncPgEruBVS3Qj3hVTA44U
         FEzDrJJ0EVHoeJJbBFk/lmC0tupDOlIQK+sjwuFxn6rhPJIYNMlun8w53gBK9EnrQVc5
         JkUXpN8iQrxYr9n6HgBhEXfWtWvVc5ojsVu6YU533X1wHlDMQHTrYWnmczhN90bsWwWK
         XuNC4AOE+VDiwbJ+n178S89hogQY1oMKMTE0CWpfkTSuSo0coORcanGtlD5eI63Gg5oT
         NmeA==
X-Forwarded-Encrypted: i=1; AJvYcCVKsTaYJ+bcfJcaJELkXx2YUEfKMJPCWYZYYZUtGH0kPEYl3mkn6wolIkdHidhw92YfEUOAtP/2txveuWA/p/UtArO//vuSLZEY+qlFKg==
X-Gm-Message-State: AOJu0Yy0Gp48hDzJTtCS1JAZDgmBx3Moxecljl0BHPkZv3D24+FGGEoy
	3TiODFSR33b2AyPOHWe0Uu7gpr3vxDChrXQJGjwnsJmSEvH/K68c8tgjURhW1tG7qewTAzvaF/G
	hGf8zfCZAZFD1E6s6MTRhH/Bl3uyUijhK7+pLcA==
X-Google-Smtp-Source: AGHT+IH1iXXNMam85attnJ7ZRIB2/4oXnewhRdPWa1d/MOJ9E89Emu3qeIMg52lohwW+P6inqZ48cubKQOYzlT5hKRw=
X-Received: by 2002:a81:7994:0:b0:607:7e73:fce1 with SMTP id
 u142-20020a817994000000b006077e73fce1mr2063382ywc.26.1708009249786; Thu, 15
 Feb 2024 07:00:49 -0800 (PST)
MIME-Version: 1.0
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com> <20240215134856.1313239-6-quic_mdalam@quicinc.com>
In-Reply-To: <20240215134856.1313239-6-quic_mdalam@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 17:00:37 +0200
Message-ID: <CAA8EJpqV=w38TqjfTp6OurAwHjR87PpmQTs2jUo6O7vF1-T-WQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq9574: Disable eMMC node
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_070051_158837_456C17ED 
X-CRM114-Status: GOOD (  13.55  )
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

On Thu, 15 Feb 2024 at 15:49, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
> Disable eMMC node for rdp433, since rdp433 default boot mode
> is norplusnand.

Are they exclusive?

>
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index 1bb8d96c9a82..e33e7fafd695 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -24,7 +24,7 @@ &sdhc_1 {
>         mmc-hs400-enhanced-strobe;
>         max-frequency = <384000000>;
>         bus-width = <8>;
> -       status = "okay";
> +       status = "disabled";
>  };
>
>  &tlmm {
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
