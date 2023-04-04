Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD03CC7618D
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Apr 2023 06:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoLDNeHsKGR1HBMkyaQm9xTnwDhXVgsQKn2ndNyaE3Q=; b=vJ7/5TnianvmgG
	+q7zv5WgoqpQ6etNGD+AnCfsdZAVyFFUWM96fDqQvvgP+A9cm8d8os9GxCizpH9kSBbnEBzmVGXgR
	bliPedIKDdPl01adxFk3TTB1/M68gmdTNiLnVVOCe5QJPn1/Kf6PMwvIbVmCivtKlZTBY2y2Oohyn
	JGTqeECOZqZud9j4/ophXEPG1S0fe9C92k/ZMP9YgK7AZ9dGeoutmmvMlCLIu98mEb8wquRYXOxyS
	85GqCMIYcaJa7uZdJmDaHT/cT0FFbcCfPAOQ/UoinxNmSNSRICl4LTljQSo5KU5Sh/+AMFX4QY/Dc
	iFCSESsJhFhuaSxmcaMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaRJ-000ER7-2z;
	Tue, 04 Apr 2023 06:46:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaRG-000EPv-2H
	for linux-mtd@lists.infradead.org;
	Tue, 04 Apr 2023 06:46:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id ew6so126276662edb.7
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 23:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680590798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GON49NtFF6jRwkKCuSpXLalRbhMygkpWAIFX5Cli3c0=;
        b=szES5vyQt7IJ1PzbqgjDEJiU0zHBEU502vsGsNdPyrVpWFkO29qy/YWrHlLDn/5LNc
         Vpn8GPqTCqCfIfKicoAS9RdJm8dniIjoM1bQWARC0Tl8wSSt+kSXqAUjqcZDxuY1L+Bt
         ZIN6wdai1OJI7RX1YGe527McoaA/pJMPmN8e1pib41GO3m6Gyc2tJy/bPTgFcePz/Y8G
         JFpm+GMNpfO99ET5Ow1BS0rhSwO0MtCaw1nLgOgdeOqpMKwwau6yOALW5JfZ6dyd7smo
         bJgbWCxSVt7h3CgJGL4iJKtbUx0L5dWBxOk/Sngr2bxa3WWK9h1aget19V5kwMqNNTY4
         FXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680590798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GON49NtFF6jRwkKCuSpXLalRbhMygkpWAIFX5Cli3c0=;
        b=vSgK5WBRPKPx/E4bhadRkxMDRZgYfwYSbssMpcbIWg4JDPLeeBFQEC9rcNoH/CHX6v
         iZd00V5sCap94/sPFSrYQFL3fxd+EK0/nnsyLItqzNynEbis9kqoHyk9LsbxBt20xLk0
         C5cS6UBmQW0xpyKBefmrCo0iVC3GawSi+ohGCYaFEEuAtH6Y+W/xfblsONztW4IHzfvi
         B/UsZ7q3P3MDbbJlQeK2pyvrGEXrB1GaqTAK1gGoP+UQ3SZMuU4m8/O6jTz8O96Ndg7p
         8YA4hNfx8aKzggSKHqW2sAq0N6c5aek310CvijmZJB6rJxz6Seb650uBIOUOPGetwLIh
         mDSQ==
X-Gm-Message-State: AAQBX9cL/xdzq5I0A8q57YHtoo9TaDMOc8YD1PEe2o/5k0BWV2O0nte/
	JzF9KaplUIKmcpwmnPGakzDUkOVN818t7VYjaLQ=
X-Google-Smtp-Source: AKy350aJqWfde4ZsCoKvNjRc6KM9HV2gs+lIRatToRavsPf7Guvoh7hvZ2QKQ9xlthYa64K3lbJ+yA==
X-Received: by 2002:a17:906:5006:b0:930:3916:df19 with SMTP id s6-20020a170906500600b009303916df19mr1112535ejj.5.1680590797900;
        Mon, 03 Apr 2023 23:46:37 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id h12-20020a1709063c0c00b00947eafc76fbsm4488311ejg.144.2023.04.03.23.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 23:46:37 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix a trivial typo
Date: Tue,  4 Apr 2023 09:46:32 +0300
Message-Id: <168059071207.13361.18309139526265602729.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331194726.840208-1-miquel.raynal@bootlin.com>
References: <20230331194726.840208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=373; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=hlt+Lp9hZFiiEqnqA3UO7/1jBOLo0CcJRoVvqD2s+e8=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkK8fIoaTgQjy8bY1y6V5Qu5192cN4AIENZGmU9 F2myEqGKOKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZCvHyAAKCRBLVU9HpY0U 6cxvCACVX2sFqU6Vv5XKHbWv65j1Gq5OJP0NcZITfyj7lOGGSpq12rNID/LFW8QJuEiJUTybyY1 Vr8QfndUHooIWfClTnPTU16LiOOOTa7Ajb6ig9hDMLjmjpKJc/iX+THS1kjoUEFNnOKbThKb/gX orD94IxPjJARHlhPRJqlZobY30b0NK8w59goy8z3+Iq40RTJrb642IOkB/nNmboDP7FJ4LOSvYj YqhiOxys+egendbp4GSOZqiNCGTunHV71mQInBmS2XubZpo8YteTUK5FB+a9ieDEID+xZLrQSQe dwZkN2A0EM8dmU373GT08I/I21WkLe6Cygo0Yv1U6CsZpFRt
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_234642_771647_51E719BD 
X-CRM114-Status: UNSURE (   7.33  )
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

On Fri, 31 Mar 2023 21:47:26 +0200, Miquel Raynal wrote:
> Fix a trivial typo in one of the core's comments.
> 
> 

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: Fix a trivial typo
      https://git.kernel.org/mtd/c/705c9ef831ce

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
