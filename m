Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4727E7718B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgGhSX6+w04qlOFAXPIpKcA8L+P5dDVNizB9DlK7k7Q=; b=A42GARYbV1xTcJ
	+g+Ai4soVZ3jXRJnnokoaRBUDSv3Eh/re0hvVtcHGJ0FCPgOIJlVV2/2RlW4YsEI9e4/tsvG4DRr4
	qxMzKZXwY3RrNQb7YrLYTUji8bY7CEQaok9thddashk5UJjA+14b+2DHFB5i3ANQwqkzVSqLPlEc5
	KviM4kbwzMfOmCULKnUwLpDlz8RBCD2W+Z/BAP2eCvgeR4+vDNJSx3YUYS/vS0TEdBrnKSzzHgTzY
	Q3mWFiWsnel7stB8SCcvk0MDGbVWfmmR05bRKcLlvv9me73TeRqrF1xhc0yOvWijm+ikCq668E5pV
	e0NkxRjyJ0JXBJrEaDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBEU-000000018rg-27TX;
	Thu, 19 Dec 2024 07:46:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB3a-000000016k9-2UPX
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 07:34:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38634c35129so350101f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 23:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734593689; x=1735198489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=PB85n4+W/1m6xeKMofLpCasAKsj/yzpsJqrLUoSG4ZleQrNfg5q7eCiThlDeXaKNhV
         /Mqevi0mBkgOcOZRKD6ueaVxlyEJfs0JQVgOJ4H4awkNNa7EBAijurYaO8h+tRvGR095
         oGvdl03BmWoq+Fmt3JUZrf+RCi7bZGYVxy5NnkneM/x4LwBKQiotCZ/xBm2C+M2LHzSt
         HQ+ENke3yYjwAhOJb2xqSw2t/xmB9pGoljvIozEQNOYj1gMolz/HgKBLYpadY1wrxtYf
         ooO5EVNjoL4UkKW0TJLuufRNMxrO8jcdmmWxj3diKlqQGLajsM1pjcY3QZZ0uTCYxf2u
         Y2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734593689; x=1735198489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=hP+X0hHjDrBvbAvnGGnXOfJBEndiD2LiNSsmbe2mJcel3abkjXD7mlLswAoCoEO2OR
         g2KHn2ST0lDl7ejyofDZnTiJwJKTIwxMorQok1/FZeXdAGkWSGtI8MF/ZxWVC0LxuAnI
         qcbUn4WA5ASbcDQ9wO5vJin87znW8kpiOs3U7UxBPla/D9uJINnYuSnXeqU8iNQBuQ8K
         ADDsjS+lXQ124rcgV4wsNvRruTvHgBARFJv2X+hUB6X95dzUuuRoRfMQ9H9dGi+sZ7EJ
         sIlyA7WfFlTPzBY8FIA7xwpbyvvs6Ej/zEy8gN5Qb9dGiVohVuUy7j7nlr/0SwPftX3A
         OiWA==
X-Forwarded-Encrypted: i=1; AJvYcCX3YBSejq9YhxomeTAnLezTKt5gn1v9awc+UYcJqHQ+zsJRmi30h+23OWVzv7QLV1pV9pBMGLEnZUo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCA6ekbgtpn1K/kQuOIxQecBSLNlxFg9Ja34kh+JU5SZzMIZVP
	8gxrc4LVONtU5NyrJq5AwIepWyfBceZEfutrUOus8Gm1Hlk5j8h5MUUH3cbVsoY=
X-Gm-Gg: ASbGncsRvsu6pXjl+e/SJj8Tol0jT+0iHNNMJJisADdVczDLtEvZQ4ZzZw3pMnmke3m
	srmlEnvttJZqj7PAzvEnFjhkPl7nX13omuGfYr/l6L5RBoxKYulU5P01ll1y4m9Dz+wYAWC4Iyl
	TgUNKUtbBlSnGPdWQ5hx3uNdOoaEaEGhnMkQTahdFkVYGEQdyQ4FPOrztbY+JoEAn9aAhbpMgWs
	sSFU8kd0BhRN0BAhINx5gbmtDIzQPMgOb8VMTUoWd6JKqf0YwbyaOKlR/CWJoP7
X-Google-Smtp-Source: AGHT+IGSWPAkNG7qOrzYxVmeGGAkKc+5N2838sx4vBBbRxaEH+7W23hfR2x5ibEWhvyzJ/s/muGljg==
X-Received: by 2002:a05:6000:2cc:b0:388:da2a:12fa with SMTP id ffacd0b85a97d-388e4d9c4ddmr5147121f8f.52.1734593688952;
        Wed, 18 Dec 2024 23:34:48 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612899f0sm9481825e9.38.2024.12.18.23.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 23:34:48 -0800 (PST)
Message-ID: <98979b69-e446-47e9-b09b-085069ed960a@linaro.org>
Date: Thu, 19 Dec 2024 07:34:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Add support for S28HL256T
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
 <f052b04693f1100e725e076fd8a0ae339f8002c4.1734588106.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f052b04693f1100e725e076fd8a0ae339f8002c4.1734588106.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_233450_696021_B04DA893 
X-CRM114-Status: UNSURE (   4.36  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
