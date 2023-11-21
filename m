Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB900C61D92
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beb29Mx3u/2Qa1ebPS2PDT2K3f/I/FziBrAB4Jx6ffY=; b=BJhYsn1fig4FqH
	28Pnk7FlVHyr7Yo0sdycIsgnJOL8XAmbml3dt8ozttJJGvp3edFgWmJNTu82n0Bpgmh83FylfPK4C
	CU8SsAoD8DjEqFf8zsXMZYhuFKwI5jK54eGqbJreETJW1+eWdczKiSWDdYCEHj4Vse+klvojLwFyI
	zKcVK+IItYU1iIHfLKQKsX0UgMPfYmN6UAudPLbUxaXVzHrpYWScH81ZTfrhKZbJXTTDWwZhiXbvT
	kW9IU7utLU13LsTg9cZnL/cHY5RtWl/Buk0juJJYPnQBdZf/QQNUTKc+4Z88Nu4pRO3h71Kboby/W
	t/lQsNxSVucdpPRO2zZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QFy-00GleU-1i;
	Tue, 21 Nov 2023 12:53:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QFv-00GlbL-1i
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 12:53:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so7618708a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 21 Nov 2023 04:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700571204; x=1701176004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydfV3QLSawHwlLHCWd/XNWDer+rCulq5TXwrRTbDPHs=;
        b=nZVfwFlKtmF00Zzi9Hhc6Y1xtXZfFxwa10NIJE4llc1iZCU0kSaX3bpnBklrpnRHxg
         AGknd/RNHNT5/et46Db34XNxxYMVSOgfvfaT1RuB2WMSGBJaf28wYdSo2egIM9rorXw4
         OVjdrgvu0K5VR+Yx6OYptEgFOg2cH3gn3FvEPTAxXXhWsyLpUYxHYCjy2AOfoC3uDYJd
         HHfLQH0+WOpw4AVTBwv4ChTMDtdnIrRbxu4bAR8SfyUkSck7hSg6n5xZj85/FJOT11N8
         dZmyxD7tBNxMR4Rnl5qec/ILMEInEEKDlEme4iuSM1TGdt6kZqLQALGUa9pdba41to1v
         2zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700571204; x=1701176004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydfV3QLSawHwlLHCWd/XNWDer+rCulq5TXwrRTbDPHs=;
        b=M/hI2X6l3Z+6JraEb5Cl5mHlDNahzqnYXMW2IsqsJgbVNsMsjjEdwgGyg8Dgyzd3EG
         xMc+38DlEK4mBa9hOSiDVXKqRx+B1QhKAaDE75O5R/M4sw6kiA09co8LCQPNyR3+AES2
         EpsrVsZXW0p4UnzaJsTDG8r1lhGMbWMrIfDxyhMHoqKDrSq1cowJoTQsbj/mcW5g8h5e
         +idliTltI4pcQ691Xt1xz6EbVjC0MHSOCTRWkObHGPB7xU5CeTE/wIQ01jkD0UPvvVio
         +H5ShJJVRpU7jv8LkA5tZGYpEKL1ydwZ2l23wa4VjUrBiupPYvp4cJTtqg7R7+uL+3F1
         ITVg==
X-Gm-Message-State: AOJu0YzeSpfx32OOREdrXzuQEpMzgYi68NaBFoyy+cOQ9Xvj735r4WyI
	J8njLE6ISQxQT4e5NqG8mMrGpA==
X-Google-Smtp-Source: AGHT+IF80+iu4FqHVnddK6Ny09Q68ePeCeZXwIFeSRKI8zi4MVpVjidbPWO654V/Rz97P67qG9Y8rg==
X-Received: by 2002:aa7:c40f:0:b0:543:5899:263a with SMTP id j15-20020aa7c40f000000b005435899263amr1675770edq.12.1700571203763;
        Tue, 21 Nov 2023 04:53:23 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id l13-20020aa7cacd000000b005486f7f654dsm3748144edt.7.2023.11.21.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 04:53:23 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: spi-nor: add myself as maintainer
Date: Tue, 21 Nov 2023 14:53:19 +0200
Message-Id: <170057114435.4569.9815407324870348078.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231121122134.1952738-1-michael@walle.cc>
References: <20231121122134.1952738-1-michael@walle.cc>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=455; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=xDTBtNWQ9s6N3/JlP9LF5XSGNDUqzZO5gzJrunwoO+A=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlXKg9zouPt9NVpk6/lnqPXJUaHS8KxffXLrzxD zYeR6fJVF6JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZVyoPQAKCRBLVU9HpY0U 6RSnCACXF52fu0uon4cCCJ9H3Md95CgZv0TuO/3TKWLEmND6thubepRTywhV0/V97xl6PcxwXDo COuBTFx4LnVuPCN/TmPdV1eFS4z/AMEAavWH7HF1kR5LlhR1Fsk+3K9bg0MZt7lM40gY78whFfq 2HUTjktyEpHGOu41qmCkVmG0vv8b5Nj7XNwJ/kjC09UAjRLl+mL8dP1bmRG9b+VZAfHjmwIyzu4 ZAUoNLidOUNnUFOclziIsl/+iwkQSArP12B9hl9kRFx44LLTX1hFZHT4cO+61lWN6eDbVXQpneB E86bSvhg2PCh+v2a95JdDzj355gNJvLQtDBSDp6aw2Swgv18
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045331_565670_7E222FE0 
X-CRM114-Status: UNSURE (   7.58  )
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

On Tue, 21 Nov 2023 13:21:34 +0100, Michael Walle wrote:
> After being a reviewer for a while, add myself as a maintainer for the
> spi-nor subsystem.
> 
> 
Congrats and good luck!

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] MAINTAINERS: spi-nor: add myself as maintainer
      https://git.kernel.org/mtd/c/4137f324cb29

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
