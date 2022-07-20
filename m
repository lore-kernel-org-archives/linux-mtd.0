Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3706EC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jul 2022 13:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAIkFnl4ykmWxBsxjg0mCCGcF4ULfBb89S2hEGVA9PQ=; b=K3MJIs1c4WP671ypHYBjVZMZbI
	ZFPsR36rdfhdRbyyY08JtY9Nh95TVTuAid7ZnkHTDwEGFRLcJfotgz+fJFrhj/fXG3Pih8+VerSXb
	EDGHc8ao+2U6nFk1N/FLgGjea898NlXEVxQCJqzDKRHKPghLBBN+m3VgiIxkZh2bVElmWOBxCHAHY
	814HPYCBANj82Jpn2jrrKujxQPNlQ2D3vCCZctPgcbmRmm7XDZCGpniVLY9q0BwTt5qMQFxRDfNj3
	9Ri6t10kj96D4YF5RrxGR0LbfhX4e1XNC/0k/GdPqZHtX5KKmwrutu0vqXw2xYcYNU4l/qidGc2u8
	hseqvkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA4U-006Gi6-TH; Wed, 20 Jul 2022 13:49:02 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA4S-006GeI-Ou
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2022 13:49:02 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 5FC752223E;
	Wed, 20 Jul 2022 15:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658324928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SDELbFZivHkdGyHGF1nop4U3jMBC/a0ONji2ciT+Qc=;
	b=FcfZdyDefl/Euo7ImCUcqieYhONzoiD2qLyGJh5kPiPNtfzkEB03vTNFgxrGMtsRIwWbuH
	JraLrzdm1V6pCcJSrb5biunhS+MokJDcTYNYiTDcvt7oKVyo6RHhO69AX8Nb0saEk5LT65
	T853AvIgyG+uP0L8HfSeQD6QsLiAStQ=
MIME-Version: 1.0
Date: Wed, 20 Jul 2022 15:48:41 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, heiko.thiery@gmail.com
Subject: Re: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
In-Reply-To: <43041ef1-2b1b-5729-9611-00964d617f63@microchip.com>
References: <20220304185137.3376011-1-michael@walle.cc>
 <43041ef1-2b1b-5729-9611-00964d617f63@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f86d847fe61bbcd832c64ce1d636774e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_064901_021500_47A62B62 
X-CRM114-Status: GOOD (  16.80  )
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

Am 2022-07-19 06:57, schrieb Tudor.Ambarus@microchip.com:
> On 3/4/22 20:51, Michael Walle wrote:
> 
> Hi!
> 
>> While the first version of JESD216 specify the opcode for 4 bit I/O
>> accesses, it lacks information on how to actually enable this mode.
>> 
>> For now, the one set in spi_nor_init_default_params() will be used.
>> But this one is likely wrong for some flashes, in particular the
>> Macronix MX25L12835F. Thus we need to clear the enable method when
>> parsing the SFDP. Flashes with such an SFDP revision will have to use 
>> a
>> flash (and SFDP revision) specific fixup.
> 
> This is equivalent to clearing the default QE method for all those 
> flashes
> that support SFDP, with implications for those that support SFDP Rev A.
> If I continue the logic, I could remove the default QE method from
> spi_nor_init_default_params(), but I don't think I would like that.
> You could use a post_bfpt hook without explicitly clearing it here.
> 
> Would you please explain more why is clearing the default method better
> than using a wrong default one, and why you chose to do this just for
> the Rev A SFDP flashes and you didn't include the no-SFDP flashes as 
> well?

Honestly, I don't care too much about this flash. I can't remember
any details from this 4 months old thread. Sorry. I guess it is
fine to drop this patch. If someone cares, she or he can
resurrect this one.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
