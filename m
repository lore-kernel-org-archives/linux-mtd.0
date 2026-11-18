Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF33606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FRqX0Hjx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWhhYeIJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x3SWmYgG62nCpkGv/PzogjMezQRcrNJbVAHerl14ckk=; b=FRqX0Hjxx8+xU7Sm+5uS7zvjDQ
	EMfDxRxyGx9d9Bku0agiUKyWXo/1t+nJLQGEGgDfyZcHmrsSmKHtJt/CrbcV8aiJzVHBbCjMNC/BC
	uxcbJOD8C1BEsCUOl+3TcpZQbdYw5TtGgzy7GlG2UOkBkL55ZYMs9JgOVvCEK9cZubV0lMWNQ4myc
	kyoFsT0uWJjekmAgqA4Wet0h5JuWSuDjiqiFeEwEZfeDJEMTWAv6eu9FxExmajM0VLY/JZKP5iwJd
	122sMGQdmSbA3cVxZxKl17eCbS3R4nIRZvY+Ug4B9fhOS7P585fThqcNhKt8ff6f77hqR78/FaMOv
	2v5RstcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjE3-00000009jpH-0sgC;
	Wed, 18 Nov 2026 17:13:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjDz-00000009joF-3I03
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:13:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb6756bb1cso832295e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 09:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795022013; x=1795626813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cBtlgSholNnDJWCl4oISQxqxXzBWeFzV9tSbiyzJfM=;
        b=WWhhYeIJL1KoWiE5+FFfVFRGgwEfqO0LmqrX1366LZ4Z6Ayn1JGjivZeuNLq47mug9
         RC18zshDCyzcLXEgXgKWBAYgXPKhXyegHw8wh9Bvsiu3rNuXqgAO35t8FBQEl5ZIyYPv
         rF3gmHsRDEL1/EuyV2O2RKsPWooJ189lXONZ0An8dZzXSaUnaan4Io76Spcl/qyYuggq
         A/DwP6LT5JUGPSMtcyxkkt9cLjalrvG8pGV+022oda/OQo3XW3C0lyf7F547I5yXfHY3
         7t6rjfAbEKWtQ7IUQ1CKGYgu9+wqnldo4DX4+01AHeEkj0CDrEBls8/vRS05W1Y7/gzW
         OPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022013; x=1795626813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cBtlgSholNnDJWCl4oISQxqxXzBWeFzV9tSbiyzJfM=;
        b=23jEDdAopfg19PtvE/2Y48qmjl3rffrhLjaMIkYdOIH4AEyc4buv73KJOZHL+rkrrR
         vsKhd61A650FQ9PNnAIzoOMUAsy5onDkneEnH35/7EdGUEPDJWEkvPYRxKioTXlrCfTU
         EbyrxwC+JaD0KjoiyX03c291fJGM0ImrZYAMLI0/Pc9yxgo3mvBpNQuKpZkuYqnvr7vs
         7U3LtY4ut+tKJ7I6KI8q0DvXsh4s1CsazDqEjeax0m1HjP+AIUI5zCKgUdDgV8J9Kal1
         6ZqvQy0VTSLrI7zpT81+RpQu2YD1IRXdTMfuDJT3ULCyIQp94+G6N6KUfVYhNbOfdRsm
         3Y+w==
X-Forwarded-Encrypted: i=1; AL+hErHlwrPqutFqfpfvK6Fi825PUf6+6P/vdgyCb49du54Slpja2BC4cunWUGpSHR7Mt2e4vAip/X8MMAk=@lists.infradead.org
X-Gm-Message-State: APuU4Z90xFnMmwIYKuR2emP8/B3sDdMOushOjziaoTFTRQasny5OHzUu
	pP9ZmUKwjmP1SCiwP57Twmh9ix88phL2ez4RRjfmoqagED6ro/7sKgWg
X-Gm-Gg: AYBFou1jGD3x/LwLGCrxJctMfVdkg6MYjm1dhZ8l2+PJoTEqeeeflFX8mFPstUb2os8
	n+QDWlrDRwrshV0GO8cffHnjLPkk8i3CpCkA8RNU38hgCJGZQfY0gtGmsUsWAl9pQl5IxPL7m8I
	fVS3WUFCKDHApm3qQ02xLRXQYspylUdASa8Igi4Uth+tb5AYO7acmQOcqD/YavNUBqgWiqVcbNj
	q4t1ag0S+APCBAVo1bHvYn7fkIfa88D16shfOT9TY5CpG2xaBCg//OpKVVpqxgnblI6eUfZ+PZr
	vPAOnGIUOMM5dNLmaNs15cVUozK6mdEItqoo8qRoFLI8AX5qZsIxN/7iHeH0LTfT14v6cEt8MtT
	dK1A8EYcCPi7VgsK3LfFkg0Ife+1fjvqggYfPl02UkDCamIsPvHo6FeMtObIxH8gmTHtIHfqFw3
	dqZV6iO67Hi0xeLOEj1DgXaj81HE92xWKz7KnCN2U9ODM9m7uof4Wu1Xbwlpndzgy8LBz1CU6SQ
	NY+KI//uMLDzXPr9JMjjog2Wf+0fkyn5pSq80tgZa79H6afhcpJi6pYVAfV7kg++E/UHyOh1pZT
	vwCq0BTTbq89rrYWNtjw+RimYHi6VLpgCysBgf7SU0FlUexXVQ==
X-Received: by 2002:a05:600c:524a:b0:4bb:5ad9:50dc with SMTP id 5b1f17b1804b1-4bb7d5783b5mr61295565e9.0.1795022013053;
        Wed, 18 Nov 2026 09:13:33 -0800 (PST)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8324a0d7sm2940715e9.3.2026.11.18.09.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:13:32 -0800 (PST)
From: Itai Handler <itai.handler@gmail.com>
To: miquel.raynal@bootlin.com
Cc: mwalle@kernel.org,
	pratyush@kernel.org,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Wed, 18 Nov 2026 19:13:20 +0200
Message-Id: <20261118171320.3887035-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87bj7mi5gy.fsf@bootlin.com>
References: <20261029210153.3986211-1-itai.handler@gmail.com> <DMYDITU0H48Z.2LA5KF2TFNUY2@kernel.org> <87bj7mi5gy.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_091336_336283_AF51A8AF 
X-CRM114-Status: GOOD (  13.20  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed Nov 18, 2026 at 3:23 PM CET, Miquel Raynal wrote:
>>> +	ret = spi_nor_prep_and_lock(nor);
>>> +	if (ret == -ESHUTDOWN)
>>
>> This is actually really hard to follow.
>
> Yes, I tried to review this patch and eventually stopped. Please teach
> your AI to not overengineer its solutions.

Sorry for the time it cost you. That one is on me: I sent it, and I
should have made it simpler before sending it.

v6 is simpler. It follows Michael's sketch: spi_nor_restore() takes
the lock itself and then sets a "restored" flag, and the lock helpers
fail any later operation with -EIO. The extra helper and the special
error code are gone, and the commit message is about half as long.
The diff is longer than v5's only because the _pe and _rd unlock
helpers move up, as Michael asked.

Thanks,
Itai

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
