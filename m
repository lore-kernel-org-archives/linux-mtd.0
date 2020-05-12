Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987F4C54E4A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:45:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DE91206CC
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dCbHGGPI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DE91206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6h4hkTLmBdrCAMuQMssYPSsLfmybUQRxjZjWZbh374=; b=dCbHGGPIT3WFzv
	Dr4QAREbK6fua0BXDAJTAUmy45J/4bA8g4IhcuZCEkOuI9bWu4nAQ60CPoaIZqlT1f0kFnpSyrpZF
	++lUijWttqX0UkSCZMP8l3uX/6N1v41ISaJRlM8SkERq6p9zNRtTH5O00CLKQh/sA+5tONFaUeoc1
	8slVWi5Gg13Py4rc6lYfn7R7QefDEbmY0pjsuufgqgbvnHwovh3O6HC8kfAsn3foOPOzBYpRvBGG3
	yQxwhCIr8R+6t2ZoG4/3UIFyCYauVwgSohiIiS6i2dtNYto1guPVrb9c/4gi778C0EY4v2gjk56Zf
	8no2mvcjuFm2ZMUgQB4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYQWz-0005YM-Ay; Tue, 12 May 2020 08:44:53 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQWu-0005TM-Sk
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 08:44:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6006ABC7;
 Tue, 12 May 2020 08:44:46 +0000 (UTC)
Date: Tue, 12 May 2020 10:44:42 +0200
From: Petr Mladek <pmladek@suse.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v7 07/18] printk: Introduce kmsg_dump_reason_str()
Message-ID: <20200512084441.GD17734@linux-b0ei>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-8-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200510202436.63222-8-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_014449_102420_9D3B7D12 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
 Steven Rostedt <rostedt@goodmis.org>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun 2020-05-10 13:24:25, Kees Cook wrote:
> The pstore subsystem already had a private version of this function.
> With the coming addition of the pstore/zone driver, this needs to be
> shared. As it really should live with printk, move it there instead.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

I looked only at this printk part and it looks good to me ;-)

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
