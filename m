Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527B0C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biRdqVr+HBN5+AsPf+5ZBa699DSrUMGyN/Kb/6qf2w8=; b=0njnVlXEtbx3txIDhTGdrHb/2d
	SMjzj/05I1xP3dEk7miNUHu7L5lnRrsUDcDOAOjImIFz2YKOzw15Jv8jjIrJztYrjUxjK9E/Iz4/d
	ZXD4c/jKOjODRkOzyjjMbZ9vMCKQoCj4uhuqliFsgWOZbp7KJSqPF2FbS97qPyCUlBO5h90k0O1Au
	xDB1TqSud6QvV9tpxjGYYxo1FRpS5ndLo9Kvm4Wk5bX3x4StfCW5uXsRwUZSDOH1fzp08WsJ3J5Fr
	xi8cpoifvCDEmYpP2bncJnZRjiCsXBqaMA0HT5Xtdrg7un1nZSDn5QjUherBf7RnUMzGnehWQuFPt
	9uE6VUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESmu-003Uhy-21; Thu, 21 Jul 2022 09:48:08 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESmr-003Uex-Uu
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 09:48:07 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 2165622175;
	Thu, 21 Jul 2022 11:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658396882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AofoZ+Awy4KTTKs9IfzgAqyAOXi1iBgYwBCmm4WFRPs=;
	b=dlLztd5srxat/ijNxxPXIYfY+0NC6DAtlpp/3+6XbPqmj2TJjWl5kVZAdhnPxqHaYIub0n
	F5vMOeR/ICItBFd2kXbai14WnR56BwzHOmNsH6TW9qz9uYYI7AkT7VX+e3MKuRHKcm+xyc
	38VqytfQSE0uKzWWrfLrq1X9OCDkJoQ=
MIME-Version: 1.0
Date: Thu, 21 Jul 2022 11:48:02 +0200
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, p.yadav@ti.com, richard@nod.at,
 tudor.ambarus@microchip.com, vigneshr@ti.com
Subject: Re: [PATCH 5/6] mtd: spi-nor: add generic flash driver
In-Reply-To: <202205132220.uRTFaqNA-lkp@intel.com> (raw)
References: <20220513133520.3945820-6-michael@walle.cc>
 <202205132220.uRTFaqNA-lkp@intel.com> (raw)
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e6b22ad3b427770625aa56a4fe700e5c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_024806_197283_08C81F82 
X-CRM114-Status: GOOD (  10.69  )
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

Hi,

>> +
>> +	/* Fallback to a generic flash described only by its SFDP data. */
>> +	if (!info) {
>> +		ret = spi_nor_check_sfdp_signature(nor);
>> +		if (!ret)
>> +			info = &spi_nor_generic_flash;
>> +	}
> 
> May be this can be combined as
> 
>  	if (!info && (!spi_nor_check_sfdp_signature(nor)))
> 		info = &spi_nor_generic_flash;

While this is the behavior, I don't like (1) calling functions
in the condition and (2) rely on the && and || semantics, i.e.
to just call the second part if the first is true/false.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
