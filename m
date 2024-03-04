Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92CCC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2024 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K60aK4HPxE5SzIbzJ+44L7UI1/cLYVSjCaS/yjACW84=; b=RRSFz8sk+5xyXy
	hki+y06pp9RFRHKLS/Jz2MQ5WbrXmFTflJ5UKNwQLe6gKagFrNTK4RpDN586NQP/DZcxWlGiVYYfD
	do/ncFTG9UqpsZXfDwd8M92oQjvV+NCHZH5d1smsH2eS5fbPwsSLvPN9dMt0mYFWX7kIYADuNLGqU
	m8VlZWYIYDFodfmqXsIPbW7eLiiavYJEShsW1mJCaIHvSSjYssewOxWFv5H329XzvizLtszC6hjKK
	m8raTuowyVJ28ZoRaDo/Ikw5JOK/hMRis4A2ALYfWQosUVnNONFpqfOH1HaSp5QyjTonFP6aM5KLA
	APjPem45TdLQLhHlKlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5aO-00000008cR3-47Ti;
	Mon, 04 Mar 2024 10:30:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5I4-00000008Y2R-30cS
	for linux-mtd@lists.infradead.org;
	Mon, 04 Mar 2024 10:11:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-412e355e258so5030825e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2024 02:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709547076; x=1710151876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=apfVynKdMHWt/84gIfAXsivA2/2+KZh2cujSEqljhTk=;
        b=yjZOHMcdXbfYpR7PNsrCp/kkrWiJNXNQJpWgLQNvlFMr9KBjIVaqRlas/8Xm8sVSab
         fIn/RFsNn9eEHjiGmoNWQhA5zd1LKMM9Q6iQdMJ2n923K+rLd6NCLDlOPp+Jrut+hdPO
         iedjdgHUqZTSmcX/R/v2Wmo7bBpgpWtMF/8S+MxJTbsm/weCBf2Bt3Cvv32Hy0zPj1oV
         gvCBrZj+2s59GyH8kchWg9abKnlL7peP8A73nvmLhMMXzJZ2MuwIisw2UtbM/eYEyjH0
         FK4Ll+mqi5ZEUv/uGVKvac+1aEr41NGX+QxU/z6Ih3kQdUfmKRG7VWsRbkPJgL9ArUc1
         OjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709547076; x=1710151876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apfVynKdMHWt/84gIfAXsivA2/2+KZh2cujSEqljhTk=;
        b=rJHWJkZUXeUhkNhn3QQ0wcI9u0LyAg9V9Be+tDDdXfyCEzyz9+jwC4mwpdJY9l5AYT
         7s2QGYZsjfRvskzJacNRoW/S6MItBuHwMkiAOV4MkOLLxsOhkUY9XBqjjWkHZetVqbgV
         kWNq3+B0h94NOP0qxAVQGp91KEdiVhKuO1o3TX7DmaOlX2W8BIn7fB0aDZT9B4KDmXyZ
         gj9fzOVmAqiWyCr1rqMNQMLDZLFtVXG6a680GLgpuYAhdoD0KYFgjtqmJ9s62ZU88NUt
         rmwn45xe7WOeZad/Dsj0tnZoKRKW0Y7zmaEaAnzTC65BMqgqU/eZHY7MCq3+LS4NTcvV
         W5jg==
X-Forwarded-Encrypted: i=1; AJvYcCXj9RsZSb1LlDqbdvFxkpqIMpGMTBvrM/y61D4VOSDjPJdbLBag81V6aqsx6YH+IJJEuG6pE9wb63j3yvKYtKlLie5v2USoeQsMdypU9g==
X-Gm-Message-State: AOJu0YykDyV0GOhDuY0jlSKGDcOTCFNFVWOTRPI4wkr+pGZP9dQ1p9B/
	Hpy+WDFnRLOdCHXlyv5FQ2j6kJrPOjGLWmjYJnOjTUcloNbyFP431nrg4u+xf54=
X-Google-Smtp-Source: AGHT+IHNn7sU3K7fVrmKdjcX18dvKktXyRnPZAwnYOUoT0D0zKIFokCLkKqap2Bkk/sWa6rTyu9UnQ==
X-Received: by 2002:a5d:5ccb:0:b0:33e:1627:4682 with SMTP id cg11-20020a5d5ccb000000b0033e16274682mr5193040wrb.29.1709547076459;
        Mon, 04 Mar 2024 02:11:16 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d58ea000000b0033d4cf751b2sm11722955wrd.33.2024.03.04.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 02:11:15 -0800 (PST)
Date: Mon, 4 Mar 2024 13:11:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	kernel@collabora.com, kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Message-ID: <7a42984f-34cc-494e-b8f3-83596621d31a@moroto.mountain>
References: <20240304090103.818092-1-usama.anjum@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_021125_025530_702B2C1F 
X-CRM114-Status: GOOD (  10.72  )
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

On Mon, Mar 04, 2024 at 02:01:03PM +0500, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite. Make its type to be
> int.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Make i int instead of u8

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
