Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1ABC6FA8E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVXKC7cG+FiVrck1W9JC/wrz2ibUJ2kcoTIMMwgVbmI=; b=wwHI0h+CXfXa58
	Ht9aD6LjCl1UUcxzpZ5uek84AGSnb49tENIkzEJ4fQI8edYTfyxB8r3B/RaoON7ZrbSM61rhnvSyq
	rN8Dr5g0drkCAbSfPxvvcgeiqZ3r4Rcfs63ntqX0YAUTMqMXsAxMnEG85y+gYllVXTM7crrS3tLns
	uuvttOTDhLe1pPHmmFrlJ4wN5mB6RJzM9pBhXZZHqSTilsezeQTj6whPdw3WvBgdgVaFSHSwKEvhs
	edHGrBqX//SsA+Eu+z1ta5bd27Gu+UWEuQMXmP5Qjrb/RB7hzys8vVFi80AKZPdal+5aeMRvsRXf+
	/0n+QqEE08HHejecckIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXjLI-002NZt-52; Thu, 02 Mar 2023 13:51:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXjLD-002NZB-TT
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 13:51:29 +0000
Received: by mail-ed1-x534.google.com with SMTP id u9so18374966edd.2
        for <linux-mtd@lists.infradead.org>; Thu, 02 Mar 2023 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677765086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnADaZ42PCk5XVOKhQIx39i542/UWE0EI7texPzde58=;
        b=n+eFBruyxjVrrY3EtqvjnrMBa6Psut3+hFmER/wE8wyj+21suQ69RuhM7tTAhDDuTH
         YLHxLe29wEHnh5z/qiRFmmtvym/A99ovHOY6FxdJfKJelEN5n21O5i9lO7rLca9Xp4FI
         oWLPwKXkUtnzzdN4CAmMqdPsyCTUoFgzjF0w8tcfeConyDJjHH5lQ9SHD9eBzLmUAuan
         cEKKFEFVBALMVgXs+2NxZk7PVw7+W1RH6ulRVCJx7OX0N8erJehOxNRM0FVMKr531e0Z
         Pc6xTcuDlrnPKWA6knavBd1WEJ8m1z9cZ1XrLyU0+kz0gCKNzjDoZdSGQm410nAT//0r
         dWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677765086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnADaZ42PCk5XVOKhQIx39i542/UWE0EI7texPzde58=;
        b=ZT+6gLLaSMYFgV+4TqD+Atauo74XYh68UQncVQsIg4t+tJroISs7HGjuVVvIHSKlDp
         5kwMOHF58nTZzG7iuBLdIdKhHWhwy5b+7lLale8AJ1nCwaK/2uHfzfcWOFZMtVohYMeM
         fPKTrO40MfZ1r1c115ltM9YE8p31Y8NLBzK0xij1ZOKaRSo7/Et2l59HuizdfX2D8ikD
         xXnbExoSQtrcEmHDX68Q5HQorKMdSllWpsThcr3vDsvkszj8FIukG47bdf3EY1WPGN5G
         fFXLoatJYm5KQ9Ovrd/fbDcvIz0Ov62kgcDnt0Hp5W8OZCFhfeO3Q1PBEZRq9UDhNiLt
         exVA==
X-Gm-Message-State: AO0yUKWAXDvagQcs3KhOECKvAgZAifCL/psegtLlRzvOHsfRHHCYRyZ5
	W+F6+HQA1KTWEqJSxdFWH36l4RTxaiUb5A6luA8=
X-Google-Smtp-Source: AK7set+pm+OWEBcxTuZAPv9Sr64u4Q0QHNTt5eSQEd8/GrpPNOmeSaZ30zxSKokFxIdB0CX1h0D9+Q==
X-Received: by 2002:a17:907:2bc2:b0:87f:546d:7cb4 with SMTP id gv2-20020a1709072bc200b0087f546d7cb4mr10505324ejc.64.1677765086187;
        Thu, 02 Mar 2023 05:51:26 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id ku13-20020a170907788d00b008e724dfc44bsm7125957ejc.78.2023.03.02.05.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 05:51:25 -0800 (PST)
Message-ID: <68e2a123-75ef-dea8-0ec2-44fd684ce811@linaro.org>
Date: Thu, 2 Mar 2023 13:51:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: spansion: Add support for Infineon
 S25FS256T
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, pratyush@kernel.org, michael@walle.cc,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_055127_995360_DAD860E0 
X-CRM114-Status: UNSURE (   6.23  )
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

The series is looking good, I'll queue it once -rc1 is out.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
