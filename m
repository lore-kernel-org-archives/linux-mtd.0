Return-Path: <SRS0=vsLb=AN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C000C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 11:41:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 193F020780
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 11:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MLRtZG9q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=koalo-de.20150623.gappssmtp.com header.i=@koalo-de.20150623.gappssmtp.com header.b="FP3p2fyx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 193F020780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=koalo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k427QVPI04Ylj/i/6aV77wpncDgNLqgc6u7gqKCmP7o=; b=MLRtZG9qM+xGkQFgQda95ywOu
	M0hYs4Bmmsh7MGbg4tHTWcMw0HSxfOSn0/B+ugGh/GZbmcPY3T9ufnm8PQ3Wf9m+qDqYDGL1+Xo0T
	arXkybdzxISHqx8blElfIKHwO5D9OdNoek6OKE9sH/L96wxjQm+fFcW70/P1uzyeqTEBaT/r2+aRf
	2BDKvWHaf3t49lzZKqmAsmJrLVZkCWTJ6XL73eMh5ne4xvzFXztuqeGZwrEEYlvtZantx5Z0NJ+tl
	cgVRmEFOJNJeYZQbWmMuNyEOlJdvmoPJQHJiOeJktwAw6rkOXdf7S3Eu3mL+HufDtTStk155KtNM0
	1KN6L6k2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqxZR-0005cM-SK; Thu, 02 Jul 2020 11:40:01 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqxZO-0005av-8H
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2020 11:40:00 +0000
Received: by mail-oi1-x244.google.com with SMTP id l63so21970063oih.13
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jul 2020 04:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=koalo-de.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DIS2Qv2uYAA+lAah2VdAQ3QdR8dMy2C9r1W+FVn+QIQ=;
 b=FP3p2fyxRLt6xCqWGZcGpoK3LsWlVUjd4iD8C7RajuhLYdQAv473U8+9sbFZEtjvzS
 FmaGlCI0J+Ej2nnDlgXqF3gXQ5F95OWgF7nYm3bqq6Hr2R2UVeSoHoWq1HmpPy21NAjU
 l0yVMk81PDaDGUItJJ1MGBCjxoZm5i9moSlSdmJqHPKtlTlUMUmXRnD6P6h/R4CsNcGt
 F4cnPD18R13cFiu078Kg6ChlmGryyyXbNYHA0r5TJOCblHcPc4kgQ3GmYrj8R4nr032z
 rsfZMjgh8awGh3WIfXq6K8/CnCwPqHboJRCIC+tGokD5NX/cCpsKPNB5h+Bdsz0bkY80
 WJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DIS2Qv2uYAA+lAah2VdAQ3QdR8dMy2C9r1W+FVn+QIQ=;
 b=J1+o/7cR+oSG0HL4oc6K1Dg736UinWLQelfFFKcSfqnxf4VJJtBTr3HVqpmn/JdXdy
 ZT5jXsQj3pNWOnJ23QQc/ylM+NgaKDgV5sOHwPM7y8awMO1z8V6cpZimpnsQuWK/p1Ih
 YFokJhjjYWkjanXr1BZdX1eGfYRqktEMJdsCR+iO/ZH2ogYOFhhUOqMSeoOcd7fjyFgh
 baqoaVjhAFeGEHceSHeoWcbuYA1P1hQ+uoR3y3ZVdi1pYF86p3AqjbzJxESpmhPBnWqd
 NVK4Eow0cc50G4YBMmsj1DzHBlurtWDYrn51nIBYy3GiFK1CqXunIzD4sCIxZf0Z4wUq
 A9qg==
X-Gm-Message-State: AOAM532LZysaLnAIvQqS9Jml1PY4GSp9FMvFMEaNVFgz+QuU7iIv8p02
 2YRj+IXUGxRDMEIIP/P3by7METJCNyXQhChqemDB3gmRAZvttQ==
X-Google-Smtp-Source: ABdhPJwNnNPf5gfjhOeoJ155ZYzonGiVfxLVu6S8L5P+MOPTF0nFunCctgk3A5NxloSEuTXiPFw2Wq+sMCXrqJH/yo0=
X-Received: by 2002:aca:bc57:: with SMTP id m84mr3397024oif.14.1593689996092; 
 Thu, 02 Jul 2020 04:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <e31c36b5-5860-b547-81cb-74135eb5823a@koalo.de>
 <223404ba200c110f464b9c1e78eaa26e9efb347f.camel@infradead.org>
In-Reply-To: <223404ba200c110f464b9c1e78eaa26e9efb347f.camel@infradead.org>
From: Florian Kauer <florian.kauer@koalo.de>
Date: Thu, 2 Jul 2020 13:39:45 +0200
Message-ID: <CABDT8WwS=gmS6r9ihV342hywvUZH-uXj-f7cdyh-n06QjObRYQ@mail.gmail.com>
Subject: Re: lists.infradead.org restored from backup, git.infradead.org down.
To: David Woodhouse <dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_073958_488205_D32A3C38 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks for the fast response!
The only one I am aware of is https://github.com/sigma-star/mtd-utils
The last commit at this one is from 5 months ago and I have no idea if
there were newer commits, but at least it includes the newest release
and that would already help a lot!

Greetings,
Florian

Am Do., 2. Juli 2020 um 13:11 Uhr schrieb David Woodhouse <dwmw2@infradead.org>:
>
> On Thu, 2020-07-02 at 11:09 +0200, Florian Kauer wrote:
> > Hi,
> > great to see git.infradead.org online again, thanks!
> > However, it seems that some repositories are still missing. In
> > particular, git://git.infradead.org/mtd-utils.git is not reachable.
> > For example, the yocto project directly references this repository
> > (http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/mtd/mtd-utils_git.bb).
> > Do you plan to add the repository soon, again, or is it better to switch
> > to another mirror for mtd-utils?
>
>
> If you can point me to an up-to-date mirror I can restore it; I just
> hadn't got round to looking for one yet.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
