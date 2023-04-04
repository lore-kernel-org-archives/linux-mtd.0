Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C090CC761A6
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Apr 2023 06:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/d2dPEMRWVOy93damKMJBdCRALDpLtfbEV8iNnrEtY=; b=NqQfi4dIdkI+xI
	85BZu3dTqtuKX++j6i37eW7Hh9id87g43NdfYUU0Fj2BQq4Q65PfqSUGxBK7AdvinWpakZPfLY4kO
	hWnmDrkiFsywINNZ84o8zK2Fxia+lyvNDWp6UzVdu8PlgGGYrxHErfizgVMlf5d0FPgDfwjABtC5r
	CBTQum0swaUvo96cI8VlDGmCC1bjD/gAoBgf8uCnHB9+8KeF5p7F9A+AsMdAWBRpy/7H3fVKmCvCO
	oKgYGNjX8TDQb0eRn8qRDDp7WJ5FeZRE55HgApd1fxVfWF4v4WX1EV8F/b6nuHApMK5bWedTDa3us
	gjGxQOocSa2o13OvaO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaRM-000ERd-0H;
	Tue, 04 Apr 2023 06:46:48 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaRG-000EQ4-2g
	for linux-mtd@lists.infradead.org;
	Tue, 04 Apr 2023 06:46:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id cn12so126410830edb.4
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 23:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680590800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4wpR6cNIQTvfB1y29ZH5QI3kXm7zB6AepahRK+63rE=;
        b=khwNPCkNrTb762NkLnpHGVzJhZ5WIWF+EOnsbBkt0KrE4zdGipdWW2N11ieQlQbMSe
         E2W9Ss8tXC6cpzLZZT0u6oO7pF8kWWcAOgU9pHx8QdnCFcof3rNRbF9OptxFHfe5NN4l
         Z/YvIroVraQD+XGuOG/Ct5g7XLLPBygDey3lq+gsT99ReTJVW+G/dewsL9He7pPCUjQG
         k0E9K5xkRX1YqY7QAq9sjUy7WZuGGb1KhZgAexgmrLB/4vlgEuE0+z/ibwQ7LHR0dVek
         2Yln6f2ySUBep5iWqugj8zhYt4j2RuDUiAgBPpqg/EP/i+Mla5pPm0Rsmk3Ek0oEOUH9
         IbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680590800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4wpR6cNIQTvfB1y29ZH5QI3kXm7zB6AepahRK+63rE=;
        b=yfyQlJwz49Wy2wCm/EImsuiJHUMds5JEuXHQq125zsvsj1q0Olo6a+nyxqE30w6VLZ
         ZYhtqPH5bJkTwDJ6sTjYfTVY7WYX9O4Q6lhouXQX/Tm1nz6TT28SSD0/L/dUMrJCIxpP
         jMnlO00vMhhwtXWL2K6Vn4u2eEDfkogXjsEMVeTBP5HBmfZ1rH8RF0Una3GhvcLX708n
         WjqWimkefSuLE4SA/GaICV4gTq2i/M2gcmpT85CNRQcTax2JsVNCdxCD3V5fbPF/RGTL
         H0OMHLXf2qKgy+PvsMx9+MWi8W6mISMrPm9n7GcSOK/aULAOL1p69XAMarj78rXRGYmY
         lWUQ==
X-Gm-Message-State: AAQBX9eH5yLNOaMkXZi3MShVGshiyQPoEttxXyu3mVryjVAZFrD2CFZd
	rI1DXFjAw6au7irgl9czzkzWew==
X-Google-Smtp-Source: AKy350Y+t97vUdhS2WCc0Ni0IdloS9ZcFUGjiehqd+Cpuheu/4+0knXZYh9CGX1+xLnOu+l5/Bf2DQ==
X-Received: by 2002:a17:906:235b:b0:932:c1e2:9983 with SMTP id m27-20020a170906235b00b00932c1e29983mr1420766eja.15.1680590800622;
        Mon, 03 Apr 2023 23:46:40 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id h12-20020a1709063c0c00b00947eafc76fbsm4488311ejg.144.2023.04.03.23.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 23:46:40 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] mtd: spi-nor: Address mode discovery (BFPT method & current address mode)
Date: Tue,  4 Apr 2023 09:46:34 +0300
Message-Id: <168059071209.13361.9220222408280662768.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=OcC9/K8lIgvhLa3FaB7YCnUSc/5yNfT0lL/dHR4H3l8=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkK8fIasVkDyCV8ikOl65YC4X+oI59U43+u/+vC xWiYTQ2rYeJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZCvHyAAKCRBLVU9HpY0U 6Ut/B/9VlseaqQ12Q5Jfmuz95bqFwVFevcGGF6fCpq067twYUPxyOj92IXqZgxpGe2LQPgXEuJx phpQpArsUWCE5hB6FslxatZIwB6N5Ju4+03RlrEAuBLp44iObzLFJlBsy7P4g99L2nhR3jOdwMV MPbtcccGfS20MiMFYZMfjwxRTIaWHK+TQhnzgHA48CmaNl6o6NKelGTxmZBx9ymnvH3vjBdTm0A ne3LGLVzT9vqbtMxzJT4GxHl0IEcGvoc0Mjihev8yw/Kc3QzG7lxEOs2TjnIdlha03+lqFsaN14 30CDzeuDhYDAPEs7R2TxFjbh7ac9b86qrzowOKlTKw61oP8N
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_234642_880635_976C1D95 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, 31 Mar 2023 07:45:56 +0000, Tudor Ambarus wrote:
> This is a new version of the following patch sets:
> https://lore.kernel.org/linux-mtd/20220411125346.118274-1-tudor.ambarus@microchip.com/
> https://lore.kernel.org/linux-mtd/20230315034004.5535-1-Takahiro.Kuwano@infineon.com/
> 
> Changes in v5:
> - squash 6/11 and 7/11 to have a single point of failure in case
>   regressions are determnined by bisecting. Update commit message.
> - get rif of the now empty winbond_nor_default_init()
> - s/sfdp_bits_set/SFDP_MASK_CHECK
> - set micron-st's static spi_nor_set_4byte_addr_mode_wren_en4b_ex4 only
>   when the 4byte addr mode method is not determined at BFPT parsing time
> - reverse xmas tree for local variables in
>   cypress_nor_set_addr_mode_nbytes.
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[01/10] mtd: spi-nor: core: Move generic method to core - micron_st_nor_set_4byte_addr_mode
        https://git.kernel.org/mtd/c/076aa4eac8b3
[02/10] mtd: spi-nor: core: Update name and description of micron_st_nor_set_4byte_addr_mode
        https://git.kernel.org/mtd/c/288df4378319
[03/10] mtd: spi-nor: core: Update name and description of spansion_set_4byte_addr_mode
        https://git.kernel.org/mtd/c/f1f1976224f3
[04/10] mtd: spi-nor: core: Update name and description of spi_nor_set_4byte_addr_mode
        https://git.kernel.org/mtd/c/d75c22f376f6
[05/10] mtd: spi-nor: core: Make spi_nor_set_4byte_addr_mode_brwr public
        https://git.kernel.org/mtd/c/3a4d5f4af9e6
[06/10] mtd: spi-nor: Set the 4-Byte Address Mode method based on SFDP data
        https://git.kernel.org/mtd/c/4e53ab0c292d
[07/10] mtd: spi-nor: Stop exporting spi_nor_restore()
        https://git.kernel.org/mtd/c/7fe1b00d92ea
[08/10] mtd: spi-nor: core: Update flash's current address mode when changing address mode
        https://git.kernel.org/mtd/c/37513c56139b
[09/10] mtd: spi-nor: core: Introduce spi_nor_set_4byte_addr_mode()
        https://git.kernel.org/mtd/c/b6094ac83dd4
[10/10] mtd: spi-nor: spansion: Determine current address mode
        https://git.kernel.org/mtd/c/c87c9b11c53c

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
