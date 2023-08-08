Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B88FC001DB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XzM+MJf3VH1G80Plh8bWPo9RaHkqMyt8Wu1945rl6I=; b=gyXMFOGOqfCnOX
	vsv3NHWOKE0S+Wohus6/fBO2opfGRd5ZrM1M+DjTx0DSS4rx+csxCnmVNeaMpVVIAJR8xsbcKSvut
	5LoFj7f1e1z3+n+LpagT03kD0WEa3IfDB6+C/a6AnBpqSinv6Dpnrl15mtp/P84k2DxnYlOFA7qHM
	XW5LBAsZidfXwulWPfAjav/i7mfpVA6F/mKrVEuxG3LifxYDcHjXFCl9eLEZVabbLOIVj2cuXduh5
	/tXvP4m2Jg9eh6VZzjU6RhBO7KtK4hjQIFr7YuPsjTEUF36XIcsFej9IwcKD+abuKhC5xW0qVAnrJ
	AOVNuOYJQ0+6hP7UFGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIts-002820-23;
	Tue, 08 Aug 2023 09:21:12 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTItq-00281H-00
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 09:21:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bcc0adab4so791036166b.2
        for <linux-mtd@lists.infradead.org>; Tue, 08 Aug 2023 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691486468; x=1692091268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TwbRUbE9Iyh7dJoGsESA40RZGfSeEYtZu2QXfcxjFFs=;
        b=xnGhGVEmYCOoniJbqE3V8ZGksl1QPPGs/Ax+01SypH+ManDIhPLh1H68FWf0c/0L79
         KK1TEbkd1H40k/CD067FpaqovvJdoyV813Wn+jWhpR3DxBjyTrTGA0fzSN69W1SSz9RC
         zioCHhV0sKP90KK6ccLOxU6sBXN8d4DGhv9P2sqS8psD0iVI00JC/VCxT8v77U7HQlfX
         V+j9qjDnxf4dYftksiZSwQuTOxkNWozK1PpObuKiiyeaqr/MZ6bwW4L+vPgGGBvpmY7W
         PvlTwxlIbC5LlNQqb4G9YC7Ebhh7yeeDz5aH973SAk1S6n210WOaVfUze10NwxaBZGMO
         ciYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691486468; x=1692091268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwbRUbE9Iyh7dJoGsESA40RZGfSeEYtZu2QXfcxjFFs=;
        b=JQXSkwdFrwSyKMUpYsZD6eMHhj3VnmfmhWfNslBT98mFYF5hRovpitS2Gmrn6h5KdS
         JObY20wvVbmKc1Q71FwXPRP33KDlOQwjce95+YNbKo9XTtiPnVo/y+yF/XDv9VKfPAUd
         MJzoRBcqFRuQwkRdS3CaTvwGhTQ4sWOXU9UCHdLCVjV5FpPvgfhgPCsfVNcyGEbOBm+U
         aznkDsF1JOBRYEKonlFUbjepOiyU0W2+pJnHhV+DbShur4oXx6P/K07O2MTK78osROvR
         voFVJud4fTzOjiqplxWHcdy17Nwaac3lPF+tIFdGPvCT98Jt2uKJyYD/Q6gbG+2QCPaC
         T8XQ==
X-Gm-Message-State: AOJu0Yx7KfDnvH6N0rmb8hthfnpWFcp0Ys7lRZE1+rJ3TRB/X5tZKIIC
	+JySrt0Ioph+oJx+pGkRyq59bw==
X-Google-Smtp-Source: AGHT+IHXnKXnrJhPhidC8ZD5IsYzCSsqG98XaFeuFR/hu6KkMI3HUVVMoQJuiF68w2EPBmHNQLE76g==
X-Received: by 2002:a17:906:5dd8:b0:99b:c038:fdac with SMTP id p24-20020a1709065dd800b0099bc038fdacmr9328918ejv.20.1691486467929;
        Tue, 08 Aug 2023 02:21:07 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.23])
        by smtp.gmail.com with ESMTPSA id o6-20020a170906774600b0099290e2c163sm6345876ejn.204.2023.08.08.02.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 02:21:07 -0700 (PDT)
Message-ID: <2d86bba8-6cad-d67f-59bf-157e245edc97@linaro.org>
Date: Tue, 8 Aug 2023 10:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 00/41] mtd: spi-nor: clean the flash_info database up
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_022110_048607_6FB02320 
X-CRM114-Status: UNSURE (   8.29  )
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

Hi, Michael,

I skimmed over the patches, the idea is good as I already said.
When do you aim to have these integrated, now or after -rc1 is out?
After -rc1 is more conservative, as if there are problems, we'll have
more time to fix them. Either way is good for me as long as you're around
to fix possible problems, but I'd like some timeframe to know when to
invest time in reviewing all. We're at -rc5.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
