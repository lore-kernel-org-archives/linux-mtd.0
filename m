Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57534CD6E74
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=CeGYAyH/2Es1Ru
	tR3dy17zb1gkrfpeo9JxPbqLJ2Anm48CBDAwqSVHTEKZjHBK3bplfepLV4JWDQgxdBqJAzK7mI08C
	a2HCztcVJhKihN5/5ZuE74yMBZbjmSOiKBKm4MdcQLY9JNhwmfz/i3AtC0AwJKjBNfSEk+qcFucZa
	1MV0oOKjkKekCUq+ormJB7fMUGQfrGOmwKsz63vRz0/89wxIInESeGNGAxpGxnzxIjnngr6YNOcKs
	nYPNNkRYxtnLSNVOGAMFrc77O6KL9ILSRm0QYJUGqav8/VXaJuy+OTdXddRayOE6HsyvoXI8/UJiS
	+JkZNpgzd8wczl3Mkp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUFE-00000000efT-1wAx;
	Fri, 05 Jun 2026 13:05:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUFC-00000000eeu-0WiG
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 13:05:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4905529b933so19109025e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2026 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780664748; x=1781269548; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=r281pvHPS3598uVYRd0T/0VhGGI4VblumJmAT0MqxvZ7f7AYbVEQPUOip3GmNZUebd
         M4pwHZpPJy+/2dp1Boh+Bu7B3jG6gdzYsoGkReboHVeYPEU+vHTYj+FxMbkxQKQXhBOA
         vbOiWl4wypHX5vgFONeXFWvzBoEZOieTrVSeFn7wDUPucr3qRjz7+tOEelq8wyAWNf6k
         3l19YzmgsmrDIqNyHgt0BylBmqZvmFgq66EsH1vbpcIRxqss6iTBpPy1RKGAJesnReNm
         YRxRAFZ/pLWDUE7krYPtlg6rXiCa/ayHoUeLFFzAQxIyxwNzNPJwHK0A4Syf8DQFzKIH
         qvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780664748; x=1781269548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=QcGNMreBNXEdjJ54azkD/RbrIM8O2Ofx5cbtZ2oog4HFeAWkNB8d4HRn1Mg49jgi8Z
         lW4RrPapOJ6Qp+enjrrq5ArXUb1AyuTKaqMW26yl0l/YzMwyfKs8Ns17/y8BIAOyYabF
         rFw8vNPXObv/fiOWqT7Rsv79V59QQbT6vq8pGJJnnRZQFkZ12qe0s74QnCwT5JCA4O6Y
         Mk2O/aaaiKKLc/qRPHgvMHIpV5Lz/Q93iVvQ9KHvIavJw9JHWFM/8lSScHHr1d2WNtpE
         TYm/PF5fmm7uPHmSr2sfFR3kFt0uY4MsORfmnvNj3eS7/d0x85oXpHBp0a+V+pBByszX
         f7pA==
X-Gm-Message-State: AOJu0YzSWz/Pk9ZIywmB0/1hLMpJtUa+48C6ShlC+4MACvOgO/5xaRuP
	vf1ZyfDe+1rYDhvWCagRDthqg7IeoQ7nkOv818W2gTuGiVhjWWieb0ha+QeS7BAI8go=
X-Gm-Gg: Acq92OEmvGCbePZ/UJ209QdogJDbQrPiw6odnZhr3Omy8jI4AIJk1wufYtXWHiHh5OK
	8vShspE+v4nyrEpvnGnOfKFhEe3NisV33GrxuY1764kEGOuIJi9d4MskeksDfDA2NOU/yRUfXFw
	Bf9wRHxCLl7Xbv6Fclxivu6bjCSbMpoDTeGNwTAeWKiUgI/rqWghaJdWsnXhaYvogieKoFKLOHQ
	F4ophBVpIsm64feo0GEyt4s0w/koaN526B2Rag+bSFgD0IKFO6u6SorLFjdoKE8p8OTn9E0Cvz2
	vUxnJdBY9YoVstEhPlxZTv67G1YluTBAUPHTro/wSCPMbTljROo3b4uEIp0tetUC7/vY9q16HhR
	WGF95m6qm6rBOsewv9BtncuC5BtKjK0XWf0RC6/0ZYXpT9yNm34NYn45WF90DN4lZN1/SfXAU0J
	Rgk8OPoSS3Yip7J2T5wP6A99jhzwMFxvCVjEcrICwtFjV1Lx0Pvz5N
X-Received: by 2002:a05:600c:458a:b0:490:b2f2:9aac with SMTP id 5b1f17b1804b1-490c24f56d2mr61977325e9.0.1780664748182;
        Fri, 05 Jun 2026 06:05:48 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d52e5esm30320485e9.2.2026.06.05.06.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:05:47 -0700 (PDT)
Message-ID: <1c943df1-bd30-4228-a48f-c772520d0607@linaro.org>
Date: Fri, 5 Jun 2026 16:05:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES
 flag on failure
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <20260601125438.3481722-3-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260601125438.3481722-3-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_060550_170069_19C3C32F 
X-CRM114-Status: UNSURE (   4.21  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
