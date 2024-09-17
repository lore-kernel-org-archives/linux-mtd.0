Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C30CCAC591
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWgcYtAgMkwlCTu4l30Rvmt6oBNFSczEymhT6/FXuII=; b=vg5N8X0zdrHeMz
	YYtawjF6XhTaPm3QbDt7Vjrk2OjUv4dbt+4qUD05J2Yvqy3l6NeqsSoGnN0fQiTBiL01iNYZ87pDA
	qH9wZE3b3hBBzmEvJfON+BSOJhVlPAJVUzUvRxDQj1pj9R7UBmJkqP5a+lNBDjmQ7KNagPTtNU6Wv
	VGOW3+8wNyZwa0neWQw1HcVe21q/gonZ1dwgwFJW4jGB5BZ1tMQG1XMqlzgYBllrRaVlSOg79hNad
	kRbOq1kqGkQPUcovu8/VTWymqxfoh5s3u4r/L1vylwv42pzBViP+W4gneHdNXkeAKxD66k2EhUIIS
	9ES/M6iqru5rINQ8z/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqbwe-00000006bCG-2tXS;
	Tue, 17 Sep 2024 17:24:56 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqbwb-00000006bBg-2YpX
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 17:24:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5c26311c6f0so8206622a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2024 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726593891; x=1727198691; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnRoikBSLAdyHdgiB2Nvl7M+y+qgJGkvLu1aR7KRctc=;
        b=JyQWWAodvU2lIiCm1RvGZN8K/wlMm9KVihosRQT8hQkomfrlf9Dd8CCZCIl7tClNk/
         VbYnBVLo1a73aQJYjpY9tpH+3ZROyuMA/93Oq2+8u/fOrfPVTYUelZ5t1F9WD2amvRVg
         QGcqAUoyLSKPyRQIoISky5qheBhTHTvP5fYzBOJh9HQ6gE7LW5SYL68a0fm3F7grwFN9
         IyidSIcmsxwGGssDtsMs3cp32Rj6TvyL0ujG9PMjNXjc15XrRZncMvEnyTCrc/3TWnJK
         qaeah5zCQx2lRoBRT2KsaSl4G1BZrRffSS+uRgXYspvYTCao/OQyTDbomGMnNY8ZNALO
         gXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726593891; x=1727198691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnRoikBSLAdyHdgiB2Nvl7M+y+qgJGkvLu1aR7KRctc=;
        b=hQ4275ojdv+1MgGBZhHGgUYrlJXAuVjN7orew6lW/Z+0qNXVL/tuZu8BGts64HadFJ
         OG1I1wHNWMoL44Xy7CG5cpYIF4gzdk8GNvLuu9AFwPzIxJ7GqM/ujZD8HXlPWlzHg7n9
         LOXq+2H0K13wOdQf2aT9iR8K69WXwIFvLZ2naQ+es0WuyudbCoozSUCkws1e8oOIcKvi
         316s64/G5o0iduzCvGXfJoxxB+MhpRb7PsO0eQro92A6xw00X5AQh8JwAfk6Kl+A9gz6
         0gymcjdozVkJqLw8/LK8jxPzT3dj+9kNNQy4nVC4xRZwsPjKs0AlK/Ho9adiTstDOJYM
         RtiA==
X-Forwarded-Encrypted: i=1; AJvYcCWCCtTHeTyD1JXs3BZoQhVRAhIcvPSxW/QvIiZkR0pq2FUny37llL2w2YPEIL5MeRpAoGg6P+ZdrIQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuiSkKC3PbrPtqIVPak95xwyxVuMMfKUm/GpScI7dI2lDsqQST
	KHBLU2g2pnOYcdgLSP83OH4sR2Lhw+IaQAY1ZSfO6I3Nd+UoSwYQ35b9OVyu/l3BIzG5h17TrBa
	vAPb7clcUlK7CDhgbmzDY4gPnhQ==
X-Google-Smtp-Source: AGHT+IGwwp6ZGJvzsQTeNC0u7Fy37kDIWdvbQ/4lRre03Vts9cqGVpEQqd1peAQbt9PnTy7wvU5Qk2ltX9t6HDvGnGo=
X-Received: by 2002:a05:6402:5186:b0:5c0:902c:e195 with SMTP id
 4fb4d7f45d1cf-5c413cbb42bmr19797345a12.0.1726593891251; Tue, 17 Sep 2024
 10:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240917094956.437078-1-erezgeva@nwtime.org> <20240917094956.437078-4-erezgeva@nwtime.org>
 <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org> <CANeKEMN+ZUAGKGsqnaToDB3AxX9NN_JeCBWHwd-wwnTWLU3R+g@mail.gmail.com>
 <64ef46b1-7908-4b15-866d-9cabe2e5dc9e@kernel.org> <CANeKEMPwgtECfksgz6jXkR+bjVFwCB9DOh1q7t_3WeojReqxbA@mail.gmail.com>
 <e0db2f62-b2fd-4b61-932c-cc2caf5dd647@kernel.org>
In-Reply-To: <e0db2f62-b2fd-4b61-932c-cc2caf5dd647@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Tue, 17 Sep 2024 19:24:14 +0200
Message-ID: <CANeKEMNCFKX2thq+Ws0vy9ovbQ7dve3YPh_FbRaoOEgL+7c_Mw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_102453_671981_3726EE1E 
X-CRM114-Status: GOOD (  30.67  )
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

On Tue, 17 Sept 2024 at 19:17, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/09/2024 19:11, Erez wrote:
> > On Tue, 17 Sept 2024 at 19:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 17/09/2024 12:42, Erez wrote:
> >>> On Tue, 17 Sept 2024 at 12:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>>
> >>>> On 17/09/2024 11:49, Erez Geva wrote:
> >>>>> From: Erez Geva <ErezGeva2@gmail.com>
> >>>>>
> >>>>> Some flash devices need OTP parameters in device tree.
> >>>>> As we can not deduce the parameters based on JEDEC ID or SFDP.
> >>>>>
> >>>>> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> >>>>> ---
> >>>>>  .../bindings/mtd/jedec,spi-nor.yaml           | 37 +++++++++++++++++++
> >>>>>  1 file changed, 37 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>>>> index 6e3afb42926e..d502b7fab2ce 100644
> >>>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>>>> @@ -90,6 +90,43 @@ properties:
> >>>>>        the SRWD bit while writing the status register. WP# signal hard strapped to GND
> >>>>>        can be a valid use case.
> >>>>>
> >>>>> +  opt_n_regions:
> >>>>
> >>>> No underscores, but hyphens.
> >>>
> >>> I'll fix this.
> >>>
> >>>>
> >>>>> +    type: u32
> >>>>
> >>>> It does not look like you tested the bindings, at least after quick
> >>>> look. Please run `make dt_binding_check` (see
> >>>
> >>> I run "make dt_binding_check" on kernel 6.6.
> >>
> >> Yeah, we are no on kernel 6.6. You can run it also on kernel v4.1 -
> >> still does not matter.
> >>
> >> Don't develop on ancient code because then you ask us to review same
> >> broken stuff we already fixed.
> >
> > I test with Beaglebone black for testing, it is difficult to run the
> > last vanille version.
> > I did backport the spi-nor driver.
> > As for "make dt_binding_check" on last kernel, it need to upgrade the tools,
> >  and I did not think it could change that much.
> >
>
> Well, it is possible to build kernel on small embedded board, but that's
> quite cumbersone, slow and inefficient, considering that it's just
> easier to cross compile. But anyway, binding check does not even need
> cross compilation.
>
> Sorry, the code is obviously wrong, there is no such thing as u32, so
> you did not test it. I provided link which explains how to test it. You
> must do it on latest mainline kernel. Just like you must develop and
> generate patches on latest mainline kernel, because this is where we
> apply the patches. We do not apply them to v6.6.

The patches are based on the lastest  mainline kernel.
I do not understand why you think otherwise.
I will run the "make dt_binding_check" on the mainline kernel.

Thanks for your feedback.
Erez

>
> Best regards,
> Krzysztof
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
