Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651D9C2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 11:31:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D31214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 11:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I4gI91FV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqNQUT5+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D31214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TjowfwEMpIvWxcTK9CnpdyagMxtQ0Jh02E5DSs+UMo=; b=I4gI91FVD5CNqV
	t1iHADsIBvDbDYpWUosZ1+cL6F9G851Ld2OvVh6MloPgjiukV7VYI6Lp7lSTNa77rC88twA2ncz8J
	Nn9TLFRc1nZvjT4iDPjIL5Pr3IsoC6I2t/jVzsPQ4uOfAOz+yE4Vil7hq0/72TOvnJHBfb/NEWe7z
	D+sydHB94AZk1GTqCtJyoYQVb/X3MRjaZgr+uC1ffpapToTh4ZOtXFagz6TPJbsckvDPvzZgIzZwh
	8uqqus9sr/yizjNybExaXw5TTqjX0E7OP4oqvJYAJBUe2P9cCPd9HVin9a1B58grioc9Tnx23fT3I
	m8RwzACtxYBcifQ7OVuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw2c3-0000Uv-KO; Mon, 27 Jan 2020 11:31:27 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw2c1-0000UP-16
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 11:31:26 +0000
Received: by mail-io1-xd36.google.com with SMTP id d15so9572216iog.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2020 03:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08WmJyV2lOOcwstonyshldRfOBT2P1hLqQH1X+VA8wY=;
 b=HqNQUT5+dYwYAaDfmNnASf9OciRc9hWlbOxSeKf3g1k/FbaWg7KqpYna12DO3l2iTF
 k0d7SbrDYCIe8fXw85OrcC+s9lbfwuJ49pLfXmlvkfDmF86deSwQitC7MBqyK8nyFcyr
 YhpIuwuHt2tbiDBY4yc5VzBYOKb4NmouF3ZINtIZfPQm7CuRT6+W1ykhgPqTh0VzWfUN
 BhoDVjEE7x9KL/fx4DcKrd9Lma4V5QZeOeB2DLi+nhdi9vBfobIKA1pOZHLLDRTT4E0c
 OiPQBQzGkGWEnsTMnDesJgA2R3g57B4HQLC67VOYKGRocgYG6w7C/OVB+HO6HSsMmofc
 FbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08WmJyV2lOOcwstonyshldRfOBT2P1hLqQH1X+VA8wY=;
 b=NdbCig+Lxk+Q7I6tTYLf92WMvMF/9UMKNAULysBf0iRUNheU23v5b7odu7GNC7oh8n
 42FhUlai5+yt30tuAgbi0l18FMCVM1ii01gcY9Nik9SlxHrxyyYVWsPcewuMLIO6S1iW
 sRdRnQXXSQ1YToYparuSWy2GGd1ksxCvTZQToHClZU/mojzmDtCWkOD6bc1ydGjvzTIH
 XYSo2FtNlAjWI0U62i6Nhwn8AyGw0Mgdrep4XibV/zsTsMBiyiPugjZprGXoGHVTOKUr
 62d2IPmsz2fYSPFU4joRSyczl2OQCBz6zBAoBqEVty4ffl0wBPO7UOV19sOsjwsFhtQN
 20Gw==
X-Gm-Message-State: APjAAAWLKWrT+BMzr4XtD7zn5MctOFeVL0d2d9O6wf4OByzWn7tnAThl
 xUpV5AOVvOeCKSn8w9mLv80eNAqqB63BkUg1tm4HYH+fYVk=
X-Google-Smtp-Source: APXvYqx89lmPB71nC7ZBYHmPf23NnGIOz49lY/7VWSeqqQWoME1x/1Yijm2P4Mk3aOEgEvKQBWyioVAgYm9NVbzxZ8s=
X-Received: by 2002:a6b:4e13:: with SMTP id c19mr11427468iob.58.1580124683359; 
 Mon, 27 Jan 2020 03:31:23 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWRQmXa4_hh3KzKmqeaEkGsbdTEimsPjh=tZWribMkM0dA@mail.gmail.com>
 <CAA=hcWRwi_EsMD2OBzVWtyX_SPJf05vqc09zhQzFdguKi0k=FA@mail.gmail.com>
 <emb3e01e23-7511-48c8-9229-85a767ab359c@andys-imac.leeshillfarm.local>
 <CAA=hcWS2ncU4+RkeLydXOnGvswshK-0iDV3cRTdFgoQ4+Oe57w@mail.gmail.com>
In-Reply-To: <CAA=hcWS2ncU4+RkeLydXOnGvswshK-0iDV3cRTdFgoQ4+Oe57w@mail.gmail.com>
From: Jonatan Palsson <jonatan.p@gmail.com>
Date: Mon, 27 Jan 2020 12:31:11 +0100
Message-ID: <CAKm+giMoe=USkKPCvBvv_Jz+AVLHTqHkf-_wZwyOfNyzyLSceg@mail.gmail.com>
Subject: Re: [yocto] lost busybox mysteriously
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_033125_092145_D104999B 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: connman <connman@lists.01.org>,
 Yocto discussion list <yocto@yoctoproject.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andy Pont <andy.pont@sdcsystems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello JH,

On Mon, Jan 27, 2020 at 12:13 PM JH <jupiter.hce@gmail.com> wrote:
>
> > If you look at the /bin directory (ls -la /bin/busy*) what do you see?
> > Have the files been deleted? Truncated? Zero length?
>
> Could not run ls or any shell commands when the busybox was missing.

Do you have the "ubifsls" command available in your u-boot? This
should allow you to look around in the file system from u-boot. See
here: https://gitlab.denx.de/u-boot/u-boot/blob/master/doc/README.ubi#L177

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
