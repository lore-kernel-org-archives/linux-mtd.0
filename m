Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC75C27C4F
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2024 06:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RoKOzkvZ+1wpty22VcE+Gcca15TWho8/ePOzFvpXT0w=; b=FUh8jv2oH6BFsK
	KGCztkPiAkvKg/Ybtn49YCSNRgEIv1m/rhWzEsDpsPTy5iskdmCDpDsgZZQ5ds+ardnauoBWIYNqY
	0U8BKagyXeZK7L8t/5AoLRqOQ13kgHvgGFyoyJvYD5kYLMllxbXBirU1LoMSytbiI7K+7PMPOTqDr
	fTl22qx2asNNPGsBbtMn+MvjT5SJZn1psEpDG0dpo/w7ifYzopDTYihZevBe/FbNOtxVJUNg3OVUZ
	fHLSPSbDBZUKYnSEJDbG1wxmXrAsoiKYskAusrWFCXVRlsIy6eQdAh332fOIUbEe8LKtr9J/dWr5A
	x9nKk745ymzB0WHvmkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNS27-0000000G1yq-15sP;
	Sat, 29 Jun 2024 06:58:03 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNS24-0000000G1xs-1Etn
	for linux-mtd@lists.infradead.org;
	Sat, 29 Jun 2024 06:58:02 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4WB3690ptNz1qsPT;
	Sat, 29 Jun 2024 08:57:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4WB368728lz1qqlS;
	Sat, 29 Jun 2024 08:57:52 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id i6ARBl_8mE74; Sat, 29 Jun 2024 08:57:52 +0200 (CEST)
X-Auth-Info: jPxR6pkkUhklqMdqkUWWtm7xg8PWuQPlt3iIHPTbh+8SVFBPW8o95hyzi42MYyuY
Received: from tiger.home (aftr-82-135-83-135.dynamic.mnet-online.de [82.135.83.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 29 Jun 2024 08:57:52 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
	id A79D12A7A83; Sat, 29 Jun 2024 08:57:51 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
  linux-m68k@lists.linux-m68k.org,  linux-mm@kvack.org,
  linux-mtd@lists.infradead.org,  Greg Ungerer <gerg@linux-m68k.org>,
  Geert Uytterhoeven <geert@linux-m68k.org>,  Christoph Hellwig
 <hch@infradead.org>,  wbx@openadk.org
Subject: Re: m68k 54418 fails to execute user space
In-Reply-To: <8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com> (Michael
	Schmitz's message of "Sat, 29 Jun 2024 15:41:50 +1200")
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
	<735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
	<7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
	<a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
	<c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
	<57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
	<d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
	<ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
	<64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
	<04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
	<8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com>
X-Yow: On SECOND thought, maybe I'll heat up some BAKED BEANS and
 watch REGIS PHILBIN..  It's GREAT to be ALIVE!!
Date: Sat, 29 Jun 2024 08:57:51 +0200
Message-ID: <87msn4z15c.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_235800_500989_69DB251F 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Jun 29 2024, Michael Schmitz wrote:

> No heap space allocated here. I would have expected that to cause an error
> message from libc ...

No, the heap starts at _end and there is still enough space before the
next page boundary.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
