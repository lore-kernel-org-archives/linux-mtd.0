Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A282EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:41:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6193460FED
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6193460FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/TBW2qigFIhFFMmduqmrmF/Ivfxlp1V4d3YyU9NRe8A=; b=s341r+YaolH6c+gUAFlvRZfiYY
	jbX7tKxRFiA2zyJCZV40zFr842SdXfXrZSY5h3qmnBrVCcB34m8aeJihOtcxdt/Hoys8SDqmjvf7m
	bQQeinonLOO5+hMaI3xPSmzUV39auu//Zj2C3+oMPw0MtgD2s9C4QJNanzcEizA3CJVB1FGMc+QDb
	n1P0wVYMIACQRuqOr+9zj118qMBr8g14yM+C1l3ePhAnpvL+iKu65NSa2aNvi8de9183oba9/Ubl0
	KT1xT4w3D0JzeFb9F5U0kp4hMG0etibeI3WUZNyvJbHByat3Xc3vsR+sCOtMTckxIIeHZLGcssLec
	2lmqokpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUzIq-004iZQ-3Q; Mon, 27 Sep 2021 22:40:52 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUz9o-004foV-B2
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 22:31:33 +0000
Received: by mail-io1-xd2f.google.com with SMTP id s20so24828497ioa.4
 for <linux-mtd@lists.infradead.org>; Mon, 27 Sep 2021 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sX6r+VtFysjF4oYWhq8xiiNNA4lX1D1DfLKUJZfhu90=;
 b=OGr73FRvt46870zXruqJzO3SP1Ff106DAwHYXUFkbZMroSt9xlbgYfx7Ha7zEr+0eQ
 fFB+gzMSVZ08KIy7nyZNnCarwiShb9palyfj0dXtHLBmtY9QZen0dwLXBl4Rvl7CxcNn
 SP7cAuUENfc4oxY/hNo+0A66ksQ9JUCs/MnzyXpskmihN/bESuVMBxAXmMC+yskn4ewF
 cvNKll/Bip9zfqynoppKB6jf4oU5D9Xmqy9wGOf+8D4/xEcZSZdSXUHc0DgUlJw88XJd
 dW6kqum5J6035JIytkWK80yNFYf+nDLSA6v4LNgfQDtCvMy5K9RF5zPvdixHvFODqSpb
 uFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sX6r+VtFysjF4oYWhq8xiiNNA4lX1D1DfLKUJZfhu90=;
 b=uunjTrkQNCPW2AJcyBJy//SMjk4YK0kdeSi2japdldiGqIKS8TUTh5ndQpZIgRAD8j
 AvWFzkkNlHykt7Tewpx+UKEe3AkgxBmslM2JpSh8iTmq6t8lyMj1r8RHZ/1RX3XyTItT
 fjb9/TvtyHJZJtFxNdBKZ4wpImLwoUrhcbWDxzg2UnMICB4QKDlzz/OWZFtEFYBatIxD
 8yF6Qkq6rNkfW8BuX2tfRzv4B2es9hPgTUkVIlaWTQcdacM8PSHgb9iXjAOl7OX3gfxY
 hz1WL+Qj44eytgBZSJ2pG0e+VvUQHA1ITr1AHRwPvwaGiMDO5gXhjVAkeg7HlpIOWsMv
 tKPg==
X-Gm-Message-State: AOAM531v6agpZwP1I7Jj0fqr92NOHygHFC7D957fxB33lMAgIUfExyWC
 JIpXe9tQUtKdaIPN0qyLiTkkdA==
X-Google-Smtp-Source: ABdhPJzP/D0Hpjy1B2sLyeFE8yokRGllLNT0YFxbbt65jzTeEocCKfwSycbAz2t49gx5XfwHzWMFZw==
X-Received: by 2002:a05:6638:dcc:: with SMTP id
 m12mr1876527jaj.68.1632781891278; 
 Mon, 27 Sep 2021 15:31:31 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id t16sm9791519ilm.68.2021.09.27.15.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 15:31:30 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] block: fourth batch of add_disk() error handling
 conversions
To: Luis Chamberlain <mcgrof@kernel.org>, bhelgaas@google.com,
 liushixin2@huawei.com, thunder.leizhen@huawei.com, lee.jones@linaro.org,
 geoff@infradead.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210927220157.1069658-1-mcgrof@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <529d5e4a-82a4-2498-f63d-34c177ca4ab4@kernel.dk>
Date: Mon, 27 Sep 2021 16:31:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210927220157.1069658-1-mcgrof@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_153132_441349_88F75582 
X-CRM114-Status: GOOD (  10.64  )
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

On 9/27/21 4:01 PM, Luis Chamberlain wrote:
> This is the fourth batch of add_disk() error handling driver
> conversions. This set along with the entire 7 set of driver conversions
> can be found on my 20210927-for-axboe-add-disk-error-handling branch
> [0].

Applied 1-2, 6, 8-9, thanks.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
