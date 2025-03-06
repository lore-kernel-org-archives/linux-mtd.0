Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5139FC282DE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:From:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0LyWhmCI7yaiz3BMS9RpHJYYbBjPzfiE0cqzC+5wylM=; b=i6wX66PogsB2iz
	1GzK8MEEfUZ8dTmML/Xt1cIgOtsfDgt/qXvVskG/AS+Dbji11rQh9qVaW71Jm7VrMq1lceCo3lFkz
	6iNiRCCKT36MwmP8nZFkAwwEox5yfHABQVnFlMbMX2rXI1XLMDysi0XHQ5hAMbsxbzwvT4MuNHp5a
	DSe5pjUFefvpSkxKxT0oGLpnY2/Filt8EJtI03mJqrM0kfm7BCnn+Q/TYkeggIdidPRJJnBBSfpXi
	qin9e0M4RCKlqs/bm5tdXkiHJYu1amF9bArtjmo2kzRxgwGfYq7E7XHuzzc7T/t2tnr8KPBCML+lE
	KRpGJ3tAUk3kdA9+vhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5yO-0000000AFde-0aAX;
	Thu, 06 Mar 2025 07:48:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4oL-0000000A8I6-2PhZ
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Mar 2025 06:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	To:Subject:From:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qH5K2lBmbOECbgDbY1ffk9WOOYuy54RHiRfvSkbnhgI=; b=DlUYwaQ4By3zdmcaj3+NniF6H6
	v0GfZ5KlHX8eUrzqrK/iLjYURdL9qNekwv6wuEm1Zb1O0rxzJezcz4MVeQlBI9cdhOD5C7rem1sYJ
	079kglnysH5ET+CfWrqjW7q3FmNT9KdqstlDCQ1yWlJoSYBGUvvW9TTYA9glenlRoPQ/kxgQp9cwZ
	2/Li9dtI5NMHHwKursQAKrEeBhKJszCP255w1e4sWPWhZNJIRahq19KeiT0Z+Ma0XU1G/1rZ1o+iC
	c99gM7JsQVgwIaX37pxOWXnAQLuO+fBjSnEWdFxQkb2FNZs6wslilVplrO3OBrnKnSUIecoENZjcT
	K9SzJsAQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4oI-00000006vO3-2DXi
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 06:34:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22382657540so4074265ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Mar 2025 22:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741242858; x=1741847658; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:from:cc:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qH5K2lBmbOECbgDbY1ffk9WOOYuy54RHiRfvSkbnhgI=;
        b=I3d+b0r0WGNMCIpFXrOQ2jaFzHtZW7kOg2R/+x0v7aZ4OpvHgPgt/SGtu+p2yNp3vt
         UWF5jItocfxBxwJh/n3ivK3/tDANLWqbyY0dPDJlM8QYQ5sQ2AGycokl/S5cdYHAxKom
         3GENpjoKRdGgG4UIxBtFPlvkXkQAkRukGkTUB58xN+jJsqkwIjMIRx7KSav5CygeJhqX
         GNwTlvx7imPSi7zLezR3cQhQwSEd2HzvdVV2cnSVXmGAPvtPh+nhHfbsXtW2knEyrLAg
         qFIxDA5EMn6fcJc/W7MNqfQgpo72urkCgeZorHeO/0qywlaYjh5mL1oKXFNi2Uqp0Rtn
         PzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741242858; x=1741847658;
        h=content-transfer-encoding:to:subject:from:cc:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qH5K2lBmbOECbgDbY1ffk9WOOYuy54RHiRfvSkbnhgI=;
        b=R+estqSqnAkWDndqbr2FUAQsR6jnp31KaBQbxf7KIEfw60nGyHjTkOolED9MuOQE8E
         2uiNwxtXb0DY6nN6VhQkp7KcHdrP8+w7VzJRvlnYT8vh+vJnYAlYqC7RAAt7+OYQEtZ1
         JPLOQhhqg45dOA4fEcDXUDBt3Nge8dsUvh0nqiGdYQNZ7egsvOfIdTouxE6v/6biad+s
         9eK2XlbGqYufiQIsrLdpNYkS1bDewOml8H3+qaErCHIBL684zcHNP/NTGhm0XGOOUms0
         U9Ari0vi5hbnYHwfdef9EatlZlmp6Ea917stSsp9NprPXE9OWB/HeHyowka7KH32ibDJ
         apDA==
X-Forwarded-Encrypted: i=1; AJvYcCW8k6NBCjGTvxHhSpSbjaZScbj44rPemm2UTW0ALtnTawfc+XcnH6fdGeDPuDng2rZIJaZm9d6u0iQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHtJRSNl02YPhwaVXjgPv+yth+8PXYp5nJaAU7ZzGr1WSLi/Ed
	8uAiJi5lGLoVCH+vOGZq+MlPMme/r52Sk/D4gushr4OiKYUwUWqD
X-Gm-Gg: ASbGncuK5hQRIj81nPxUynCHnDKVlxfOoHmT+8a3o2lrrYxQUBeLfvwGWbQq39rFdk5
	dqHyQNMozVC+Po7jeUFhD9ZOxB40bHSIfLGlnETvJJs+fcIbQQozAlj+zAXP4Mm3BifR2PRyNFW
	mQ/OgMAdc9S50Griey3oeqSFRWOlc63GDImj4wKbsylvBSoihZKj1DZX3cwpeTok2FLCGZUSBgq
	bYyvJUNQDwvx2Fq61/X+MH2UjWAo4tXM/a6dZzBGodnKIlZG88LhdjOtOHQyLE+Js3XMi+fAR/O
	B0ns3bI0xveZtSuvC9G6mOAntcDRsUN/lEwENe5lq6+lW/mEMh9J5mUdkr/8W7K0odNHrFanlaN
	SLg4VplblIKlhZYtcfyvm
X-Google-Smtp-Source: AGHT+IHl2Kv9oS2iXIFCXr8SM01K4BXLk9tdyZBjR4//v0VgWLOJe0T9U9fO2LmsMltPJX/rHgW84Q==
X-Received: by 2002:a05:6a21:3a41:b0:1f1:431:9d7f with SMTP id adf61e73a8af0-1f3494b6c14mr10830991637.13.1741242858538;
        Wed, 05 Mar 2025 22:34:18 -0800 (PST)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736984f7252sm541294b3a.101.2025.03.05.22.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 22:34:18 -0800 (PST)
Message-ID: <b6fc44aa-0a7e-422b-87c0-b33afaac1ea2@gmail.com>
Date: Thu, 6 Mar 2025 15:34:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, linux-mtd@lists.infradead.org
From: Takahiro Kuwano <tkuw584924@gmail.com>
Subject: CYRS17B spi-nor flash support in ubi/ubifs
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_063422_574364_1A4908B3 
X-CRM114-Status: UNSURE (   6.81  )
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

Hello,

Infineon introduced a SPI-NOR flash chip named CYRS17B [1], which has untypical
features comparing to others SPI-NOR flash chips. I would like to ask you to
share your thoughts about possibility of UBI/UBIFS support this flash chip.

Features different from typical SPI-NOR flash are:
  #1 Inverted erase polarity. The data after erase is 0x00 instead of 0xFF.
  #2 Larger erase block size, 1MB (or 8MB). Typical SPI-NOR has 4KB to 256KB.
  #3 Larger program page size, 2KB. Typical SPI-NOR has 256B or 512B page.
  #4 Programming partial page initiates internal page erase.

Obviously, #1 is the biggest obstacle as UBI/UBIFS (and all other Flash File
Systems) are designed with an assumption, "0xFF as erase (blank) state".

#2 means there are less number of PEBs. I think this affects storage efficiency.

#3 and #4 seems not to be matter, if I configure UBI minimum IO size to 2KB to
avoid partial page programming.


I understand it isn't an easy task to update UBI/UBIFS for this Flash chip,
but opinions from experts would be really helpful.

Best Regards,
Takahiro Kuwano
 
[1] https://www.infineon.com/dgdl/Infineon-CYRS17B512_512_MB_64_MB_SERIAL_NOR_FLASH_SPI_QSPI_3-DataSheet-v07_00-EN.pdf?fileId=8ac78c8c8fc2dd9c01900eee733d45f3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
