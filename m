Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B4CC28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9DDp6xZvLTu+JEay4DNvX3gdPUgNbdezUUdR4f0DZM=; b=HrVBMgS7i4lHsW
	G2rwG2emJCw5f5Tx6I3dymXsAicICRUg2LM/QHsFaTLLrk5xj2cIbkpddsQQWNG50877Tt4dxmSuL
	n9rO77rHsB5waS2tnsxeZnHfiheUTHTzPeb6zmyCwGxRH7YbJANWoGgWHJx1RNnlgB4Y+qMfXYF39
	/Kd7/nLEK0B+iKqpWCSK1Ckd5jWLS0HinUGCiv590xYN+14PCQBpNCeBPsK3eIKdq6L+Fx1mjMEOj
	18XoL4O4ljtKzhbVQXeOtpQbC9LE0WgnkqyFfLDLOodeHjbrdXivi6MqDiBGwmyOvE7sG6dnXHEhB
	GIauI8DMPmk3PjL+/kog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhk-00000006TIS-15JI;
	Wed, 02 Apr 2025 15:08:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhi-00000006THg-0Ob1
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:08:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43690d4605dso47324125e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606513; x=1744211313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=z7nmhA2p3J4owBvyVxxS7SZbQluaWspvsy+Lv0AA9vC1Ku24od8plSVSIEefEFaDmA
         fI4w5BzJaUWKeACQx6W1i6cKoveoDEj9jnDMQfOIiuVKPP602ohW7UmdNCDqVs39Q/z+
         Zs+mNzR23xmSylsyOyiyUT2N6DkIMvq6ui3Dwh0in0Y5A/71MzTpB02w0HoPOgxZU4cA
         jTxoOsGv1s3XDeZDMkLbUfwYP1XECWXqOZEK+NA1B5a520OpFnmZibh5aLGiOg5YKM0t
         cu16uuV5NaGg6S6YWMssY1QLNlZdpOE18KRHb4q2Zy756EZVomd14QPTJHT7MkafZMZO
         4j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606513; x=1744211313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=XeL//W7OWkoqmNkGZkqujNT6ROIpcqVSJe5r1BMvzTYDgem/WxWB1dc7XZDI4kPNOX
         Klrnx2MZMAyZnfFns8avQB/QrIoMO/BdDH3ysFBZNp7igXZVo3pnBBVhnGlx3NFviiXz
         jDnAchpCQwH6jHnIe1L7f0n1V9/PWSmRPKIKmuHsCrBBqCDWf9gBkefjyR3Qis3sU3aR
         lQXtAi1I9wDOoRXhBqT5Gg0RxxO5OxImAax72uDZpvVNSVxGeU7vfU6dOV5uTOtELH2M
         aazhq7VWAJA8ToM9rNg25s9OKF8cZw4qtHE+kkr84er2alIzXS+NUm+FCuvF3NA+Qmud
         ubYA==
X-Forwarded-Encrypted: i=1; AJvYcCUt1gveSg7i9NBnZFk+cggh0PNvf8zbEKQNMCMTF8ipIFgxDCHCZtHq46DWjfPD/+fX/tvVdI19Uqs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0sio76B3rDy8d+owrFGtQjQsgun22/Nn4MVacvXw1Fb1Ukk5o
	lKzltKx3BvXnvmv4wkRpSsj2gZe94ayR/pFLFcJ8EeXFy1VZc1B12G0pnDd9h+E=
X-Gm-Gg: ASbGncspnMOPnchF9F54lJh0zgzNP7/fPqQy1g60IMO80v2pdWX/INzy95/ticDDu9R
	xw3OLl43SlQAeXmU+A9OuXejTo1zA4QvN1RfGcrviqJ9mOqpJpuesuY8/qhOIORp2UEFdTJppLF
	HUEV7j2XEdHxcxNQ8RW3qyB7TRxwDQ4BVYDwfBCzj/yWalJtCYFTuE5xLn83plF35eerryrOGf1
	hihBCLi1KVM1rcXSbg2giykHtjFvynK9PkT0uvngkp8j2Iiqo7aSitC8AnVK7ikLrO7v4q0bNBg
	RLYUA/8H4LZ8sbI0Rh90FV5iYKtrmCgSEm6/ADCY3/pKXPylZ0WmrQ==
X-Google-Smtp-Source: AGHT+IHewcwryKZGUim+bc4+gDwso6yocdf3w3vafyj0dLW37f8TS9sGPVOsSTSvWJrzTYzQ7IzeMA==
X-Received: by 2002:a05:600c:4747:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43db62b71abmr131366815e9.19.1743606512759;
        Wed, 02 Apr 2025 08:08:32 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc59c0sm24292535e9.2.2025.04.02.08.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:08:32 -0700 (PDT)
Message-ID: <97639641-03f0-4d9a-a5c6-73ef264ba35e@linaro.org>
Date: Wed, 2 Apr 2025 16:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] mtd: spinand: Use more specific naming for the
 (quad IO) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-11-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-11-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080834_125480_95C10BD1 
X-CRM114-Status: UNSURE (   5.31  )
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
