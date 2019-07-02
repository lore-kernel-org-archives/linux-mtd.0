Return-Path: <SRS0=szGg=U7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7898BC06510
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2019 13:45:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42EFB21479
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2019 13:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IrreEqNj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4++upSj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42EFB21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHXWSGi779HASuW8qjdCHndgP1ReCoqXMNQPpYQXAIw=; b=IrreEqNjZ1iKMD
	Jm9OmkP/GcfT299+2Q891ObKeV3VtdHfOlrCTl1OZIaCsye/BpaX6JmTUxqPcy7Oj5J8F6WU20nSt
	Oeiv1pqMlPBFeLFe1NDmbRuUxxmPlGO5QqWAfDnCv3px2CQb12lCTm3B88oikLOxIBcyOVFBuI/h9
	SJe4ZEuk2x9M6CxTuL4c44Urjs56PUJrrUJviv+E3lL2Zz3S03VvzaAaLidrvHfh3rm+ccU9jTe7N
	xNbQwo3OGwsh9JOXL/rqZ7D1LKsDhIG6t40DCvx4A/KkjYPC5NxNS+1XKj5Tr9kK2c3qQZ24zuzfi
	4LIqYVHnShaS6N+0VHVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiJ5b-00066n-4O; Tue, 02 Jul 2019 13:44:55 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiJ5X-00066N-TV
 for linux-mtd@lists.infradead.org; Tue, 02 Jul 2019 13:44:53 +0000
Received: by mail-qk1-x742.google.com with SMTP id b18so13928394qkc.9
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2019 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AiNHH5kLF0a5/4W8JVo7tJ00LHYVYNsbbkRzQ50gi+o=;
 b=r4++upSjUBerqcHlHg56rwYAfu0tK+y5Pbtq1VgLa7YWRq/cQfD5qZE/n18jO3v06U
 dKXprarhKDYXAKFn4PfyuiWWLP+MtIaCK1+h+REyeC0Nqiy+KyzPfahEpWGjAs/GRCAW
 SoEUIQYdMJW8JW446Qe1eSLBsKihADrKiMVDV6CGJ1Mfd5kfnc8fzJw0mo8OcOXp0wMt
 ZvLsCRS5WtbbY2JJ8R9oyBSWdr8U/48jak7g9NHCtAIRUewALlOOsepod0+KwvlscqDP
 r6UspE5+UZYJaKoO+5t6JaErJR1RnW+40lSgtVizJn3ZFG9js48BjRSz09Zr73XOINJM
 TOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AiNHH5kLF0a5/4W8JVo7tJ00LHYVYNsbbkRzQ50gi+o=;
 b=Hip3zDM13CK6mUKfpwIt9jAnKwNybWlS40HeoPkUXxXgT7RMWj7Tx41jG+AwV7OKrG
 44uPH1iME3lY1s2R7PRfjz+nkerHAtlJYl3l4NC582c3ngiyeAl6ENRneAxsNMwgE6Mp
 ujdVLj23oB4uMGxoSRqQH6FYVHR5yctMTHwrVMkAktT0ajpP0i427VDrbe6MUSJwKd1f
 v4hqeMIYnExEvyfgHINMfpUgmlACY1d4/EMkZi7bY2VpWYyLNM4D9rHDOTxNJ5qYPADr
 cXBj4za5tXF7eSNINDiHGeF9YjZy81sjKs4K+5S/wkPr3M4OofQDB9IHPx6PeQadOd10
 L1rQ==
X-Gm-Message-State: APjAAAWmL/TDzel7pURKIlZcJx9/1YeK+aqjEaoPqUs6gQZEsc/C9Vzl
 JAI4/m4G9T/RJixlDsJOuf0keRAzLidHUAWQCh4=
X-Google-Smtp-Source: APXvYqyl2L8SickB4Uw/7jG50ilbgF97AWgSOx5lDPLgOAAh4VYDDjdZ0CX+GPw2qJlpv6+vQ7zfKMMGCF09fJbV004=
X-Received: by 2002:a37:a094:: with SMTP id j142mr26058706qke.2.1562075090142; 
 Tue, 02 Jul 2019 06:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <1562005528-22272-1-git-send-email-pdoyle@irobot.com>
 <5180bc0f-2494-880b-747d-2c09b7e24d7a@sigma-star.at>
In-Reply-To: <5180bc0f-2494-880b-747d-2c09b7e24d7a@sigma-star.at>
From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 2 Jul 2019 09:44:24 -0400
Message-ID: <CAF_dkJD+QtYFovinjSC4ybCTQtujyYrZ7rf45gaApBu=KNp1Cg@mail.gmail.com>
Subject: Re: [PATCH] ubinize: Exit with non-zero exit code on error.
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_064451_955485_D85524F1 
X-CRM114-Status: UNSURE (   6.14  )
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
Cc: Patrick Doyle <pdoyle@irobot.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 2, 2019 at 8:43 AM David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:
> Note: The source code uses tabs for indentation. I fixed that in the patch.
Oh! Darn darn darn darn darn!!!!

I noticed that, and I meant to fix it.  I'm sorry.  Thanks for fixing it for me.

--wpd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
