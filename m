Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C36C04AAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 14:47:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D0920848
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 14:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipfJj0Nj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RbjLMkPZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D0920848
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaxse52dOX/3oygAQdT4q+j5KkYNrtmhzMupZ6X/Hmk=; b=ipfJj0Nj1DGaqr
	QelUegOquQWuCDDnKNgvOAaX+YJJW7TqaTFhEMW3OlmBHSv0QPwxB1NWO0dqcb6PP78h6QpCgnu4M
	dEJ9hMweNp92oXepgS6MRHR+0XgXIiD9kYuvnalKy8YzK2v6NQ9faetiBxrlF5UoGrwbJ+xynStaw
	+8i+kS8HLrDlUpcXFAdf4fFVCPVmGwLv8MewHcAghdtsishgj4uXmM4ZkK9yZbbuxrl5pTap0JfnC
	u36oeiEOKfohQjfxg3srNjkoXxOiOyCR0KeUOcQDBzYe80e5RYD5jFJ2H4+wcRh97s4JvmDm2SAEh
	OnrntQ7HYH894lnyV+QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRHfh-0002pX-Ar; Thu, 16 May 2019 14:47:49 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRHfe-0002pA-Vu
 for linux-mtd@lists.infradead.org; Thu, 16 May 2019 14:47:48 +0000
Received: by mail-lj1-x244.google.com with SMTP id h19so3380335ljj.4
 for <linux-mtd@lists.infradead.org>; Thu, 16 May 2019 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+AY9FGToF7XfqxomfQs9FiHIqAX8dYewdybhmeUoTA=;
 b=RbjLMkPZ/l16ccEaNtAkER7DjD5jYPDaLczLmzyh01O3rbUJDI7XLPByf3snj4wnW0
 /76OSaLm1g6x/DBvxSOlNwwxYL1ULO2QwoRV3hEsQvtaG4B19CEMo20TWT9wgsS8rgum
 BScXFRwbSRFVEFH1JXOuePQxZsiabMWvw784Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+AY9FGToF7XfqxomfQs9FiHIqAX8dYewdybhmeUoTA=;
 b=Th8+eoD5mSn5qBiDjBZIIaT9qGqirVIm09FFSza6xGuX9Bs0vbR93UjVYqHZpjNcYX
 YVbQNzhbvJhoYYvWP8G05tlqeJzHnryjJRUdMFD4ov67JNr+aQlBvKUIOQYnFaaj2Wyv
 /SZRIQRLzNNNtoIpXBKBmrQcYt4cDHVG9WS66RRjhr4fyzdgKGVIs7sekSEC6o6XzQ21
 ZxhxGblJFJTM4s8VGg7N2DDAW2MiyjX1PkFYwmYdrBGQScIX153zjL6MEK9Dl1PGa9Hl
 NwW57xLYBCF3F0276oV/FFfMdxoP3D14QdreGx5VQ/JwWw2i66bbyylD0jNDzuWiPfpz
 xFsQ==
X-Gm-Message-State: APjAAAWkfoH3mmHWxYJlFe21pMuV883O9uNP2ibbJVdrSlC1AMgizAeW
 seZA+xgVhftGUxVFcdVyfwz/3MY9MBeq4YzhsqfrNA==
X-Google-Smtp-Source: APXvYqw0hDatqMLJ9zbTJnhnTT5oC+AytbihhJlbtmmhC0PCFw0n+jOkJep+hdoIObkawWGwDm8yCxILLdub7+DGlhc=
X-Received: by 2002:a2e:9bd2:: with SMTP id w18mr554571ljj.120.1558018064453; 
 Thu, 16 May 2019 07:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <1556733121-20133-1-git-send-email-kdasu.kdev@gmail.com>
 <CAFLxGvy7B2K2AX0nSe549QF-gDMZcc5F4X0Y+yzRrnYfL9svEw@mail.gmail.com>
In-Reply-To: <CAFLxGvy7B2K2AX0nSe549QF-gDMZcc5F4X0Y+yzRrnYfL9svEw@mail.gmail.com>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 16 May 2019 10:47:07 -0400
Message-ID: <CAKekbeskaF90QecqArSd8xgsU3zpBMndeo3fbevRjUZRu=ZkMA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: raw: brcmnand: When oops in progress use pio
 and interrupt polling
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_074747_032361_04C991DE 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 6, 2019 at 12:01 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Wed, May 1, 2019 at 7:52 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> >
> > If mtd_oops is in progress switch to polling for nand command completion
> > interrupts and use PIO mode wihtout DMA so that the mtd_oops buffer can
> > be completely written in the assinged nand partition. This is needed in
> > cases where the panic does not happen on cpu0 and there is only one online
> > CPU and the panic is not on cpu0.
>
> This optimization is highly specific to your hardware and AFAIK cannot
> be applied
> in general to brcmnand.
>
> So the problem you see is that depending on the oops you can no longer use dma
> or interrupts in the driver?
>
> How about adding a new flag to panic_nand_write() which tells the nand
> driver that
> this is a panic write?
> That way you can fall back to pio and polling mode without checking cpu numbers
> and oops_in_progress.
>

Thanks for your review  Richard. Will add flag to let low level
controller drivers know that that its a panic_write and make brcmnand
code more generic and simply fallback to pio and polling in such a
case. Will send a V2 patch with these recommended changes.

Thanks
Kamal

> --
> Thanks,
> //richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
