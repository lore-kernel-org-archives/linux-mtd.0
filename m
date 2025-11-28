Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82C6D116E2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Nov 2025 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=Dgu5i32EhTbhm+
	JE+NJcpLx+2KHWPwQ6aKRE7Bsd1tG5Q59w3GKKVzKSOsaHSEY08j3Kfu2h1fneZ/Vvfu07de4MAlv
	9XyvvnC06cPMmQJUIDskmIJPmQ6+FpKh1b6cXTMyZCSOYygc3IjtOvjke6FBNEm5kRMnoR8zTDP++
	srlPGD/VzTO7y6YFLs/kEKGisdUZ+Et+oQJky8fGi7BJBVWF0O1s9dGs2RYEHlkEOSBmY6lyRRBV6
	AKgxCopAy2nV4nU6SCCAXPjhab8I/Pf7bh4cimbMZJuyiCj+AcgpO126m5iZ3wkTtF642MQzd5Adz
	g53To1MQYPCYvVQxkzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3bs-00000000ntA-2Qyt;
	Fri, 28 Nov 2025 18:54:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3bo-00000000nsh-45WA
	for linux-mtd@lists.infradead.org;
	Fri, 28 Nov 2025 18:54:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so3515092a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2025 10:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1764356058; x=1764960858; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=P77ga4rCOb+3iLQ+9zoKcrvYAkRhGINAyCisR8jIkegI3bfmFVZfosNOfiAvh37l0b
         qw+WUqfCh5bk2JXnkHzU6TKKGnoEceWAWey7V4IBqXP3utD3k6q/LDG2DBpRHQ6pkYL9
         31VaIatvFptyA9m123iTwLGE5BEjnhus1tXRaK81WMoS1faQklS5nG4lvjHXF+ELQYtY
         GsWzCEk+Gj9nmBiiYRHOSVwSfXmaBbixqFDJUcJcBSdUbutcsVSTFd96hkObYVBCtWuc
         wJGjZTWAPz6DiTVd+QKAGB++sWkz/wxklk5I0jOuiD8fOX1ZVrjGmdgXVGTfySB3j2zT
         yAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764356058; x=1764960858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=K8XJIgkTxCqpwnjeVEjDS14siWXlCgv4XbOnokxKraVb/VM+nWWvG6jzFyl0eU+8nq
         Au6JDF9QmULtuqHrfUNpdCvDBglo1OrSYtNBfKI3D7IhRTsFPvM8Nnpu9afloSGoSRdA
         oHNe/RYi5AJ8mZn1M+764onJcy+AKggDpne+4W+4j4Yr/5e06RrdAyzy5CPq3RDCN4h/
         P10IsMOwnlDM+JdZuN8AJ+vfhg9YdIj2+DjiX4Fx3+Mm/adi1TRlChYZ2DfPFv+0z0kN
         AIZJ3RjPl5xSMfenYC6sfsm7Pbt3qfuIMpmwZfUTmpE1KY6+tY+MnmJN7Mq3k/MO5vya
         rwLw==
X-Forwarded-Encrypted: i=1; AJvYcCVRnG3MpD/A3qN120BEik4XBtgPcAyR5Zy4J9RXnvYVbtIB2xwo6ilQre1Rsj+/muE/EFyJ30vmbB4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5EHaznYo6Ae0eoykA5KW2l9yrPj3+GTh4nVjdcQcCGuzCWMkZ
	rGg9PmU30aJR2+zcGk9kcPQ8yJ1YyJ3XwA9i2g5DnaFx0XTBhn/Qs9yuegvuqrLsyvk=
X-Gm-Gg: ASbGncufCZ4XR2v8sFDvr7tNwatldEn7o7XMGCZpK9sAY/5XrAhrEF/UPK9fyMoFCo0
	RTxKRSakhf0ppNAH0C2PFM2Bppwf2/pF7BNNxnCkNjXI9l2vFasPKCOHRTGzPag/EOQnH14w2cB
	uYu6Wk4AupKB0+qeam6zgILRmwR2RwlRD94WkYgWbKKrSOut35dDMgxYW3mLner+6gKVhL/s4lY
	m3mbx5pK3MP+yr8N4eY2pRpQ156jb0o/7ZOw5wWQviFAHNdsfdstspZ9dOwJqwLoxmrVOqRSqLU
	mRcBpcuXS6NXriVHjHDY+kFl2nhMzZ1ZCnSfjilHXGYex4lmWAKnutf+/X+3JOxekasA65IXkc/
	bqxNE8s3gZrRdfi3b4NBcnL+WMfycSpHsII1MWMfWIpW0DQHTC3bKUJtlZ1smVeFmQNIRfHAauA
	uo8koJ70ENZN2us1U3GreubbpluDolFOK4d30dGWz8DlNP/j0y7ncPwLPdfQ4/ZQ6ozaRzvTVRY
	A==
X-Google-Smtp-Source: AGHT+IFBMSHpEofMAWv+xEqRO2YcTV2Xm+tEztI8JtaJMwyjvNhEkJtbNs58DVGA9BiJbJHS+bi5BA==
X-Received: by 2002:a05:6402:5203:b0:643:c8b:8d61 with SMTP id 4fb4d7f45d1cf-645eafad307mr16165387a12.0.1764356057901;
        Fri, 28 Nov 2025 10:54:17 -0800 (PST)
Received: from ?IPV6:2a0d:f302:e054:54:ffff:d714:229c:6eed? ([2a0d:f302:e054:54:ffff:d714:229c:6eed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751051313sm4946231a12.28.2025.11.28.10.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 10:54:17 -0800 (PST)
Message-ID: <a21334b2-3fe0-4594-879c-b76f822a0b09@sigma-star.at>
Date: Fri, 28 Nov 2025 19:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils v3] tests: add test_DATA to EXTRA_DIST
To: Michael Olbrich <m.olbrich@pengutronix.de>, linux-mtd@lists.infradead.org
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
References: <20250220112554.2150046-1-m.olbrich@pengutronix.de>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20250220112554.2150046-1-m.olbrich@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_105421_321901_06154119 
X-CRM114-Status: UNSURE (   3.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
