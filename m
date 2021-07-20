Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43428C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 08:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED41261186
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 08:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED41261186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wguiDWV2j1PJkszK9E0eISm01a2hmCk+Ep16aWrTHLc=; b=L5MykIxr+YI8bc
	jfO82SersEQXIV7lheethj694/Kt/lfoaSIRo5tHQ547cyZ6qpOfkWI/FzJGTpByAR8O2+6TsTYxy
	+5nkPrbe2/pBaUkrMl4BSkpZV5PYDQXhRtPyHp0MYzNrK/7wHQr2msKqZMf/CdJ9BKQ08hyuDM5Wo
	I3lmHiMeqqxXv+jGlhvQzNIFx0vtp+PWwu5VP4DKXqGz0GjqBwh7mQGOoT58CLcIrWhxWonVHeuLo
	uzenf5w7Keup5sEFMkmTq5vb5+CStbRP0keIte/5YwkFp30D3I1KCMC+2AwSRSA35Pm26NqqZx7Sp
	K9qVEe0kxQY1tWZflaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5khg-00C9Dr-EP; Tue, 20 Jul 2021 08:02:12 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5khc-00C9Cl-S8
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 08:02:10 +0000
Received: by mail-ej1-x62b.google.com with SMTP id gb6so32995313ejc.5
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jul 2021 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2edD4ZbIoOM5dgV01Aj0vA4z3mEuf8snofuXl1oXreo=;
 b=d95LEuqAdqoJ9ACA/94Go38gEhST2eZd9Qx7/4ma9tR1Saj3T7L/Y+GORjnWGEU2Sc
 6YdawSAlWqwyZ/nn/11TgzaXx+BGOkrn6/HgBuqjebbxfyRnv1j0dVnGA1npVHdvkLT+
 s2ZmXIh5mUvzoygiu+4tjVL8u3Bzy8HPhS1eL4I0Msh0Y9vuUoso1Y3m73iRSX7F5ids
 8I8hukdpPLqX98oT7NZ6zuS5Mz8cAO9D8WvR4w8m2xt9aH2T/mxHeHaDhvZ3suOTOuLB
 6cRgdBqQsqlCriqA73Sf7YzK6Ayx/kejohpedHFCUyaAHRJz26BTM7mRFWR+h4izZ0I3
 O5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2edD4ZbIoOM5dgV01Aj0vA4z3mEuf8snofuXl1oXreo=;
 b=qn9lOjNuUoeKEmjuQ6au/JH3l75m9IT0/6CTv7ObDIXKjdJKo+f0vPT6UpizNeTu2p
 Wyjd3XIs2JrPXfLSou8wavHIPLY433fcHROLJbhJLAoS9nDye66navsg/V8iky0HvrXr
 VbAcH+U++2t/OLyFPKxvSAGm1+rR8E/LXTTKGNlNZ/9L5YDB4z+l55wh9oDf+fPTo8UT
 ZJdXs8vygZ0i+mKzAac5qxbXX3n/KdpDfWzL2ET4cLTgP+xDCPYCykiyKwN+NGjxdAAw
 E3aL7mFBDEnUkwAKqi5V7DOZMPEyYv/MdgxB4fh39INwPoAaFTUuWWRiahZQL61B7/iJ
 Nw6A==
X-Gm-Message-State: AOAM531NpQ0frRRHJDvvtHK/c/YshJsuA64SugjpHUOw8BkdHNmus+AK
 v8Ikt1kjtghezDWec5Xtv6o+OvEPezd+rQUDwqw=
X-Google-Smtp-Source: ABdhPJyO9ZvIDN2d6vogWARmI2N8r8z5KnWcZOZsKssnZq9MdMiE9SwxK57GIk2vAlTtMjpmt6tqwyPg5BbH3zAiNBs=
X-Received: by 2002:a17:906:6050:: with SMTP id
 p16mr22033077ejj.43.1626768127286; 
 Tue, 20 Jul 2021 01:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
 <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
 <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
 <1458549943.44607.1626686894648.JavaMail.zimbra@nod.at>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
In-Reply-To: <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 20 Jul 2021 13:31:55 +0530
Message-ID: <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Richard Weinberger <richard@nod.at>
Cc: Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_010208_966490_542D5FD8 
X-CRM114-Status: GOOD (  22.10  )
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

On Tue, 20 Jul 2021 at 12:10, Richard Weinberger <richard@nod.at> wrote:

> > Anyways, I will create a separate thread for dm-verity issue and keep
> > this thread still open for UBI image size issue.
> > We may use dm-verify for rootfs during booting, but still we need to
> > perform integrity check for other nand partitions and UBI volumes.
> >
> > So, instead of calculating the checksum for the entire partition, is
> > it possible to perform checksum only based on the image size ?
> > Right now, we are still exploring what are the best possible
> > mechanisms available for this.
>
> I still don't fully understand what you are trying to achieve.
> Is it about cryptographic integrity of your storage or detecting
> errors after the flashing process?
>
Yes, it is about md5 checksum verification for every partition to
check its integrity before updates.


> But let me advertise ubiblock a second time.
Sorry, I could not understand about the ubiblock request. Is it
possible to elaborate little more ?
We are already using squashfs on top of our UBI volumes (including
rootfs mounting).
This is the kernel command line we pass:
rootfstype=squashfs root=/dev/mtdblock44 ubi.mtd=40,0,30
And CONFIG_MTD_UBI_BLOCK=y is already enabled in our kernel.
Do we need to do something different for ubiblock ?

> If you place your squashfs on a UBI static volume, UBI knows the exact length and you can checksum it
> more easily.
Yes, we use squashfs on UBI volumes, but our volume type is still dynamic.
Also, you said, UBI knows the exact length, you mean the whole image length ?
How can we get this length at runtime ?
Also, how can we get the checksum of the entire UBI volume content
(ignoring the erased/empty/bad block content) ?

Or, you mean to say, the whole checksum logic is in-built inside the
UBI layer and users don't need to worry about the integrity at all ?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
