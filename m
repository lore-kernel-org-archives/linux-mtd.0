Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E0AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 07:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrrRHE0GehOXgeo4Aaf3yYbKic+NUZq//GubZxyuSi8=; b=rilJY9ojDLqsxjSG8yh5f+lHIQ
	wHiRLtubJeBYor/niWqhiI3w6542H/s/YKj8kuzitkC8291GkFaffL+HUchk96YbuhvozanUCxB2h
	gnTXd4kZ9xmULoo/1KTfhPgStN8qcK7vgc4X2dmJujeVr0yudTMgwq6CarsE4A1fIJXqIvCZw/1KS
	1zgLg7SvftkYlXWgx5uMbMuKRRJKPB7uC6cYLujtrrZ3/TQ1vls5tWCvCNS2a7oh7/gMvAP1CNAC0
	8JAzIuixyLTQDVlbR/3dT19/vYg55/KQY0D0+NFdHyeB3wuJQZEQ/wZJdH69xntOxNp/4hP7lG5iW
	6J4RHIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhFd-005mKe-JO; Tue, 19 Jul 2022 07:02:37 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhFa-005mFj-Bm
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 07:02:35 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id BCB73221D4;
	Tue, 19 Jul 2022 09:02:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658214136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skNvbr0j+hofl85iaW0RxTSkg4nCkrhF2c8S2PwWoOI=;
	b=o1dSZePGRZbzDk6KrzIUHkbRZAp5Dk2ol0SUVc2agfL0dYMs3F7HoxmZDqak/0Gdgg6W0I
	VtnvJnPHsoqndhE8wy7lK9GotFyrXWOVb36a9FXsR0YMNHMC4tZp9r3h7+R07Jue55zGdY
	QM1plMP8yV8CaJagu+ln5ZMxD+e6eDg=
MIME-Version: 1.0
Date: Tue, 19 Jul 2022 09:02:08 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: winbond: use SNOR_ID3() for w25q512nwm
In-Reply-To: <3e018ae9-66b0-0699-1121-e55c88f37570@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-3-michael@walle.cc>
 <735a88af-c4f1-a6b3-3f85-ea532b3f39c7@microchip.com>
 <305d3c9cf8a2362ad23a87f6ea92c6b4@walle.cc>
 <3e018ae9-66b0-0699-1121-e55c88f37570@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <4ac08f08010a71e288b0114fc02d47a4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_000234_611163_C5B56136 
X-CRM114-Status: GOOD (  10.42  )
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

Am 2022-07-19 08:00, schrieb Tudor.Ambarus@microchip.com:
> On 7/18/22 10:25, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2022-07-12 10:40, schrieb Tudor.Ambarus@microchip.com:
>>> Shaik, can we have your Tested-by tag on this?
>> 
>> Sigh. His email address bounces with "The email address you
>> entered couldn't be found." So don't expect a Tested-by: here.
>> 
> 
> Would you drop this and pick the other patches that use your SNOR_ID3
> and submit them all in a single patch set?

I can collect the other patches, but why drop this if we know
for a fact that the flash will work? (Because it is the same
as the w25q512nwq)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
