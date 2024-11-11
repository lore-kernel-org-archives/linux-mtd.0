Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C355ED2E9DC
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KB49pZ8kK4Z2EDZAM+fczzDmaCnVrv1BGgBJlZMao1k=; b=o3YYWGNzNPJlxm
	CfSaTMcrhVPZuxd1lGqE8LgVoF+Pk0AyzuNRHVhQW9W4ZI3BUBolojRVwW8wKyDlV1BvqjXxK0AMo
	ZwsnXDlnnwG/VaYagnk9PZ7F60ZaV0KTVl4AoAPqfIhct4BU8tDfuloYj1NSYHGgsz4od+8k15WKs
	/u73AGcV9voVWX5l+6zwVC4TguzTjNAoGxdtvQBq33LHNK/CTCu8olRH4oQlTrJyTGcfRouOowdkK
	e3JavKCVx6NcXrEAulmuwj0MF1PmH/chFuwUm89yqi4wLg1Hr7qFDzWW1J1P4uYkElTQc6lJGq4tD
	o4PvPQ6rgXb2V4E1nSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASY0-0000000HRmo-2bzJ;
	Mon, 11 Nov 2024 11:25:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASTt-0000000HQah-0MV6
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 11:21:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so574651566b.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 03:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731324075; x=1731928875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xadGs5mwD1qsGTtzkxs+MHJf7d9pXe1KKCe8zYpsmpo=;
        b=NL9Hli6xtn79UoXRXQ53jGIMciuFN2/viUpHHDhYLawdcVRwG7OlKfpDiKhXp/twkQ
         kZWT4D8hKgauMRwUBI5b2fhUpx5vdnatjsLU0lBkx6kz5v5rDc/dp07s7vexm8OaBS4m
         u7QvzvuxsX0cA3Qq/jFMjKs/uqOzW6bO+WGUV2GfnPYit8kmuN4tTXmpu7Ws1rQvrAXk
         4BJHTSV+ZGjPprNsIrDhztbf+dyqIgovHMHCyGIQfqPw+g96dBF+18IHSY45i03AxqVr
         LzSWpK0unjchTmTUII1BI1w0KzeF5jNccatX+/M4P+9eZR4MCiTzfALf2XY56tGg1InE
         g1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731324075; x=1731928875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xadGs5mwD1qsGTtzkxs+MHJf7d9pXe1KKCe8zYpsmpo=;
        b=XH/ENQ6dQkbvxH+MJX7tYsRfRpt4XTrWUskLILrHKt08N19uSqOWel9UivmqH/fRSW
         hWrq6xSht2tEqDxUWZsHuqMDVTRkiA5baey/g4Cv3Qd4ekAAP5m5RB+Tzb9oPna6b8HW
         2vkyjL1aHzf0Dfr+kRyGZY6w3gIzI/hlm3Em0ozG5fPapPTdNhxsH6hKDv3SGPnA0BxY
         rWywtt8Lu94wwTMtOEKUbPagTeXDTok1ZSFipocw4KnuPmHl4W3gvu2kFMlZ+hNKPqsD
         z6YZyD3bi1vX+pyADFZSN4Is8Ouvhfsc/FEy3jJ3tu8+DwXHFUzPcRs0JQWvK9W8thoM
         OvKA==
X-Forwarded-Encrypted: i=1; AJvYcCXXn/xsMkuRk+8cSVGJgBRZz9NDjrkkXgeuoKgdwEsYt2O5sc7dpYtcl3SK4ZISA4BLQ+kptH3aFuM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXlBuDqgvHO+GUsO4vONr82HgYjDKnry2yYit/mop7aR4/JymT
	b2O1q1KYTFqryAGl2Yp16vckoZqcSe4P2gzxWsz0UCA5kXjVsE3YMb4CYiMqy/U=
X-Google-Smtp-Source: AGHT+IEwy2N2c63rj8E+OlMUwXaIcbDUR7Sk7oDxP0sPZ3aSNMocv7LL9KE0Izc+N6rNT+6VMc/psA==
X-Received: by 2002:a17:907:7e8e:b0:a99:37f5:de59 with SMTP id a640c23a62f3a-a9ef001919bmr1200287766b.53.1731324074792;
        Mon, 11 Nov 2024 03:21:14 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a48585sm580264166b.45.2024.11.11.03.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:21:14 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: mwalle@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: winbond: add "w/ and w/o SFDP" comment
Date: Mon, 11 Nov 2024 13:21:11 +0200
Message-Id: <173132406532.9203.16605766715028942192.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029080049.96679-1-tudor.ambarus@linaro.org>
References: <20241029080049.96679-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=730; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=gVRNVXU+XsTveFPESwuAaoUa9rADH15YraU1uwLLr5I=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMeil94i1AddMV1iOqINU7/gzjAdNXiYIo44l5 x07nJhNGjaJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHopQAKCRBLVU9HpY0U 6VGgB/4k5MVyWCGYYf01ruTnRsPkUVYYgauJWhy0qDI4NPnSs64C4HMLTFjMmWZjHXUONCIVOLK juKPOhBh91AO67d0FxAKeFPBfhIiEQK2rFKPdqhJ5QGgLp8JQutlGfn5vuy5TVX7retT+51y+Cg k6FlLEmQAUbKQI8KcDdvTIVEsaKWUmySe2h/yTcJ2yYdKZUxOPXgbDBy1xJsriHXRpSeTLF1PQT 6PWEwdsLaQTmsub0/tpBo9KWZQJvj+Cqo/Afpwp9g40QoqM/+xeBthgvw5mFopw3UthIHHfb2hi az78nFCgPRmeZkGQu9xj8q0S86bE1B63lY01WQu39kM9FVKn
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_032117_177689_B5D90971 
X-CRM114-Status: UNSURE (   9.34  )
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

On Tue, 29 Oct 2024 08:00:49 +0000, Tudor Ambarus wrote:
> Commit d35df77707bf ("mtd: spi-nor: winbond: fix w25q128 regression")
> upstream fixed a regression for flavors of 0xef4018 flash that don't
> define SFDP tables. Add a comment on the flash definition highlighting
> that there are flavors of flashes with and without SFDP support.
> It spares developers searching the entire git log for when we'll better
> handle these cases.
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: winbond: add "w/ and w/o SFDP" comment
      https://git.kernel.org/mtd/c/f8f6224948d8

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
