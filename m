Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D9DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZmPrwGXw6eVvelzEOB1xDMfIFHfxDlouYjgzOk9zuk=; b=pPs4b9JkZ3/iqt
	lxF5omqs1lI1d7uQvbLcsYSa01m1DqO/A7yRJ9Faqgd3fylalZxgIPVod3QGewKCy66iaxyEi1cQs
	ZrWBXq3HH4yrkGAs4EEuMLpJWo7wi/+eb932vfjmn4AkyVD19W+cpaTVU0+4LMxo8KJllFCwilzgO
	lPSPo4cP8WS93GLK6wGUx35WxwOwxWmOy/xOeLRHG3zh2XGmHfSUaNCnyvOGacMj2NptAPxjFG2Or
	aHXi2lIKqPQZTRH0cgZvuhzTBJxz8d7tuktGC38o+PxOnh1NbNrhGHmW78ZfkTq3hcnckX2pVyiEr
	Rc4ZlZW9LXLXLzGB2SsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI9Tx-003sha-BC; Thu, 10 Feb 2022 13:27:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI9Tl-003seU-5q
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 13:27:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q7so9487594wrc.13
 for <linux-mtd@lists.infradead.org>; Thu, 10 Feb 2022 05:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lccT1vDs39uO4OztszPn43naV87bgv8lF79Kis/tyDI=;
 b=ppLX4h1TEy8PBW7a4orzxmSRVpkxMMzDVgFrPPO+f6wmqSNbpVbyd980agqXUsmsK4
 1t3S3V3yoGn5PBZR2wXsNiBwTiBg+7IWH1M5aJJPZiGs155neECX0Xdc2i3WXR7UwbMM
 aT3Xtfs00uZGf1TbnMYWNrEUtQHMZ5qRjlmiRc0/xqYQhMq8duwRHg0U0Z9pXtKzJ45Q
 hYfhYVE/1cZLNyTrYw1GNDxUZjkYoAd3FPrsD2ljbrv3HGwfrkyETIATbgIB71TaTNDV
 dnfvww2HWwcMyGbOkxaLGF8pIQWjKAPbfSCnWB56bK0zNRSMtsjTh7NuJVkUEYKppMbv
 lTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lccT1vDs39uO4OztszPn43naV87bgv8lF79Kis/tyDI=;
 b=hsv51y5YuwjO1Gk4WF5AWDDScbN+R6bsbAZGIgMQT02YWhWIHVINmSaINq5o32GsL/
 5n1vldnuLcpxAaRb+5dB745ALAJnNyn82conbgPirFU9LiSsX+jox5ecT7R8Y4sMlsRl
 OtLSa7srGo91n9SOSlOXI7+kcG1XBcEE5HoIxy4HG9jYhO8IYVJ+lBhGHaFtPRFsGgfw
 LG53ARwEoIWDOTrredwHSecg5d0VSIbGP6bmC36bcFhNamLCPhpdcKtZs2Q4tpbvXbZO
 l8jyWblqvNS8zry1GCwKqiRUZn+mBImp+el9n1OCqCiIDK+O6T+ReFtndaBrMrMB7+Uk
 TJsQ==
X-Gm-Message-State: AOAM533ifXtLrk2m+0EYvWn6XwCbnQqwNuiBaXotNQgVhyq7ep8Htt2e
 DqOE8dZA7ejRFfNwQPt3zkf4yg==
X-Google-Smtp-Source: ABdhPJzKId3yDGkhp6bPVmSqb71G1h0/VzUuaq+GY1xoayMe32i7GhkM4V+qZRiTEWVDWxES+I9IMA==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr485824wrs.275.1644499638587;
 Thu, 10 Feb 2022 05:27:18 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id h6sm1559790wmq.26.2022.02.10.05.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:27:18 -0800 (PST)
Date: Thu, 10 Feb 2022 14:27:15 +0100
From: LABBE Corentin <clabbe@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Message-ID: <YgUSs3uIgpb91UgD@Red>
References: <20220131080858.1777518-1-clabbe@baylibre.com>
 <YgQvsQbGEBgfAoVO@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgQvsQbGEBgfAoVO@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_052721_247386_ED279245 
X-CRM114-Status: GOOD (  23.41  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Le Wed, Feb 09, 2022 at 03:18:41PM -0600, Rob Herring a =E9crit :
> On Mon, Jan 31, 2022 at 08:08:58AM +0000, Corentin Labbe wrote:
> > Drop mtd/cortina,gemini-flash.txt since it is nearly already handled by
> > Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
> > =

> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> > Change since v1:
> > - fixed typo on syscon
> > =

> >  .../bindings/mtd/cortina,gemini-flash.txt     | 24 -------------------
> >  .../devicetree/bindings/mtd/mtd-physmap.yaml  | 18 +++++++++++++-
> >  2 files changed, 17 insertions(+), 25 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemin=
i-flash.txt
> > =

> > diff --git a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash=
.txt b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> > deleted file mode 100644
> > index efa5b2aba829..000000000000
> > --- a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -Flash device on Cortina Systems Gemini SoC
> > -
> > -This flash is regular CFI compatible (Intel or AMD extended) flash chi=
ps with
> > -some special bits that can be controlled by the machine's system contr=
oller.
> > -
> > -Required properties:
> > -- compatible : must be "cortina,gemini-flash", "cfi-flash";
> > -- reg : memory address for the flash chip
> > -- syscon : must be a phandle to the system controller
> > -- bank-width : width in bytes of flash interface, should be <2>
> > -
> > -For the rest of the properties, see mtd-physmap.yaml.
> > -
> > -The device tree may optionally contain sub-nodes describing partitions=
 of the
> > -address space. See partition.txt for more detail.
> > -
> > -Example:
> > -
> > -flash@30000000 {
> > -	compatible =3D "cortina,gemini-flash", "cfi-flash";
> > -	reg =3D <0x30000000 0x01000000>;
> > -	syscon =3D <&syscon>;
> > -	bank-width =3D <2>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/D=
ocumentation/devicetree/bindings/mtd/mtd-physmap.yaml
> > index f827984936f6..82eb4e0f453b 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> > @@ -44,7 +44,9 @@ properties:
> >                - numonyx,js28f128
> >                - sst,sst39vf320
> >                - xlnx,xps-mch-emc-2.00.a
> > -          - const: cfi-flash
> > +          - enum:
> > +              - cfi-flash
> > +              - jedec-flash
> =

> Why is jedec-flash being added? The old doc made no mention of it.
> =


Because one board (gemini-dlink-dns-313.dts) use it.
See commit a10d862e585e06aacc3a03e230fdf8faf6b1caf0 =

"""
The flash on the DNS-313 needs to be probed as JEDEC, it does
    not conform to the common CFI standard.
"""

I will add this (the addition of jedec-flash) in commmit log.

Regards

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
