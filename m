Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF5AC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hh7OyJLIZaf2cuCRLctjwGaIU2V/dcqYcOnyDhTQlLg=; b=KOK5HOqLdc9kBB
	M6UuXPfgdZSkjocAQEOxoZ37i8G5t2BNrDtGzOFitUxoxusoFN45MtJTNivbcIfFy64/Y8AFlldal
	LYTdEEGYXFNfR9iesHGvyOVSBt4q6p32HlJmHvLYUu/oo4WW2tu84947ze0LHiXy5BT3gn9TV/2y5
	4mNgKxLHTuYzhQWWcMT9Mb50WyRTzORt0PQKqRVNF1Cwrzug81IR74uQqAfxZehSMiS5v7bzqhShk
	mNiJaXpJDEF6ND00vExu/fWi+atxfWCsttGwRCbX6iuTd46wpMp+D7F9cicruZxc8iOQ0Mf7RSZDk
	xvwK9jjlH9KKB+lVhfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxxE5-002V1T-23; Wed, 23 Nov 2022 21:24:13 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxxE2-002V0r-QL
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 21:24:12 +0000
Received: by mail-qt1-x82a.google.com with SMTP id z6so36402qtv.5
        for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2022 13:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZQDrrY3Jh/JGf3hkC3luDZW4ufEkyiRrePoBcKr4iA=;
        b=Dv0Av04vLcO/pCddOPbVJgUmAD0kD2zXLrwqKqYa0NIQ0Hspv0NMm2jMXepOpLrF2Y
         wj5slOSCW05nlAMlZH4ScQ5mfb0Ws8JhpQrn4Jvl4N6kOy37HNSl6LvmDSewAhvDpqRh
         ngTvoATS1zvvwDt9M8YYmIw5qtimRzFkrrP1diAYeApI3uuhPGCxdMnqHkO4ovF0hXYT
         C9usUttclxaKSgv/KiFPp8o8kU4M+UcnOpv2bIBUYOmY27wubAvd5/bnMbAjC0fZ0meg
         Ort6+iZ4AihkbpbnT6cfpHni/25rZaXx9RdO9kdbIEjNp4QiqsK/5rhZQCdDwIAHEkrI
         +Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZQDrrY3Jh/JGf3hkC3luDZW4ufEkyiRrePoBcKr4iA=;
        b=sNQ2JprOUUwA/sNKtMFjXhJD6dKqI43LyIEmUcN2l0y6IMbHpngCsAGGxkoP+wtBHO
         ZBL9Sp7GitjSrrKy2MNHB7+trDlRNlDrSfkFBH57dItatw9yETUE7uRdxEr46+14UonP
         jccyEU2IMphLeCYolrd4DWroWs+031zESOr4KkfWzAon3EYZf0Ojgspezt1B5fJURVPO
         3dlqlpx8hEfelqyeI1Wa9WTmBbG7I0sRizZfNhxICoxoIgHPdhgbBbi8ktuR1LE5IUn6
         yXLSFWfQspamwcHNidBYoRc9WGWENIgO8ACAitAy8UjEfSK7e6XjEC3qsVtluebYyW47
         UEyg==
X-Gm-Message-State: ANoB5plKqXPK8hV4SUk7q2cufMyPljixRThC7QByKHllcskZ/j/0Wfnl
	jyjigghBD8juWN6FVy4i4h0+aA==
X-Google-Smtp-Source: AA0mqf6TyjGy5VAIjuc9VbLwCS17xAYpTzweE2Mo4q5nwZg+MJn7BgySkh5GbT9ZN6kp4vSgIg5AWg==
X-Received: by 2002:a05:622a:5d88:b0:3a6:6181:f4ed with SMTP id fu8-20020a05622a5d8800b003a66181f4edmr1130097qtb.347.1669238646821;
        Wed, 23 Nov 2022 13:24:06 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id i5-20020a05622a08c500b003431446588fsm10587030qte.5.2022.11.23.13.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:24:06 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: nathan.morrison@timesys.com
Cc: greg.malysa@timesys.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	tudor.ambarus@microchip.com,
	vigneshr@ti.com
Subject: RE: [PATCH 0/2] These are the required patches I found while adding
Date: Wed, 23 Nov 2022 16:24:05 -0500
Message-Id: <20221123212405.128123-1-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123211335.126417-3-nathan.morrison@timesys.com>
References: <20221123211335.126417-3-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_132410_867438_EC1DB7B2 
X-CRM114-Status: UNSURE (   6.67  )
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

Sorry, the header of this patchset was accidentally clipped.

It should read:

[PATCH 0/2] spi: mtd: Octal Support for 8S-8S-8S and IS25LX256 chip

These are the required patches I found while adding in support for
an ISSI IS25LX256 Octal SPI chip to our boards.

1) The core framework needs some additional logic for 8S-8S-8S to pass through
succesfully.

2) The IS25LX256 chip needs added to the SPI part table along with various fixups

...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
