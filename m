Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420A4C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 18:23:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70CB65114
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 18:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70CB65114
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sUU/61oGKUhsNRaru3tHeV5Ij0fUexDgcDDm5xq93Eo=; b=kXVTdemZTExcBf7pA62NaeO7t
	wO+qQjk0RD2Q/zN6yg2k4cWw9WIVbXy9FYJE/fUbfbt+vHn/ddphReZpiWCoVXBrpqal+S1j9I4Vs
	/FQg1qRR5Ym6090zGoTaL8VhyHgs9XefX2TcPAnsFLDP1B/mZ8/s399HSPQSPexNmbeotTuG2lY0B
	8rhTGHq9ajTc0svMUIiqWRf015zrNoTZAYX87lRF6Kzb72rjDqQOTkriQlEo20wyaE1z9Tpee+DqQ
	Ld7m+QVZ1Mzwi+IyM1do04SizH3CwfbFIhUMwVqREE+M2fpx/0SNStX0JW0CEjvXRet9/PiXSo4xv
	qiB7o2AOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMELO-001bqz-Lg; Tue, 16 Mar 2021 18:23:04 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMELJ-001bq8-5R
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 18:22:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6C16022238;
 Tue, 16 Mar 2021 19:22:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615918976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6lxzdYWjc5HQ4RAtVvQYiQ7satUE+Bd1YcmCxWTW9M=;
 b=cGzi/3+3BIIcYMVEgjfjfDvy6Gk5lzjULHA6cEiaoUwz0QPbk6UCslKYwhFI7sZ2CDzku+
 bUkvlIix7mHttd5UxyEZKPWvQUc4eex1XcWpPEVotc44gqY/yTdoKquHnM0W4QLTlE22r0
 bFo71eWQknIVV00g07JrqYeyzce2q/I=
MIME-Version: 1.0
Date: Tue, 16 Mar 2021 19:22:56 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Kuldeep Singh <kuldeep.singh@nxp.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Vladimir Oltean
 <olteanv@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: spi: Convert Freescale DSPI to json schema
In-Reply-To: <20210316180655.6oidvffum7yuwknr@ti.com>
References: <20210315121518.3710171-1-kuldeep.singh@nxp.com>
 <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
 <067c42f3726578ebe60d201a141dfdb6@walle.cc>
 <20210316180655.6oidvffum7yuwknr@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <97410b24785492f9e80999dd7a1ffdea@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_182257_345930_9E44D22C 
X-CRM114-Status: GOOD (  10.29  )
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

Am 2021-03-16 19:06, schrieb Pratyush Yadav:
> On 16/03/21 06:45PM, Michael Walle wrote:
>> Am 2021-03-15 19:30, schrieb Pratyush Yadav:
>> 
>> ..
>> > > +patternProperties:
>> > > +  "@[0-9a-f]+":
>> 
>> Shouldn't this be "^.*@[0-9a-f]+$"?
> 
> The pattern has to match _anywhere_ in the string so both should match
> the flash node. Your pattern is more "strict" or "precise". See the 
> note
> at [0].

I know, but specifying the whole line is widely used in the bindings.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
