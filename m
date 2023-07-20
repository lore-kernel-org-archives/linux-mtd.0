Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C67C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnhlBlcii/GwjSupuOIif6Ig9wq0UNldHkcJHe7CgRs=; b=WgqlwGkpG9Ie/rm5wnRZtyj/iY
	BDvI3kDS5Qkt0mPbMMJF+o9twcbAGzyMuTZGT22/pIDmMISUo3SWy/cW1zycLbFvQoMBv25ACn7IH
	55WEz1doroce4qIPH40odZcIrICGqiJU0eTspOfGzEj37UBlpM+9JtPylRasQZ25bsUURnC/5TeuO
	/czyyn+MBPyB0adcVAM7Mn3pdoQM6ewqPxknjmACKYtLidg/6SFVaGtR9+rhhZYGL8HDq0zsdS+hZ
	8f9EYoIaF8z/p/PB6RRO5l2bgoQqqFxHdZlm4TSToIQqQ6yE66+85Xg75ExSrxLKuzjVpYRJMJwHx
	SJqBhh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVc7-00BY4Y-2g;
	Thu, 20 Jul 2023 15:30:47 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVc5-00BY3e-06
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 15:30:46 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b89e10d356so5954175ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 08:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689867043; x=1690471843;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDNz4+C3Ia+UJJWOL2yYRO78JT/eW+cEwJdo8jSL20g=;
        b=OffQvvwt8m85HLDfkwbt98mioDWmSmmheznjylIBs5/BR7ZRFgqfuiUXrquJ68BMzc
         s4OqOQVW1sqtNXG5ipCMVbh59UtmHI0LYHPqUzyM37MU4J1RUIpAW0QY+5WUJkihWXAy
         0aAZ2uiYKU5EcNvEqvoUtOxvxDpLV6Wyrhu0fRa+P7SEdFEQekYJ5U4kSToiwatQqKus
         rhYuecVrodlKIdskjsBGp0HuakgOkX4QHatiY1l/cAPfjSE9pAaYTvfuxOB7+atBKlna
         dg2ilo8Isaen7dKNzbamzU8nDkkp/3mro505eBbk9elslnBwm3qz0vVUT5/CjttMhrQp
         FaaA==
X-Gm-Message-State: ABy/qLY6mlnoKBbPHBIPtMB+dCQu0tANfnalYuwuYTY8XYK6tIX2m8/h
	+BZHi660IFDo7sgASrRzRnU=
X-Google-Smtp-Source: APBJJlEp60fdkh+BwPlnxV7BskYrzw4J3Aqy8/DijBF1o7Ei41aAzfcXecHcQpUp58++ywm58NVt+g==
X-Received: by 2002:a17:90b:23c5:b0:263:409d:6ef2 with SMTP id md5-20020a17090b23c500b00263409d6ef2mr6275576pjb.24.1689867042556;
        Thu, 20 Jul 2023 08:30:42 -0700 (PDT)
Received: from ?IPV6:2601:642:4c05:35c7:a9f2:f55:cb5b:263a? ([2601:642:4c05:35c7:a9f2:f55:cb5b:263a])
        by smtp.gmail.com with ESMTPSA id l15-20020a17090a384f00b00267b7c5d232sm2993691pjf.48.2023.07.20.08.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 08:30:41 -0700 (PDT)
Message-ID: <352167df-34fc-ddff-def9-902873796536@acm.org>
Date: Thu, 20 Jul 2023 08:30:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 0/6] nvmem: add block device NVMEM provider
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Jens Axboe <axboe@kernel.dk>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Dave Chinner <dchinner@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Jan Kara <jack@suse.cz>, Damien Le Moal <dlemoal@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, Min Li <min15.li@samsung.com>,
 Christian Loehle <CLoehle@hyperstone.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Hannes Reinecke <hare@suse.de>,
 Jack Wang <jinpu.wang@ionos.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Yeqi Fu <asuk4.q@gmail.com>, Avri Altman <avri.altman@wdc.com>,
 Hans de Goede <hdegoede@redhat.com>, Ye Bin <yebin10@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
References: <cover.1689802933.git.daniel@makrotopia.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <cover.1689802933.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_083045_087253_690D044F 
X-CRM114-Status: GOOD (  20.05  )
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

On 7/19/23 15:01, Daniel Golle wrote:
> On embedded devices using an eMMC it is common that one or more (hw/sw)
> partitions on the eMMC are used to store MAC addresses and Wi-Fi
> calibration EEPROM data.
> 
> Implement an NVMEM provider backed by block devices as typically the
> NVMEM framework is used to have kernel drivers read and use binary data
> from EEPROMs, efuses, flash memory (MTD), ...
> 
> In order to be able to reference hardware partitions on an eMMC, add code
> to bind each hardware partition to a specific firmware subnode.
> 
> This series is meant to open the discussion on how exactly the device tree
> schema for block devices and partitions may look like, and even if using
> the block layer to back the NVMEM device is at all the way to go -- to me
> it seemed to be a good solution because it will be reuable e.g. for NVMe.

Is my understanding correct that these devices boot from eMMC and not over
Wi-Fi? If so, why does this calibration data have to be stored on a raw
block device? Why can't this information be loaded from a file on a
filesystem?

Thanks,

Bart.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
