Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43053C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBCV+1Il8Ci1YfnPdSQubfojiUk8VKEi+iwrlFTArNg=; b=kp3y2EC2TjU598
	e0YYH15S4covhmUsuSzz9PE1KU5ghKbqKqr9llcrSoETIikuucSfGUit3IzIdD9LfcwBZVNCOP0fL
	IreqBgacMNhG6xNG5vYuaHl+hc/YzcvZqzfzXF2CJVyijb2RxnE/DptxjKTPOM69iF3yWOmgKJOLq
	mcOlZdwh1ypr5XFnpVieFntzuqtiAFaTyPF6lyW5F/e7tys+aiD88s6YhoIfunReSB5j2A5/mrTq/
	KyIOWzZ/Dx52NX5BQMc3b1oigwMdz2ZGdMcaCFhrTarNxmAVBSSwNUDBvPAKinPSOF6oFnsoh48HV
	Lq4nKs5u/X5K8taOaJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZIC-00000000NWZ-2yhD;
	Mon, 26 Feb 2024 11:37:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZI9-00000000NUH-413h
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 11:37:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a293f2280c7so411781666b.1
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 03:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947422; x=1709552222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4GqtRq6hc3T/SzvdOKCJWyXtG9JbJJBVpac3G30OFA=;
        b=JFMjuHTPBX48X6K7NZZxdU1avj/J+68FohI0afplPwjpsnXTvGFjgRFvldV3vkN5vN
         HAPdf8ednKlW5eR6HXWkiA6tA/2kuru6nU1hfABVt+lbdsmHDcXs7pnvhB0VUGb8Mkqf
         3e3Zdq+jBnpGRK8cBmcUGo8pAfymrdnnHIgKN5y1IQyVvK1zYw+jY8De1PNRCrnXxCrx
         gUVwVtlnbzUYRRJIOXj0IPBmDvJnn1pXCiqHrD5Qv5MtfxYVTXITAEvH9CNA62f/pqJ1
         C8o1KCmZT76wU2F26suYO1LqX+OYXJk0LSoVWN46E4gHwgCYaZ+LET3G4vwC6cmWpan2
         e2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947422; x=1709552222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4GqtRq6hc3T/SzvdOKCJWyXtG9JbJJBVpac3G30OFA=;
        b=Gm0qLpVQ1DeinKuXGZxhN+ZB8gZwkqLQkwmqb39a0O7rhOiHTcuLGTaddRoMh30VCb
         yE0M/P4Lkjq7jmsxcIzXqAtFE9uzKG91+XiUgqsX1eNXKh2S7yT9VzD1LpT7H+jpdfoa
         sd4rrIrilgFNn+kUAHj3oD6Q21Gk1IC6szfCh+IhEIStGB0kSbrYa0Y5Y9Or4rs1JDg5
         3TFBlxCGesvP83tsZu5dKOqecPqMsNo1rCYHSmy6uh4EoENeFXbK3jOHz7xRrg9dm1gm
         OOK2ktjFMFbDU7B2M8/s2MCefh30dSO1l9G9rs665/cR8gomcOAioNskBiqI6OBh2UeU
         jdyQ==
X-Gm-Message-State: AOJu0YzrIsBHa7CX5iPHTUgSxbvEiCepeMh0ZtQj/INmJ6Pop1Wi5wWt
	k4Rryt2UvZKmJA0JNMfPlcivJ2C0s0Th9gpvpO49xgahBZewbEXS5F4JyXd+L2xx71zsdwI/4tT
	j
X-Google-Smtp-Source: AGHT+IFz1IiBsvuFYl8yoCzJ5PFJ+NFQeNvz8xTC99a6QvVc8fIHk4wk9vIrelcx7wIbYNB6gnlVsg==
X-Received: by 2002:a17:906:a1d3:b0:a3e:b523:90b with SMTP id bx19-20020a170906a1d300b00a3eb523090bmr4239407ejb.14.1708947422479;
        Mon, 26 Feb 2024 03:37:02 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id qo7-20020a170907874700b00a4319de07c6sm1564160ejc.127.2024.02.26.03.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:37:02 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: linux-mtd@lists.infradead.org,
	tkuw584924@gmail.com
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 0/4] mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
Date: Mon, 26 Feb 2024 13:36:58 +0200
Message-Id: <170894738161.74939.10667760438634438811.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=37B1ZipgfJNVLo+Cfg6bTa7uz+kG/eMLNMEL1+ioh/U=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBl3HfYYzRcBC5ppeQ0REXuLFngLnu9wSG+b3ySO w5pX5VtKJmJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZdx32AAKCRBLVU9HpY0U 6WMkB/9w0yhU5wzvbTCkxC1hYl+w2W3C77JDIDx4fWf7NApOskA5soiwvN8AjS69Fzvl/P61Fjv aoW2IVK15p3YYEBnyOX/Ry2ij4R0ZhZzFNy13tsJhlG2bn9T9DBnUR/Yrzx/L1v5MF9ecIVsdbp W7OjMUkc/Jd1YZqM6Ht8Om8CeAmSAEOqP41XX+vzrYalfqgt5OMKciY5Hm+YG1eXERemLDbEPYi Sgh2ARcxGpTG57PLqxAAqMd1vFfNDeRkeNMOfdpSZ3ck1EO3XUrCVFpV+pzJ/kcp8u2eikOkQbH 7Uhb89fd3lbpffZiZHmlU73k6YiD7FwwPLTOHFdNs8Mblb3B
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_033706_024719_48E16827 
X-CRM114-Status: UNSURE (   8.35  )
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

On Tue, 20 Feb 2024 17:34:05 +0900, tkuw584924@gmail.com wrote:
> In v4, split two flags removement into separated patches. Reworked
> spi_nor_init_erase_cmd() to use n_regions in outer loop.
> 
> In v3, reworked to remove LAST_REGION and OVERLAID_REGION flags. Updated
> and tested debugfs.
> 
> In v2, reworked spi_nor_erase_region to stop bitmask encoding in offset.
> And added n_regions member to spi_nor_erase_map.
> 
> [...]

Updated patch 1 and 2, see commit message.
Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/4] mtd: spi-nor: core: rework struct spi_nor_erase_region
      https://git.kernel.org/mtd/c/0e164238bb07
[2/4] mtd: spi-nor: core: get rid of SNOR_LAST_REGION flag
      https://git.kernel.org/mtd/c/df6e36edac23
[3/4] mtd: spi-nor: core: get rid of SNOR_OVERLAID_REGION flag
      https://git.kernel.org/mtd/c/2865ed0e2c71
[4/4] mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
      https://git.kernel.org/mtd/c/6a9eda34418f

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
