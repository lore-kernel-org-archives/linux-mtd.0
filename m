Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2D4C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9DDp6xZvLTu+JEay4DNvX3gdPUgNbdezUUdR4f0DZM=; b=BRlE7H+VlaIrKN
	ePiiQeiYg9N3Ezfnw3HDCWLYVz23R8BgPgjGpgUzCEX4TcIpmTYaweflq5rqhk1Wq1TEQYUt7DHSg
	I2inGs1iv8fIJZrt+dSEE2czxYbQ01QjjmxMaUAAvJssm9b0rvp3GX0wCbVeSLtRYv7ZzxklxOsCG
	GNdXkveBgq4cNSWMlB8bmxH9GlyL6I8o8gEDRSgt6olCL2mBxDzLHquh8PoXPbsn5YNwj0zswJnOR
	EazQW6la+Bboxv1S1QNIolg9ly3mYc4tW/CstaEcL4CtTWiTXSONjf3GoVAYVcIHHi3CZQpV+Tn0a
	kqHyn8BfunL0tvj8MxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzh5-00000006Sza-0OQc;
	Wed, 02 Apr 2025 15:07:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzh2-00000006Syg-2KdH
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:07:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4394036c0efso47377435e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606471; x=1744211271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=GV9Di7JbtyaTouKRGQWumgoI6a/wlxolHO58DjwVRiPf7sxDaN26KrN+c3Z1TpVdf1
         T7T1bckFmAEgjhUXYd9TI+n2jkLP1CCSiL6NjOcz9cGhrp3hgSx5MtaHvSP6lDsoUi6h
         TIPI2aBy8s2/LUhIYqZDLZx5QTWZugDjCOknMXD4kG4jYyUVUIwCb+U4aQVipl+m7wFs
         hylmKvVzpNNHFw6otR1b+JFex28YrslY6YHGrnuRPrt0ffoQoOGAHP/38jDmTv/kBBvP
         DKGHNB5RPgDS6LxgR+fK/nR4k94g07dWFxTDaf0iVO8qmk+7Wb0LBu4M6/gma1DqWkKN
         /O5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606471; x=1744211271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=nVyokZe6gX9Z77fyMB55q6iIGEItCJ15k2PqxzgLQLsfShRmKhibh4TUWJUwsKXum3
         kp3ldTBAwS69CKvLIs3EZ1RivDCLb9R8nI5/UouI19/3bP/htJmrUF9yR3lrlZkwWHRh
         ZH19lqdfGVf6elzF3NnHkugHSY8XwflB8U777yzirA+AMIUB844FCtC2vV0y/gsPpaa3
         M6EBxVJtP9+0pX1X/tIUT11EkreqHC3PmB9oQz/8a7ZQ8XBZ7Rg7YWkFq1gBoCPN76MB
         iFsx8W1P5pBiLqzu1f1JCssQPW5A8Y6r8P8D2zVcRA7U22OWOsmg/ju/bRvLt8m9KMwi
         6QYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKhXFO3pqlKEtfoSpftxneyng3aARnMWU1M2h6tQaHKBAhadrGnjoUMxo5mviSAeP2ll0Sjb21B0c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJhBVF7gB+Al87u0gP5uxSQeplCsIbAneLieOSXkV4XPO8RGPc
	0KlT0vAeGuVbSCR7dxBx3WQqa7BzCEoSz2KAQenUKvkOGv2wmVIQT+pBNscsDg8=
X-Gm-Gg: ASbGnctiSNN4JOzHM6xOpz55lH7XN6Gvj0tN8KZz4ydMnCb0y7mR9/cWykqXJbbmVOJ
	bqUVRYfp0DhgwQayjlKTP4ER/sYIGipvUqzOF5Ny0vNVaP+HY3+YsIn4BvaWXwNMkWKdIlNWeeM
	YQ9PyBfs4AloyggjSzaUzY5Wx7Z73RQvtjKB6wlXzK+cnuS6lRgjqw2B1bAMMmh+jy8mLJRf+El
	HyZpcI0VngNvRDK7ABhGXLDffdv519zKnBz/8OqBTSdmWjm3WjWpi/JX8aRfGXYpziYJI0dbN4O
	LGajPQKQm+M+O67mLO3OT4CPWUNiZYuWkc8SiWm1lzBno6GxNTDc5Q==
X-Google-Smtp-Source: AGHT+IGwDjoqT9Q8y5sN1jn/reFFnITOC68FEDThXYi7gbNhD7FNe7l92ACnDMlBKNlvVLSp3LrpFw==
X-Received: by 2002:a05:600c:45cd:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-43e94a3bccdmr158907875e9.18.1743606470834;
        Wed, 02 Apr 2025 08:07:50 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97904b7sm35787975e9.1.2025.04.02.08.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:07:49 -0700 (PDT)
Message-ID: <a262bc35-4a99-4764-b825-4bd3a602b265@linaro.org>
Date: Wed, 2 Apr 2025 16:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] mtd: spinand: Use more specific naming for the
 (quad output) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-10-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-10-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080752_586078_ACA16119 
X-CRM114-Status: UNSURE (   5.13  )
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

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
