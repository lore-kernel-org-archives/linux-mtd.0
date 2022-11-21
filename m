Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608CBC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=nFhYh40/zJHfkC
	TcbvzbCHqObS1fZg1zVh5OtLJqsvEAxcBAdQYqnhnJEk1svr9+jNlhE+dVVZqlvnto0VLYZ6IWO1w
	dSEmurS8rOI6p2uzTKNamj4lzO0h2KftF0jTPotxQr33lcsswuL5grpIB5ZViodjkwQZbSFhJ/IuH
	bAr2+wEW5WkzmvtrZP8NZOI1gZEHk7kUquR7Q1KkAXds6rsMxVRdxC2XxE3fJNnFldgICwYGyecdJ
	KSzCFAQGUeWzgh9qE3FilL03/5mveTVADrRo1KaQD/hgFfS/Us37dZqj4hV4A2a9wUckSkIgMEN9b
	7T1ZlcTVNM2i+8Hme8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1NQ-00ASZE-G1; Mon, 21 Nov 2022 07:38:00 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1NN-00ASSM-9g
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 07:37:58 +0000
Received: by mail-ed1-x533.google.com with SMTP id z18so14987561edb.9
        for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2022 23:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=DL8uvGJR9MbU/ZrfypPndwBAFl/Mp80jgWhI7o7pwo4TYfax3ENiTFY79F62OBvPsh
         0IxhJZ6AOyOs7PfwR3ln4LGgLzw/ShjfyF/h43LZ+W/rggWEcBKj3gUw5k+3m/le3j6x
         iisEmB3NrALcNgkKOwNw+ftWT+CO264hetX1O14Tu9mvQbu/nl4N0AAx1IBYJZvvbHmY
         xZ0q3ynNLmYTU6t3jxzNKKDcl0VIsknFZz7Gu5rLilC/YUjCQqP2V3iwZt+yTulQ1fv7
         aMNRrKn2MmrBtOMXrfREf0qiHjh44JJq4sc0ZdtnhJUYsvRtXrbaxhEqs3u13+KqfUBI
         SgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=B2aRg5uOzeTGefxXMx6HLfcc0P4IawtM9Y9mAsS7V9uUCTDIpdTDTn59hif9FPnuQd
         FL6lGD6002VgDX+jjgl7HVNpyGW/AYnQFEXKItb2I9MbTTdnNJwfGmlf4tITU7M/Q/8d
         ncBJoed3lhwf+IicJcEE+oVi1t7H4N95dLWanS5AlxoqG8+LCC1LDXxwdYBGM3XwetqK
         8Uf6Vea6P5SFMBMlNiKAsYG0hfLFLcYcuGYkT4LPohpv77eSGZIzt/fNDlUcJQ53/Hix
         L5mCl/4OP2HPHPrU0BacaXtKMdRDCUIzfGHU3QvD9M1K4D+gaQLkNzkBjuBE20OZNKQ4
         Ttnw==
X-Gm-Message-State: ANoB5pn5gtKjxOiz06Ujxpnozg97YxMK6atIkvusJa4LYwVSAL9faqMe
	n/qvv//qVeNnDQcBmkymDWph0A==
X-Google-Smtp-Source: AA0mqf6REKXEojLFd8D3ZfgZ6PIywQgJvvFdJBnSFMEFl7wJ8W3RcOajMtGKxAYj1ly6YGW6tB2p0Q==
X-Received: by 2002:a05:6402:142:b0:461:7fe6:9ea7 with SMTP id s2-20020a056402014200b004617fe69ea7mr14875062edu.94.1669016270784;
        Sun, 20 Nov 2022 23:37:50 -0800 (PST)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id hf12-20020a1709072c4c00b007ae38d837c5sm4739247ejc.174.2022.11.20.23.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 23:37:50 -0800 (PST)
Message-ID: <c3a9add5-673a-2d86-f46b-7720c56c41fc@sigma-star.at>
Date: Mon, 21 Nov 2022 08:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/2] Measure read while write latency
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
References: <20221110155938.820334-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20221110155938.820334-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_233757_680324_F265DDE1 
X-CRM114-Status: UNSURE (   4.90  )
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
