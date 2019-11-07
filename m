Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E788FC6195
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 20:56:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 616832087E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 20:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LuC+jKYS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="VJ317FW0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 616832087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbKB7iiP66D6MmcslSDcpvpz5Pd1V+B1zIPoUwJU6hg=; b=LuC+jKYS8tLJfJ
	k64VC3PiER1z91hMkezq+Zy9OW8mtN2Q14rYGgQSOnJhyIbI20x4u0p7lF88sYJiKLQY6lasCKvtG
	wnf5VMLkeRhIVKx4Ma8Gtc6hEU0oiXn+KCtNV0EgHc0VCAzT8pJR/Wx6k4tWS3ieuLuOqNDtP1wTa
	w7Sxl2vGq2osTvo/aX2U12ENiRerV9/Zj9likPW6fphKo+mAWSIN46Mx4qA+Zn7zg11UXfhp7vL1q
	l0nLmDWtNDXQJQ7OpJAahEgdL/xELgDwfcBWg9zLnS78dnNyNw3xGAYaX/OfJNg8Gy+RIAekND62d
	+wuYy4HC3yZnQweSRuyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSopX-000507-LO; Thu, 07 Nov 2019 20:56:35 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSopT-0004zP-RT
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 20:56:33 +0000
Received: by mail-lf1-x144.google.com with SMTP id 195so2672714lfj.6
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2019 12:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LQ+QOfJUcCK4MSPSn3OaqVaWyffXdOvL39jYRU31DP8=;
 b=VJ317FW0z8Ba3vCoIL4z+27haBwLeESXyqW+q4Myj5YiWewdkbC6NMzkyX2h+jfew5
 PPdUU+VMzgmVF+Xq8hRM4ppO3gOZTNQpI0w7oVrqPszTU6duFxsys8P1HygXVRYgXAyw
 qU6cGfeHuHkVvOSVZvUyRfMmdYwY20qqKDLZDbdVw+k/a7SyOwahU/G3klvOD/xK9N5h
 YT66dgD2EVbu807WlFVtqUCq1KNcVK+M9jlb8yC6n8/ESTzoVbJU6KilgJI/32VqWuk8
 +ehn/6PY/vvrkrVeYLcVVV+zZWp98iUjWlquWBnkg2f7oEJ6MqAjhGybNJJ6N8E1Cbmv
 IhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LQ+QOfJUcCK4MSPSn3OaqVaWyffXdOvL39jYRU31DP8=;
 b=JyprqF3HliVDoFtEZ6fNFzuykGXKG3PWup18ImiEgLdwpPp+ldkNp6M4pPPQowgfCv
 TW0yGbcNn6c7UDhcGsyJmLHmcekLVCNuVidyHkTeQVTh50xJ5y+LBD1GSXiWip/pxBUC
 a4RZY5YiS3LtWGkjjtYawBKthfkBga/CHBNeor1eGWKIUDwN9PYQFsWpiZvO7I95i61p
 5gWOdZbHQSCrxK4CICdaxzWrlONb5Oh9HO5/bbgSaVOaJWMQ1xFoBYpH92ablzzYcoC5
 KOlV3ZNtdO7BzpCpbNxwX6PxMvaQmha32L055jyTElyNqY/0T+vS4B8yiw1/N74zG0Je
 VvQQ==
X-Gm-Message-State: APjAAAVV2P1LMd6SfkxeKgvDbHlxoT/z0fAwFTVqzbXkGnt+f/OLv3jf
 EVaMW9BAM8bKnZoSOvnulfxo8w==
X-Google-Smtp-Source: APXvYqyN6bS6Qr6QpGhPJOtFn0Rr24/nGWVM+V0iEuCFm8gX0CROtOZ03cC9QlgiZAImBSWfMqC1JQ==
X-Received: by 2002:a19:8582:: with SMTP id h124mr3901574lfd.64.1573160190205; 
 Thu, 07 Nov 2019 12:56:30 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4419:fb0d:268a:7979:ff08:4b0e])
 by smtp.gmail.com with ESMTPSA id r22sm1425425ljk.31.2019.11.07.12.56.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Nov 2019 12:56:29 -0800 (PST)
Subject: Re: [PATCH v2] mtd: spi-nor: use spi-mem dirmap API
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <ef173d36-c918-4636-ace6-f6ba82dac672@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <9bdf7c8a-64ba-2813-cfa6-4ec6638c0bc1@cogentembedded.com>
Date: Thu, 7 Nov 2019 23:56:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <ef173d36-c918-4636-ace6-f6ba82dac672@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_125631_888693_1F80F8E3 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/07/2019 11:49 PM, Sergei Shtylyov wrote:

> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
> 
> Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---

   Oope, forgot to mention the base. Was generated again mtd/fixes by mistake,
should still apply to spi-nor/next with only small offsets. 

> Changes in version 2:
> - moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}() to
>   spi_nor_spimem_{read|write}_data().
> 
>  drivers/mtd/spi-nor/spi-nor.c |  125 +++++++++++++++++++++++++++++++++---------
>  include/linux/mtd/spi-nor.h   |    5 +
>  2 files changed, 104 insertions(+), 26 deletions(-)
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
