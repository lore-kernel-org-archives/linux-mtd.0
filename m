Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB5EC7618E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Apr 2023 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=CXABbdgZ/c59ok
	JM8GTHaNHKa4M0Y9M/aavP540rx8PzHfIDavGUWyp45SQfoxaAb5fAWKESPy/osp0JvemhOKTliCU
	nRMJXFluL6z7PhWkj820bGOXURQDC75hF4kR2d9txKsW85allnXWQyXBF6XrtSnHMBZG+maV0Fj9d
	JKzx9oYGKKkdMtiRdoG4evnljMcnEmd9RKtifDxWg/4/xl1F+NZMzVC49KYCgoY4AAE0FBswHDDHd
	rKozCrcMQa6r51oJA3DI4CA15/JROs1kikWp+dYuhZeDeIgLparPby7awVrFtvH+vFvWMhDEWhkFf
	drMkDHlRQG3tKwUhAUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqFG-00FX99-0n;
	Mon, 24 Apr 2023 07:04:18 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqFD-00FX75-0a
	for linux-mtd@lists.infradead.org;
	Mon, 24 Apr 2023 07:04:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94f1a6e66c9so717664466b.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Apr 2023 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1682319852; x=1684911852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=KxQfiX9Zg7YzTAvnf9iFHy4MA9CSh+6LUhdvWFRKXFqw6fhFILuZJ3KRC6TlwdZSGa
         DUJOHX9aCRXIjRxmtx9sJxJlmzaWONqTCnv181r9L+wivC5tSUbgA+xiIZn4T7EW4/qz
         VzexBXL3PkeHHUsqASAw4w+Qk91IUOE7LTwEBXQmDhX4RjPCZ6CmSbMrh+T3wNKOmQ8q
         +wUVtIdq+351tASc+sy+8Oc6rrxD7dgn34kSs3KYQjFxLl+sRUhQ5ps+u43P/GIUqy7A
         mM4fQsVEspkDou/+Pq63QKJVAxXgkUv7NaJbcSiLwn2No8r2sFnL1bxHLvaS3JFMJ05H
         FNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682319852; x=1684911852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=DshS287IpZeC9it8PJv/9RaoBichCUBYqyZbzq6GCMAGWFDlBRmW8QMsBmwoufUuQl
         dCGDGnQ53ZmZRwsiapjOtrmzq0q+O2PBNDjt8s8Ny6Sy5pDDxgOvtZ1OAuL6al2n80Po
         mkDSx88O1+SV/FhQH+EGceiFT2xI1L1n2Tqp4KB9qGWumjGCIo5d34fGdTcexzrYLseV
         POQECwE6tuAl5xmIoQCqPjqvZihEsUMQwK8l0rAqAEhglF4a6WychoMz7/Idm6h+P9cg
         LRsqu+LAQsAp/ZKEmqlVTGoCNNjF0T6k9ahLWg3lf8J30k4xKiw7JWZz4Lcld73wujUT
         rAsA==
X-Gm-Message-State: AAQBX9d14z9lsZqvjI9LyHporw5LA7IQBscSfveGjI2WwNmQbPbC5FCP
	IOB342I+ciGBFcf14aE63wjxFg==
X-Google-Smtp-Source: AKy350a441sfK23JV9RXeQLqy3sKuWoRA8UXEdeEIdHLbG+o2WeBaNEklLo8geFNFgCX8Tt7ganqkg==
X-Received: by 2002:a17:906:4a99:b0:959:af74:4cf7 with SMTP id x25-20020a1709064a9900b00959af744cf7mr1198122eju.70.1682319852698;
        Mon, 24 Apr 2023 00:04:12 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id zu23-20020a17090708d700b0095807ab4b57sm2826513ejb.178.2023.04.24.00.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 00:04:12 -0700 (PDT)
Message-ID: <59bf7edf-ffb7-9663-d584-05c4eccdcafe@sigma-star.at>
Date: Mon, 24 Apr 2023 09:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] misc-utils: flashcp: correct casting for percent display
To: Zhihao Cheng <chengzhihao1@huawei.com>, cchoux <chou.cosmo@gmail.com>,
 linux-mtd@lists.infradead.org
Cc: cosmo.chou@quantatw.com
References: <20230422073115.3555981-1-chou.cosmo@gmail.com>
 <14dd246d-ef2b-2fd1-e874-a3ede1a6996c@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <14dd246d-ef2b-2fd1-e874-a3ede1a6996c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_000415_492031_A46E2F38 
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
