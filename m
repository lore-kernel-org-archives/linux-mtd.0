Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF0AC54E8D
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 15:37:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A072E206DB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 15:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gDoQNqTC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A072E206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OZtFjfxc0Loka8F4LJUYKSzP3K4z8UfXbDWbJdBVqU=; b=gDoQNqTChDwzjN
	jcJRrP5FZgZoCk5WkPMoe9tPuLXFR4DvElct+TtOL4yMSJRmzpeOW9oe4QmnEHRTJIYiLVShkMK4q
	FKk8IyegPBs2Q5t2vmPZvGKtT/QhY2TxQ3E24YYb+PjSkpCxnaOkMo31LZy+kze72FI2bh4cQ5kR0
	WaqDDL3wRcUhfO65n8Hn8pYLe+cO4xDDxGmBwZJR5LRr04o0mdOxZkxc1dHizRnqxgf7PeCMoSu/l
	1kNqn1akxNycuStPWxwo+XX2nHwf3Paz2Dwd4QQeXUPr3RO1WLqtY9b6grVj7V/mrywQiY3HjrbLt
	C+ZVdRdFp3RL6WO/Pd6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAUD-0001SO-L5; Mon, 11 May 2020 15:36:57 +0000
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAU8-0001Rk-Mk; Mon, 11 May 2020 15:36:52 +0000
Subject: Re: [PATCH v7 09/18] pstore/blk: Introduce backend for block devices
To: Kees Cook <keescook@chromium.org>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-10-keescook@chromium.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2b4fec3e-53f7-b8d9-49f8-d24401f83363@infradead.org>
Date: Mon, 11 May 2020 08:36:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510202436.63222-10-keescook@chromium.org>
Content-Language: en-US
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/10/20 1:24 PM, Kees Cook wrote:
> diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
> index 98d2457bdd9f..92ba73bd0b62 100644
> --- a/fs/pstore/Kconfig
> +++ b/fs/pstore/Kconfig
> @@ -160,3 +160,67 @@ config PSTORE_ZONE
>  	help
>  	  The common layer for pstore/blk (and pstore/ram in the future)
>  	  to manage storage in zones.
> +
> +config PSTORE_BLK
> +	tristate "Log panic/oops to a block device"
> +	depends on PSTORE
> +	depends on BLOCK
> +	select PSTORE_ZONE
> +	default n
> +	help
> +	  This enables panic and oops message to be logged to a block dev
> +	  where it can be read back at some later point.
> +
> +	  If unsure, say N.
> +
> +config PSTORE_BLK_BLKDEV
> +	string "block device identifier"
> +	depends on PSTORE_BLK
> +	default ""
> +	help
> +	  Which block device should be used for pstore/blk.
> +
> +	  It accept the following variants:
> +	  1) <hex_major><hex_minor> device number in hexadecimal represents
> +	     itself no leading 0x, for example b302.

	     itself with no leading 0x,

> +	  2) /dev/<disk_name> represents the device number of disk
> +	  3) /dev/<disk_name><decimal> represents the device number
> +	     of partition - device number of disk plus the partition number
> +	  4) /dev/<disk_name>p<decimal> - same as the above, this form is
> +	     used when disk name of partitioned disk ends with a digit.
> +	  5) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the
> +	     unique id of a partition if the partition table provides it.
> +	     The UUID may be either an EFI/GPT UUID, or refer to an MSDOS
> +	     partition using the format SSSSSSSS-PP, where SSSSSSSS is a zero-
> +	     filled hex representation of the 32-bit "NT disk signature", and PP
> +	     is a zero-filled hex representation of the 1-based partition number.
> +	  6) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation
> +	     to a partition with a known unique id.
> +	  7) <major>:<minor> major and minor number of the device separated by
> +	     a colon.


-- 
~Randy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
