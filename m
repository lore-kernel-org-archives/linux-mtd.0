Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBB4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 10:37:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA9B60FDA
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 10:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAA9B60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jdZ0/jT4MShFcDC3GnmqrqO2S3PtpKNH/rfS+CTauUs=; b=RCHsIHuaIWTmBYuNNyEGAjsYdQ
	h3Cei03RIWXfWA6/fJ69wAyxjiGPYeJT1ZU1hxsqhV9xW2+ptjEf1sFLVygFrAyZKHigF8UzuqUdw
	+PnrGKm6A71eBSbhessQKazNpz/SPHrHdt4gts8pQG9gfCKB00ZUWkFqRHQWQ/mUShbB7xD10aPDz
	FZ2z721r0OawSutKAk1xiftuIP/T32/IM+tf7xNtgT8mzb4qYB3WM88JPt45DnZv71YTsu97WqPqU
	JrGEBgOWWQ6xq+WRdbzPIusx0tlg4jGh9ZzpzRoYQYF0ytNQtSriTuwt0Fu+9k1ixU69ByOJHhbj6
	cot5RiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPjKj-001K0U-Dy; Mon, 13 Sep 2021 10:37:05 +0000
Received: from lb2-smtp-cloud7.xs4all.net ([2001:888:0:108::2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPjKg-001Jz1-SI
 for linux-mtd@lists.infradead.org; Mon, 13 Sep 2021 10:37:04 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id PjKdmYA5MpQdWPjKem2WJ4; Mon, 13 Sep 2021 12:37:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1631529420; bh=pmZak51jVw9LOZpdrL6UGBR/GrisLVXFjv5j8CBgpT0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=eKBfUVJYPnpCPaeZyPVYGx9dqPMioL8SFANkSpv0PCSf4P1s2ZPzDBFu9/nXY6yH2
 e0HeFmgPuvqGhF7iz/T9v9oOjld/w7xt5ORLIyIuJUZcJ3hYqhuIVbOfwSW+4Ftgs0
 pjGcFN027doqWbZEFdPHWRkncTllRldolMmJ0Jqu1JdfyWtsKBGpXj5bO6TazHMi08
 tdFswL1JJVic6rG9xSZ1vMXOMpwrd7LndPaBR1CiKMCGJ38XbDMfmqal9AP4AF91Xj
 ebnl0cfxXGVjmul6dvnhBJGRyBZ4EYHgAXvTbO07ZJnDL9NyYUvx2hL2tR8dNqghNz
 tL4GdMqAS2Fuw==
Subject: Re: [PATCH v11 23/34] media: dt: bindings: tegra-vde: Document OPP
 and power domain
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210912200832.12312-1-digetx@gmail.com>
 <20210912200832.12312-24-digetx@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <03846b87-6235-4ec4-0f6b-a9a888e0452e@xs4all.nl>
Date: Mon, 13 Sep 2021 12:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912200832.12312-24-digetx@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfJGp+P1+1KIcOMgV32T3yhr923OcCL6/wUgJil5v7QWOOP0Zhj/WgNktUtF9PouVN93W6glH/2kdp/M/y5S07oUJCcQvwyLfCPTVaw2Dszv/oabbNhmQ
 oFuzCetEg8ofIfF8vqL0fULFUZKJedzqIARGayuWOMhLOKilSixA841OJYWhqxXzn9DP1W3PYyFVJV6PnISQJighPE3R/TzqK32UcI55jHK94SWFsdMGl+QU
 kqMyij9fqa9tL1zWDSRQYgBdCUets1Vk3aGi9/rOERQ2qwzKrz39iEhzekpGRMVkcnK2HgAOCRK5Z9Aacy4/syqYzFA3eGoLzZndlbzuyTKHMCmylRevB//V
 WEL9ZDWYDqSOqVmqHYCm6V8SE75AjCOwMuqzmvwYLOtXsh3QAX0G8OBXkk5tVBSE7gypcE5NL4amI3wZdxOcR5cgpGrKf1lUYe9Cu1M7mrl8mwiNYjZ+w/7Q
 zh4AWT5+UPVekYKKGrz93eD7I2xVxK8qJhfNL2y1Aup63pe1gby0163kFDAInmrnZvpSkE2POtuZD/XsXob3wbqqM2vlujy9pir71bXk97qwMeHU1U5NO/DY
 cU8OtE/Qw7XwOQEJwE7ABkRkiSAZ3r7ihUzlVFDPGDWV4sBh7BFHv+5VmAxSIguOYRpRwhzw2a6o2IFnykdVzQ1/a4rFhNC/N2bw9HwMBd7rCzogaty1g32X
 S2GEwXcKPHyjglR/Ya4vBRJWyD5+FenQnxroHTnOJvPwqhnFRb4549L5U3U1Nnbbvk++9Ih0bC/1C8fiFA6N4dRxGKPp33gosiXCRHHyccoNIn4GyojDiMMV
 1kBvYNtab/Vay9WBDCCtGLA8RB41v1Kj95/SCTXCWRNIdtPKqMwK0kjJ/p3JYdYr3c8I+2vSzElu31GZdky7VZh3MAe8sKYTc7yvp5ST0qDWlukb2bBKOMZE
 6Poq+10P3xEvReeU3j9hkxza2xLVGuWk2viD7LQjuLplObCr3m2HESKwdKcvjwuqo+hqVMiltl+dzW7Gj+DRSVBhe2TEPw/0TY0488IQ2LvDq45JCNiMWaL2
 zfwqXTlEsPMwM5OVEZvLAY8uELfRzxk2n9/L7Kga7jtL06UQFbTM6bC95CbGH9z9fWEOn7b4g3tN9lYgaUgNhmRHON/s9fwB5oB2UEG/Ew6xtlI5sUwFjif3
 PN7zHRKa3c8Ksb5pQfUdCs20Pe9xeZc1LEpkl3LAvHOUdh7dfetF5mQpaYQY8z6Ri5jgrAPMgF4cV1POl4RJCvrowJ2dgdU1cGZTXbqiB19W622pBgKcxeyM
 WmxEFei8okYUFvM5+lHKpd5+AIIBguVKnzqNKxXY7PxhfJ8rAKuTUoDlf067hrUDr6+K51FSXFzs9L3u3opk63Ik+4BglUdrLerpdCuVJD3Eyg3SiT9kfjz2
 1CJ0ScmOaqygyuQnfakSFzFa1nVTyrgQ7pg35A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_033703_106402_B36E0D06 
X-CRM114-Status: GOOD (  16.85  )
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

On 12/09/2021 22:08, Dmitry Osipenko wrote:
> Document new OPP table and power domain properties of the video decoder
> hardware.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> index 3b6c1f031e04..0b7d4d815707 100644
> --- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> +++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
> @@ -68,6 +68,16 @@ properties:
>      description:
>        Phandle of the SRAM MMIO node.
>  
> +  operating-points-v2:
> +    description:
> +      Should contain freqs and voltages and opp-supported-hw property,
> +      which is a bitfield indicating SoC speedo or process ID mask.
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      Phandle to the SoC core power domain.
> +
>  required:
>    - compatible
>    - reg
> @@ -104,4 +114,6 @@ examples:
>        reset-names = "vde", "mc";
>        resets = <&rst 61>, <&mem 13>;
>        iommus = <&mem 15>;
> +      operating-points-v2 = <&dvfs_opp_table>;
> +      power-domains = <&domain>;
>      };
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
