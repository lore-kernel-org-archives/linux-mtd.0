Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4942AEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 14:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMDwMpFrKb6aUAtjvc1IDupKF2KlKhoqufHSdCqFBaE=; b=G1ceQDcuNzD2GZ
	cWP+Wr/u21zkYHAWy/EhgFVQaLr0CPVp/2fybUoaE+UDG/vwloDKlAq4jKjUTZ6TgdXsE3Q0BAltg
	9hZwbc9eLuVc2YtaO6ky4alhT4lNNKMmHRuffwqlWDFKRG1P+ITTQ3GU+MNX5rLUKKgTKEcq3UgcC
	eD6k+QEoPm4gjKpKEDuR+39hY3sWlauQkzHogBVyipmdogpqslghS4OSeYfRAF5w00vIwLGKj96BM
	uV310NbATHVpd8Z0Oj8LsLVfXXH42lKCvBNXqNVTlwFxGO1rEPY/P1WfoK59GJF2AkWIAWa3Z2LOh
	n5cIlQk1qnQVKXiHQcvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUju-00BOpj-1C;
	Thu, 20 Jul 2023 14:34:46 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUjq-00BOoH-21
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 14:34:44 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AF67B22BD9;
	Thu, 20 Jul 2023 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689863679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6ff9/xbMepFzo0u5wSH1LXPdzZwFF8kXNP7KYOumW0=;
	b=qJbxkSu+Z/pld8ZDnozSN6/06j3CWTxvtPLYu9WNVqVnQYD1RI5PVainHToQGk4VJlA8o9
	08RqGEh7TmfWw0zpKdWPzd5NQgcsjDUdsX7EP9Afe96ZipgSN96XINuxW2H1O0lYVpjW6B
	K1AfDAllBtV5XnZeo1WSkFqrE7Hl/g4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689863679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6ff9/xbMepFzo0u5wSH1LXPdzZwFF8kXNP7KYOumW0=;
	b=BfGCMyGUKemTNPoT/D7uFthLN/z5ova38Nj3q++Mq22svLYcCfPNhIS17nOKCvDfTHV4Hr
	d45COpmtTCV8NqDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71F49138EC;
	Thu, 20 Jul 2023 14:34:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ZBd0G/9FuWTBdwAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 20 Jul 2023 14:34:39 +0000
Message-ID: <944562e5-1923-5f7d-6a2d-5f648389cadf@suse.de>
Date: Thu, 20 Jul 2023 16:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 3/6] block: add new genhd flag GENHD_FL_NO_NVMEM
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Dave Chinner <dchinner@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Jan Kara <jack@suse.cz>, Damien Le Moal <dlemoal@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, Min Li <min15.li@samsung.com>,
 Christian Loehle <CLoehle@hyperstone.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jack Wang <jinpu.wang@ionos.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Yeqi Fu <asuk4.q@gmail.com>,
 Avri Altman <avri.altman@wdc.com>, Hans de Goede <hdegoede@redhat.com>,
 Ye Bin <yebin10@huawei.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <cover.1689802933.git.daniel@makrotopia.org>
 <96510d925cb0ca1a3a132f8f8affd4bbdafd8fc9.1689802933.git.daniel@makrotopia.org>
 <0592e021-237d-6d41-7faf-e5b93aefbeea@suse.de>
 <ZLk6-aARrlAGenk3@makrotopia.org>
 <f6256c2c-0fd5-764b-92ec-343b99e79c36@suse.de>
 <ZLlEhxspjyMPl29b@makrotopia.org>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <ZLlEhxspjyMPl29b@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_073442_809436_6A265D14 
X-CRM114-Status: GOOD (  31.54  )
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

On 7/20/23 16:28, Daniel Golle wrote:
> On Thu, Jul 20, 2023 at 04:03:22PM +0200, Hannes Reinecke wrote:
>> On 7/20/23 15:47, Daniel Golle wrote:
>>> On Thu, Jul 20, 2023 at 10:24:18AM +0200, Hannes Reinecke wrote:
>>>> On 7/20/23 00:03, Daniel Golle wrote:
>>>>> Add new flag to destinguish block devices which should not act as an
>>>>> NVMEM provider, such as for example an emulated block device on top of
>>>>> an MTD partition which already acts as an NVMEM provider itself.
>>>>>
>>>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>>>> ---
>>>>>     include/linux/blkdev.h | 3 +++
>>>>>     1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>>>>> index 2f5371b8482c0..e853d1815be15 100644
>>>>> --- a/include/linux/blkdev.h
>>>>> +++ b/include/linux/blkdev.h
>>>>> @@ -80,11 +80,14 @@ struct partition_meta_info {
>>>>>      * ``GENHD_FL_NO_PART``: partition support is disabled.  The kernel will not
>>>>>      * scan for partitions from add_disk, and users can't add partitions manually.
>>>>>      *
>>>>> + * ``GENHD_FL_NO_NVMEM``: NVMEM emulation is disabled.  The kernel will not
>>>>> + * emulate an NVMEM device on top of this disk.
>>>>>      */
>>>>>     enum {
>>>>>     	GENHD_FL_REMOVABLE			= 1 << 0,
>>>>>     	GENHD_FL_HIDDEN				= 1 << 1,
>>>>>     	GENHD_FL_NO_PART			= 1 << 2,
>>>>> +	GENHD_FL_NO_NVMEM			= 1 << 3,
>>>>>     };
>>>>>     enum {
>>>> Please reverse this flag. Most of the devices will not have an NVMEM
>>>> partition, and we shouldn't require each and every driver to tag their
>>>> devices.
>>>> So please use GENHD_FL_NVMEM and only set this flag on devices which really
>>>> have an NVMEM partition.
>>>
>>> The idea here was to exclude all those devices which already implement
>>> an NVMEM provider on a lower layer themselves, such as MTD.
>>> In this cases it would be ambigous if the OF node represents the
>>> NVMEM device registered by the MTD framework or if blk-nvmem should be
>>> used.
>>>
>> Hmm; not sure if I follow.
>> In the end, it doesn't really matter whether you check for
>> GENHD_FL_NO_NVMEM or !GENHD_FL_NVMEM.
>> With the difference being that in the former case you have to
>> tag 99% of all existing block devices, and in the latter you
>> have to tag 1%.
> 
> That's not exactly true. In the current case I only have to flag MTD
> (and UBI in future, I'm working on a UBI NVMEM provider as well) with
> GENHD_FL_NO_NVMEM, so a 'compatible = "nvmem-cells"' in the
> corresponding device tree node should not result in blk-nvmem creating
> an NVMEM device based on the (mtd/ubi)block device, simply because the
> MTD framework (and UBI in future) will already have created their own
> NVMEM device attached to the very same device tree node.
> 
> In all other cases of block devices, the compatible string can be used
> to unambigously decide whether an NVMEM device should be created or
> not. blk-nvmem is opt-in, so unless the device is flagged by
> 'compatible = "nvmem-cells"' it will not do anything.
> 
> For all devices which anyway do not have any device tree representation
> it won't do anything (think: loop, nbd, ...), we would not need to opt
> them out using GENHD_FL_NO_NVMEM. Also all other drivers which do not
> already bring their own NVMEM implementation won't need GENHD_FL_NO_NVMEM,
> the absence of 'compatible = "nvmem-cells"' is enough to indicate that
> they should not be considered as NVMEM providers.
> 
> The way you are suggesting will require that, in addition to selecting
> the targetted block device in device tree, the block driver will also
> have to set GENHD_FL_NVMEM. Hence we will need changes in MMC, NVMe
> and potentially also SATA disk drivers setting GENHD_FL_NVMEM when
> registering the disk.
> 
That is absolutely correct, and was my intention all along.
Drivers which can (and do) supply an NVMEM partition should be required 
to set this flag, yes.

Cheers,

Hannes


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
