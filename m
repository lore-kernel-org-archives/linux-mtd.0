Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FF0C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEED2611C3
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 12:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEED2611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x5ebl8WjNRLbGN0GQNcyzjpkyVIXcK6MP/a+Th9nybw=; b=AsBeEhdBLBXfJ98YXV5j+QO7kr
	BdXJgRMmchDnfwc+/bnuJLCNF/eaHgv8CEnVxQWAxuKA+DOYeWt1YEplBihSe8UFiGjq6ewA+GDH8
	eXHSxmqo72q0rBBV1JJxBWY9WiN4AULnVlF1ggD2GKFa6PShf3jv3wbNH/2Wb5NseLfoL3/smBxEb
	DSJ5xSnbv3oUelIvBnPQlz+zCTpv/ahlWhemDwgTsv/2faSnHZTXyUME4WKXf8KWmGNcYkyu2LGVd
	VTQA1ApOZb7lSisc60dCIcsFIRzO6p1YMR7+gjKq2HEZ5i8OYj1XcNYs3m3CDBy5ZGtlVa9gY/Hm6
	eEeIolQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVCKI-0079db-LE; Tue, 28 Sep 2021 12:35:15 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVCDV-007712-Jk
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 12:28:15 +0000
Received: by mail-io1-xd35.google.com with SMTP id h129so27154893iof.1
 for <linux-mtd@lists.infradead.org>; Tue, 28 Sep 2021 05:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eUW2/IJFZY83nPJmflQgcvtOV5+nVA8I+eyXlqMJPRU=;
 b=3rbyBzZUI4kM0wtWn3uTCiL+iFQn37kynJEfwzTuvV788lRHsOgrxQX//6Ptwtyvhm
 PRk4feijU3wh94ty5i1N66Ig+sABpOoZVeSM47DP356owZxXG4KVg3Qk+fU5UpN7qjXC
 jeSW+Bttk5kETwDV3GWvC4MYYvgsuJqIuQTZDyroLwERBzQS4FN9yhIxNHryOdoEOwa3
 o/15DNQGaey/vFs6hguKBx6L7zxTznRm9cJa3vz3CKspK4BMmY/hSPddKOKPDaXtB5dT
 Z+Mr9kmkrhnMk9UXoVcl7QPhre4NUeznnkriL3TH5rbTeZtGvIvFfgKW43pdABZ6Z0cz
 KdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eUW2/IJFZY83nPJmflQgcvtOV5+nVA8I+eyXlqMJPRU=;
 b=KDrxX4z+I6gUhaK6zfTNPDYjTC1XTjmniOg7OX6rUyMrFWx0PimcPECQ1DAZnd6liw
 r87IOWjG/+yz9ONiJ0I6reIDt7SQQ12nUEjGsN00TlY/bFQQ18ouLcyU7mCuxFwc9dhp
 MVReS8LQmu4hyh9DDaEaFWV/hSj34C5QSxrELNPB50D80939WH0YfuwU6Bc/wkdJzACC
 BuzZdGp5wP397GJDIyEiz+yGe1gc1e0yC/tLTFDu/CIwArsO4VGYPw++47HEGN8tjUb0
 tROMfcC5+vYzcQwupuTXA267KDPageWHVzAy83wMBtx0lUWJTao+YWrRBJIvpVhhGtJ0
 cysQ==
X-Gm-Message-State: AOAM533xVBhM7tudc+7aeThErbzSrnCs6b04SAoe6uJD/XwV9j2K9mV2
 LJcqtv7sRCtjw7C45gZ9HCuhOA==
X-Google-Smtp-Source: ABdhPJwPZLFitXCog7R4G/mZxZzFOE8+azMCqbj1uCZcF9QhbMc4aOBoMdp9+4PWoLOwgLvLP0Uqqg==
X-Received: by 2002:a6b:5114:: with SMTP id f20mr3764704iob.97.1632832092364; 
 Tue, 28 Sep 2021 05:28:12 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id j17sm856634ile.20.2021.09.28.05.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 05:28:11 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] block: 5th batch of add_disk() error handling
 conversions
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, gregkh@linuxfoundation.org,
 chaitanya.kulkarni@wdc.com, atulgopinathan@gmail.com, hare@suse.de,
 maximlevitsky@gmail.com, oakad@yahoo.com, ulf.hansson@linaro.org,
 colin.king@canonical.com, shubhankarvk@gmail.com, baijiaju1990@gmail.com,
 trix@redhat.com, dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, oberpar@linux.ibm.com, tj@kernel.org,
 linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210927220232.1071926-1-mcgrof@kernel.org>
 <25afa23b-52af-9b79-8bd8-5e31da62c291@kernel.dk> <YVLV3s66GVVSQ+tj@osiris>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <bfd9f85a-d6fb-c05a-5ec3-2e15ee08062d@kernel.dk>
Date: Tue, 28 Sep 2021 06:28:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YVLV3s66GVVSQ+tj@osiris>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_052813_783149_2A0345F5 
X-CRM114-Status: GOOD (  15.75  )
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

On 9/28/21 2:44 AM, Heiko Carstens wrote:
> On Mon, Sep 27, 2021 at 04:32:17PM -0600, Jens Axboe wrote:
>> On 9/27/21 4:02 PM, Luis Chamberlain wrote:
>>> This is the 5th series of driver conversions for add_disk() error
>>> handling. This set along with the entire 7th set of patches can be
>>> found on my 20210927-for-axboe-add-disk-error-handling branch [0].
>>
>> Applied 1-2.
> 
> Hmm.. naturally I would have expected that the dasd patch also would
> go via block tree. But let's not spend too much time figuring out what
> gets routed where.
> Applied 4-6. Thanks!

I left the ones that have active maintainers for them to pick. Unless
someone has already acked/reviwed it, in which case I picked it up.
I've got no problems picking them up directly, but unless it's been
reviewed by the maintainer, I prefer if they either do so or pick
them up.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
