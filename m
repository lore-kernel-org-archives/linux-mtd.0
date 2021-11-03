Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A410BC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 19:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6AA60041
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 19:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C6AA60041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qdjQ1qiWyvvUdpQvd3L/TcK9Ohs+/+mn2n0/d5Vav6g=; b=KfbFrXXgyaTicu6yqcHn7TiDZG
	GjJLP+fsdlKUeuEwLsLlH1c9WtCySFxej1bvZ9akYMgWLnCMHc61tFAuUybgGBy2AG9k2wK7z2VM6
	K6VdJ+1uBVvdRpBA5VIohR8y22xFBnLH0Lk5XY3a0jwbBy6SsG2SPmRrvGmwpH2iFGoVuXDi6HbGJ
	RE/FgJgktyY0m/tMLTP3HX9UDjHxEw/mj3eNxNCludnh5ZdGJ9qRKuLhvtdaM736PoysFxRVBkoLt
	Q9XxPRtNYx/D4T+Ieu4Hj5jRQt7OMFABQAc7d7ZHDavCkkVq8wCR/MAnFQzbqfnkCTfvS59FhhdWd
	ZLi9feNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miLvk-006PMX-SU; Wed, 03 Nov 2021 19:28:16 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miLvg-006PLj-Nb
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 19:28:14 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 w29-20020a056830411d00b0055abaca9349so4910401ott.13
 for <linux-mtd@lists.infradead.org>; Wed, 03 Nov 2021 12:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UePDyJ5YGTt0SI7wSYrq2teto/cQR2vkkj6nAm2W3a0=;
 b=iJPu7qjoWnWpnlD3pbi8ofB5MCwNTChZ4jlIPjBLmxcCizs6UsV3G8NIpJvwQns6xz
 Mcu2063seKgTdnAoui3FtZzMw8tih4oa/T0SA1zkZ8TWIgMTCTlvKwUnRQJJX9o8hTQo
 NO5VmJ63MSPyzGtQlLxtrNhEUEkrQEkpnINZoI7anc9hmGLMdLfv28zMqBiXyzp7XfrI
 Ch4low2MMbl4FMIg2eatNVS8VMh4Fy+7tyv+dPfwdSjjwvwv6LXIR/YJ6bywUGJoXBmN
 xJ2/AiVAJMuY6c1kefCFBdNCE67M6OuV9vkZKDH4WRUFtlR5dRH6zzPvPZ7M7qHdques
 FncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UePDyJ5YGTt0SI7wSYrq2teto/cQR2vkkj6nAm2W3a0=;
 b=zYGow41ms+qoT73deWqEOrb+jeYoca+CL1JltlRkhpofirID37y72EQPtdlL7J1Srd
 Wob+PFG/aCqvksS2H2soyGXe9ZDq8EWM+65vZVGwliNJWNK6I0g3RJdP/C8K5aLfhoYZ
 j57f4a4swm2RmjHR4DRHBtkBfTFF7yoFX4xBWbGqty68jkZVB2z3o5A4nTXEGdFZdZ8w
 nFpPhtjQx7dgtGGzK8Vx/15kTHzr6sIkJBbGOn6t7ZQCGlTlv74QvQqgw7omxW4j83nR
 RCPUrV1Deo7PE1x5xWWsh7fsRy39EwYG1U6vahAnjanF4AOXaLhFXDutH+Pthjwrj2lc
 ogXg==
X-Gm-Message-State: AOAM533bAt+UtixgIFgzP9H8p2QIPsJTDx019836ne6DdtYp92x7Er/w
 S7/058dros/F7iyVq5dMNadZiA==
X-Google-Smtp-Source: ABdhPJyDHe9v7v0ovnKDw8B7RfOBJHhSliZhy8hiaOCde7In7CDoT4l8tvqDIUDUaywzpQBTQ1nVDQ==
X-Received: by 2002:a05:6830:2058:: with SMTP id
 f24mr19740345otp.248.1635967691754; 
 Wed, 03 Nov 2021 12:28:11 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id c1sm790336otl.71.2021.11.03.12.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 12:28:11 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] last set for add_disk() error handling
To: Luis Chamberlain <mcgrof@kernel.org>, hch@lst.de,
 penguin-kernel@i-love.sakura.ne.jp, dan.j.williams@intel.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, ira.weiny@intel.com,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 efremov@linux.com, song@kernel.org, martin.petersen@oracle.com,
 hare@suse.de, jack@suse.cz, ming.lei@redhat.com, tj@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211103181258.1462704-1-mcgrof@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <e01938a3-11c9-e368-65da-fcb5830e5a4c@kernel.dk>
Date: Wed, 3 Nov 2021 13:28:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211103181258.1462704-1-mcgrof@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_122812_807595_04EFDAFF 
X-CRM114-Status: GOOD (  12.41  )
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

On 11/3/21 12:12 PM, Luis Chamberlain wrote:
> This v4 only updates the last 2 patches from my v3 series of stragglers
> to account for Christoph's request to split the __register_blkdev()
> probe call changes into 3 patches, one for documentation, the other 2
> patches for each respective driver.

Part of the reason why I think this has taken so long is that there's
a hundreds of series, and then you get partial updates, etc. It's really
super hard to keep track of...

Can we please just have one final series, not 1 and then another one
that turns the last two into more?

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
