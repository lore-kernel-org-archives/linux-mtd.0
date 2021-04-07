Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC4AC433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 22:21:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F726120E
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 22:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67F726120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1JT7cevwZxr4seCXOQjnqEIuv2QLNay+p4QeLQIHYm0=; b=VxhKLmnK+ajMeCC3NyZswJbyf
	1prFXY2i7GDqYZDjuZ758EXV6BckM7AD63WKBTW1azkWsQQU2oI7+tJtGdGVzXX/XxSqXPTJAjmni
	LqHgedqOurSq8djZP4iaduHSKG6Wbv7I4ZnbBnBmszIlCQkvnJXZPbowWKyc1c45dT8rtDNPCO7fM
	/MZhNrybvCsdtlGYDxmIDPF4owzwqITfhrenvWVjhlGknolHK8BK82M/Vn0n7JLlJxYOeZaQG5B9K
	4LX7qJTYjBTa5fkaYtPUj9yHgKm+ojPDur0WHD0daJPsB0tF+a7+PpgmaD/Ilycf/4fuIfRdoKh72
	NzNrBubcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUGXJ-006AwR-5M; Wed, 07 Apr 2021 22:20:33 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUGXF-006Avb-Lr
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 22:20:31 +0000
Received: by mail-qk1-x72d.google.com with SMTP id x14so234472qki.10
 for <linux-mtd@lists.infradead.org>; Wed, 07 Apr 2021 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ner43B1c7JahH39vGo3hPzauiEoC0Ok0VtKiG5WaEkY=;
 b=U16K0peTEaFDRZyiGqG5dTqKXCkKnJRPaNxJmbe3Q1Sg+u+XdBREmoPk9D4QGlPs5S
 eTTzVZabqfO+GDt9sCXNTUNN7zPqDYAwEn/+f1DLP5YiPjdgVRptDaBiPpYpOQLEQWeE
 t7lF2JbRy5iYwmiS/bJfdY9wv3rjHc1YWXsBlgjnAnXwVhZWzIfsGph7UJ6fQc4MSqkm
 v1pgLQlSm4eycU9hOmk4BInbijaFF+2qzoygqyipg1Ovqc4qsO3VU+eZKFmfHpWgy+yM
 cFlr/DFB9mOdGNdSs6D1jITwediB2I33I9gGyJAwfQTLgdHMu4BcSJ57rpvOpM6FRZsG
 1NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ner43B1c7JahH39vGo3hPzauiEoC0Ok0VtKiG5WaEkY=;
 b=K0OgTG2VwKO61ruTwuFQy7cf8tnrGlXeRy4XVLCVstFmQ1TbVYzcLdPVtofV5yOh8D
 uixwG69M+jlcXk7I7vMiF/PZlSdsEcy+OGbn6XQFT9i+IOMd1HLfn3WQCSKmHMcVioE4
 orZ2EdYkwHM8qOdOKB9TUOlT2JW945VA/mrv1bnSJGTM6wTW/jPagMdLR1QP4wSRunkh
 15LdpkqU6fclbz6FU0negRaplTY+4ygcKQs9f25IlXu93q4wGlrIm44rNCuUC7Hg7rvp
 zKmI7wUQMlICPxqH04713+T+wfTGWTwpXAqAJtQYAqDAJs0fBnrcsL9vIivPXaWOiV7o
 qXsQ==
X-Gm-Message-State: AOAM531uXFPgrmxWAbf/rjHw0+h0NrL0RIKLp953M+LlDqYpxohwF7h+
 japP+9pVbtAdsHY0d40ePQlu01ZzBodtCiy2td8=
X-Google-Smtp-Source: ABdhPJz5jXn36tzwk6U6Xoaraom6QWYRZFMN4zt+7Lp6WMX1nDkSss9M6Q8P/BhBfqfEksawLeaydMgAaq178wnCKMg=
X-Received: by 2002:a05:620a:527:: with SMTP id
 h7mr5602337qkh.108.1617834028553; 
 Wed, 07 Apr 2021 15:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
 <1617087773-7183-5-git-send-email-wangqing@vivo.com>
In-Reply-To: <1617087773-7183-5-git-send-email-wangqing@vivo.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 8 Apr 2021 00:20:17 +0200
Message-ID: <CAFLxGvy7vKJHAms-QAyhcUiv58GYQy+zy3AZ3hP_g+tmh-X4xg@mail.gmail.com>
Subject: Re: [PATCH 4/6] fs/jffs2: Delete obsolete TODO file
To: Wang Qing <wangqing@vivo.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-mips@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, linux-scsi@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, 
 netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net, 
 Greg KH <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_232029_842739_BDA248A1 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, Mar 30, 2021 at 9:07 AM Wang Qing <wangqing@vivo.com> wrote:
>
> The TODO file here has not been updated for 14 years, and the function
> development described in the file have been implemented or abandoned.
>
> Its existence will mislead developers seeking to view outdated information.

Did you check whether all items in this list are really outdated?
Nobody shall ever blindly follow a TODO list without checking first which
points are still valid or not.
Removing that file does not magically solve the issues it describes.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
