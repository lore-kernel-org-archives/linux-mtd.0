Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB54CFA750
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOK9pSBhxpRPE8wW8ypnbDAsbErubfPZiCsvqnxGsPE=; b=EhEphqVomSorCf
	PNaM6luGdyz/dTgQDYeB7QcRnMNgV+ck3R/V4tzessVeQIaKc55xtRb4AXqcTZE51YiKmThdm6o7D
	CfhcYKQPt/VrRF9T5OyHZwzQpUODTGzY4YAuT3CB9sLE+1FhQD8MJet7I7KjjpzuMHOsKRxKrn4Wz
	ftFk9vF1lZoNbixp3rfqXBGAuGzhTEg/AwhpBWa5yNb/D6knXVO809FiuG+fLJUJg4NvOVrof4lVU
	//cTes68kBx/+ZUPPfA3UNyqeQWLGLaWnIpn233pl4lGzvTEXIj+sTsMBEfYGzjqK+Dp6uvstUXpW
	0Oh6Z6AmBU65J+tqw5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swd9v-0000000BHfK-1y6E;
	Fri, 04 Oct 2024 07:55:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swd9s-0000000BHel-1Z0b
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 07:55:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37cfff59d04so1664175f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2024 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728028525; x=1728633325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FhNRrSnyZylgcaxxovBMlLXGqaYS04e7rZyoS3PuP0=;
        b=MoEMKQ/IQKvXyz+vYwCYUtuVBy4uqTZuYE69o44N8cOpWhQL3KGQXYxMw95iyFGb2o
         1vjXisnW9WvtF2FPlOpll3GGM6vMp29I4Jrxdwlhzbyza9jal0kZhb4TAGhqo/WuZM36
         W/766p8bP9ch98oi7RXwphsBhTu9PNBcMB8ZNaqRflz6+IO9C1win73YGmyLSx53eT0B
         WB6F81Ui+h1IPTU68cYlrXjZAoTr/2ldFMRD2WD6d56hXPzkpQBmsabQucc8XJqLRcqP
         mk5jlwnKqvB3V/yAgk0EIJdAEJw1aY8PhDEXyxQs0j68IG3zmWzaDl6MrTjJkqSC86s+
         9POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028525; x=1728633325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FhNRrSnyZylgcaxxovBMlLXGqaYS04e7rZyoS3PuP0=;
        b=mftq8l8VBTg46dIxodI1O9PPPty8ob/geGXDRZA1Sik47dKp8C/uUlMWw3PSaTo22l
         wP3z2L+00+muYuLiiIR9ImxqZ6WjW+Y4roMIWfSck/sjicjc+pUKrfpOoP2AW8Vlj4p8
         uyHTJ+ofmOYVZAS7C4IO8qmMO9ibZq1Y3WJoLwcnYhD5Wp6mCZgNpvsL02sJatR9v1f9
         PJkN3vIszT07+xliNNt8sO3VN9qVnxogAsqpEoSO/tqucIjvtR/ZEg3PJrM5DdP5NVMK
         UcZO+Xp/cKFWX0xlF7o+V+YWZazM9krphcYoWUe5uKVe4TekCkTwNwoH55cmhfraux+b
         kKPA==
X-Gm-Message-State: AOJu0YzKdnWDiNqVVdr7V3L3S08qPRzkEoG41wB3zpE+rFCZxHmzGV76
	hUEGMP8wzd0Q5kAee/6y8I4f0lI/Zj46/1oXHeexhwoX3vrH/UKPjQ/2W17Y1oOjM+MJW/E2dPa
	7
X-Google-Smtp-Source: AGHT+IG1JoUsqKBdDF7cCqFuGrOBJMWIqdelI3A/3zB9ug7YMTLNfUWq7WbX04o8yxlgPk/pm0MNqQ==
X-Received: by 2002:adf:a45b:0:b0:374:c613:7c58 with SMTP id ffacd0b85a97d-37d04a7b2e6mr3435594f8f.29.1728028525557;
        Fri, 04 Oct 2024 00:55:25 -0700 (PDT)
Received: from 1.. ([82.76.204.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b3951fsm9058045e9.41.2024.10.04.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 00:55:25 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org,
	AlvinZhou <alvinzhou.tw@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>
Subject: Re: [PATCH v10 0/6] Add octal DTR support for Macronix flash
Date: Fri,  4 Oct 2024 10:55:19 +0300
Message-Id: <172802837479.20734.613907045651385407.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=Sla59omVs1a66Fa00iyOK7RF8EoxQRRdQcgewA171Wc=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBm/59kHY8UWiDNnVTb3qmjpzEIQup8tWBSV4mq1 JQgVpJ+1NaJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZv+fZAAKCRBLVU9HpY0U 6dClB/9zpqjtj8auegJbo5/kDhhYg+kjoeTCDMsqktnl46imgtkM/ZfxHOUZo+EkonTBr8ahZ13 dwjxMT/EIg/Rplylb+HCXEiNAnPaeI8bvJmYjYH4GzK0K4qM2kOiRsRKUOE7dEEuaE3kA/ZfEbu BwQMQqbU40OifVNSPdeMjC5Qiq2Nl7nCClJeti3saULUKt49Cl+h+9r+D7MMt2mJMSE4bBFGY3V D9w92BNoy9NdvO4kF3POcTmCyZahASzwNsACLBREaJbz/5SksBFuVdLghM9pO4NM4dQpCn+CBGW GVazCPDVO81zDjcxdPgYefTat7UAMYMkjf1ctpHoZlXzB9pj
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_005528_446433_76EC79E9 
X-CRM114-Status: UNSURE (   7.88  )
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

On Thu, 26 Sep 2024 22:19:50 +0800, AlvinZhou wrote:
> Add method for Macronix Octal DTR Enable/Disable.
> Merge Tudor's patch "Allow specifying the byte order in DTR mode"
> 
> v10:
> * Further explanation on adding Macronix manufacturer ID in ID table.
> * Correct some typos.
> 
> [...]

Made the changes that I specified in replies. SFDP
"Command Sequences to Change to Octal DDR (8D-8D-8D) Mode" can be parsed
later on.

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/6] mtd: spi-nor: add Octal DTR support for Macronix flash
      https://git.kernel.org/mtd/c/ccac858d2bdb
[2/6] spi: spi-mem: Allow specifying the byte order in Octal DTR mode
      https://git.kernel.org/mtd/c/030ace430afc
[3/6] mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode
      https://git.kernel.org/mtd/c/6a42bc97ccda
[4/6] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
      https://git.kernel.org/mtd/c/46b6256a68b4
[5/6] spi: mxic: Add support for swapping byte
      https://git.kernel.org/mtd/c/50cb86f21ec2
[6/6] mtd: spi-nor: add support for Macronix Octal flash
      https://git.kernel.org/mtd/c/afe1ea1344bb

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
