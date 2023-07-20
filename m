Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD10EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azx78E74ezeNYqfhVSI0fBBi1fuETxQFQyNNldb3++U=; b=E3r5+KKBwhaBLX
	ENmvVXyFFho7BzzwYtU0bbc0cNXYyGS8ZwTprQ02SaEpcNntAvZztUiLnzMk7O/44QCP8lqIJgNXq
	jKH0jWC4tPJw6amHKQ30e5ppE/TW19rUkKzh4cSEWf6BeNgyaffHVH08gw/B1UCcW9ifzUADoTVJs
	0ZlKkdj5woRdNHxOuJ9iJucy2LSeZ+V8zntCQbp5VbD9lX66vJVbFg7ijwX7vMeRq9ymxfeJsIMg0
	QnPulljjDZXzJOxy1qbEAFufuOZ4WvcAMiWEDADFlxGqUWSIzjfG1ovy69DwxuwcMA81ELErJ7t7j
	21kfqrRL07600TReJ8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUFf-00BKWA-28;
	Thu, 20 Jul 2023 14:03:31 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUFc-00BKTu-0O
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 14:03:29 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AA0DC22C64;
	Thu, 20 Jul 2023 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689861802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGnybU3gGB5aNK910zLVij5aowP7RWZlN7dwTs5iv2w=;
	b=y3LtS5/gtRX9lVn3eFs2GAUvGyKcWlYfvac6mcNsjImdFCTBRjER9JwMgDYreJLiWRoeQX
	G4GnuucJ+GYBhf6SftdM6fAIE5chEafvKewVmqb+BVJ0Dh9GgVx1bDj9WFG00YWcu1A91f
	o1qlgWgo7mm8/KYPvP03TDZ7U3IalMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689861802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGnybU3gGB5aNK910zLVij5aowP7RWZlN7dwTs5iv2w=;
	b=RBWSyVgblVwr03N26SRGPofyGJCbUi/vpnVfiIgmUxhEhB3PIB08n6hKz2jnquMbkp9gNX
	GMq+KLeEJQfBoIBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A54B133DD;
	Thu, 20 Jul 2023 14:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YTNYGao+uWTVZAAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 20 Jul 2023 14:03:22 +0000
Message-ID: <f6256c2c-0fd5-764b-92ec-343b99e79c36@suse.de>
Date: Thu, 20 Jul 2023 16:03:22 +0200
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
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <ZLk6-aARrlAGenk3@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_070328_307547_DA785872 
X-CRM114-Status: GOOD (  23.56  )
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

On 7/20/23 15:47, Daniel Golle wrote:
> On Thu, Jul 20, 2023 at 10:24:18AM +0200, Hannes Reinecke wrote:
>> On 7/20/23 00:03, Daniel Golle wrote:
>>> Add new flag to destinguish block devices which should not act as an
>>> NVMEM provider, such as for example an emulated block device on top of
>>> an MTD partition which already acts as an NVMEM provider itself.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>    include/linux/blkdev.h | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>>> index 2f5371b8482c0..e853d1815be15 100644
>>> --- a/include/linux/blkdev.h
>>> +++ b/include/linux/blkdev.h
>>> @@ -80,11 +80,14 @@ struct partition_meta_info {
>>>     * ``GENHD_FL_NO_PART``: partition support is disabled.  The kernel will not
>>>     * scan for partitions from add_disk, and users can't add partitions manually.
>>>     *
>>> + * ``GENHD_FL_NO_NVMEM``: NVMEM emulation is disabled.  The kernel will not
>>> + * emulate an NVMEM device on top of this disk.
>>>     */
>>>    enum {
>>>    	GENHD_FL_REMOVABLE			= 1 << 0,
>>>    	GENHD_FL_HIDDEN				= 1 << 1,
>>>    	GENHD_FL_NO_PART			= 1 << 2,
>>> +	GENHD_FL_NO_NVMEM			= 1 << 3,
>>>    };
>>>    enum {
>> Please reverse this flag. Most of the devices will not have an NVMEM
>> partition, and we shouldn't require each and every driver to tag their
>> devices.
>> So please use GENHD_FL_NVMEM and only set this flag on devices which really
>> have an NVMEM partition.
> 
> The idea here was to exclude all those devices which already implement
> an NVMEM provider on a lower layer themselves, such as MTD.
> In this cases it would be ambigous if the OF node represents the
> NVMEM device registered by the MTD framework or if blk-nvmem should be
> used.
> 
Hmm; not sure if I follow.
In the end, it doesn't really matter whether you check for
GENHD_FL_NO_NVMEM or !GENHD_FL_NVMEM.
With the difference being that in the former case you have to
tag 99% of all existing block devices, and in the latter you
have to tag 1%.

> In all other cases device tree can unambigously indicate whether a
> block device should serve as NVMEM provider (and right, most of them
> never will).
> 
> However, reversing the logic seems fine just as well.

Thanks. Please do.

Cheers,

Hannes


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
