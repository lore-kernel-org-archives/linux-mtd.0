Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92733C35274
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 02:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bnU+YTYcJ7lHLkhnRntdw6i531zmrHxZur6nRUn5Yg=; b=tKMf3YlhLWUhsW
	QfqVU1tYygkbF5cpTR8LLho4+VWiy+zmB8TbTW14AIv+exUQquru36i1jvgKywYUxe5W6f8eYiQVB
	IuB7EbBM3vbBp3u50wIpaVEF3tWcWFxmM2dm/RY5I78a7/gg7suWVJJl/mtVhkOzJnz8LWW5QVw3n
	M/O5DCwbeLY+UFauvufP6bqWP9ZyRlhqfSINl6PzADmk9KeOXOlogvsPusYWPvX11rpJ2g4/rbHCd
	K+fo+GaqzDEIGOgZ9kjMb9BZg7q5IVHYU0OPeuFV5n0tO+qJJgZcSfXhx4N3BE2xO7JMYpq5dHQFa
	xCqEaDcm1zHocrGxJpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFQ8d-00Ccix-0a;
	Tue, 19 Dec 2023 02:47:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFQ8a-00Ccic-2Z
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 02:47:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3363aa2bbfbso4204293f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 18 Dec 2023 18:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702954034; x=1703558834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnwKqS75fmoBKZ6JUfdCyxecRAaSaUAJyW+9JW8x254=;
        b=eCmNN0HkuUcaTTDGB8kstjnCD3pnzRiMG9dH/RCheuxezHx5KFE0V6o4PrScciJpvF
         yECx9R78S1rGiqdwLBDDZ7OkRYSFnGJtp3LqL1+7BCKaGzpYciU4AkwQm0+e1aBI8fsH
         YOOyLXf6w924cIDT1ogdXjh13gaaetqBhmGHtDo8Sf2Nawm73f8L64dwU5I3LycC+k9c
         Unp5O+axUahZ84vbx0pdcux2rlZf73RZLz8oo4xTPueFajiORpTMMjHVNI+MxsEAVvZH
         1XUlZcWj1TRXMSQMnyqiTk+VY+RsA9pW94rrralrReF2BPEsHZi1mcjFmuLUgV6f8Nv8
         x86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702954034; x=1703558834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnwKqS75fmoBKZ6JUfdCyxecRAaSaUAJyW+9JW8x254=;
        b=iSQnBoXR7SzzSW7x8HUngZU6SjRY9VpmFH6s3pP95lWqm5W2OPd0nWIfkQ333OnKSZ
         T1c5u52ivplB8twXwqVZSjRkkFVhrTep6QhZOiHkLuydpe4BjYmaPyCVDQvJTFV473BG
         po9T8RfAdry0bs0XeTCPlEGzs5sr4omFuKRuPuVFgR66ox1R4l9dQt7EfuSkzn6yaI1i
         fgm7SKuPZr2MtfhM+1JJq4PKOLkMQPV6RuXysJBq43kK9jxonlHSr4/OSuT1aeSSL5YX
         Nm1TtZ+4OxPM8E8ribDDtcBRwl3vqA4ZWsCaTWuFb9/Yon8aqOBlzQKC339PTw6XKPf4
         2hEA==
X-Gm-Message-State: AOJu0Yxax7ltpZkXvw+whH/UnJ0JgABM4RDgejnCNIsf3T6xoLsL0pj6
	N8W8WWL+qZNJOT9zeaokN1s54w==
X-Google-Smtp-Source: AGHT+IH1es16u7uh0bMTqgZjbsRgfKYgVlo+U8MgK2DplnFlSN3lmCiHelfm/k/tTubXGi9FelB20w==
X-Received: by 2002:adf:ffc4:0:b0:336:6701:e80 with SMTP id x4-20020adfffc4000000b0033667010e80mr1869086wrs.94.1702954034493;
        Mon, 18 Dec 2023 18:47:14 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id e6-20020adf9bc6000000b003366cac55f4sm2717124wrc.107.2023.12.18.18.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 18:47:14 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: richard@nod.at,
	jaimeliao@mxic.com.tw,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: spi-nor: mark the flash name as obsolete
Date: Tue, 19 Dec 2023 04:47:11 +0200
Message-Id: <170295399037.64561.10229495240556989288.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215082138.16063-1-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=935; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=3k65lHxgY8sTNdZdKmSGqZ9DWwsAKEbwE62VkhhJp5g=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlgQQtyDhGCTtoQ/AWoWIAMvk3UvtDtHhhM2ESp wP9cH/Ae6uJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZYEELQAKCRBLVU9HpY0U 6dTQB/4qnGysk7VNTyLTeMGD+fDu+sYw8EkWK0XRsJFfPLTJCMi0jFz2qDDBr2ZnyzqS5UO8NYB eZoeWUXae8SnLa1X/55GFvJAbk9ws/oi3dA4I381Gss3HISPzJ7YvNse9891R4D00pbY3OqCAkd pHgvSDQLZj8OsNHqkoPAGlgbBQqozYZISYoEJkuXQqzYPuLevV/c7aDSX4Elwoy2UXoxkJjlaTR po/dWCQZ5nGc6oxByL55mnlWks2roaSZE/dlaYxJo1smhcTMb82+LjwxmFfCp2JBxMdnBvaoj5X yvAjDqvq/xEOSsyHMEEbBDIPTz88tO5evVJhTcqqtfWao9aI
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_184716_887798_FB38D036 
X-CRM114-Status: UNSURE (   7.53  )
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

On Fri, 15 Dec 2023 10:21:34 +0200, Tudor Ambarus wrote:
> The flash name is unreliable as we saw flash ID collisions. Mark the
> flash name as obsolete and print the manufacturer and device ID where
> name was printed.
> 
> JaimeLiao (1):
>   mtd: spi-nor: sysfs: hide the flash name if not set
> 
> [...]

Dropped unused variables, fixed typos and
applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/4] mtd: spi-nor: print flash ID instead of name
      https://git.kernel.org/mtd/c/9fcb0999345e
[2/4] mtd: spi-nor: mark the flash name as obsolete
      https://git.kernel.org/mtd/c/15eb8303bb42
[3/4] mtd: spi-nor: sysfs: hide the flash name if not set
      https://git.kernel.org/mtd/c/62f92e62c1ef
[4/4] mtd: spi-nor: drop superfluous debug prints
      https://git.kernel.org/mtd/c/7bf018ea5cb6

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
