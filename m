Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C6FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:42:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E5046103B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E5046103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S6cqNr7xm4zLGR9Kvyuoy+G0cCBkPJwSvBXRtIArNkU=; b=iPGtcaMu3SspQb7Wv7HrpGSSyI
	LSSZvyq31Z6kaFcpcPMIPSoX8Wp0z0Qn2zd4/W/P5+bKv0WkT4WqwTb9Sov+7oV0uEJ39BAu8isAh
	mk5WsasyJaZsXiy5CTewqJ27/ISrwjxKsawgPkNdfLKGO9sH6/FzF7mIOKwTyu5fwSwFR/E1Yh9RW
	/D+IzeaNjNBC9gUqI8RIJNEgRV1mE/77SIMSxwR0Ktn6pC0x1FJHlif+I/As859DF8ZEUG97BzA5U
	9o5TazDItVNH6ljdlxRRHJWDI4jJ0nNc83eNHN/2XSJK+JJioEmI8MEqBJ9MOksUxOb17Q8nD+dRt
	0YJMIOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUzK1-004iqo-AV; Mon, 27 Sep 2021 22:42:05 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUzAb-004g2H-If
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 22:32:22 +0000
Received: by mail-io1-xd29.google.com with SMTP id b78so19523099iof.2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Sep 2021 15:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+UmxU11hST5wQMMsZTOdrPPgQ47TLPa20pybe++XQYM=;
 b=DYK0QeVSPErU0fdUHY9fTGU4W7LYS3OpstW7jKN2zQIGz6Fg75r2GHQ3mNhW9RIn1l
 +/XX+0IaT+QuP2WnY1RDSSQe/LzU370EV/dACbM1CoHg6kWxfp4JKYe9NsSJNOZspcJv
 79kSmVRSpqY6HusQwOsl5Cca71RoZZnxCQ7faeNT+onSgNJoOacMUCqYfldqMMFZnJn1
 op2n2nb0dzUlxGLwnR76PnSZAQEAPJSGaPxLjQP0iN7EFQdPXw6p08Wye3gAirxio6qw
 Ay8cPI17oe8ngWi6HmVYmshTvXlSdR08xlvJOMOinmATWt5vmC9kQdW4ky3oHMIbMIRb
 tKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+UmxU11hST5wQMMsZTOdrPPgQ47TLPa20pybe++XQYM=;
 b=Ln+rnjJJhtrUcmTvipi+dphfeflw8bQjlWj1FU8mhD+9zCV42WxN53jtclInUOiSmD
 Ai1RnYolYLed4AQ7sY8I2ayWplQp0dyKMtluw1EBENDjdElYXgpKA6hy65TZJFHgMYxs
 andBWXZnzbAPzAFPw3vP4Ih/P76ggP0RUexM4SaKnhdVN8g33MmxoNRcwlWjWB1rB2+D
 b1N8tHqK6EPoWnjDUPhNRfNe7HySs3b1dU+AaKqr2uC7b+Ocy9JM140dXkoTHlCU4lH0
 3YyjNehEqwCs6JtpltRPvgKe+lIBRXUXIB96rHRdG2pp3r5BYUJSQR54BMAhPJlRsH+j
 JKag==
X-Gm-Message-State: AOAM5309to2ypA2HQjRlYa0fKaTVpl30xyDneP1ek+r9PJcsnIb0J7zw
 QbqOdQ/Lmrz6Zj5SmAW9IQb09w==
X-Google-Smtp-Source: ABdhPJzCRspGfuZEaibKYg9STMBXwDX6ihxLpFk5STZ/wJRDMFJCRfEhMCvkyfG9LlSO8u6kMpd4Fg==
X-Received: by 2002:a02:3f4f:: with SMTP id c15mr1841581jaf.1.1632781940669;
 Mon, 27 Sep 2021 15:32:20 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id p4sm9291645ilj.26.2021.09.27.15.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 15:32:19 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] block: 5th batch of add_disk() error handling
 conversions
To: Luis Chamberlain <mcgrof@kernel.org>, gregkh@linuxfoundation.org,
 chaitanya.kulkarni@wdc.com, atulgopinathan@gmail.com, hare@suse.de,
 maximlevitsky@gmail.com, oakad@yahoo.com, ulf.hansson@linaro.org,
 colin.king@canonical.com, shubhankarvk@gmail.com, baijiaju1990@gmail.com,
 trix@redhat.com, dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, oberpar@linux.ibm.com,
 tj@kernel.org
Cc: linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210927220232.1071926-1-mcgrof@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <25afa23b-52af-9b79-8bd8-5e31da62c291@kernel.dk>
Date: Mon, 27 Sep 2021 16:32:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210927220232.1071926-1-mcgrof@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_153221_673380_DD1F6D77 
X-CRM114-Status: GOOD (  10.90  )
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

On 9/27/21 4:02 PM, Luis Chamberlain wrote:
> This is the 5th series of driver conversions for add_disk() error
> handling. This set along with the entire 7th set of patches can be
> found on my 20210927-for-axboe-add-disk-error-handling branch [0].

Applied 1-2.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
