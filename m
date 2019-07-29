Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A7FC7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 18:17:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D150F206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 18:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BcUE6TOV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClLjpSas"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D150F206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNKhcqbCTFP7zRilRn2xJGRBHVhSinfOr2SswzhU/Pg=; b=BcUE6TOVG5qKGh
	4NRKG2WOsEU3ktt71gaOTYHBQURvFPb2nzJHZ6v61Ds2fAcEbwBQfUi9jrrFvTAHhoMZ9g5s29jGa
	01o7WPjBAKukMQQbOgY0L+J+HOq8XS2k3/xx0Qh4ep33B+KdITkkX7nY1tmXXvYQRl1bmEN/BPMQa
	WtwjPRzg2C/Mr7iHRATEXGRQv0mR2jWFOS4So0o14bcOHG6EwxNJ3TPCG/niUrQOv+hQusTf7Dsv9
	U+7LcplhF2vIawNnUiTclK59D6FuV4KPN+x16JoLEQkrnyLVru8Px7zk2MLOS8UObGZNpNt5dg/Op
	w09HzXoJU5LdhyWhJlsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsACm-0003nj-AH; Mon, 29 Jul 2019 18:17:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsACD-0003dr-Tc
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 18:16:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id 31so62919678wrm.1
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2019 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghWschluBjMHv+N3D1DMwXhTF5BZSWv/NSWnqPoTzSs=;
 b=ClLjpSassjj89DItj+FZAI6T2Dp8qcbfLy/b+GujASj4EJgC7dXbO2p87yuqTnSvgN
 ECGGYzmkawADsVqEHUc2pn4Fv3fHXKy/BcWt1gtYAvlTtbpIQcIC5KujchReWtEHp9wU
 6P4la5CzXj4FOztZUL2JyIaXIK+uUY4PHRbSejv7bbOeUWoVzP4WjMObqO1cuCScEIUp
 RsBLqIot71iyO2u1C8XHkfe+0mKEV8708Uavkw6fVM/zCCFt4ZYt19oDPN+j0AS5E7Lq
 wTJqq/u8UjEJaUdimEl9BWz0673b46uE2s9Sm621l/fN6S7vTeG04LxlhrqFIPzCoQwz
 o+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghWschluBjMHv+N3D1DMwXhTF5BZSWv/NSWnqPoTzSs=;
 b=KsC3d+JkGYtjagzOtpULBy4n6pfmQeIhrkzqcO6m1FFoFleYDnBqXdHIxwhZR13bkz
 nbUAiHIeCAx1mjUwmVB/PS2Q6CnRblTvZLApSgfAsb6hEa52r9GlLN+xdITRfXVfSJ6R
 WOCESnGMfi8+F6kUY6HqUhtu1bA641S99HBjF9YUhG8LOCE7u2DHxpO0drjTcahMfcxT
 PzzqTihbthfkYtgVXiPA72aqdj7MafWa8XLwaNpQGPEz72GQQLZ/5lUwLASmozTLE2u8
 01Ls9xhOrBAct1bwKNNLSJ7arsL4gEGM+37qNDqqFfgvp+XMDbyIXNb6qhqWUoxCQZaO
 wOcQ==
X-Gm-Message-State: APjAAAVw2QQd2rdpvJ6kXhT/894iBloLEg5FFH1e7jSFPfdQ8xBXzfNp
 2toqYb7KCIDMW4HASkU4tHvpRVNlueEP2/ZVLCFE8jFW7bQ=
X-Google-Smtp-Source: APXvYqzsq8FjSgPbhtjlo97UU2tUs2jy+XyB3O0wK+3lWoAuFTGbnGvfEUaU2Gl41t3k3RY3coZdo0qsA5m3qhNRLoU=
X-Received: by 2002:adf:ea8b:: with SMTP id
 s11mr119723590wrm.100.1564424188470; 
 Mon, 29 Jul 2019 11:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <5D3EF488.6010307@etictelecom.com>
In-Reply-To: <5D3EF488.6010307@etictelecom.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 29 Jul 2019 20:16:16 +0200
Message-ID: <CAFLxGvyicArpTC_VmE8GPXeHwXVT3CV-Z_5v-+qo=MB9i_-6-w@mail.gmail.com>
Subject: Re: ubifs_check_node: bad CRC
To: Mickael Chazaux <mickael.chazaux@etictelecom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_111630_166742_7BA02B5C 
X-CRM114-Status: GOOD (  16.20  )
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

Mickael,

On Mon, Jul 29, 2019 at 3:28 PM Mickael Chazaux
<mickael.chazaux@etictelecom.com> wrote:
>
> Hello,
>
> I have been using UBIFS on embedded devices for several years now.
> We never had a corrupted filesystem. Recently, I used it on a
> board design based on the previous ones. On this new board I
> had several filesystem corruptions like the one below.
>
> I checked the CRC of the corrupted UBIFS node, and it is incorrect.
> However, the CRC of the UBI LEB and the ECC of the NAND page _are_
> correct.
>
> This node is on a PEB that was copied (copy_flag = 1 in the header)

Side note, you are only allowed to check the CRC of a LEB iff copy_flag is set
and there is a second LEB with the same volume id and LEB number present.
Then you can use the CRC of the LEB with the higher sqnum

Otherwise the CRC can be outdated.

> I have been working on this a lot now, and I would like to hear the
> advice of the experts on how to find the cause of this corruption.
>
> A bit of background :
>         The volume "userdata" is used for logging.
>         Approx. 1 message per second is logged.
>         It is mounted with option sync.
>         Its size is 10MiB, the ubi0 device itself is 491MiB.
>         There are other volumes on ubi0, that are not
>         corrupted (rootfs, etc.) . They are less busy.
>
> I imaged the NAND and can reproduce the error like this :
>
> flash_eraseall /dev/mtd8
> nandwrite -no /dev/mtd8 nand-image.img
> ubiattach /dev/ubi_ctrl -m 8
> mount -t ubifs ubi0:userdata /mnt/
> echo "azer" > /mnt/azer

That easy?
Hmm, sounds a bit like a bug in your NAND driver. Did you test it?

Please also disable compression in UBIFS, then the read back data maybe gives
you a hint what went wrong.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
