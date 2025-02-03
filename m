Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B39C02193
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2025 07:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=Yn4ggTosxkrh15
	rwP0IML6l6xWsMjFceBxWSOvwFnyEit38QsQHTrMmlypBS8D6tNJ5ibPNs1xukX17Yqhan+fvbMC0
	rePYPrergKXw0m4F1t3miZqucBinZGqaDmfDFCWwOXlnzedz17hQ8xTWmM0ErOpnG7wMYLIOVHDuj
	P020HL0SDKmjFAk7TtHtj7KMcLNwIPiyn1OnkTPVcKlCm23laeM30prbl9qzxnN6W+6p+zBnWLWXO
	05vLZZZPU79JQ1WICIS6ASsEo0S1HkdG4JHjnxkM/+MughBp3I9L76GzoXPmTQE/EpKtiPD0QJi4y
	DAJ8yfnOJZF8139UljQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teqct-0000000EhN5-3a1i;
	Mon, 03 Feb 2025 07:12:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teqcp-0000000EhMm-3uoB
	for linux-mtd@lists.infradead.org;
	Mon, 03 Feb 2025 07:12:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43622267b2eso40474995e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 02 Feb 2025 23:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1738566725; x=1739171525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=k/4/kXg3qRLzfQ4h8BSd+gk2lhguqZlauOZhVF3UE9oTi5puoNfVJsbN0YUvuyhQI3
         fE6cUqanuY/rFw2jC92R2863pDBZWEbwJii98/jPlO56d2dJW2HHlc6x9W6eWq2UZdXK
         YVdVD84TyR3r/NqdDtgKcLFlDk7Vkglb1k1+i1hZpca2kA5bAYWmifqzftqOrtWunH4p
         G+RS9T1QWutPZ0cUewxKRQw7A+WcFri96nReSPUKslrWUlSDPIKFPSR/VmUqMH/B6Hed
         7vo+8w/lvjmvGxLf7tQYais19qLW5I8w3M1YhXZLxB4LDJ6fxuqVFdM5o/21Cghq8duB
         sVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738566725; x=1739171525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=AJvEdbcHA9kArucVqMD5jY6n5i/XGJIhfbL5qBXKz2a2aLsGTPMxI1IOGiK9BoxvPX
         CuTdsBet/kU7wnYg0nvWoLQGxWcxwAIWfVvXbJuWOVeNZhA9p0BEHvQnSMtCrZmtmqBO
         xv+d/Ee/9+T5BakcEPYqA0jBC9ngzAN2v1a6lEAISi7q8+HsIglq353SMeRit/LU9i/N
         7K3zClPMKksdjV9C8FOtoMm6MuksD5+NEaVZGGnXYf1yD8MuzTotYe/O66oKXhuJHSem
         wtujrE4Ag5tjnzu1sE09oqOHZy6BxaeX3G5Wj97aWuv7VZgsUw7ecygUlUEuyprCc1C9
         G9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVeblMsFmDP+f4Cn5qAHGgKhQmfjJ0/aHd73TEqhPHOGwRmANrknJ8olkegVeBxmMAnGdUkwYhpTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwM1P5HRYNUIL2R6TPjC0hAJoC0vCN+6YwNAGxOfcQKGx/1yuAk
	MWU7QLmx0rdR31v56KbE20i2T6sJoj3Zzq5sM5mYct4eZzCkXAQCO5gMJWg1RGk=
X-Gm-Gg: ASbGncsWxWV9BkVEUDqke0qdfjLm1JMGYOFnryRzqczBfV/VFQIMUSDPoO0Hk0ti0iL
	0HNn8rsry4xTXYJkOrbYvwiuK/I+GgeEy4fRCdNxcShskw0tzdQTaB+vAzS87ZFIwq9CRNzK8zD
	Url7p0+RjswMkGMR6+6c4wQrmV+isu7zFlqxY/J3CHwvm8ioAIV/ay4RJbhMHy/V/1tKDJXU3IS
	3bXe9+JQoc+sUYTg0E3cWrkZmcKz4Zb7q+uWVjZ4hwGYrAtneBdvGZYUwMLwc0M0qFVU88PWXdE
	qENyIr5nYEkDQmFyR2D3cRJnjcgiwYf7Q3q5Aw==
X-Google-Smtp-Source: AGHT+IEI9/Fw1paznP0VuEEFV1LBa3QnG9g/SdJt2HZWJpeqxFzL7pu7wdE7xtummi7QLHV5k0Oa7Q==
X-Received: by 2002:a05:600c:3b23:b0:436:f960:3428 with SMTP id 5b1f17b1804b1-438dc42ff3cmr180673945e9.29.1738566725298;
        Sun, 02 Feb 2025 23:12:05 -0800 (PST)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b578dsm12028717f8f.64.2025.02.02.23.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 23:12:04 -0800 (PST)
Message-ID: <309e2dc9-80c6-448d-8b24-71fb62d98ade@sigma-star.at>
Date: Mon, 3 Feb 2025 08:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils 0/7] Fix some compiling warnings and update
 source files from latest linux kernel
To: Zhihao Cheng <chengzhihao1@huawei.com>, richard@nod.at
Cc: yangerkun@huawei.com, linux-mtd@lists.infradead.org
References: <20250126064203.3348494-1-chengzhihao1@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20250126064203.3348494-1-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_231208_271788_435F086A 
X-CRM114-Status: UNSURE (   4.08  )
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
