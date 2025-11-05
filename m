Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB7CCCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=558OPA7wR9YJGIn7ZCrniC6CVTVOpMWLFqd2PnH9Qps=; b=ZwaZU1Q0l33bHi
	JDjEuI1BbtDuBKz/Q2hJNTkxsGA+NkihMiA0zOXswYpWb2GlFD3b220hA4jGIAB21MGeT4dYDPhxN
	HCEDBTUrmyMfQOUXDh5o+kZY8dhOU4C5g7n5zIFP4Ay+If+xtdfPMpS3rCd6PZQ5kZqnj1P7BWtBX
	3eKaV31/ARwKs8sR/EBKwkWb7Dt/tlqEYld/B8cP3yLjJl5hrdJO16s+D4+Hu4TS5PV5NsPikVyBm
	tsHlYOyBMpaTMI9tPxss+dE+/fIcsD59yzy/ZyO3+w9hIxR+ciMGqaTUDpTHg/sMh0V7bF32FjrTw
	3HTDbYuD4qKzSgz8CVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGftJ-0000000E0EX-2Nty;
	Wed, 05 Nov 2025 15:57:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGftG-0000000E0E5-0KBV
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 15:57:43 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so5670221a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 07:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762358260; x=1762963060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gi3ulz3Ij3cW2aD1iWY/9uEnz3868+Ej+OFb25qIT1E=;
        b=EWypydY38QvuydjdRWmZABJQjNFeVmcJfi4Q4q82MSthsU4F5lejMJW1Po7XQzQPwy
         sTn3BOHz0Pt0qpNI0OcMn1VG2bsNR/Q7w+79clQPjFAAkE9+Yu8FgqnenT1W/0Fq1QJf
         cbgXGAahEaWjBowhfimGZAyMbfju4RIcqu9kOf7VIYPW10+aZW/qFJTFhSHqdoluIQJ+
         6gaZrb1Fl5z0yYAUsPqqErqvk6MRWWpmcx+EQ4h7k1KOC2y/3K0IJ5Ejb55DNgIt+iQ9
         fX+5gVy2bqEotEy83EM8H/U/Eo23czZ6ifpfH9yuUvYEjYrGA2HeuIbn85cJUOMowtdB
         SQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358260; x=1762963060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gi3ulz3Ij3cW2aD1iWY/9uEnz3868+Ej+OFb25qIT1E=;
        b=OXeK3oZmA7LsoTO57sccCw3giezudH49/eNozx5L+TMtwVqVtwfMrf0G2+4DwTgtty
         42M09+ePmvj28Wc4BsRrJu4mnUdkzoS1rJ0eUPVG8CmQZ2f5pnTSuDVfCdtfhw/1pCRa
         d/0RtZTi14hsG+Dq25joNQkyceYOF9M052nj5gU0Ec9pbdBeeDZhcuFfOcEe5Ae7KS7T
         74vpFH1/iDalsrFyNZqhhoeWT4sjfklHvGyUn2APc+rquCwKXb9MSS4aTOzI74Rtj6J2
         0UG5KScWb/1DRzSLSvEpRh1pdU7KW1DWg77bJ//bWBMJC2wU1Njuj6oytoO+tHILMG89
         /TRg==
X-Forwarded-Encrypted: i=1; AJvYcCVkAHHWhRcCh1cYq8JEZyqA/AssWFm1CfP5M/VqY650vVFoIr9SKPhkqA8zn/rOd64IpGvPqtbvxUw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZiNU3RHG1tv5HntENud0vy8junUOPr5PxyS4pCLg+uKjB+8i5
	W+44Vqtl+Ma/t5oqsTzVNJO7s7xOl4N6NI0yNH+JDLmmiR9znYPLsKEC10ChvfWl8C4=
X-Gm-Gg: ASbGncuy6JxbKrrdJ24l3L38thEypRT7gkwJ3SciNrFl+ikQE4MyT0EDYutMgwk5oCl
	BBLG4JvMFcMVJOJXPvwozIjPCvhfPnIihfabJ2hvhUuwgrs8xfMh8orrekFiTnM649OQ7D1x5Wd
	Uc6xlPsc3gDcrsR0725UwLIiqXPl1dmOXMksayu2nJLFCeFRgClvO3Lb8nmHJh+DE/U4mGR1DxO
	qacTiGd1aXoEawPzI3m5gdn/ekdxkSYvoSZ1d8NWUt9kOoO+KeTSutRCUM4Zn6EpIE3Bds4XU/r
	8XFYhD0ikGzruDt+AtJC0Pevb0P5R2nvf0ArOn8Fm/UNWXxqCm7F4HjeNVNnb7e18ppdoif8uqW
	YEJEH/gEpoAvHKTu7FR8Jfzn4b/xYY+nhYg/7c2+IBwvowtxwXGlG1Qg4hI7oqbt6QsxiRWK1wB
	Q3nyrMOyFDkMLdRLb/D+a+xIo=
X-Google-Smtp-Source: AGHT+IG8Ib7bTOk4rfnBCJBGTAFfgk2ImcjjuBmXvp18vfVvKZ16nOJ2X4KjkA2fJsMo226KrUYJSw==
X-Received: by 2002:a17:907:6d0a:b0:b72:5983:db20 with SMTP id a640c23a62f3a-b72654f55c1mr405051366b.32.1762358260191;
        Wed, 05 Nov 2025 07:57:40 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e26adsm522473466b.43.2025.11.05.07.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 07:57:39 -0800 (PST)
Message-ID: <efb8bba5-8805-4c95-ba1b-3bde46a4e528@linaro.org>
Date: Wed, 5 Nov 2025 16:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/28] mtd: spinand: Fix kernel doc
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-4-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-4-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_075742_144268_F9212C54 
X-CRM114-Status: GOOD (  15.15  )
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



On 10/31/25 6:26 PM, Miquel Raynal wrote:
> The @data buffer is 5 bytes, not 4, it has been extended for the need of
> devices with an extra ID bytes.
> 
> Fixes: 34a956739d29 ("mtd: spinand: Add support for 5-byte IDs")

no fixes tag for documentation.

with that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

(commit msg can be updated to smth like "update kernel doc comment" too)

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/spinand.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 927c10d7876958276a841a9f1278a74deeb89944..1c741145e49717169152854718f784e0e519ea92 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -287,7 +287,7 @@ struct spinand_device;
>  
>  /**
>   * struct spinand_id - SPI NAND id structure
> - * @data: buffer containing the id bytes. Currently 4 bytes large, but can
> + * @data: buffer containing the id bytes. Currently 5 bytes large, but can
>   *	  be extended if required
>   * @len: ID length
>   */
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
