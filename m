Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A58C197A0
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HyOk1LeyxQFlb84A73jWZA9AjtsCw86Nkq7i51/Bgw=; b=WU3RuSxA501mZ8
	ohZgEYqc4qrUJcOWDqUVe/LqOnOZdK1Db7A2hKW5kyfwFQo4pqhgR5Htc9d1Z0ZBYeyyMPi+C2W1m
	Rlqex1Ox0vctu4OVAeENiMIH2vzvQbqW4uBQUfQvaCSkFNO3xDIB3xw2LJYkr6vn5EW9A2vmq4OeH
	DOD1jAAdUQ5nRySNiDFrnO4YgWdANqG1SUCRYlWRNUN1hyAK/ism+fAT8OU9qriUpc3wR2mK/PZIQ
	qbZP5fUz8ysZiz5vF+lZM15drHxeS8UMr5pYeBa17AiCV5/fPBvvHJ9KvtE7JbSWWzmLf52ibW04U
	iaVlIR4W999x4sSEKc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3v4M-0063YS-2v;
	Fri, 17 Nov 2023 09:23:22 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3v4J-0063Xz-2C
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 09:23:20 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53dd752685fso2549982a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 01:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700212997; x=1700817797; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFqQmOBEAr4RkmlEF6xfFKYJ9x/EkaJrijPgCQml7Tw=;
        b=RcQqohW4JLi/R0g/GMOZZioBRkSWeEk0dc8q5BTDM9M4AGrp7wDHvtpBeQMB6c2lSd
         o0xlc7jkSMaaq9CU4BoHxIGmDrSMOJNf9WyF310hpc95GeXHCSU9IbnJctRPRq+i3ahv
         hE2UMn/8wMud2UK4DbIXbDpk1upXf66VPrksa9m6ts0gkwD/acD7UPPYICCWfMFB4FIA
         nfth6wNCtRQY8a5VChypF59HgRl0OaBVFqkZIDaKKndcPscgOyYIhwcxv2on/TLOiWAN
         4DQPfTi14NNQEBPJfEgASzPLlDdV2Hb7OvmFgL/OVkzMT1MqWg/0BpkPw5QBJXJHxor8
         AVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212997; x=1700817797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFqQmOBEAr4RkmlEF6xfFKYJ9x/EkaJrijPgCQml7Tw=;
        b=Z7sNJUh77sO+jOZToynupVAcBcZoFuodfnb6Ir3OpeZCSg5l7iXeKS8pE9w/kPaHGo
         HzDExC3UcyYQGIz0UNvxWna8z0koRmeM3xgid6qQi/svHE6pmJpa9uBqK9ElyAsRkw1Y
         PL/Wxw+mxWbHHS0RCjR/+ye+1Ch2An8mFcnAuX6sguPiJvu7Awmz7h89kQGA4/fAfa9u
         R9z2GbrrQy2tNIr2RblDNdmC0xnfMYjYAI9L7h36oi4U/iCRGwsiPoYgpoFUT3Rh0Oe6
         TDhaSTjSTNyW2MdPE9eWadYknMnKrF4SUMiVECEGDCjKdtzVjsMmDkYW3igBdeHErl22
         z8Pw==
X-Gm-Message-State: AOJu0YzB6BO/CmuwBRGK44Wr+UGfea6C7NQEkw6x+RlpW0r4w5hIh2C6
	p9neLE1a/NDYFO3E8WqeE+jFOQ==
X-Google-Smtp-Source: AGHT+IG6BMUBZ0IGaHBJnMAlSc1xrNeOtJmXTo2RUiGqb5lgeNfIqJMUPeeuONex8OnXhKukZK731A==
X-Received: by 2002:aa7:cf19:0:b0:547:5251:f2bc with SMTP id a25-20020aa7cf19000000b005475251f2bcmr11794099edy.21.1700212997393;
        Fri, 17 Nov 2023 01:23:17 -0800 (PST)
Received: from [192.168.1.111] ([37.251.220.47])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b00530a9488623sm530250edy.46.2023.11.17.01.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 01:23:17 -0800 (PST)
Message-ID: <876c17aa-d328-4374-896a-a13cbc28a6e2@linaro.org>
Date: Fri, 17 Nov 2023 09:23:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: add support for Macronix Octal flash
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-7-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231117083853.33329-7-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_012319_724493_B3F79B83 
X-CRM114-Status: UNSURE (   4.58  )
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



On 11/17/23 08:38, Jaime Liao wrote:
> Adding Macronix Octal flash for Octal DTR support.

Do all these flashes swap bytes on a 16bit boundary?
Do all these flashes correctly set BFPT_DWORD18_BYTE_ORDER_SWAPPED?

same questions on the previous patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
