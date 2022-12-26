Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02A2C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIKrnX5CSINPkGNyiVlHWW/lYDcvd4pFUBpxXTGqrFY=; b=yke5PXz+2R/bW6
	MsNuGm5OpLCRJDT98VG/3VDaz3LQ/Qc9/U5dw5H+0tqf2jyMx/I3OkzW6MIVX8VSWt/jiPQclwd3v
	0oRdKUVNLNQhewJlni2AtkruPaubZG9zNdz3tkjJvaG1lREhRbY8wkrialfDz1Yo2Jvq0n45E+9p1
	dUxQRg4bJY5rJzo4RmZ3BkYtWQMaidTvHL3V72d9codZFbvwOApFXadsjbh88ByE81GxEwsjxgR2k
	t3vfjlPQpuM4r68U7/kpqYbeGqXNYD1wtG/mJg9KeW59N2QeR11vqyoJ1riKi0EgXgNX9ZYfrRHcw
	3CEtmDOjLEsjC8ILaUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ijt-002f9K-OP; Mon, 26 Dec 2022 08:21:41 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ijq-002f7t-8F
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 08:21:40 +0000
Received: by mail-ed1-x534.google.com with SMTP id i15so14817391edf.2
        for <linux-mtd@lists.infradead.org>; Mon, 26 Dec 2022 00:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBOy6M8XqX+f8ChS3NMO66Zl69QDreJxcZl08ebT+ws=;
        b=XJ7TIrvrgOkfhnlvnaRyQWSwMYmR+E+i8remztATZ+lkEABvIUe5/YInt/67yNXgqA
         RLzy1fhW8xkiwzA+qrDygrZAGaG3rltVmLYgLf8RG5gmD3c0LqSnULdFhAyYtt84jJxW
         ClF8BoEaBskl05BPDMg9Kopu3pf0vjx+TJ7KiaE2ij+WsTDoDqT2O9gdLagz3N3N7QuW
         mqvDiRqKrfCQuaBAN7EQ6icFRqQI8FrGCi/qdsFXlxz0CfBAHewlq8R2EdlGWEzf2qzS
         ClyDd4mHhWmVu79BIhpEQOBn+Rx8i17m/3GROTnSYLSbUeJPco5u8cQ7Z9T6ROgO7viR
         HWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBOy6M8XqX+f8ChS3NMO66Zl69QDreJxcZl08ebT+ws=;
        b=1oHJjSgVwlv02p+Bv3LQ73ykc5fV2jWUAUtZczi+vAWidJB6hck34CAng5/pN647R9
         USvrTCmeCoL6W912R54CDwNlGgSWj+Z0aR++IPxYkf95UvcxJM5z8x4NxLzy3ELj60b3
         mxkYy5sQPKZmyvBy23PXACfm7bKnGuo6zy+N//m8Vq0WJyHpoSG1VyEqJlx8GpHJoUfz
         y5e64lphKeD/jeMWaEKgJL4MXqqzV+w39H0uEqVdr31aFhgbnaerJu93clwubV36yutS
         G92ilcsJQskiiExRGeOlN8keMiF+3/1fDcworckCZmVGvgyVscVqN0KDzYFYsdDbXFEa
         hnOQ==
X-Gm-Message-State: AFqh2kq4CP+u26ebwsbv5PAJVNh/afgXyfaK2u3bFRjg+pZKay28vPV1
	Qt1ekdhZ7QX4yXxZUQBK+1LlrA==
X-Google-Smtp-Source: AMrXdXtPG9qKGDcqXn2v9ImBa9HYQqc34DGKz9jEUHIlLv/djhB9KQMidmBYXlT4imwCgn8LtYGZBQ==
X-Received: by 2002:a05:6402:1490:b0:480:190:5d90 with SMTP id e16-20020a056402149000b0048001905d90mr10358773edv.14.1672042892921;
        Mon, 26 Dec 2022 00:21:32 -0800 (PST)
Received: from alba.. ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id f25-20020a056402069900b00483cccdfeaesm2148126edy.38.2022.12.26.00.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 00:21:32 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	linux-mtd@lists.infradead.org
Cc: patches@linaro.org,
	linaro-kernel@lists.linaro.org
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: sfdp: Introduce SFDP_DWORD() macro
Date: Mon, 26 Dec 2022 10:21:31 +0200
Message-Id: <167204277292.48273.13144866020344883525.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
References: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; h=from:subject:message-id; bh=StyO4ItfT3BbmJzoP7JkdtgWsiw+sOPgcRHLl85/bn0=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBjqVmII7OqNdkcSNmzfzZjkEOvXOvsQ7wAweR3Q/K5 oUW2AHeJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCY6lZiAAKCRBLVU9HpY0U6QBECA CmsJTQYt5WSN201MNvKbxhxO5d/fkl0D/oj66hm7zkpu8Gp4GaWlN9+XlRSyOpcK9FrKWhCDZ8B3wo DmY1bcjdemN4bq0O0VS1xrkC452BZyco8OhFht43K2EsbI1Spfj7djytCx2hCS9sYXlD9mPO2/E/v6 jGAx/W0V/dNcDYcpkY4VCZTUJsteIPlbmAYYWQQyLIcW/4YwTeT2qSR5/6492G3zA97wemIY1P+f8M Tz7APau6aSyQDmQ/nW7fj5KSlClRPMd68nvG7Ni8BFQiP0KJZSCQcib/SS6PZaH29ex7361YP/6xzM zhC3zQfl2aAVJNI03SaTK5R5ez/Cv7
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_002138_735224_9D385185 
X-CRM114-Status: UNSURE (   8.50  )
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

On Mon, 26 Dec 2022 13:01:57 +0900, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Existing BFPT_DWORD() converts 1-based indexing to 0-based indexing for
> C arrays, and is used in BFPT parse. This is applicable to other parameter
> tables than BFPT.
> 
> Based on a suggestion in:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20220912051317.2369-1-Takahiro.Kuwano@infineon.com/
> 
> [...]

Applied to spi-nor/next, thanks!

[1/3] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
      https://git.kernel.org/mtd/c/ad9679f38118
[2/3] mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to SFDP_DWORD()
      https://git.kernel.org/mtd/c/86d4cdf88c81
[3/3] mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for optional parameter tables
      https://git.kernel.org/mtd/c/55398beb0846

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
