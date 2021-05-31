Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE56C47092
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 02:56:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC6F61220
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 02:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC6F61220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVW2gMzgHV0eYOtiHvs2bppl/LkZDB3Rqlu2zzYdp2E=; b=o6wK0OrQYxSnuR
	vhdm+44HH5bLTzicS8hsU5fm3tfYZ8DZPRH9usJI+iFKg4G42GKXkJfkEo9MnUCMj7GVfhZzABXeR
	Okwj9FM113pA2af3qX0PREzR7ghvmAbCy2byIgz9xQgxN7DrlWCZBsAFcWX7YI+Ezzs4EbzBBAVZC
	6da6svH8bZ+NegcKclrGsDt1vyVniNyg9r6uYMpjOMP5r7PuqlJcwgf+DYxGYfmWnM/FJujivBIvT
	uufTnI9RBYF4MVGwcfltX5HZtXgBKcDVyi6qQvUFI0LpgPI6f+uUS6XBAGeJoDY3PVZsUV7EvrASO
	9luLSE9r3AFHLRfykh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnY56-00AWg8-Gr; Mon, 31 May 2021 02:55:08 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnY50-00AWec-Tc
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 02:55:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id y7so11752571eda.2
 for <linux-mtd@lists.infradead.org>; Sun, 30 May 2021 19:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qi4JwnuStjKrl13hwRZNjYRqAXVvLVe47KpI8ZOLhcA=;
 b=uElWrWzvBAHrc44Imdhjdq0EX+o1vZtfPPFcY84AGmkmIZjj/6YT6uIGdn3c457aYq
 Dj7xt/j+bqZIEqb8XWQTCtMpiIpZhGX+hf5rB1zPzxQT9owtNsctHaUPlajlEe+EoH/d
 72ByMG7lQXgnvlkXVLd6tyqUdHvL+uVNbcB4MWGeRyjutC+aleeSuLqTLBYQ2r47t/Bd
 zAfvRJ/4WxNFaQkfOVIb6V19u15onpv6Fi/ZtU/wCuUFSnwD3tYaq1xUg5yemY2C8rf/
 s9Xr9hYmMs8kGTbN97B0KVaW6kdCPvOX1dM7zR1QLtrfqwT/NHt6wBZ3qmcbajMJAbvz
 tSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qi4JwnuStjKrl13hwRZNjYRqAXVvLVe47KpI8ZOLhcA=;
 b=gIEt1v6HR/eC/LC85GjZ3K6ZDDJcGA2Ozo0F9Qqtg+ONGrkyIeGxzbwbRnUwbjSB1g
 U/x67TwFabRf0sdl0KxMbIL7AsN9bgzwgGNjWkKMYM4jme/T45kEn8QWRd7ycXqEfVk6
 23ghwxuw0ZBQ6gJQw+rR54X+8hBimQWFVjP7ml9d+29teP/x5HvPdquUBV9OAvMxk0UZ
 ccfommymkmzbisXfOnwezlM8og7LUJ9b2CTZgBB36kDpFRVMu+ygjTSa8n03RRDvcRUC
 NIH+zsuH2v3/GqnV+AeebzD4nydw5SQjcwCWo3CPiiTb++BY470eLdbUNOIaSysXZgjG
 LYfg==
X-Gm-Message-State: AOAM530K2nE8aBpzFtiC3xGdvNiw8ZLQ5snS+3c9dbTjcYECK8V1SauZ
 YYehxk8R+5iy/RAxLCunuLUQZD/Z/34oA3Yebh0=
X-Google-Smtp-Source: ABdhPJw7Y0d92GylmlMCy9GMNyn7kQnkHuYBMaViMJry1bY7neGEi5I54S2HU379J78rHAbRggiff+zo5ufy89Pi0Wo=
X-Received: by 2002:a05:6402:2713:: with SMTP id
 y19mr22499149edd.59.1622429700519; 
 Sun, 30 May 2021 19:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
 <CAOuPNLh_0Q9w96GKT-ogC0BBcEHgo=Hv3+c=JBcas2VgqDiyaw@mail.gmail.com>
 <CAOuPNLjmJ0YufFktJzjkyvdxwFTOpxVj5AW5gANAGSG=_yT=mQ@mail.gmail.com>
 <1762403920.6716767.1621029029246@webmail.123-reg.co.uk>
 <CAOuPNLhn90z9i6jt0-Vv4e9hjsxwYUT2Su-7SQrxy+N=HDe_xA@mail.gmail.com>
 <486335206.6969995.1621485014357@webmail.123-reg.co.uk>
 <CAOuPNLjBsm9YLtcb4SnqLYYaHPnscYq4captvCmsR7DthiWGsQ@mail.gmail.com>
 <1339b24a-b5a5-5c73-7de0-9541455b66af@geanix.com>
 <CAOuPNLiMnHJJNFBbOrMOLmnxU86ROMBaLaeFxviPENCkuKfUVg@mail.gmail.com>
 <4304c082-6fc5-7389-f883-d0adfc95ee86@geanix.com>
In-Reply-To: <4304c082-6fc5-7389-f883-d0adfc95ee86@geanix.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 31 May 2021 08:24:49 +0530
Message-ID: <CAOuPNLigHdbu_OTpsFr7gq+nFK2Pv+4MUSrC6A6PfKfF1H1X3Q@mail.gmail.com>
Subject: Re: [RESEND]: Kernel 4.14: UBIFS+SQUASHFS: Device fails to boot after
 flashing rootfs volume
To: Sean Nyekjaer <sean@geanix.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_195503_018227_D7F8E487 
X-CRM114-Status: GOOD (  15.46  )
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

On Tue, 25 May 2021 at 11:07, Sean Nyekjaer <sean@geanix.com> wrote:
> We are writing our rootfs with this command:
> ubiupdatevol /dev/ubi0_4 rootfs.squashfs
>
> Please understand the differences between the UBI and UBIFS. UBI(unsorted block image) and UBIFS(UBI File System).
> I think you want to write the squashfs to the UBI(unsorted block image).
>
> Can you try to boot with a initramfs, and then use ubiupdatevol to write the rootfs.squshfs.
>
Dear Sean, thank you so much for this suggestion.
Just a final help I need here.

For future experiment purposes, I am trying to setup my qemu-arm
environment using ubifs/squashfs and "nandsim" module.
I already have a working setup for qemu-arm with busybox/initramfs.
Now I wanted to prepare ubifs/squashfs based busybox rootfs which I
can use for booting the mainline kernel.
Is it possible ?
Are there already some pre-built ubifs images available which I can
use for my qemu-arm ?
Or, please guide me how to do it ?

I think it is more convenient to do all experiments with "nandsim"
instead of corrupting the actual NAND hardware.
If you have any other suggestions please let me know.


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
