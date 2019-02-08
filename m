Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB336C282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 17:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7227B2146E
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 17:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ER6WFWFZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOivv1lK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7227B2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zwfcm3NCOdNrK6CkbBxRQh05/7lBcEhX2KWM//x3k+c=; b=ER6WFWFZ38FXAE
	LvexXd3XrrVkkuiD9e8vFBd0HflZ8hKYX9186rrduq/QnwAD6oZjec/9fRvSTVPc15/oMgP/C7GBT
	GSmTk4k9v9uBR+7lzuJGza8vCA36xWRT8sPpWWdWR2DAUeoCnxa+l7pTnuYZbOEBaaTnkbUa8/g7E
	DDlpa0rKajN8WFfyJL5vLGpm7WTvGQwRPws1sv8H6JeLK9DKUPjLoN4Zvsoy0NXODoLZzsqhxgUr2
	6ufJyfWEiFuGwvUURvu8XcXROGZne295bYX/xAjxm5tLa4irHE906r0qYeAUqwSeCQqUXOl0smtMI
	JAHtSkl/FH5z6zn1VGpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsAFQ-0000sa-4r; Fri, 08 Feb 2019 17:47:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsAFN-0000sE-Ia
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 17:47:30 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 523E620863;
 Fri,  8 Feb 2019 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549648048;
 bh=Ns0tZd6nUG6qgOrC9SKATuDtr+8z5jEZ6t4Q4cUP2Gs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sOivv1lK7p0qJ2edQkL6F2c2ox//xnh4kCBNV92Yx5uYpa4EFN/X5Gn4ZqydtAjwx
 GwvYbtB05Omm1wMXDCyvNOlFVDT3uDRrhJcZxpvGh95KvJ/Q51S4FmBazBLWILc135
 VHGi00v25AEU3/BzP46w2FX0xfcNzglQmbho2/BA=
Date: Fri, 8 Feb 2019 18:47:18 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] Re: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
Message-ID: <20190208184718.3c488d0d@kernel.org>
In-Reply-To: <BYAPR08MB4533DB0A7F4E30543750C83FDB690@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533C8EA6B775C7514FA7F82DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <298d18cf-094b-d5d0-45d1-39c7b75ba309@microchip.com>
 <BYAPR08MB45335415CC3690816C1FD603DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <a83a9655-0ce7-da15-ec17-80ef88764e21@microchip.com>
 <BYAPR08MB4533DB0A7F4E30543750C83FDB690@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_094729_631261_C19C813E 
X-CRM114-Status: GOOD (  10.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Bean,

On Fri, 8 Feb 2019 17:13:52 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Tutor
> Thanks. unfortunately, it doesn't work on my side. Problem is on our email server side, not my local setting.
> I followed your configuration, then git-email failed.

Can you paste the output of git send-email and the [sendemail] section
of your .gitconfig so we can check.
It shouldn't fail, really, because the server shouldn't check the body
section of your email, and this is where the extra

	From: First Last <foo@bar.com>

line is placed.

> Please just change my S-o-b to 'Bean Huo (beanhuo) <beanhuo@micron.com>' in my patch to please checkpacth.pl.  It is not huge change.

It's not a problem when an drive-by contributor posts a patch, but if
you don't patch it that means we'll have to do it manually every time
we apply one of your patch, so please find a solution.

Thanks,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
