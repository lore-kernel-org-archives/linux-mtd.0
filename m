Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1F1C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 15:00:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1016206E9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 15:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B3Srbatz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="uVP5oeGo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1016206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6tt0z2czTqIQzs3wbUtx6XbsnPYckf/s5BvS/s7qhTM=; b=B3SrbatzQbnA7tOcWd4Toa3tr
	H706CjTuDrn9ajFrhUhAqFbUfHs2dR/ZnKj2Xra23qL8bpg6ykSzPROs8uMBT/EeU1duBUUFO1vxD
	j7sleGa00Ud1+YhPHFlqLOmB5aWqo+B++DwD9CxmNwKXGRWEDuyaPQsgl/Tzrblq4nSfwaSvNvd4q
	uvPFkjHev/kEE5tGKaYt+Rytz56+UWT59LAHO64Ht1+76S9/L+mkHKe9uFnEZn3jX0r0n4nyRHQPS
	DeQvErsAn2pBZC0VwJpsDCnGOvsDrshCLUVf6MpB8+k+F0/oHGaw59HzPaZ8HC+JEMvYdTdgF4wKy
	eWedDO0VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYsLM-0002gZ-8Z; Sat, 31 Oct 2020 14:59:00 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYsLJ-0002g8-RE
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 14:58:58 +0000
Received: by mail-pg1-x544.google.com with SMTP id k9so5673478pgt.9
 for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2020 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0zr0b/y5rkNm6oxrz4+W0bMdaVZDG5gT02DeVbHw98o=;
 b=uVP5oeGo2YZHfMjuITKgMCFLRKszKlLHhu3NYhX0ToMOD9q3WR0wGFUFkWhaYhtsqt
 BAXEhyU8dThRZMaOj2G/t8Pe1U4C83abPqUdJdvBRsprfX4o3o0dNPUzXz+OTNzS4Hsp
 CUEhW0B8wY/RY+Th4RHI/09LirVvsxeVY9fEajaAgZIl+25Fb/2PCrfAyx476Qzl+TQm
 CUUJidojEoMdNDmnDrCZARO6HcTvO8Caib55eG/L0aYjM/BPpAQIazpSmTMFoYpfInIj
 RX3g3AP8AH3sA5rTGyq6Ghbu2bsLlNEE7x6UAT9gEFpa4OPcO4FgxEZBWLDJaVVE+aiH
 YKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0zr0b/y5rkNm6oxrz4+W0bMdaVZDG5gT02DeVbHw98o=;
 b=jT5vHzZ6wP+lOZey56PgzpFTvrVnyCWZs5Jvv4bE40OfYKhwXLU6lcOhxiXCD0O8lZ
 HOx6qks1PVKyBWxM9fG6+V3MeRmVhYXpPeiIGcwyEmsFUO1xJ8A8bxqnG7v0wvp1mP+M
 fY+3Kx3h133cemFjG2plO4U5oETZ6jNrIuc/UGSj7Lso7f/EMf4Pp3/Dp3DJhT1rohjo
 mrN/2TB9bu6sd+CsJPC4u3bkOEU7QrfuOch9GRMEpuSBBSWyf3NDDkEz1Zrlf0stp55g
 xiSTFbegv6sh1VJ/WP9dYlEIn2tdbMUlduO9FQGZxbr3oSzMJ6L9P8iMBvy+oO685CaS
 X5FA==
X-Gm-Message-State: AOAM532UjyoybOTkLCDemwBABS1Jbz7KwzG05tdsAiXknAZJD/Odxcsr
 cGYnimxfF1/FUvc4oFeYIFl3YQ==
X-Google-Smtp-Source: ABdhPJxu4Rg5DJXBVruN6ahpydQKdUXsdC1eafH3KHv2+x9uXffRNUui5KAFMqg9AwAVU2K7WSB8Ww==
X-Received: by 2002:a63:1b41:: with SMTP id b1mr6826953pgm.274.1604156334647; 
 Sat, 31 Oct 2020 07:58:54 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id q84sm9374774pfq.144.2020.10.31.07.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Oct 2020 07:58:53 -0700 (PDT)
Subject: Re: [PATCH 02/11] mtip32xx: return -ENOTTY for all unhanled ioctls
To: Christoph Hellwig <hch@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
 <20201031085810.450489-3-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <f128e8bb-7ce4-b8f4-80cb-1afab503887c@kernel.dk>
Date: Sat, 31 Oct 2020 08:58:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201031085810.450489-3-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_105857_918102_DF354215 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/31/20 2:58 AM, Christoph Hellwig wrote:
> -ENOTTY is the convention for "driver does not support this ioctl".
> Use it properly in mtip32xx instead of the bogys -EINVAL.

While that's certainly true, there is a risk in making a change like this
years after the fact. Not that I expect there are any mtip32xx users
left at this point, but...

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
