Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8006AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IFWoUOb56x44xCULdcAFz5QQecsxVNbqyfCGKqsQBI=; b=Pl395+9aiioHY6
	ScguXYu90ENJ/LhAZ4D5qyNKR1DXdpqarcF2lZwDX5XDtD7jpJ6bBdqRf8hqb8+7k/buCVNk7aWme
	thxlXWv/2eEiFoEEQt2vefoPSEqNA7YfnuO7euf4LDEeZfc4IxSeTYFzNO1AMyzWzZTQ7LNTJ7j6o
	CYWt33jn0KgTPYOguA5tWauGlIZ8fy29TIN14/CFzrPpzeWX+P1n4xViUy1VUTBpYdZW/626IdPVv
	DrgF/eiejcLYxBl6sqONEAUomB5KzxSgvxXd8Cc/5ufkdZKAYmmLhweZDKNeaUNokfzpWuGI84gZY
	HvDLXnEcsWzLscgn3oRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCJ0W-007R55-Uw; Tue, 25 Jan 2022 10:25:01 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCJ0U-007R37-1W; Tue, 25 Jan 2022 10:24:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id z19so19117367lfq.13;
 Tue, 25 Jan 2022 02:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=9BG2GS4zinb7Ow72+Oc/dISNMPxbcJYV6aq+uT4bdK0=;
 b=blXz03GfcmGHo8II4aBz3Obb+udMVXJzDsGHCznCs3ZCPSRdsakcLuHbROuo1SK4GA
 SuXp367kkdb+yMu6eMKCScOGPafKSq7CceAdgCuWq4Z9277qMxceJIsKDWqdCnEeorOQ
 2H586I5mrrK0vzkFrABPRkeuSP05P/Mxk78zi4kU332uYNcRyimOmgvh3U8qZPuATc2u
 wotd5ayJVrV4m4JwUXMBQmzghcPyxWohRchMtcyMFfqsbrqG5W8oyNdqChZaKL74vaJ4
 R8Rq7IKtOJObQbMyc75nKQ7G8ifhQ7oRUW1+iDyp2F8m8XhDxejtXj7I4Ey8gwZNE2Zz
 8jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9BG2GS4zinb7Ow72+Oc/dISNMPxbcJYV6aq+uT4bdK0=;
 b=kHfLoCUtY12LsZisf4yxul7jJvCwasehWhXUzHZ3ijixX4KVnurKE+9PGHV1lZQ32m
 VbYgL8VX93tkG3BvU8TyMB+Bz7UyvdmhTTh26HFAPfkJh9dEwJ9x96QpDB2yZmBmBNmO
 r3kDbxta45JaUAAfKj6hee3NlCiqujKW25P1jCOyXJ7p1NwTawJY8I12O39w/JJZDiKP
 1QGqWHtNsD9irXXCk/IZiOSPyb+a/XQXy0HTcy+K7QzVUVbYeCUDRTIp3y9QHZ/5Xnap
 IGlQKRVonDXKWzJ0oPDUtTLBXeIo79S0adNrvu1E+wQgcfvFgLhdUIrqIfRftdo1MV/C
 6dwg==
X-Gm-Message-State: AOAM533i6KVgUQ4D9/ZpXX1Hho1vLLvN23bxma7UfL7QNj48qw6hyyq+
 oYVESoItbYWrvGLRiil7O+o=
X-Google-Smtp-Source: ABdhPJy/dzbGa69dT6Zgyw2xUBM0PDpzJjNBd9JiVGSa3Rrdvss02918Vl59SsYkbxguJc/zayyU1A==
X-Received: by 2002:a05:6512:39c1:: with SMTP id
 k1mr15660735lfu.207.1643106295329; 
 Tue, 25 Jan 2022 02:24:55 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id k10sm451341lfv.258.2022.01.25.02.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:24:54 -0800 (PST)
Message-ID: <0d9a0ce5-ab34-cf05-158e-e25fc5595b4d@gmail.com>
Date: Tue, 25 Jan 2022 11:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 5/8] net: add helper eth_addr_add()
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>
References: <20211228142549.1275412-1-michael@walle.cc>
 <20211228142549.1275412-6-michael@walle.cc>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20211228142549.1275412-6-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_022458_140049_12510CB8 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28.12.2021 15:25, Michael Walle wrote:
> Add a helper to add an offset to a ethernet address. This comes in handy
> if you have a base ethernet address for multiple interfaces.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>   include/linux/etherdevice.h | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
> index 2ad71cc90b37..9d621dc85290 100644
> --- a/include/linux/etherdevice.h
> +++ b/include/linux/etherdevice.h
> @@ -486,6 +486,20 @@ static inline void eth_addr_inc(u8 *addr)
>   	u64_to_ether_addr(u, addr);
>   }
>   
> +/**
> + * eth_addr_add() - Add (or subtract) and offset to/from the given MAC address.
> + *
> + * @offset: Offset to add.
> + * @addr: Pointer to a six-byte array containing Ethernet address to increment.
> + */
> +static inline void eth_addr_add(u8 *addr, long offset)
> +{
> +	u64 u = ether_addr_to_u64(addr);
> +
> +	u += offset;
> +	u64_to_ether_addr(u, addr);
> +}

Please check eth_hw_addr_gen() which contains identical code +
eth_hw_addr_set().

You should probably make eth_hw_addr_gen() use your new function as a
helper.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
