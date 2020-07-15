Return-Path: <SRS0=+X7X=A2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4068DC433E1
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 07:50:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A71E20672
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 07:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q2THocJQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nITANJhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A71E20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=41r/Nyr5ikMEVfXSPfz+cjPq4N9lcNYVahu0zzy4NrU=; b=Q2THocJQWQ59CohrKx0FSbHRK
	RXFc6gEXSmb+MQYyx1klvmqdg8zvcdFZZ1dzGCM5HciQ7cch5HMm6aC9wE4IoeF8OyemitoTOOk7S
	StGPgyoaWBLTwxYlNPSVOejasPQ9UI/W43K7KuLArghFugy9V1LHkOGY7kZ9m9ImMmjbNTIF/E5vS
	jVEwe7vZyM8rzVCugObL58Z/m1hn0sBkdSFH2zRyyyra3MtyGFt9sxIq6bu5ZWGxpLhywuVNpA7/9
	Sqgi7vTUJpW7o3Y2k4PaVJ8Xd1yMaxjr8VB8/34Lif7GV0+s64pM1uolZS+ChtwtaFdHngMLvZEwO
	0l8RGsM3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvcAt-0006CK-BL; Wed, 15 Jul 2020 07:49:55 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvcAm-00069n-9Z
 for linux-mtd@lists.infradead.org; Wed, 15 Jul 2020 07:49:53 +0000
Received: by mail-qk1-x743.google.com with SMTP id q198so968632qka.2
 for <linux-mtd@lists.infradead.org>; Wed, 15 Jul 2020 00:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2hxAhRHGznvP3x0GH9I5kLA83LtI5MGzkZDrric2C8=;
 b=nITANJhZ+S1Je3d/kQHYlr/LhsqXxPv8kVQpvEzlVF1g56h8F0f/RvZXCzQvtvjsGl
 EoTaUTmG8wAKzp/pe0KWE3QAahWqmfXk8TpROJZAJF/AolCKVTXcAxtRbRCjBdL9SUOd
 c7QaU5hwk5yXHGrOZKnlJ8y8mMrfwFkA1AN26YV5kLnLIt4Yg57lLga+Qhyv8X/D9fax
 2GLQGm0V0zWP6YTmz3NGmSh+wlgasLHEK8WgjpyF7ga2kvDRbxkckWUgGwH0wmDqo3KP
 jdQ4aegz6v1stNglcJEI38a9P5ZPtyNvz9Wu/07JQXpy9IG145PT5OVcJDJtz2kKywoC
 MrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2hxAhRHGznvP3x0GH9I5kLA83LtI5MGzkZDrric2C8=;
 b=crmzvt/hcHpFLW8PQDLYgSt2R/n8sufjTcB+HvSp59oIDoBVPqA7YgNvpj7Qw5pXNz
 0YMpbbE+LlcG4nxnrDbp7lDHHEzsq0zZgGdS2XctkCji2ihQPojiPr3co2mTMPIWqcpm
 TQejUGuoxWX3c6I9Zlh27QGXbZ6teqMnAt3ytSR9fyd/tFfrbGzMPkGny6gSOA1gSGQs
 EUNXk1z5aZeJ5oKfB0rdmCP7wBkJ7MNT1MWTjzjKP5ppmBuIWVGDqVcu9/W3/QbwgvXH
 GKk9heZNM0BXGb/OqkDmVZZavdL20xvF72bTkrHOAuPMqvYfRCOPkL7P6xO1heO23CTF
 l1Hw==
X-Gm-Message-State: AOAM532QFRKrVOP8WbcKXqsMTQrqEGvqcEJyX9E04/BLcKFfY7HEZpBm
 f6tqphjtlMAESk/JOOZlJAwM5ZWfnGFQArRoqEE=
X-Google-Smtp-Source: ABdhPJxRU1suOXictpKMhpKdY5n5UFCCvMV8M/HIMI2KDxMKdYWvKym3V4XUrQboYUtv/X0P+Ssv4DNWAqpKu3Vj1N8=
X-Received: by 2002:a37:9147:: with SMTP id t68mr8274659qkd.34.1594799385291; 
 Wed, 15 Jul 2020 00:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200619090635.58548-1-lizhe67@huawei.com>
 <e0d04d70ce674584a71af1a5a00984dd26729891.camel@infinera.com>
 <dadc539df01b17aa5dc85e7c0f1dbc83591667cc.camel@infinera.com>
 <CAFLxGvzP3AuZBJ3RugZiRTobxv3Z-kxYKnBUi0rfshwf7GuuCA@mail.gmail.com>
 <a42981ab23f75dcf5feddf6c8b50d3b44f749899.camel@infinera.com>
In-Reply-To: <a42981ab23f75dcf5feddf6c8b50d3b44f749899.camel@infinera.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 15 Jul 2020 09:49:34 +0200
Message-ID: <CAFLxGvwNuN_OqGdA8oMom1uG=QAnmJDJkQ-BHEMA915-Kz19cA@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix UAF problem
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_034948_412995_AE549406 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: "lizhe67@huawei.com" <lizhe67@huawei.com>,
 "qiuxi1@huawei.com" <qiuxi1@huawei.com>,
 "zhongjubin@huawei.com" <zhongjubin@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "wangfangpeng1@huawei.com" <wangfangpeng1@huawei.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "chenjie6@huawei.com" <chenjie6@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2020 at 11:51 PM Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> Did you queue for stable too?
> This bug has been there since day one for jffs2

It will. I just had no chance to re-create my setup after the
infradead.org meltdown. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
