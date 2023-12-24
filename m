Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA2EC46CD2
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Dec 2023 20:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQzWEGcvt8XHOA8/hmjQVM29zziPNE/ALN2EKB3uE+0=; b=xFpu5tyKD1gReo
	4J7gwr/00sGO9tOugwMXYSgGmsuN+lQO9nhKahQS+nWSDswGbBdsJSetKLx6JnndT/p3NUAHH+CXQ
	aekoDQLtgWKnIlLwh/aPP6oucNk2cXGtK60So7s3+GsdgqEgT0DZoOsmC0le3CloTAKQnNQuwy95q
	UuDClEi3mQkPT+TshYhwdB5zJ7ebDbbqTQpQn3tJk0Rdc1We5FDHuKQ9ka2sO92k8fUdzobJEcSRE
	xMmBWt5mY8CAYFhpEU7IUWrbTg752C5sgLp5Vz7ice7Vsk0gtL0ptf45DLm5Dw/jky3x8U4NEq9Y1
	tUfXB+xxvo9wBTwZI7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHUvM-009qf5-1h;
	Sun, 24 Dec 2023 20:18:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHUvI-009qeg-22
	for linux-mtd@lists.infradead.org;
	Sun, 24 Dec 2023 20:18:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40d53297996so10822275e9.2
        for <linux-mtd@lists.infradead.org>; Sun, 24 Dec 2023 12:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1703449085; x=1704053885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5teAGkE02BEQqTOzepCPiM1sP5VO75Go9gPJiGEVbbg=;
        b=Q9aThzlDUU3JsO6KYS+zYp9kTyxXhnS82jlkhuLuiySQI7SCdbY3iHn3k1ovpYYE+C
         QWKCVbNZD3JvRt4bzWecq1xB/JoQwbyP6Na1OIAncDKu1XTpw+GehlrFH4H35J07pKdv
         MZPhg7pt6y4BngpBOdrteTIqfcP0MYVNWT8/QvaUuvO2x9q3Ywj9ZBPC4zjgZVZWZpQ0
         tnVFmkcBtK2/Cj8fyXbUe+dfeHEVg0QRAXkZqGj194cJ1/JHuN8tNXyvaIyF9pXbFBTd
         kShT8cpZkJwfw+0pNUFxGMCSUNY7wAqmHVYldOuWYa9sS4FEZNJ3BcA6dnGfGeoCV/PU
         FePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703449085; x=1704053885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5teAGkE02BEQqTOzepCPiM1sP5VO75Go9gPJiGEVbbg=;
        b=GINp+NBCOii8qtxM3Njm3C4E+w4id8L3SYANrhhIokaImC3q7EkriR9bd5zMBXu7RE
         slEfWWLHmjvz6yLP5JIB3NdbuhpXjZGLbuwo3qekTp85d89UEDobl3UN7k9o5WlD37fC
         9wdYDO2I5C1NSQzxFYxsrOS3mv8SJtX9bC3s1ijgxywu4B9aqphLUElNETpMmHcJCj/t
         AACN9aP0u6Mja3Kda6Zwk3hEXCOnQes+X4KPSXpukxSthO+2tbhVStLCc2qlubb7a033
         OAA89RZlY8t4ooAd0ra14YapHxuBcoX2EUSys8zucmk4UFU1QOhgS0xgyK9A4QvmH2Y7
         XYNw==
X-Gm-Message-State: AOJu0Yy+nOBS0WLudJJZC6Wc0F4fpoRDnUZ6gkdtQGzzeiE2BNq4f8y2
	lRE5v/AKOa+ewo0d6Dt2p8ma1sMtBdqpUj9p//gtO8wOa+E=
X-Google-Smtp-Source: AGHT+IEn3nBx5c0uRX0q6MoFuI4pkr2t2/h9epJ5pykkfAUcYp8nP/LXo1kkXDbOyC0xoEunVnwffw==
X-Received: by 2002:a05:600c:198c:b0:40d:40e5:4b0c with SMTP id t12-20020a05600c198c00b0040d40e54b0cmr2684597wmq.134.1703449084464;
        Sun, 24 Dec 2023 12:18:04 -0800 (PST)
Received: from ?IPV6:2a05:1141:1f8:1c00:a804:36d8:8d9c:f8a? ([2a05:1141:1f8:1c00:a804:36d8:8d9c:f8a])
        by smtp.gmail.com with ESMTPSA id ey6-20020a1709070b8600b00a26abdff0ebsm3638004ejc.142.2023.12.24.12.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Dec 2023 12:18:04 -0800 (PST)
Message-ID: <6ae5b13b-f7c5-48e2-95ce-e12683ac6b83@sigma-star.at>
Date: Sun, 24 Dec 2023 21:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mkfs.ubifs: fix xattr scanning for builds with selinux
 support
Content-Language: en-US
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, Zhihao Cheng <chengzhihao1@huawei.com>
References: <20231215114824.15236-1-goliath@infraroot.at>
 <a301483d-2d63-4335-cc63-3b31d05e2988@huawei.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Autocrypt: addr=david.oberhollenzer@sigma-star.at; keydata=
 xsBNBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d/nSCZ+FG
 FX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N8aL7YNF7VfjTRntB
 tKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6/N7b/cFH9+fx8kwi4pNFuJwr
 BkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258jnN65jBO7ElqU2CCuGRPg6uryAHV3RVCB
 9j9AE3HLacQReFtt5ylyydSQbaK4K9asnd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEB
 AAHNN0RhdmlkIE9iZXJob2xsZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rh
 ci5hdD7CwHcEEwEIACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXc
 PHQaAtFuEAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
 5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQbxkP1YWzo
 Vwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU/o3dT23NDeQ20jXg
 quJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+hPK/Dmdsqgns+Z+SrQcOvRa3
 GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8XqwOnfVmZdCW3qGKmLbn6qMEdM7ATQRW
 cn9GAQgAvugF8cFjv2Zs4BBb44SnxGawBySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr
 +TRnXIzcb5xI8SxitBDU5MLvwsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGP
 ak8JmjMMtOoOBh4meOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUa
 h7wajcojYSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
 FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawARAQABwsBf
 BBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt3ao3Abpu2fqYfwbI
 yPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEjviKMpfI7ppTUBuGKrpgc5xsi
 UpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8rBKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fm
 qoVHaw8PhLAtez+B7HS7Hv7iJPDtX85kFYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR
 7In6ift5SNySojCOfAV0iKZb8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDT
 qyUpot0oG03vtSG4LIRCdxI=
In-Reply-To: <a301483d-2d63-4335-cc63-3b31d05e2988@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_121808_995198_BD4BB87A 
X-CRM114-Status: UNSURE (   3.18  )
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

applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
