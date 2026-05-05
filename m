Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9038BFF885A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Subject:Cc:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plCTPLwq8A8FdyihMrGW70gHYF1uLdWEE2lv4iJJB8g=; b=OJvbI4aygGd8Ri
	Vnoxn7+DJRK0spk8O3MhmwdCUk1e5KfQV/nMVYvXgJJBnTw4GLouslpHHWTqAB/t8u6Dfp5IpXBe3
	iYsD5yYgZwo2peJwz3KugM8EeUtvQKDKbeLpupsGSnJiXKMffn/92t+Dqn11Bcp5Z0PlSn+nmmRp2
	TaqPF1c/N6YtSBWKJPKq8PSs1pGJWoRHsIjorcQOdp9lhg27uiUArYv+1fZg7IJGd2kDOq/TBEhEx
	CrvR4jntA/lcYJS5DO0cWH3rkTQCujx31vhTRYMY7msJBOQfDo1Gw5FVIEAy0UP8j5NuUrusnGgXE
	w1tN6r5H7ieLjo8mOmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFJm-0000000GFZ6-2x10;
	Tue, 05 May 2026 12:56:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFJi-0000000GFXe-3jd5
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 12:56:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso50286215e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 05 May 2026 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777985761; x=1778590561; darn=lists.infradead.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxVALa61UelDFSuSOSAEpWSCQHjblQqY9PVBh3yMBSA=;
        b=di6IhnkvIYNdQKH9jW4YTJFvnAzEYE+Ys+LstwDz1nowg/PCnlT5iJY71ZodYRlTeE
         Q6igFcR/kqv2Hz8Go5qU0V9MK95G/CLbgrlvGg5SoDcbY4KesHgwAlSq4UEGCOchyHHc
         vNTldxOuOyhDLOB4uwGuD5WxIYgTCNfg7jCcs/l14voeY14lySK8oHPxGg/sLWYgoMKe
         Lo58/Q1aovIHMQszKlefHHxW0myP1EnXoWwXmy0E5OE6r9Y+dIkkk1DJmq3oIhMKtla0
         o2WshgFQC1SDsKT5VbGtXmWNvy7rKYBBWCKUHObRyKa5Bz6jDPoXvkm55G1mmmbGsk9H
         yVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985761; x=1778590561;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxVALa61UelDFSuSOSAEpWSCQHjblQqY9PVBh3yMBSA=;
        b=C2a3XjeWx3qOOclMiGuR9ac7mERnujmP62j4HbCzPaXgzQ0jG+qSNNmaXlNCIRWL+0
         gZHdLhZ4zcPD4O9FejAOtbJpy5iZA7cCRqxxXgnRL1n1JiQRNxUS6uhl4apvTc7ZN4kg
         mKAVB8Xg395gePVhiH5ZRUEtQpif0wMiHzwuTHwYdFh4OIqRMSbKzrllO8WB3F+UgNWO
         XnkXl4EsuoWiHOo6Dic46B3MnQFTiz1ZpDYEPpJ6FKG0pbih9o4xEKCnjpyi1KzePJ5w
         aoblHKCxLrXDOH3lwrIe2eCMobEbVXqJ2azh5KTDwQvPU+phZi6Xk+6tJmH9Nsdq1pSx
         m2Og==
X-Gm-Message-State: AOJu0YzrwyfvTP6USvWREClS1bdNJ0PARkMkd0bzGzsYVLWE2WjstDJx
	pFg7q7arf4APkXvQDoPZkDnmO+JA0HDZekvOJPI/FAHXo/OFdX2t3RQ=
X-Gm-Gg: AeBDieulRcvSZTFXxM3KlCPaz7iSDnsHQBhNmi8X79Vdax2LGWK9z7+xaago2ceyBLF
	CLDYJETn8vzEOYiPCCG3CEnP1aZtUoeuLu3ltvwd1eFLFtiR3RS7NCPPMqvQE/CI7eFkCtJaK1D
	tT9tSWjtDu61774/rddGo37eB4r7AUgZqAmaAjp0mS9SMPWdoxRNOF2ORWphHHR4Rm75ku+hIa6
	r/NIO1/MFCrpSW2lnQJ1yKrVQhUjZd16JGYExL65FZMVgcQSqfbPWjOHTE8T/Vt2VKb9HvFT29O
	zWiLDXRIJOsoNBaxkVbjfpK4iiSp8xAQiJ1WyD1aJTM55SIJR6rvYyepx/jb+JLCrPCp7q4Z980
	bTATSYuKmL5R6MtrjVSWK1FFqJ51qa0rb2+PDRJg4gIG8st+TqmgTia4w9W7eW7J0bzlQREJf+M
	9IFelhmJ4=
X-Received: by 2002:a05:600c:628c:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48d187d9124mr42886625e9.8.1777985760780;
        Tue, 05 May 2026 05:56:00 -0700 (PDT)
Received: from [127.0.1.1] ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822be902sm427621435e9.6.2026.05.05.05.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:55:59 -0700 (PDT)
Message-ID: <69f9e8df.050a0220.21ce45.4f26@mx.google.com>
Date: Tue, 05 May 2026 05:55:59 -0700 (PDT)
MIME-Version: 1.0
From: Tristan Madani <tristmd@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] jffs2: always stop garbage collection thread on
 unmount
In-Reply-To: <20260501110246.50647-1-tristmd@gmail.com>
References: <20260501110246.50647-1-tristmd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_055602_938608_7A473A2D 
X-CRM114-Status: UNSURE (   8.11  )
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

Hi David, Richard,

Just checking if you had a chance to look at this series. Patches 1/3
and 3/3 have syzbot Tested-by confirmations. Happy to address any
feedback.

Thanks,
Tristan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
