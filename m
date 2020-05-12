Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3305EC54E8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 05:48:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0239920733
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 05:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RQmxuooT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0239920733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Txui5FaGbDXQGNIj05WLKGVmmnGQdsueeTCu/APWVbI=; b=RQmxuooTgoxibO
	qxoSMum3xdMsH3NPmKyK54U6gNdUfIWDxrz6jlO/dZVR2VXKlopx16/V+2MWxyAQ4Q8mDNFMWh0fD
	rHnz/H272eGjHbYuEn9Ut0cZMmZfmDqZKIbfT/DoWThOmxUaWO6edxk9JH5mMi4rFmT3BRKITWMf+
	JCPTjKSrzudWhRs8bWFhqqId65pEBe1ZwrWt4pbui3wMYnp1v8EaW9JkMJ3wNBAuMiT8yUMwYTRX7
	T3H0LZOVQ+HudREwQi8mZDyNGiAbANHhqI/phO8RBkjmYeIGzupn0yqvHrZzUQRi4yrEwF0ybGDWb
	4i16kSRltyeLaxMpQ3Aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYNlm-0001bZ-T7; Tue, 12 May 2020 05:47:58 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYNli-0001aK-Gh
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 05:47:57 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.074523|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0724473-0.00134074-0.926212;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03301; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=12; RT=12; SR=0; TI=SMTPD_---.HXEAwpL_1589262465; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.HXEAwpL_1589262465)
 by smtp.aliyun-inc.com(10.147.44.129);
 Tue, 12 May 2020 13:47:46 +0800
Subject: Re: [PATCH v8 01/11] pstore/zone: Introduce common layer to manage
 storage zones
To: Kees Cook <keescook@chromium.org>
References: <20200511233229.27745-1-keescook@chromium.org>
 <20200511233229.27745-2-keescook@chromium.org>
 <a9d47bf1-7498-1d07-a943-29dd0b0ef2e1@allwinnertech.com>
 <202005112212.2E75B83@keescook>
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Message-ID: <57efa2b5-d598-a600-5f74-8fd81299fc58@allwinnertech.com>
Date: Tue, 12 May 2020 13:47:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <202005112212.2E75B83@keescook>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_224754_742324_6978ED5E 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

hi Kees Cook,

On 2020/5/12 PM 1:15, Kees Cook wrote:
> On Tue, May 12, 2020 at 11:55:20AM +0800, WeiXiong Liao wrote:
>> On 2020/5/12 AM 7:32, Kees Cook wrote:
>>> [...]
>>> +struct psz_context {
>>> +	struct pstore_zone **kpszs;
>>> +	unsigned int kmsg_max_cnt;
>>> +	unsigned int kmsg_read_cnt;
>>> +	unsigned int kmsg_write_cnt;
>>> +	/*
>>> +	 * These counters should be calculated during recovery.
>>> +	 * It records the oops/panic times after crashes rather than boots.
>>> +	 */
>>> +	unsigned int oops_counter;
>>> +	unsigned int panic_counter;
>>
>> oops/panic_counter is designed to count the crash times since the
>> linux kernel was installed. pstore/zone lookup the max counter from all
>> valid kmsg zones when recovery and saves them to oops/panic_counter.
>> However, they are unable to get real number if we remove files. It's
>> not serious, we can fix it after this series.
> 
> Since the kernel was installed? I don't see a kernel version check in
> here? Or do you mean "since ever", in that it's a rolling count?
> 

Yes, "since ever".

>> And since pstore supports "max_reason", should pstore/zone count for
>> other reason?
> 
> For now, no. I opted to try to keep this as simple as possible a port
> from dump_oops to max_reason for now.
> 

OK.

>>> +static inline int psz_kmsg_erase(struct psz_context *cxt,
>>> +		struct pstore_zone *zone, struct pstore_record *record)
>>> +{
>>> +	struct psz_buffer *buffer = zone->buffer;
>>> +	struct psz_kmsg_header *hdr =
>>> +		(struct psz_kmsg_header *)buffer->data;
>>> +
>>> +	if (unlikely(!psz_ok(zone)))
>>> +		return 0;
>>> +	/* this zone is already updated, no need to erase */
>>> +	if (record->count != hdr->counter)
>>> +		return 0;
>>
>> These codes is to fix bug that user remove files on pstore filesystem
>> but kmsg zone is already updated and pstore/zone should not erase
>> zone. It work for oops and panic because the count number is increasing.
>> However, it's useless for other reason of kmsg. We can fix it after this
>> series.
> 
> Okay, sounds good.
> 

-- 
WeiXiong Liao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
