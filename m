Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AB9C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 08:27:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 374BF60F56
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 08:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 374BF60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yyr1yP3ul13hWpUCNVVY0j9dpPoaBNnU1u667EI8SEk=; b=cmPmg9fGK/BJN1
	y+/foRp4Tk0jbxSh9MAnuGbfKh9Mfx+6mx/D3OFO0UE+AcsT632x9e6E5HJtuUYmhwgulGDsIWxBM
	OSLhc1wqAUv7l/9Kt54nypYc02FDXJa0dyqkBIy0CivgCdCFzYH+gMxepoI0Y6ro4+QPAovXoj/Wz
	y+nImmxaDDBPk3eRkwM1/k409Em8uQlyPD2K2wjT81otkBfzpY2a3r1C4ufDd88tiFCizJ2YuGIfC
	Ztu33Qi+wm6xTQTULMGOkiQqrgD2ti81iadJZktYZ8/8b0mw9DgdkLBy1zF5j0DjVu1jKJwREmFPT
	kxpeqm+hGZ8FZaTEHe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbIY1-005yv4-0a; Fri, 15 Oct 2021 08:26:37 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbIRt-005wXX-0N
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 08:20:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id z11so37110175lfj.4
 for <linux-mtd@lists.infradead.org>; Fri, 15 Oct 2021 01:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=Yb3HRm3oltP3XN7Taes5SxDk4wxAVFugt/p8AK8wgzs=;
 b=K+UoKmUZl3LD1tzbci1tODI/iS9OAxFRbSNNe1HnFh9chxf9M1Ow63WxXxe4Pa6+Hd
 mD4QVe/+ovtWZQDe4avouXINgZ3VsgE1mjaIiyrdmRH7qRyTgIUf7jv9rM39Bp+aS9z7
 52P+804g9Etn/0cBHNctewEyQm9lKrnXbWdi4Wv0UMywCp+M2buTx2G8gRDqaMeRnB1b
 GUy5pamHAkroDnRI6eVVU7dH6drYX2s2SaoVr6rEb/uC+st7OeKwoJUX30H8TWRS+cts
 Lm41/UhVs/SwxpXjLM92RZPBxZjLtf5kr5y8WxOigw9XXR8u+OMhy4o51sJwJ4/ka2Bs
 Jkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yb3HRm3oltP3XN7Taes5SxDk4wxAVFugt/p8AK8wgzs=;
 b=coHDGCVCunqSf7FAc+1MlQ3RsDzbRFEArh0u6xKJH3AremzvRgVVmjS2TociseVaK3
 axoXLQXRj89ZSJiJ0v7swaB4O6eS+lZWYpeBzzCCnsEWhctWnh7ZGccKJ1/W+g50PfzK
 np1woHx5h+ab/GcWvQlszhIgne02BriKwyI9UsDcAw17uzo1yKiacO/6wB3a6+k4AS0B
 lrwbJdid6dhvnMoLUMEMJS1OBncf7Ns6UGoTMFSx9MWfWiULW9kTQGEJxiC5TeuXxOh+
 8iLm4IkH9YANYooJtfNV8Ey8kCdF3KDRvE8mPXsZ406AWPefNjuKqr6oSkO0Ji/CMhnr
 R25Q==
X-Gm-Message-State: AOAM530LIkves+n3o0Qg4p6nl9/nWXKHmRbKUc5BgTgDZ+bKPDyhr9YT
 098JCpb8KfH/LBcxYrr96kDMd1WuWnc=
X-Google-Smtp-Source: ABdhPJx+MvNfzbsbRhDUhkBZZhohsDMc1q4txWILKVW5xKXb6c/kvA9oZJmVbGvNCKbyrvVcUFY7TA==
X-Received: by 2002:a05:651c:24b:: with SMTP id
 x11mr11237016ljn.272.1634286012430; 
 Fri, 15 Oct 2021 01:20:12 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id s17sm479927lfe.10.2021.10.15.01.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 01:20:11 -0700 (PDT)
Message-ID: <c28ba2f5-cfd7-aef4-526d-bf0679298b5d@gmail.com>
Date: Fri, 15 Oct 2021 10:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: nvmem: Defining cells on mtd created by mtdparts
To: Sven Eckelmann <sven@narfation.org>, openwrt-devel@lists.openwrt.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Michael Walle <michael@walle.cc>,
 Adrian Schmutzler <dev@schmutzler.it>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org
References: <18728084.NGlc0Rocea@sven-desktop>
 <14722734.oMan5NXi5u@sven-desktop>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <14722734.oMan5NXi5u@sven-desktop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_012017_150114_58FA4D40 
X-CRM114-Status: GOOD (  15.96  )
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

On 11.10.2021 09:06, Sven Eckelmann wrote:
> On Sunday, 10 October 2021 14:53:13 CEST Sven Eckelmann wrote:
> [...]
>> Since there are most likely more devices out there which use mtdparts, I would
>> guess that there might already be a strategy out there which can be used to
>> define the nvmem-provider for mtdparts defined partitions. At least I saw that
>> Bartosz Golaszewski added all the mtd devices automatically as nvmem provider
>> in c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem
>> API"). So there might also be something for nvmem-cells to find the correct
>> mtd instead of relying on the fixed-partitions registration + of_node (which
>> doesn't exist because it comes from mtdparts and not devicetree).
> 
> Ansuel Smith just proposed in OpenWrt [1] a workaround. It basically adds a
> minimal fixed-partitions parser to the mtd cmdlinepart parser (responsible for
> the mtdparts=) that tries to find the matching (size + offset) fixed-partition
> from the devicetree. The code in mtd_device_parse_register
> (add_mtd_partitions -> add_mtd_device -> mtd_nvmem_add) will then
> automatically take care of the rest.

I like the idea of connecting cmdline specified partitions (mtdparts=)
with DT. That will help devices that use DT at least.

One thing I'm not sure about is criteria. Ansuel in his patch
[PATCH] drivers: mtd: parsers: add nvmem support to cmdlinepart
https://gist.github.com/Ansuel/35abba1f5663ea3d9bd8eded01e8d95b
requires a matching name, offset & size.

I guess above may work for partitions that stay static like a
bootloader. What if someone wants to describe more dynamic partition
(firmware?). Should we reduce criteria to allow matching just by a
name?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
