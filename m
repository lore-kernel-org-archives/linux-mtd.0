Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB83CC54E5D
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNgFObgDCxGAHpvzBAaz0PZz2cWqKt6VJqFdgqqVnTM=; b=cqnPmRUruuqu3w
	G/cNXGuJUktQUoIhtx7Q/Iw6znqiO7vcumvyp+EzpRAiMkbiOP3bWqr19sB/4j3yuT8yNGxt0ndhW
	ljorKn1WXIQLLWN9EfnWNObkQ0ioxbhKhadIjUTy7m9HL46z6Zf2ll8L90OKr1+mUvQqZYK6pdTO+
	3UT6HEBIuFpkwmZ3BDUwZhNBDlDWIqjOArzb43EwolwmTlqZht48h9O6cvdnYBYMNtSjMkESdjq6/
	evWFcwVhAHRhhkzHHfdEDlfjCL37uByvi4TehOYrdFvvf684x/w22TVyfLv8iGCLxDte2Sai4iHyf
	1N3RfaObrpSwgdkdQqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmW7k-0000000CAXT-2s7C;
	Tue, 19 Mar 2024 09:51:12 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmW7f-0000000CAUK-04oh
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 09:51:08 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a450bedffdfso645183966b.3
        for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2024 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710841864; x=1711446664; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=88XzjhFNhn70mBpqUdKgpf7ppYNiFhAhyQuqQQPS+u8=;
        b=vI4X2fIYF7Gsr0igHFXOLvwJKfcoPevgXeJpu4WwrV75vg59iitXP65rPQV+Qz9DfU
         mePNW3fGT1BiU6WQ27p2i2PIvOMFvJ/2GlGrPqKr5x0mkHRQkyxxcv2rm/P9e/MLgDnt
         dBxG9yAaWM2heaKxAN54eCUucTAB5xgfkjDDpYul6rAkcHX89OHDpUl+CfHcFJILiuRk
         efLacMBmrLKRaKkJvTJWxJZiIJ6Pr3YCXsWoWcrUkWBCq45bFwUjrMuUsVCbVT9ubJhd
         Vf6BPXYAVGHXQ5czbmiuUXFeTpFrSWZJ8Otxb+IRx6K6CMZ7+0mzEatDLu0LHmC5eARR
         /6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710841864; x=1711446664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88XzjhFNhn70mBpqUdKgpf7ppYNiFhAhyQuqQQPS+u8=;
        b=WdHH8ZjaT9ew1wnaUGeHSOCko5BfpzbvAe13PyCaWppRXxN9GlJKNmyA7cR9RT0Zu7
         PpN4Ekg19I6rnTLkLJBcKGay+VzEy4KDNvHxUiEHC8ZCzE56Vjt9dZRzgYbVHq+n4mjr
         bAaNkVa99LkRos0uTypL2AOwboUr1+2s61NrP1FMHEfZa7m/SxNxQn/gF1o+56vi6lST
         KKxxUd73ZTZekNeAjFF+UaN5umBL8TKIXftkw6fRfHDIMmpYzitykD9TOhQ4ttSfZU4o
         Ep2X0RB4gkN7aZ0TSv9TCahLuVjFdRqsLTolEAstXRZI8FeGhxzoKc+8rWPsu/fF3BuD
         2ihQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEVPvmfNW8H/vq6hOdQrSqYBv0PYPBNdLu2/b1f5cbDfInf5Wgg/ZNOHaWhr6kAMvT9tApPjyFItD9L6uUtpzJXxj8zN+JdFnDOiWBeA==
X-Gm-Message-State: AOJu0YzmpsSJ4d6qkYPpHPLXefRTOakl/zS1cGnicClWEn2ShtCVoN69
	zmtk4Xj21ZiI24qSzoKZhrqdRJz0c8vH+BQNN39BDG/rxt+7YzZNrZ7Cfypgwpk=
X-Google-Smtp-Source: AGHT+IGMWUF80taYTEDTOvULqZp7oGhfy7/aDj3puVhQ4h04RejN43TJV4t5HfEmZUlTmjGVjWE83Q==
X-Received: by 2002:a17:906:1b15:b0:a46:cc49:2fd8 with SMTP id o21-20020a1709061b1500b00a46cc492fd8mr2387192ejg.67.1710841863797;
        Tue, 19 Mar 2024 02:51:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id dk16-20020a170907941000b00a469f043d7fsm4005091ejc.41.2024.03.19.02.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 02:51:03 -0700 (PDT)
Message-ID: <4e3fbff7-6edc-4196-bc72-1095f14d0dfa@linaro.org>
Date: Tue, 19 Mar 2024 10:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mtd: Replace module_init with subsys_initcall
To: Manojkiran Eda <manojkiran.eda@gmail.com>, patrick.rudolph@9elements.com,
 chiawei_wang@aspeedtech.com, ryan_chen@aspeedtech.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 jk@codeconstruct.com.au, openbmc@lists.ozlabs.org
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
 <20240319093405.39833-3-manojkiran.eda@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240319093405.39833-3-manojkiran.eda@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_025107_138293_34080EF2 
X-CRM114-Status: UNSURE (   8.27  )
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

On 19/03/2024 10:34, Manojkiran Eda wrote:
> While engaged in development on the espi kernel device driver[1],
> I noticed that the espi flash driver, utilizing the mtd subsystem,
> appears to initialize before the mtdcore subsystem registers the

NAK

You incorrectly ordered your call, so now to fix this you incorrectly
re-order rest of kernel. No. Fix your code to handle modules, probe
deferrals and device links.



Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
