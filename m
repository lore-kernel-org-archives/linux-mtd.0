Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB814C433DF
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 14:55:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7907A2072A
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 14:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="otMY+aIN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ri+G2px5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7907A2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z5SMQU70biE1NEDcdmVx1UFQXBlzT1aq8BxLS4NnfAY=; b=otMY+aINvlYAVY/RAaXa7lsYo
	3rOIaWR/jao9jVderrs7T2hYmhpxLwX657QqZmV5zFqRH75xw7JWycIv/HK1q3TRmYID1CAwGzNEj
	hZIdosmR7h1bXVb4gvmXuWCUHUdzsB1IU56ONBVu2AhBVkW6ymBpW6V6bosyDTLMJGYv6O5gQhDnM
	M3ZA/tNHjOdixNs3+xK9/+mDKe/pe3kU4sLrirkcFi3fNVM799+4xLubIsHKLtayQZEw8HYtd0kL+
	iZv1/WCzDYAmC4oRm6Oxk72B/oVgTj9skl8cJcKKc5MnJnM1oy8RtIhnr/KOesU9lDACeictpaEH8
	x7cSOyu+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2FNE-0002M4-R0; Sun, 02 Aug 2020 14:54:04 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2FN7-0002LT-HV
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 14:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596380035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kkoTewt7Fx4Q+2DDC1UGcR4JlqqtBcQK2oUP1r3rTc=;
 b=Ri+G2px5TAe5FeHVfcMJzEdsFXKpWPtbbAf/hPS73FK1f6FU3ZQlM15r3MOTvgOPne08l4
 0P9jqJc5vyA3gROc4fOot6fXxv0Ah+2KHQEgfkDWScibcOiaCCoEshuIDhE755qGOSyaN4
 UAJSXfoqHfNBZyeYXA8AztJxhIjmqAg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-QegjHyt-N2GY0LReBTnbqg-1; Sun, 02 Aug 2020 10:53:51 -0400
X-MC-Unique: QegjHyt-N2GY0LReBTnbqg-1
Received: by mail-qk1-f197.google.com with SMTP id c202so18736439qkg.12
 for <linux-mtd@lists.infradead.org>; Sun, 02 Aug 2020 07:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1kkoTewt7Fx4Q+2DDC1UGcR4JlqqtBcQK2oUP1r3rTc=;
 b=GJSYB8B50CPi/yezY1dXN5Y6F+bFXcKa5jQj6wmEHFv9w6jybmVY1EEAh4p4WMHMNc
 NtBKnpjxcCk9ZTZ+T6aSdzyjshbPZf3GSybsdEl2+1Lb2vsN+z/04ViuzvbfiFecGOFJ
 DENXx2xWv31d+fbvNwOVNUe2IkrKoRnP3qKgJQQiCNbjfOkNRv4lVEFmRBi6vqMBzUE8
 16U75p/eCQNU20mWyVHfup35FKRpS+cCrxYvb4550WsqUDn4TUK8+xTrFJo7/jQ1vkfS
 8U5mMb/tFctaYEyVoOFQi5hmfW5f6oqnAvcD+DYW57C10p8MVgNXB3puEgtvJV6fgmNI
 nYWA==
X-Gm-Message-State: AOAM532AsIDz5s3ybhfDddfQk+T0MyVI8h3zGwtiUYpKmZxhALrCKFps
 cSgRyvtzJX/bJkkDkSVD6dvFHyYKKV/eZMmUUJtkgyhOw6+vI0wZtqv8LQwwiUt1yVkpCH1uGT2
 BF74DCaehp149pCvRxdK8ujIRFA==
X-Received: by 2002:a0c:f007:: with SMTP id z7mr12711362qvk.53.1596380031292; 
 Sun, 02 Aug 2020 07:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsaj772ZR8xxDSmSbCv1i3DbzhNyKSnnIAtdh3ZvECGhzafck69cLoHqLTgfamrb5jJgzXtg==
X-Received: by 2002:a0c:f007:: with SMTP id z7mr12711349qvk.53.1596380031093; 
 Sun, 02 Aug 2020 07:53:51 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id t127sm16326265qkc.100.2020.08.02.07.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2020 07:53:50 -0700 (PDT)
Subject: Re: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
To: Borislav Petkov <bp@alien8.de>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
 <20200801125657.GA25391@nazgul.tnic>
From: Tom Rix <trix@redhat.com>
Message-ID: <6ecce8f3-350a-b5d5-82c9-4609f2298e61@redhat.com>
Date: Sun, 2 Aug 2020 07:53:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200801125657.GA25391@nazgul.tnic>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_105357_665369_8FC1CB1A 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-rdma@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Joerg Roedel <joro@8bytes.org>, linux-atm-general@lists.sourceforge.net,
 helgaas@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Wolfgang Grandegger <wg@grandegger.com>, intel-gfx@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 8/1/20 5:56 AM, Borislav Petkov wrote:
> On Sat, Aug 01, 2020 at 01:24:29PM +0200, Saheed O. Bolarinwa wrote:
>> The return value of pci_read_config_*() may not indicate a device error.
>> However, the value read by these functions is more likely to indicate
>> this kind of error. This presents two overlapping ways of reporting
>> errors and complicates error checking.
> So why isn't the *value check done in the pci_read_config_* functions
> instead of touching gazillion callers?
>
> For example, pci_conf{1,2}_read() could check whether the u32 *value it
> just read depending on the access method, whether that value is ~0 and
> return proper PCIBIOS_ error in that case.
>
> The check you're replicating
>
> 	if (val32 == (u32)~0)
>
> everywhere, instead, is just ugly and tests a naked value ~0 which
> doesn't mean anything...
>
I agree, if there is a change, it should be in the pci_read_* functions.

Anything returning void should not fail and likely future users of the proposed change will not do the extra checks.

Tom


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
