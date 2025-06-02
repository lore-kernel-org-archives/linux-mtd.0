Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051F1C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=qIEYg1zac5HPjz
	OXRfSbhYn02fS3TyTYh3wQCLx2Apb1a6h2iKbpUiVyetmEe7Y+IazWo1N4v9ZkpUa6o0Gpv17tweN
	jQGFMb0N6MY+Y26mJT/IuTUyXOvCjOX7HDBWT0Ar6jVHgUNmjBmDW+z7CkzBgQfIKTJQu15W384oR
	gKWypmvEfYzolqlLqJDRBzYwVCwHeHzvna25jrSbCgPzJoMVFuM/TMC+S2Gqkk2WAbnQoLEJA3EOF
	fpQiEcCGZk2UaEDMgvdEPRHXvepZlhhghzA3AY/Y3G7eBOYWkWoVKJr2wVFlOmTpnsRmyNpZdJ0nY
	VVxr/qeQAfV7TekNj+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxpA-00000006ksb-22fU;
	Mon, 02 Jun 2025 05:35:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxp6-00000006krD-2ILQ
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 05:35:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4fdc27c4aso848117f8f.3
        for <linux-mtd@lists.infradead.org>; Sun, 01 Jun 2025 22:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1748842498; x=1749447298; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=Tb7L11GwwmW+i+p4AeutGUaqA1Pxy8Styipaol2dMqzVPg43f9Eee4EPB9B0rcL7CF
         62dIyg1YlrnsIF/SyzqDv9pQO/aAk7IZ/fERrZzPHl7UXadBcQloklIBpaV+nWiuWvwP
         OW/ivzNDnzpsyaSqGAzQKsYhLyDk+7JFKH2FQkLSeXD62y21xC9gc3nZ38ZaE1ljCbDz
         mQIdeHymx5YFMtoUXDsUzbZBibuWuO37K4yaQWbQtgH6702/GH8c7QDP6eLrExeNqA9I
         OlwmtDmV4r8dCZGzFr5TNEJ+GanFAdqBoHNXmmVWdA5574LCcVFjLOOX5JkooBp30IRf
         5MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748842498; x=1749447298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=d/FDtN6DTH12Rlx8llRUYhzK/7NG4j6aykvtfl5nYWpGSGQPCv7hS5ajXq4noYIlvH
         +OIBCcAQ1ecBYxv5nopSUBg8r1pWTRMNDR6kymsd6Q7QuiuEn0ZyEhM3QP91x7NhLJwL
         2Z5cEHykNkzpU6X9bKNe9ML0d2Q36p/kuMoUhfAXibAS2Hzoj/9Ar1cPdX8ywe7OVYkH
         FsSu0fSlne5BzXDLo8UWW5hsqTFVnZJo70iLI6UYMujhtFhRP1h7Z5iDRVEJjTEcnbVL
         GSyayXde62RTQwADWggLSA1LNWzhhgKEF7fAxue2XILm5RQKAFrMEc5umQZvzqhaYvDK
         0nKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQpXvljmrIedTvP8jPk/fpn6Z21JdX6a3lrTpqJLUPhJm9SNnLBUL2Qo8srmZC7LQnhWx4Wy5gzEA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbg+N1dqIqmbuDSH/RzG4d2cC3QHVb22D5p3awy6Nkkv1897Fx
	iIqtGeye2+TWdONXWve91qDCBEgjfrDlgYNZ0ztvlRMnzUeSigSkyZIPC8jLQMnhKJw=
X-Gm-Gg: ASbGncsuWIw3nKcZpRX0KnvTctuFbEa7L40N24BNDiSTltj646IX593bT9bybti3Vqi
	hw9b3AFgULKjnGnWDJhLN9O6CXjeXvn+aVvfYTaMS7cw3EroRC8V1UF80FjTLFl1iartdU3ApeD
	wsMElXRGrpl/jxG+zY5cm14cca0c5huO7RQGLAnl8NXs+OmNBQsus9Y3AapefslbWFAMAaN6D4G
	WdSN38Nu9YY7GgK7xzLEj0pmJe7t10AOINvb5XzooLkNe7ph+ayMTaVJvqjCwRJ7vz1ApbDzk19
	O1WaUOTrGYO/jMlKvDvyLr+FZH2odz5pWS2TW1XbMs7ijd6TSnSVRb6mAvVw6tWT/xaLMQk1JQ=
	=
X-Google-Smtp-Source: AGHT+IEumKLf2vhxNlK4SOLwbDoPh/4j+EukKM54eJEL6gkMcDVyYC63ryIv7+6aDHcNaRy6ugxf4Q==
X-Received: by 2002:a05:6000:4014:b0:3a4:ec32:e4da with SMTP id ffacd0b85a97d-3a4f89bebfamr8489315f8f.15.1748842498079;
        Sun, 01 Jun 2025 22:34:58 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c91fsm13640308f8f.35.2025.06.01.22.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 22:34:57 -0700 (PDT)
Message-ID: <f883cf9b-a8e3-4019-b21e-878ff1688532@sigma-star.at>
Date: Mon, 2 Jun 2025 07:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubi-utils: ubirsvol: resize volume using all available
 free space
To: Zhihao Cheng <chengzhihao1@huawei.com>, KAMenyaev@salutedevices.com,
 linux-mtd@lists.infradead.org
Cc: sdfw_system_team@salutedevices.com
References: <20250524172639.1294040-1-KAMenyaev@salutedevices.com>
 <9dce98b5-9504-67f3-fae9-32af50fac722@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <9dce98b5-9504-67f3-fae9-32af50fac722@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223500_884029_50041F68 
X-CRM114-Status: UNSURE (   3.59  )
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
