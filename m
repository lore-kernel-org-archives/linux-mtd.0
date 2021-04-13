Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42DCC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 13:01:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3E6610CA
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 13:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3E6610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=itw7v2Ay1PvFOih8uMGi5Xhq1RHScHsfQ5C1xmwccKg=; b=meQ6J09F7KBruOxIKAncFnu6F
	kpeTEzD49hBLUJY9I0MB2iwliThrWKZ9kqagCvV/rafo7OSWEOzZ1Du8yvQyd2VIxCtYDysOjTbP9
	cY0HUcvcgKU/8b20lnOGlq8kqMHMAZpiElbHO0fdu4QGV/vUslweSATgEnbKxVZFDyXHQNydqBXBj
	rWoOkYoGU0riwAieROUAAIZ6L2GK+cxofUEERmDUg8TRSuBzF1IoKxrBLWbObHo1z4IZeZxlJHLHf
	42YVzZi0avoL/I1913C1GXc/lJc8pB9iZdaf60EXW0MSzHFHiMBkG1iVZomzFJpNSuaOrek+b/5Yh
	U2ev8Rkdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWIev-009Jhe-W8; Tue, 13 Apr 2021 13:00:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIde-009JUu-4P
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 12:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K6gp3sUpFpXKT8ewnG/DtO59TU7kZa7T83ujn+9U3LY=; b=S5BuJp+buup3QhpybOGGP+SGV6
 1DJDU2NiPR7o8Y3aFgw4EPSQoYf4zq4U9x52T5uP7Y5GzKwxo3v5mfzYYPYGqhtH1NsdoQH3efvc7
 5rIvUjMk9HRF40zgI8p8x+5g3fw5JXLNmwfv7qS/UD+OT/+5YWG3MfVCTK8+XgVdAKWfTYt7r+uiD
 OsR68VgY8xDvekpZ6swZgy37yJBEye5KMn7PCY+Tn+pLwsvsXOhl8xjBw5/RPBWRP0IzlNhJT3hHn
 p3fpcTOvQZk2le1JischfSC/c8G3Yfn7zTwJb5PNmZHYebOHNjpQG0MoRmoY9AMn1q73kQ/aycRqg
 ddteFBtg==;
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIdb-0072ig-3Z
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 12:59:28 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id r196so3595387vkd.11
 for <linux-mtd@lists.infradead.org>; Tue, 13 Apr 2021 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K6gp3sUpFpXKT8ewnG/DtO59TU7kZa7T83ujn+9U3LY=;
 b=k/keZUcro40h04uT1/VfEHmkHDGBDKO2cnowLghFt0R1PeqRpkI4rt/hFE+iqBgHUI
 Ogxoz2hyWL6OV7DkVxZA83PkMwrkh4obMpAwjOHmJLP+Rc+Oqjk0by3lSrhC4Gsac//n
 e2uLp5gJHoSPY51YZjKCxlImTOj+FPPBMt6oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6gp3sUpFpXKT8ewnG/DtO59TU7kZa7T83ujn+9U3LY=;
 b=fPQA76nRw00STH5fjCDuM+OCeSjie30VFftdeeN7afb6R7GM2ILortTfa4DZWWkUyI
 uAlpYCvZv8Ok96T4YKDEmjgGQiGdY15uCgOv60n/ZhC+6d9CMHJaVsVanwgnVVGcZwno
 8mwdJd3K/N5VF9Iirulig2Dq3SpC0MG6Koh2CxBADxcrmWDB7ryiMKaa/IAKZnS9EzaF
 EnkF8L35D+rdWSHwkKEI6gL9mTjt6/FPNUyfD7zjRVBgm3KqLNlJKtwVPzqZxgax3Cwa
 2HhLIXGnLoOIkQBTZZ5eG5kFyAMPlyvzgYt2V2yvt/YARbxwZfKR4KcV29OEPyQCVf6i
 /Tmw==
X-Gm-Message-State: AOAM531SLp9t50rWdES8fVvFQ3Yfr0vLuY5u7did72HPSFwF3kxvkl/c
 Y8AOKcduFV53P9um5LlrO96HnSgNTPR5OxIxMfqj1Q==
X-Google-Smtp-Source: ABdhPJxs6+Ltcl9KHtwI860jVS+ZVqSy1Ow96RAOLyEy068wP1TKV+u/hvVaYVi95fFNGiw4JKo3k26V5KV613Kdsvw=
X-Received: by 2002:a1f:4ec3:: with SMTP id c186mr23220165vkb.11.1618318764741; 
 Tue, 13 Apr 2021 05:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <1923896038.379134.1612901174023.JavaMail.zimbra@nod.at>
 <CAJfpegufojx4q_CfR6L-fzSyQw9QXJZKy5xKVZZWaepADkL=Kw@mail.gmail.com>
 <CAJfpegv-UDcgzkFiZXdoif2qjws5_xXh2bQSNbNdviQHhxzZHA@mail.gmail.com>
 <CAJfpegsbVWPGKe-bLvM=00EHe-PC_QgJ9umxCf1gFtUQge6_cg@mail.gmail.com>
In-Reply-To: <CAJfpegsbVWPGKe-bLvM=00EHe-PC_QgJ9umxCf1gFtUQge6_cg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 13 Apr 2021 14:59:13 +0200
Message-ID: <CAJfpegv9kvJ_KKyRo89Yp30RocZut=PBNJGbVobgO2f2Z36jcQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ron Minnich <rminnich@google.com>, 
 sven <sven@narfation.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 fuse-devel <fuse-devel@lists.sourceforge.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_055927_325564_3F8139E6 
X-CRM114-Status: UNSURE (   8.09  )
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

On Thu, Feb 11, 2021 at 7:09 PM Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> Pushed to
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#fs_fuse_split
>
> There's still room for improvement, but I guess this can wait after
> MUSE integration.

Hi Richard,

Have you had a chance of looking at this?

Thanks,
Miklos

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
