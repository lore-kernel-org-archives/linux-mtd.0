Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664A8F436B8
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ME6YtxQ7/JuGX3EhcJCBY0sAn90HbQSCWBmNanLZPno=; b=g6hVqMtKyMFrS3
	quXNIHnt+S5lWIno0p1Yxo2Pt5aHL202v7I9VMkBZp0r8wztqJxQh/t0onCLzVegC32WKG6ztyV4C
	KIf7iqMiOfB2JLKmQv85E4KPBY6deBMegXmUglaRMEfFy6KVFb3a3w1RjReGGLErHFLGG2Y3e8xXi
	0juR6EqnMXiQRQn/t2JOIndw7k5DASaQz3bEVykdw5nwOnpZKGnyjHf7TVpztl7mNwfZimPX3Qcp7
	YtmLWwAS47hSFBdImLKB1hZNzzvtjRyl+l1x6xYUf2yxsfiBy/1VzJpdb2i9S8UHlMCtr0CkJQOsN
	+aDL6/mzwC/+kBX+YEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl6G-00000004D70-1LXp;
	Fri, 17 Apr 2026 15:27:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl6E-00000004D6U-0Q5p
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 15:27:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so647133f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 17 Apr 2026 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776439636; x=1777044436; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=40ZypixgjKXIo6XSohZvf0mN6J7nrFoGdssup44acmU=;
        b=B3CBzWi0QQt+ZjJ5hUrlAZjkXrVHx1lC1Xo/L37I7dSvIYLrSO7GrJeuPMyhWLiEOn
         Xk8CN4jU8gcOxbhpQN7IZdgJoJMcUqeW9Tu+uiVaML70W/AzfdyfpX+bIpl1WiJfaehZ
         If9Tyku7Y/fPg81BcMjJTyljQeyVW4dHBk/lxlgZCm8CNj34hppvjMyLkZfBvlIIZRv2
         B/HbH0AGWK/MIkV5sYHeeVSnvmGgmJLVph1h4bZQ5etI+cPH5eiaIz9YAnoFoBfaRbgc
         u105CBHBHFLHMFa8KRhhRj1t+3lKwPnTZr/yQsxm+TNrqmsYLSH3jGTh0OPiERnY73be
         nhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439636; x=1777044436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40ZypixgjKXIo6XSohZvf0mN6J7nrFoGdssup44acmU=;
        b=W4H+oOgRehKk/qFDTdGbXlHb3rqHztBwVqZdkxgCpzoUP7F55UAdyTxYqyYsyMK3ww
         ZrcXlFPamPvLFZ9h/LIaYAlelNpvn2CzJdOBRsLvmlnj/Aj9LkUIyr0RUgai5HMFmdeu
         RVbLp2UkxC8RFzaQnWteBkQeQonCogEDaji5XeYvzdSJXHFEXjZFiZ4DwMf8HmfJe1fT
         kCHQXczq0OFDHZB4vB16mxViE/fKvuaAkeMpfBKyD1H5rgBmZs2oe/tgD525u0cLZqmJ
         enimCAdbtpTZWjwhNVj20B6psXqP3KRXpN+NDs+tHksVrxCfUM+wWOEreROd8cD7J/Of
         m+Ug==
X-Gm-Message-State: AOJu0YyVgNTFbpl/porOytj3FgHK2p+qiD4zY4hTVuCHgcwwHRSJTSFu
	XL2YFMOK059tE7UgmK733ynn/yWZNR7qBUBrXl1zOEkJZAkimHX4pmxbEbckpkkyS20F/17Eqer
	2weyQfUpV7Q==
X-Gm-Gg: AeBDievawzY0flXwkVwVvu+OKQBP8GT4Vg8Eaav//jrVrklgfrrq7fAIU6Jrb1HDsE6
	GUqe+PLZKgaYbDjdOTaE2wrXVDTZXplNI8XjF/nqNQaxsw4ZVTBLxWUvYQzSfLb1X23POXBn1YV
	aw3HJbdJO250LbKJERBMxh9AwMPogmiW2x7bshRh6uu7XWJRV6UUMKfvIYtBZNuhStpD8e/IRwZ
	rrACd6qK84BEoAabAgdDSYJueJwvInsju20Puxli2uKcjKpcdL7bCYRDmMonkQtITvWD3ds3ONF
	TW0h9MtwbbahLSHb9EFwtYXaj3upRy8ZqcdajTKZqUfhEZSdtE5xxsRmmsenjnLZMaVGcJRr0qS
	NyZKtbWerN8lUAzy274gyzf4Zda8COUUO8UziitU3XCgQrEKOozVTZKsL8IEuDQzaMgPCElNCEk
	tm2aHBPKd1t11VY+ucqgNta9lbn74hJ1xzduHdL87I7g==
X-Received: by 2002:a5d:5849:0:b0:43e:a8ad:975e with SMTP id ffacd0b85a97d-43fe3dfbedbmr5330169f8f.27.1776439635158;
        Fri, 17 Apr 2026 08:27:15 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm5594838f8f.37.2026.04.17.08.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:27:14 -0700 (PDT)
Message-ID: <e3529aa2-9372-4b5f-b87d-c236cce11947@linaro.org>
Date: Fri, 17 Apr 2026 18:27:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
To: tkuw584924@gmail.com, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_082718_169960_C6F2DE6A 
X-CRM114-Status: UNSURE (   4.70  )
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



On 4/17/26 10:17 AM, tkuw584924@gmail.com wrote:
> - Copy to <linux-kernel@vger.kernel.org>

cool, thanks.

see what sashiko discovered:
https://sashiko.dev/#/patchset/20260417-die-erase-fix-v2-1-73bb7004ebad%40infineon.com

and the patch
https://lore.kernel.org/linux-mtd/20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org/T/#u

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
