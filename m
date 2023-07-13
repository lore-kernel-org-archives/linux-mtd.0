Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BED8C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 02:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jv9Josr48D2CcSa3RvFxgzhL715zn6DFqtsbktqDUo0=; b=D0dGnUfnkP4Ma9
	KZuiv/6NYarM6zg/O0oywxYhNekEILXc5N+d38cQFnIOMhDoxCTUJzgaJWXESsl7mL3cFPc4Mi0Qt
	PhsZCX0id5RnS6UoBTMJZ1ELMDuPbH2yHdsC2gneOV1c2Uwe/ABWtda0XJSZFB6KnA8+HmWFUfr/Q
	xk/TBYjh3qjXeStCtq+mJUYYMrpwAGl1C219awUzhhNeKpPjcxL1I7zboNuHfOosIhuhyvTpAqwHs
	rAx3JDSGk5Ip9yIHs/8Dx6kJ3tzqUS1AUdzzUBZ2H1ru+kBAxvK47eO4JU4acW+LQLv8EuubGd2Sk
	b02ZnBHgZ5ePEuJTpEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmUe-001mN3-2x;
	Thu, 13 Jul 2023 02:55:48 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJmUa-001mLu-1b
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 02:55:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992dcae74e0so39028866b.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 19:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689216942; x=1691808942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLlU58c++ci0IwqSkjxaHTSUcPb1zdpAeIzC2kjdIKM=;
        b=BUNTBaE6LZt5r73fzC3XCFuLsZgsOT1IAJcT9VjwDbN8snUUYP1sEUvu6Qt76HZ4Zg
         OwxWqOeNsG6U2s2NSrdUBLL8xhsSIi34mEjlpNIxzyeQZp/ddXhG7KnOJkKKEs34qJBA
         tcFMCzGn4MCLJNv9swwhnkLRPzhlwJ1jU7HovZeRp8hN9GN+b2lsgQ42plEUsrAp7XCx
         eLTSJBaIqw7Vf8bhJDh3X0ZWQWuetlnIm7cMIY5cCM9P894BH9tVxNemcVkjiv2Wyy54
         +Io3GWchFGtwM+KBX222G93mTED7UKSdo1E2LyrXVNCaRCpbGDK25FLPCCD/4XXe4Md/
         6KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689216942; x=1691808942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLlU58c++ci0IwqSkjxaHTSUcPb1zdpAeIzC2kjdIKM=;
        b=PBo+qMXC3wPyaomSwXqmCs7rxE22XOZPOT392nYV5qH+ac6qlTRHrQAFZkKCw1x7Jf
         GjnQJ3zxwCOS2kk7zrLJAjAWJHaIoeBQJZBt4FK+bHhKDkzM1oid952cxxKuZUKmAPx/
         P5jlzYCKgnLIzSqBoSCDI+aP4lj6r676XhJLmwqYh91belM274qrrTdXYAHoKlD56TPP
         bOe58a+a79yZPX5KbLCVMogNlMtxv0hQKhmTHSKi66zyy41EFf0Bf/SL9M5+rF8/fFnm
         eG95nDUEcwQspiJ8b1REbYYcM5hMVKDb14g0AtDEf3as/FdqCmWXsGSSMhRe2tDawvky
         ekPg==
X-Gm-Message-State: ABy/qLYlPTK2mdU0LlK2MybBpYAi3LNuqbpQ+byMLQeLpETpc9Zs29y5
	ZXYdAOakASXcJq09M873cifwhg==
X-Google-Smtp-Source: APBJJlFYMn/hMa04m/3HyPt1kQs3tR6WyEkeNn1QB7QSSGrd5pBpQej6DP/GuwOuNUdMOr5ZjXQoBA==
X-Received: by 2002:a17:907:6025:b0:993:22a2:8158 with SMTP id fs37-20020a170907602500b0099322a28158mr120877ejc.61.1689216942405;
        Wed, 12 Jul 2023 19:55:42 -0700 (PDT)
Received: from 1.. ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id gr19-20020a170906e2d300b0098e2eaec394sm3370236ejb.101.2023.07.12.19.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 19:55:42 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: clarify the need for spi-nor compatibles
Date: Thu, 13 Jul 2023 05:55:35 +0300
Message-Id: <168921680625.27728.11240136618925333880.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616140054.2788684-1-miquel.raynal@bootlin.com>
References: <20230616140054.2788684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=qQrf9UEl4mHPW7uYjAFEMB9b0BBwHqIyTsPDsR2h3mk=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkr2egyZ2R4+Mvk698dwEXY6GlaMZ18bERxOJDY aBqp0VccFqJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZK9noAAKCRBLVU9HpY0U 6QhUB/9DOWFpM/PMJBKdEZGXzpjOlBDEtQppakwcE6ftjqQtApQcSiF33NkMhQ2Ts3M7eVuoDZQ x3/Zk+xmukkwKeje3dbmsJP6GoNFR1Z5XY7yKc4rYrPAW0pAG/tgLpP9zSVlx1dwYP6tcfDQNJn HBVwmW+zpyVvyZm5vXJwnSmpuy2b+bNstx7oolPgUl2xjZhJ6OuwMK2sD4RzmBrkqwdkkGjt4/M qAsH0wKGBkGYOV1OACviGl4nLdjjc2UbzcLXUgMPkbdohpDLGGMqmAF4fnIw0BVvaCKp8NcebnR BHJB4By13mDtzZnsE02HiuBUD862MCrPLSefT7wa/+OjF0ZU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_195544_533107_3D9D0D17 
X-CRM114-Status: UNSURE (   8.05  )
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

On Fri, 16 Jun 2023 16:00:54 +0200, Miquel Raynal wrote:
> Most SPI NOR devices do not require a specific compatible, their ID can
> in general be discovered with the JEDEC READ ID opcode. In this case,
> only the "jedec,spi-nor" generic compatible is expected. Clarify this
> information in the compatible description to (i) help device-tree
> writers and (ii) prevent further attempts to extend this list with
> useless information.
> 
> [...]

[ta: s/JEDEC/JEDEC SFDP for clarity and s/JEDEC READ ID/READ ID as
the opcode is not part of the JEDEC SFDP standard.]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] dt-bindings: mtd: spi-nor: clarify the need for spi-nor compatibles
      https://git.kernel.org/mtd/c/4b0cb4e7ab2f

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
