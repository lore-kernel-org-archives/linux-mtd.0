Return-Path: <SRS0=AizK=EC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186A6C4363A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 22:27:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B83207DE
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 22:27:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jfougn1S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="XhoKeqJ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B83207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RGChEhSNQB6AvDrwpKYc20Q8bIkJ7CreAX750dSVmbQ=; b=jfougn1SmXO561d0qeiMljFss
	I+DHRmEal/AjP0CpNnIGffs2CUkiuFXr8hDmffkhX0P1QOFEX/lpu1u9CWeq3B7VMSB295pf4jOEU
	ANkFTGuOBner379bYdKp2UBJ/RVgez7yIOxowjdC+PrC1VSff/q9ihNBCJkbS3obWaYZIIVjQkqND
	fdf+TMLZBESnSsc4SyOnTuktLEXeqv/wd4Z4BBrE8sf/VMTK9ZXG4O7R1atTm6k85UqsHYhewf8Z8
	/dl8adaqF7kx/+922YPJNedowhV30o/AqQrk/nOfqBMX+oWKNugLUk9avCJIJSwqoNf+T+xhnfmVw
	R0uZb5DmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXXQo-0001gV-FE; Tue, 27 Oct 2020 22:27:06 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXXQm-0001f9-7g
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2020 22:27:04 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DA4FB22FB3;
 Tue, 27 Oct 2020 23:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1603837618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhQZ6qZ9RvERhK0/FOn0nWDX9oV7/yBunnJMLi68+SY=;
 b=XhoKeqJ6fA6IxkZ1u6sclV1ef80OMhKM+xuDOu/2xwNgQC6Y6CCeny5Fn1ZIq8ntpx1lmd
 9o3HF3NpuDjPugWP30Q9P8xI/I7Y4Wx8+PFN0UK44e5fyEpljoqC8K3N4LScT3Qe8zjMlW
 DCxuO/bvFue2/6nFu16sCwO07xQhDYY=
MIME-Version: 1.0
Date: Tue, 27 Oct 2020 23:26:55 +0100
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] mtd: spi-nor: keep lock bits if they are
 non-volatile
In-Reply-To: <20201003153235.29762-1-michael@walle.cc>
References: <20201003153235.29762-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <babd96f5018d6081746aa9063ce21756@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_182704_395116_46D93E21 
X-CRM114-Status: UNSURE (   9.35  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-10-03 17:32, schrieb Michael Walle:
> I bundled this as a series, because otherwise there will be conflicts
> because the "remove global protection flag" patches modify the same 
> lines
> as the main patch.
> 
> See invdividual patches for the version history.

any news here?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
