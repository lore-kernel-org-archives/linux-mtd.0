Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADBAC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 09:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABE9520721
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 09:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uF1cqZWD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABE9520721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kahVDNWm1WZ2sWj7fnIal2HyEc39ve1TKqwpq5o/UEA=; b=uF1cqZWD1q4a48
	OECQA9eNiobI87E0W4X4L+HplYdC7UDGptJRppLQ1uyKNj9hnWmtryRRYTNJ8PWrKyyj9Zf0Rz0i+
	gZc6GSqhZzk+xJ9ctycKLSkoKt67c8G+L89agURJAEGgNag7hGMsIL8t8FmZQR+SrCa/nqPwyxtgg
	TaDTGoDd0GDKm2gY21Jyg0TQ70iu113xvvdDSuFwxl89ToM1G5AQQdnN+ICZanyDsHudjVgfS9j8x
	6UtYyA/cRtfUUMTyRx/p+Y+ZOXxAo5lKprrzP++IrV2OY/M/JGgJqM4l1BchBqFJk8J5nABhkARMK
	jheNJpiyou9KQEfCsRAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbh5X-0007wS-Sg; Thu, 21 May 2020 09:02:03 +0000
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbh5M-0007oQ-B0
 for linux-mtd@lists.infradead.org; Thu, 21 May 2020 09:01:54 +0000
Received: from belgarion ([86.210.245.36]) by mwinf5d73 with ME
 id hM1g2200G0nqnCN03M1gax; Thu, 21 May 2020 11:01:49 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Thu, 21 May 2020 11:01:49 +0200
X-ME-IP: 86.210.245.36
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
 <20200520155735.GF1118872@kernel.org>
X-URL: http://belgarath.falguerolles.org/
Date: Thu, 21 May 2020 11:01:24 +0200
In-Reply-To: <20200520155735.GF1118872@kernel.org> (Mike Rapoport's message of
 "Wed, 20 May 2020 18:57:35 +0300")
Message-ID: <878shloe57.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_020152_656768_C058D3B4 
X-CRM114-Status: GOOD (  17.75  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Mike Rapoport <rppt@kernel.org> writes:

> On Wed, May 20, 2020 at 05:21:51PM +0200, Arnd Bergmann wrote:
>> On Wed, May 20, 2020 at 12:21 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>> >
>> > As these boards have no more users nor testers, and patching them has
>> > become a burden, be that because of the PCI part or the MTD NAND
>> > support, let's remove them.
>> >
>> > The cm-x300 will for now remain and represent Compulab boards at its
>> > best in the PXA department.
>> >
>> > Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>> 
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> I've not been PXA development for a while, so FWIW
>
> Acked-by: Mike Rapoport <rppt@kernel.org>
>
>
>> Should we take the series through the soc tree? If so, please
>> send them to soc@kernel.org if there are no objections;
>> or along with other patches you might have in the pull requests.
Yeah, that would be great. I'll send it to soc@kernel.org, adding the 2 acks I
>> got (which make it a v3).

Cheers.

--
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
