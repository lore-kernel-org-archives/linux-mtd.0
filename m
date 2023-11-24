Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E66EC61D97
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 20:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNhJda/5hAeTXC/J947EobQn++aZp0VXA/RlYS1vsMw=; b=Viu92XtTg/v5g5
	cekO35CyF80nFnz2h+AcNzrccDor0K0CQaG1L9oplj15wi0YA+f3m5Q3PTu3JLpgYjAPlDhsYRnO7
	yaP96JQlKFFMyxiV+1wuxkp/XmgtiIbPjTc1oWsUXamHkvUJRaJeT4Wh5BzX+QzlMjt6H4H6i6YR8
	9dX1eurrH7bmUhx5BXgEWQrHTCwJ+6y5rg3ooL54lYkxW+yKnVtRx+a7s0C4KPBnJRWfihHDOXrlO
	1kn2XepdTLKIgpkXEOsmrv7v+3LtVI1tAjeVnsASjYics9oJU+yRibYucAbRsqNJXWZUVpAMyuGLR
	o9+woJfnYiG/hGO16y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6cfZ-00815z-2g;
	Fri, 24 Nov 2023 20:20:57 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6cfX-00814z-2G
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 20:20:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a013d22effcso313574966b.2
        for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2023 12:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700857252; x=1701462052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViRdTSishNWqaCbUV2uSiB5xfGwWROv1i1ATWCTnWTA=;
        b=Y5YbhrifMhmHvizb7j1Lz65aCXJ8LvLntNG8nr3T6ZyQglQZ7NGVF1ZTJ1ie9LQ1rQ
         6pEaOWd08tvFLn062XkuLDv/nv8Drj62pJhJhSpIncyrY8Vv/XoW6dtmTQ/Cpvu/iCd6
         ZUP9vTP8nUZNiX6NZXF66awCJfLQTIqA/YniyNyenFItgw/HdKL8iMeaROQ54K3FBGOU
         U5pTXnjG4jbfhl78/BSaz2738AgxnG9uLi1pCGtCTb2/vUk/7azHWF4S6DSUliB3Q75L
         JFPk6OwDn1dCcXU525RU4dJQWYbOCkmCfq//yaQszS9BqbXvnWkhsKljqiyJadCq582J
         d9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700857252; x=1701462052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViRdTSishNWqaCbUV2uSiB5xfGwWROv1i1ATWCTnWTA=;
        b=Jt7oPhIO7WpvQiriuoe3LOX241zJwdPf0HMWATyLPJuNa4V+mqYGnnNprlC+rTWOk9
         t0N3JL6AAHP2jHb7oq0lcUrXv2fpPbm1UTpOty8VHxnJXA0Y1DgmdBoXNfnvOiHDPMfR
         ea7I42axcYSGNd4tRvLgSF4d5IpUHcWVunzAbR8vxnEayIy0Fi0i3vZU1ASr4uWGLc65
         dqtlD0D2bh8BbQbC8HauHdxylTo4Y7xAnB3odk9kKX8xZL1WnxO0zikX1NBCw+AL9tIY
         MPYqYs++zUxF7UzynA6wU3KQmeyTXG8gFqhwupuid1HI8Z/t6o1QKhV4dfZIQRNfJwsZ
         pxJg==
X-Gm-Message-State: AOJu0YyWBLb0CFisvs0Acipjm1tmAEuDZYRMTI4SrZhJvylt94IwQcBb
	J3RRCWgOda1L7aVL1lkaD7JsDsJdnakfLUxLsVI=
X-Google-Smtp-Source: AGHT+IFn1Sx7rXRl6dVxMZBYTRWrjxX7S2eKanbthlEva2ddzupq9Obo7nDZY2VTzHvPyL/U1S/CTw==
X-Received: by 2002:a17:907:d407:b0:a02:ad84:3ab3 with SMTP id vi7-20020a170907d40700b00a02ad843ab3mr4271261ejc.44.1700857251967;
        Fri, 24 Nov 2023 12:20:51 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id cf16-20020a170906b2d000b0099bd7b26639sm2458153ejb.6.2023.11.24.12.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 12:20:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	bagasdotme@gmail.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs: mtd: spi-nor: add sections about flash additions and testing
Date: Fri, 24 Nov 2023 22:20:42 +0200
Message-Id: <170085693794.1196935.11331460822270915583.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124184902.1194235-1-tudor.ambarus@linaro.org>
References: <20231124184902.1194235-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=z5Gv5g8CG0O6R3uZ2jYBbxtCMSKnIZn+Qt1oDzYZlX0=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYQWZHXwqSKgQJis+6i9/ivqKhWebRQEeB3NCf HUNer9eXrSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWEFmQAKCRBLVU9HpY0U 6VpvB/9TU12yTGGWVuKnS9CNZLjA0Pi8FLC646PN3qnQl5UnNCb25Q7R1O3g0prog9w1+JIPllP nXVBrD2MlMfqA9c86jeSoo6zNQeCtjCBFMkT5ho59k8ZP1OWIwSu61IvQV93vDt6TNYa9DXcTO0 dfYXCF4gAv0uzHju2RnRBnVGttNq4j/bMUaZticjbjFDv04gZso01Fowq+ZHICq+ODtEsfZq7e5 gQPhXCXYzTwyMsCdwpeXXUGQJjY++kh4hLHGbdEckM9LFNwg7wZrAlUOlTaMd0crUXUx7Wjg4ic qm6C8Y8hAhC/cK+NBSwhzbw+XpUwuD/VbNeMoNUdqs85Q5/G
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_122055_736917_2A6DA7F7 
X-CRM114-Status: GOOD (  10.77  )
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

On Fri, 24 Nov 2023 20:49:00 +0200, Tudor Ambarus wrote:
> v2:
> - specify that we prefer to dump the SFDP data with ``xxd -p`` (Michael)
> - update the mtd-utils tests (Pratyush)
> - fix formatting (Bagas)
> 
> Introduce guide about when to propose a new flash addition and what are
> the minimum testing requirements. Dropped the old documentation as it
> no longer applies to the current SPI NOR framework state.
> 
> [...]

Introduced the extra erase test. I guess the proposed mtd-utils
test suite can be implemented as a dedicated mtd-utils standard test.
Exercise for the readers or for future self.

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/2] docs: mtd: spi-nor: add sections about flash additions and testing
      https://git.kernel.org/mtd/c/bb1f9e39c1bf
[2/2] docs: mtd: spi-nor: drop obsolete info
      https://git.kernel.org/mtd/c/9b3eae3486c8

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
