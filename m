Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071DDC07E95
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 13:18:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B56AA613F5
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 13:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B56AA613F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GjZUC+H8yTHhESdT3uQsHMCvfpqsz045n3zloY/IRdw=; b=BFjHMg8JVLy1TFrVy5F17p3Nwm
	aRLw4b92FhMueCP+VBGax0ZIDEUS2puIFIglw9ChGDBdmLeBsHXF25VVaHYZWTbmwk366m+GlezOm
	RPPI5NaWsi1YSvOmG3H3+bc0LZ//O3JnYudA15GQq9br2PwjGTEMRL4gxfFZ0R/I7sQnlroV+sjmj
	SxTJN8N9DhCUlnSOUZoZV1YdYUqqgQfaxc3BvLtu9Ev6MaQaQtGsRafK9KG5QJ8oizClK+nDHBgau
	6wbKLjE7E6/kcmZWWbrbS4NH7Nb80NzQa6g94xvwfZsr7pjRoqdF2BwCJLe+MjAz2glD45qHvhJPe
	SxXHCRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4NiN-004RD3-C6; Fri, 16 Jul 2021 13:17:15 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4NiJ-004RBd-Sn
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 13:17:13 +0000
Received: by mail-oi1-x232.google.com with SMTP id t25so10797154oiw.13
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jul 2021 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gS9kOJpcGK76eRo5Aofr06uYyb4BuGzYuKkE7nL44x8=;
 b=GrYNadcR5amCn2iDHt4hMO2O2LQIQzTsyizX7WVUE9JxK3q7CCJNaimFjmWm10aBwj
 WVSUXw/xBLVkWh7fNyh8PHc74VAYtjeMna7Dm0NdlClt8x0vFU7u7ydFA/lzjmQ3UYYt
 BPotPlxKSql8X2+bKqRqVE9zlfM/wF7hX8O7BX/XyMxsGFrdAC2nNjCigRJBNXCq7agO
 0ro8a/61pJCVPZNZ2IbpVNS8BN3KyHWJHjNu1YEGIlxDlv/hmHG/nh+ldkrjcCpmBhb5
 ySMyCdQegMuFWjFljwohdZVvr5kngrY0h7nINLfiusJjvrg+2bz16C7SF5gHrWRKDpBA
 UOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gS9kOJpcGK76eRo5Aofr06uYyb4BuGzYuKkE7nL44x8=;
 b=JZW/nE+BPfHWqKvOh0mONlF1edYtzizPl2VC1v0RPa6Mk8TBJg/8dJIGoRH2HA58yo
 XjkFJDgY/bKndf1+l7qmNoO/DgdDS1HqLYAf9DRM4IoE7otysr9U68B067oYUrUAUmmE
 A4pU/FsHuUwZzXcNKcZhQzEALacfVLsu/tp950MK/36GDd7Axpkvbtsqn6P4W/e6jWJQ
 E9QZOdOolsYllkDyLrk1cgHDLMWPeqqpNtvVqacaIZM2YrSZLJS+H4ln3ezXcARGGGiN
 vxyCBiGsYVctzT6Fp1ARRLhZNFID7vKHNQEcwxkOgN3LsigwLqx11drVChXQ0kwgVdme
 nX4g==
X-Gm-Message-State: AOAM533rxLh6MzL0eD+mX4SoBROYBaoy/ePzosdwbnnYqMHVwA22xryh
 0qzixhMzcxbKalS0znzWpLnK8A==
X-Google-Smtp-Source: ABdhPJyCnbfm9K3k3TkPCw3E0oHuQpDTPd9rqx/ncyn2f8DYEnq9d+jlXtztU1J0SjkpBvc9pLN8Ig==
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr12079068oig.58.1626441429627; 
 Fri, 16 Jul 2021 06:17:09 -0700 (PDT)
Received: from ?IPv6:2607:fb90:e658:f352:6680:99ff:fe6f:cb54?
 ([2607:fb90:e658:f352:6680:99ff:fe6f:cb54])
 by smtp.gmail.com with ESMTPSA id a7sm612997oti.47.2021.07.16.06.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 06:17:08 -0700 (PDT)
Subject: Re: [PATCH] mtd: fix size in mtd_info_user to support 64-bit
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Miaohe Lin <linmiaohe@huawei.com>
Cc: richard@nod.at, vigneshr@ti.com, David.Woodhouse@intel.com,
 Artem.Bityutskiy@nokia.com, ext-adrian.hunter@nokia.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linfeilong@huawei.com
References: <20210708131359.21591-1-linmiaohe@huawei.com>
 <20210716010224.44582046@xps13>
 <95e3d455-ccb1-0e22-ee83-78dc6ad8aab1@huawei.com>
 <20210716114808.246e92ba@xps13>
From: Rob Landley <rob@landley.net>
Message-ID: <f7f55c5e-f6b2-542c-66d2-20f4d88bf669@landley.net>
Date: Fri, 16 Jul 2021 08:34:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716114808.246e92ba@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_061712_031844_CC7A38B3 
X-CRM114-Status: GOOD (  13.80  )
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

On 7/16/21 4:48 AM, Miquel Raynal wrote:
> Hi Miaohe,
> 
> Miaohe Lin <linmiaohe@huawei.com> wrote on Fri, 16 Jul 2021 09:42:19
> +0800:
> 
>> On 2021/7/16 7:02, Miquel Raynal wrote:
>> > Hi Miaohe,
>> > 
>> > Miaohe Lin <linmiaohe@huawei.com> wrote on Thu, 8 Jul 2021 21:13:59
>> > +0800:
>> >   
>> >> From: Feilong Lin <linfeilong@huawei.com>
>> >>
>> >> The size in struct mtd_info_user is 32-bit, which will cause errors
>> >> when obtaining the size of large-capacity MTD devices, such as TLC
>> >> NAND FLASH-2048Gb.  
>> > 
>> > Besides the fact that such devices are far from being supported by the
>> > Linux kernel, this change would basically break userspace, it cannot
>> > enter as-is...
>> >   
>> 
>> I see. Many thanks for your reply! We're working with these large-capacity
>> MTD devices now, any suggestion to work around this?
> 
> The only way is to create a second UAPI.

Twelve years ago a patch was submitted to add a 64 bit MTD api:

  https://lwn.net/Articles/326418/

But for some reason they only merged 64 bit erase:

  https://github.com/torvalds/linux/commit/0dc54e9f33e2

But NOT the rest of the 64 bit mtd API in the same patch. I've never understood why.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
