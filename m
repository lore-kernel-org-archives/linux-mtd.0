Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EF8C6FA83
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 06:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeaRUkDM/wG6IQKb5JtA8+9KxHj40ZhOkE+LIGlcOOQ=; b=uSkoNIbycMJVI3vni40gZ9VBuI
	RtLYvBttNh4f/mfu5sfyq9Ii6icFwautS2Jxw2nucDLYhcMyn8K0yCXSz79K+S8O3Q4V5CXwmwxIk
	hLJw4u8eiL37U/fiPQbwMcc4uJcAjkHtzK7uRMlW5AzYisZcEPVRaRpwtKOiYGlqw8ie3Ci2urOFF
	1fGfncaWQ7bvoHl9Q9YWsUCDv+pX3Hd749cD2joCcgBHCC78u9/DaAdedBpUjb48CxCbvFSs4kLwd
	EzuE4/mF+Cc2zxLlqipylkkgnXHWXhxmfz83N/vHUzzFIPYEbDSwm/SSNLLuZq2f+ddfLB6rlEamW
	S+NONQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4Aj-008aWv-9B; Tue, 27 Sep 2022 06:34:25 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4Af-008aTp-Lc
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 06:34:24 +0000
Received: by mail-wr1-x435.google.com with SMTP id cc5so13415462wrb.6
        for <linux-mtd@lists.infradead.org>; Mon, 26 Sep 2022 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date;
        bh=GaBSumZwdDPWU9ykFe1wOgvWG/BAlZMWDsmSmoGgrrM=;
        b=LfwWW2qXIctqTdL7TBzCqS2ghyIa5m4nnPDq3Vm/SjVcvib7x7+8aYPpCS0YSizGjF
         6sP92ViZKN9RxwHI66cHFvUcZXr31/31v8oQMAHwqeZwdfGdd5kuySFPkNf5EK1C1NV1
         8kwv9mdyf+WyewYxvUb2M8Wxi9BN4wZqK6OnmYIgVOyXgqg4d9fxJVQ6CgNhrL0QSuOE
         KcOjP7exwLwVq8XnUXXnY/sXXv57dqoCSmM5MRuS5pNYzWg/ogea4XR95cMc1hKZpgLz
         MIT+yIXuezFy3Rs9gIy8jjk2lQxwPLWpFtEBrlPhYonmjawBXwDOkHcasf0Ltp14R+BR
         +93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GaBSumZwdDPWU9ykFe1wOgvWG/BAlZMWDsmSmoGgrrM=;
        b=5QdoO2SSFfp3jF7Aa2S5vy6AuL3HdzV5wUzPNf88GPk6yBeU1cVSHFTrH9nr1wJOUz
         Sf3BRfdbAN9/CqE+uN0jWatF5XqvFqNMBOGsN4gUl71jOybrZsA/BkRC9ba+IA1AL4R0
         w9zKeSbC8/hvECm9vppZ/3mVJ6azgTrTm0jZFAZiIIGjvkakW4KU2l+V2lyrGsR67Kzk
         qoVxBz7SSNbx1oLciCEr0Ny6Z9QNIqiRSqVkJMrqeUHUM8UXQE6KM3k3gDd6Ognw1aQ+
         32sMkB8TD24IV4u7ulxtVKbOkZjFTpCU7r3BbPrhMzKDB2lBfIkD1yeQQDBUHPR1lx1D
         PWiA==
X-Gm-Message-State: ACrzQf3Ua3xjuAy0NlwFD2zFyxTG9AE+VsbmoaLWckoMAf1b81drpzC6
	l1Qiz6YtXdVl45h2g4lq/LfKn63vB2Y2Yw==
X-Google-Smtp-Source: AMsMyM57m7ReZMiDfwhdT4GUhebFr28MS5afpS98f39JQFYvFIESQkLI/kLs0wvWQFPZbNqdcewfkQ==
X-Received: by 2002:adf:dc8d:0:b0:228:6e44:9861 with SMTP id r13-20020adfdc8d000000b002286e449861mr16104912wrj.452.1664260456383;
        Mon, 26 Sep 2022 23:34:16 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d5290000000b0022b1d74dc56sm843366wrv.79.2022.09.26.23.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 23:34:15 -0700 (PDT)
Message-ID: <5e85eafb-bc6b-a005-fb12-db6940118481@sigma-star.at>
Date: Tue, 27 Sep 2022 08:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] mkfs.jffs2: fix spelling of --compression-mode parameter
 in help text
To: Alex Henrie <alexhenrie24@gmail.com>, linux-mtd@lists.infradead.org
References: <20220922031440.422193-1-alexhenrie24@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20220922031440.422193-1-alexhenrie24@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_233422_014122_21385BD9 
X-CRM114-Status: UNSURE (   5.49  )
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

Thansk,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
