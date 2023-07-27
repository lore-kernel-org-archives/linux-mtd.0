Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6226C001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTz2MpO9ca/KYTshOdBelqVgMd72I3ljv4ynVsaSZdc=; b=iK9WB8m3y65nSi
	1rwFe+y20yRweIHWjrc440NbtXFVT92nNcqPlEJ9L53new5XB+KEG8swkziy2exXquA/29FL+B81f
	GyH0Gox9QVPmv7Rzc5nmUfXCb3kC8ggnYOoNHY4xoZL9X36r1B83lNCJEN4COZJ11MEtKCUVlC+BO
	wHM1SQb51LIvW+psbT9wrxve6hJFV71aU/emeuKdOlH5+z9r6/rn21jMGgj1FrDYWR4InA8tXtXqK
	bKMoIC8Eqt5AFfVt7oK8gViafbVmZUpkonaelqpCa95FVX6KOh7Cc2X/wMSeJCHMEyCZTkSJ8zvg3
	axCSXf6pq7FHmXpojazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2Wp-00FbSN-2p;
	Thu, 27 Jul 2023 15:03:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2Wl-00FbNx-3B
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:03:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so15975015e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690470222; x=1691075022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+7K7N1HrBOO9ojx4XhuX5XeUgpfjjdJ6RhT0kUIZNQ=;
        b=pH9MBOTyCKqKk8fJqK5/7It+/tcMCAR2ABxOPjmXKtH9NYsavyp2NbjigGfbmd/hSs
         D6AcOFHpEs1lPCL+NgkIV384u8nBE8kafbiCak7P4TlHtAhoie9yu14nnTnS6uapai+C
         ncB3+3h/F33Ns78d7n9JWtQ/xRcfEcT6GjVl4Wq0zJfPWgQFSmmnVLSdbtpHVAX1+kKH
         7dzmWtS9CuG3kzDxFkvZAZHjk1qBjOexqAsM8nTPKcYo/j4O5sZf90/JFuD9XDWh1pkv
         5Ni1QBwoP2NSpsP5SR7FHua6O79cLOBgTVcdNxCWjPoMitQdn6NiF0EwwAscbmdNh0HA
         qp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690470222; x=1691075022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+7K7N1HrBOO9ojx4XhuX5XeUgpfjjdJ6RhT0kUIZNQ=;
        b=IYDHMiBRErBArRLsCm+ISRhb7pBqd8dGwX6H+tm8403cvy8MmwXfDGhTYeKl94646F
         xOO4S/Fv0FTKcRjQv1abh5VTMa/K1a9VqveHv0sELM4bV/B8wByMWb3+UtuWjQNfkp3Y
         kV4/b0RV+pPsdRrFxaBCG5R8+NdkYDnv3DEk8mkWrBiG6Dz4b3VpOdfRsccaKCMuAzVZ
         OBryIMBi7N4Us8co3d58CorfDPbYCZ5srFWLYkNaYIA3MGetH81N+89ue8vdW/bUaaEa
         85rxxwByIrmUWcxDisEZJuH6imZii0d7cvIOWz/wD4iZ6yJXePOhp8/vH9s2hujWFMK5
         cXXw==
X-Gm-Message-State: ABy/qLbAMeI+GUmWX0AxEYGCL2W2fU/r2SkXzD0K2/xRgYtNMwQDfe/x
	0HdaAQm/4Oe1u3of0uvt6zoMDCb7RqWBWpCdFBo=
X-Google-Smtp-Source: APBJJlEeZbcvjHHK/qS3M+V49Nm7sz4oGhzqLLA5BAgZvrDmBzx0eZJXQXeS9zpHYg+B0OM39RDnsg==
X-Received: by 2002:a1c:790c:0:b0:3fc:180:6463 with SMTP id l12-20020a1c790c000000b003fc01806463mr1960886wme.7.1690470222084;
        Thu, 27 Jul 2023 08:03:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id e22-20020a05600c219600b003fbfea1afffsm2005621wme.27.2023.07.27.08.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 08:03:41 -0700 (PDT)
Message-ID: <d83011fa-79e8-0ce8-4fdc-de01c43775f9@linaro.org>
Date: Thu, 27 Jul 2023 16:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/8] mtd: rawnand: qcom: Early structure initialization
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-8-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-8-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_080344_044236_C1976E76 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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



On 7/16/23 15:46, Miquel Raynal wrote:
> Instead of allocating a structure on the stack with random data and then
> expect the callee to perform the initialization (which is, in general,
> error prone), prefer zeroing the structure explicitly at allocation and
> provide the already zeroed area, so no explicit memset operation is
> needed. It is probably safer to do so, so we limit the timeframe when
> dirty data could actually be accessed by mistake.

Why is zeroed data considered safe or sane?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
