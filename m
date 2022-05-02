Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE47BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 20:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:To:From:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=3L/uHRHPXY/4qaKjfHOUQkGtGS74Llqz1G70wVbp5J8=; b=WL/
	L8bIOMLRzFbue7u5ecyah4RupMcWm39n25PjOX5yJ0b1BJs+cBrYS2h7jcMqut4ExQ3hXsvM8Rg+b
	b3IdKAeAf5nzDThqDJcLTlOwALuRyg6jPRegPiM5eYs2gIFIft93pUJD6SQtxOOZIZ5gyzcHPgrD0
	73BmZtHCF1YAP+rCzQYcmu5uoWg2V1Z4cilriy3PUPe9gij9lNi/G7pWcpKQaQmQhmWu9lMy+TXNQ
	mp9Jxdh61/XggmJJo3DqAGBLV9AOJjINNomfD6joT9PREWZDFUfPABDCWvRbAd6AP09CtUVfj/TzS
	uraHi9hfRvnCjGj6NSkfcINUmgeyMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlcij-002akR-HS; Mon, 02 May 2022 20:32:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlcdI-002YSu-KX
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 20:27:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso204100wme.5
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2022 13:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=matchdayarena-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:reply-to:to:subject:message-id:mime-version
 :content-transfer-encoding;
 bh=lJ+KH0aRdl8k8CwFrYo0ipoiGK0sWPv66PH3fZBi6XE=;
 b=V40J1GOj5oUQgeThKtQbHNKni7QMq9YkyBWf5AZgJKJ8NEerBQHfTFVoDH4cq2H+Y3
 imhCrB4wPVr+uLL7C3h0ndxCf6vkXlUWse03J+HG4TpVhpfT3k9vQQp6QT6NUvIr5duS
 QL9QiSJ2XbAuFE3yJAFyxG2udc/gG3qKj1OuJpDEseYXRQELILAcHgwKiLtDZrY/e3s/
 v3dQFtaXaXJppldJPfBi6Ti49WqNnwYBaulUhzqnRWEIEPpXfPc7iweroG8U2kT9W3/C
 3tjqkmlPWRXcvelzjdmVdsiCld+sq61lIQlXZYJB2ZFMsmGMg53RK8nSTCmfpuK+ILIG
 i/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:reply-to:to:subject:message-id
 :mime-version:content-transfer-encoding;
 bh=lJ+KH0aRdl8k8CwFrYo0ipoiGK0sWPv66PH3fZBi6XE=;
 b=G0Ht5BU1JvJEyvdRDWsURbssqVXXfRmD50PN5z42zSSXnmqhJQ2xc1SqAAN6YJqRWm
 /0Mj2Rgcs/SBHWKuYSiZwwCPSNmy83OLkmXZZSjqs+rwnVqcfxu5iMQtXp7g0Stpv5jY
 3403SdKT9JwkQJ+UWCvtCZGdyaNMmJaS5phBh5tAqob4aN0Y7s/K8Jmqkt3K/Xt4HB9B
 qCj+evwiigY4PzL6VAsaQD8hEKKPApxX8kZfGY7azGpyybFFa0mtiM3fAv154G7UBvrC
 hMbxREc0iDKTZL/LDi7bXZaaXZyq7LTYnC5u1cRoansS1GNwQdYA68zSHCKs5vq68qP/
 p+XA==
X-Gm-Message-State: AOAM533Vr1CeggZ4v4VhUUbXXmtO0u40VuBOWScVJVqzyzyQoGcpYzQ8
 RUMxd1fSyGOHX+uKOitRMlEcryxv4q83GX6hYUsjm54e
X-Google-Smtp-Source: ABdhPJyKA/bYSel4Pz5Ua0SCImup2pMwDZfYs5F51EqcuYMuTpq0NXXufnljwoRacUY8ZyOpujLTYw==
X-Received: by 2002:a05:600c:19d2:b0:393:efff:7c26 with SMTP id
 u18-20020a05600c19d200b00393efff7c26mr621541wmq.9.1651523217885; 
 Mon, 02 May 2022 13:26:57 -0700 (PDT)
Received: from localhhost.com ([41.218.193.3])
 by smtp.gmail.com with ESMTPSA id
 l3-20020adfbd83000000b0020aca418f26sm7943969wrh.1.2022.05.02.13.26.57
 for <linux-mtd@lists.infradead.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 May 2022 13:26:57 -0700 (PDT)
Date: Mon, 02 May 2022 13:26:57 -0700 (PDT)
X-Google-Original-Date: 02 May 2022 20:26:50 +0800
From: RGICOMPANYLTD <no-reply@matchdayarena.com>
X-Google-Original-From: RGICOMPANYLTD<Admin@localhhost.com>
To: linux-mtd@lists.infradead.org
Subject: Greetings
Message-ID: <20220502202649.6495872596017385@localhhost.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_132700_729022_B0ECA3DF 
X-CRM114-Status: UNSURE (   1.34  )
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
Reply-To: rgicompanyltd1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: RGI Company Ltd
Address, Netherlands
Call:+3197005033311
02/5/2022

Atten:

RGI Genealogical Investigators specializes in probate research to 
locate missing funds, inherited funds around the world. We can 
also help you find wills, obtain copies of certificates.

Recently a woman from the Rothschild family, one of the famous 
families in Europe contacted our company that we should contact a 
business minded person who is capable of investing her funds in a 
lucrative business.

Our service fee is 2% of the funds and we will be paid after you 
receive the funds. The funds transfer process should take just a 
matter of days as we have the mechanism and expertise to get this 
done quickly. Please if you find this letter offensive ignore it 
and accept our apologies

Warmest Regards,

Dr. J.T Woods, CEO
RGI Genealogical



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
