Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED0FC433DF
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 18:28:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9752065E
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 18:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+YtzHT3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtJLT8D3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9752065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DlbDPayIjWqvDeudJXpdxMz8oaGhZHkhn41ZdX2PSoo=; b=m+YtzHT3Mf2PZ13wWTUJdS0y5
	JKKyMCyYVc1BY0pgDXASPpA3yFWy4wMrAVJoJ9gTF9dgRvwuGWzWAYgrF3U7joY+BmSKfg90WF7c1
	49JkguVfLwkaT8p4HUbvPEpUURzrwBgQ0wTsTso6i40US/7OBsPA5zdAt9+9J9mcRisGbpUxQ/7BJ
	hGsdnzG+WlByhOxbTe6GOcmCm/DymhL/gpabePymwy8on1vsY3rxuyNGvH1sM9tEl8myDAwPY2WGz
	7t9J0dk7Vq3RVxMRADvhGex8t2tKCOVkySrDYsraAYBQuqMuK3G+sGwRfv46iyKlws88QWxnRr3nw
	Rx8XAq4cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Ihu-0001yk-Ft; Sun, 02 Aug 2020 18:27:38 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Ihs-0001y4-K1
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 18:27:37 +0000
Received: by mail-ed1-x542.google.com with SMTP id m20so16213812eds.2
 for <linux-mtd@lists.infradead.org>; Sun, 02 Aug 2020 11:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ec+QZPQt4BI+HNScgjvbhAWx5U5Q2eYvCkS354frzh0=;
 b=YtJLT8D3c903d3hsfGfmpRep4DyZJhzRytGWo/UssPWnsu4TDB7JZAkT1sTJMmJUH+
 bq5rDlN4QtT+Xdj0JNzjtQ2QqTr2pVyC4JOlcnf9bRRCSyXgovVOl9FdgJQfsiPfkKzY
 DWsX6GX1lxDOlwpnwJCtIh+GQ6RZkI/pzRvVJxUc5FGTjx+jay8s+7hZFlw796rU78Gc
 7K1ApoysPqm8FRM+jQOGIRHengeFZ6xNP8mOw9mf8ONnQV8kOLpUVEJO7EpYgXqjQKbR
 ZXY6Otij2DqA3PujrgbIOxTi9tcd/lHDFFPdppv1+HoL/eGjvY6ERK9eoJvC1OZ061lc
 FmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ec+QZPQt4BI+HNScgjvbhAWx5U5Q2eYvCkS354frzh0=;
 b=L1hT6vRUttxJZyEMcEzLoDnh0S08++9cj+OYHpJSjxIy2mzWQj8rlIjBiNEvv2K35a
 hc1YyKtBw2pz3zo1bS/X8zujKYZw0dGSS/sHXrKjXXQJGhj3LYbdU6Y79ZNV0wCxAW7f
 hgBTmkx/jJTgKXf7vRGeUcQgJt8MNQaTvOYh2/FBH6P4u4coZo1I77kWobEx+PM1M1vo
 oNBWQa3nBRHF8y05JFFdhSifOkWmY8DzHILCAzwRzpotrDXcp2spHq5vuU4I5dccNdaq
 EgUT0ilrMEJGyQlg3hUmQNCoGjvbXlrseP3roy8Bwvuc94yEs0bNcB/XqK3QhFKWiVs2
 ElLw==
X-Gm-Message-State: AOAM531/D/wJGp/qFljIIGaSaznzAM0u2hWMUB91StrFtJC+3QLNiq71
 ycKWWRGhFnnenZy2mSv6oGM=
X-Google-Smtp-Source: ABdhPJzPSVl/d4yXQb9tARqdTsGpw8tzteKDCnrRiPQdt2yWNobLwsKDJ8Loc5jmq7ZA1MaLrCqHCQ==
X-Received: by 2002:aa7:c9c2:: with SMTP id i2mr12251380edt.326.1596392853909; 
 Sun, 02 Aug 2020 11:27:33 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id b9sm2015326ejz.57.2020.08.02.11.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2020 11:27:33 -0700 (PDT)
Subject: Re: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
To: Borislav Petkov <bp@alien8.de>, trix@redhat.com
References: <20200801112446.149549-1-refactormyself@gmail.com>
 <20200801125657.GA25391@nazgul.tnic>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <b720aa44-895a-203b-e220-ecdb3acd9278@gmail.com>
Date: Sun, 2 Aug 2020 19:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200801125657.GA25391@nazgul.tnic>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_142736_720215_69E04C8F 
X-CRM114-Status: GOOD (  18.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 8/1/20 2:56 PM, Borislav Petkov wrote:
> On Sat, Aug 01, 2020 at 01:24:29PM +0200, Saheed O. Bolarinwa wrote:
>> The return value of pci_read_config_*() may not indicate a device error.
>> However, the value read by these functions is more likely to indicate
>> this kind of error. This presents two overlapping ways of reporting
>> errors and complicates error checking.
> So why isn't the *value check done in the pci_read_config_* functions
> instead of touching gazillion callers?
Because the value ~0 has a meaning to some drivers and only
drivers have this knowledge. For those cases more checks will
be needed to ensure that it is an error that has actually
happened.
> For example, pci_conf{1,2}_read() could check whether the u32 *value it
> just read depending on the access method, whether that value is ~0 and
> return proper PCIBIOS_ error in that case.

The primary goal is to make pci_config_read*() return void, so
that there is *only* one way to check for error i.e. through the
obtained value.
Again, only the drivers can determine if ~0 is a valid value. This
information is not available inside pci_config_read*().

- Saheed


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
