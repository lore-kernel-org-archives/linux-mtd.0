Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C061CC33CB3
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 05:58:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92EE922522
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 05:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3AKhuRZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/CtQlYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92EE922522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh9rzu4wNtEh388JFf8Ut3V+0vGcHVzZEpmWo4XhbV0=; b=X3AKhuRZ9iPLCn
	g2MSSrFAbxHKa7GEAC0lWLD3BbHmRQ8rwjUXcl+vymQ2FY7OyA6HTjVRuoCDxOULb+gXALA36aBvP
	BQpxxqk3orZBmeJ/kuipSZWstVKZvimgZ9Hr9Kk/O3DnWyzLe2/fXTbbmZ64+nsUjfUzqwdAR1ZUa
	X/pIGH+gJt5+a7NsKktqVeVWZOGPU8/26Ri/7idIv0ZHQ2wgTm0DVBwF61xF3MqkTbg3mKRGNACCH
	k5uCN0C/80YSM2Wj3udj+OwofzqmDLb/bK0Cgbek8LRTRBFd7xtZk/0E5CjasI3ikKxczXNqkH93Z
	cfOeasgbrfXGq+bBG59g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwJtT-0005Ao-PJ; Tue, 28 Jan 2020 05:58:35 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwJtR-0005AD-2f
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 05:58:34 +0000
Received: by mail-io1-xd29.google.com with SMTP id x1so12917003iop.7
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2020 21:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8joxOrqCoLHjZQ0z1WSEa4eCoFeCIuBuU79BlYwNU+o=;
 b=R/CtQlYdgfiiwzzt7Nhq7X52YWObwC5WX1xEI6U8XqwLfwvPvBxhpDlg+dGXf6eu9/
 zjv9CMklsLPffpEodLSWQHBik+S5KnIGJaRepKc/HN+8ZnsmkZkEnR93CvkLA5hIm8YT
 w/V8TEOOPKvWqFpsKLxpxieUArW7R2cLIasi5QOwjApBFo5p4y8OLA8QW24tR0YtVZNE
 JpAZb6YNtcbj1vF6E+am7ok/QjCiJA2Bc6N5uITeJYIYecA9Fu+iA4+X1WpHOaSOD+pB
 k5b6aJQQx/tQKcU7NK/NFE2ZWpFz83/Y4z3rlZ4/3WhUN2mh/Kvx8i6JUPc4cLiopoCF
 fqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8joxOrqCoLHjZQ0z1WSEa4eCoFeCIuBuU79BlYwNU+o=;
 b=N3mZ11oZFX164bUbhl5d1h+So3qcIXr+XzKar9828IGl0LOPtBqYiZLtGNnbdY6Bon
 nz/K4Kr33al5uW3VfOwHAVhaDX/BfiBajPF7X9Dd7FYPWdAtfigpoQJQQrZ3F25P+r/R
 cgi3n5NnsNZT8AgQgxkglkOtF8fCOY4mIT8ZkrwOp4jgdWhQlxh4OXOqQYq6r7lO272C
 N0tDhiGoWZNMgbdKDc7tOqC2iEdgtdd+lfGeM5KpUtt87cK9r7W8UMd4otLGNnjFziUo
 VO5eZnfOM8rs0421D4Qndpfha0y4/f8cp6MNTI2ezRaTg0BSWNwV4NWlavFSUVVO+uBI
 r0aQ==
X-Gm-Message-State: APjAAAVS3WsCQ2E6FVBDjWqC7W5zU33ywdcFi6Mjh0DFPB56fkRRxWja
 vREGuu2QcAEXvHb/3xkPzlKY5JEcIxwt9feAUwQ=
X-Google-Smtp-Source: APXvYqxrRdNMk11mYIDVbyCgmE5HeUc3lyXinqxnzTvouezJC9/uRz+qo2c/Qx+uRpvI8DfJafD5HiXsPOhfvHhXElw=
X-Received: by 2002:a02:6055:: with SMTP id d21mr17051686jaf.21.1580191109030; 
 Mon, 27 Jan 2020 21:58:29 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Mon, 27 Jan 2020 21:58:28
 -0800 (PST)
In-Reply-To: <CAKm+giMoe=USkKPCvBvv_Jz+AVLHTqHkf-_wZwyOfNyzyLSceg@mail.gmail.com>
References: <CAA=hcWRQmXa4_hh3KzKmqeaEkGsbdTEimsPjh=tZWribMkM0dA@mail.gmail.com>
 <CAA=hcWRwi_EsMD2OBzVWtyX_SPJf05vqc09zhQzFdguKi0k=FA@mail.gmail.com>
 <emb3e01e23-7511-48c8-9229-85a767ab359c@andys-imac.leeshillfarm.local>
 <CAA=hcWS2ncU4+RkeLydXOnGvswshK-0iDV3cRTdFgoQ4+Oe57w@mail.gmail.com>
 <CAKm+giMoe=USkKPCvBvv_Jz+AVLHTqHkf-_wZwyOfNyzyLSceg@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 28 Jan 2020 16:58:28 +1100
Message-ID: <CAA=hcWRb6Wcv1FpxMjwqVmiNPp+5UEydKw8sAELCrmGyFfgDPg@mail.gmail.com>
Subject: Re: [yocto] lost busybox mysteriously
To: Jonatan Palsson <jonatan.p@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_215833_120065_1096D237 
X-CRM114-Status: UNSURE (   9.71  )
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

On 1/27/20, Jonatan Palsson <jonatan.p@gmail.com> wrote:
> Hello JH,
>
> On Mon, Jan 27, 2020 at 12:13 PM JH <jupiter.hce@gmail.com> wrote:
>>
>> > If you look at the /bin directory (ls -la /bin/busy*) what do you see?
>> > Have the files been deleted? Truncated? Zero length?
>>
>> Could not run ls or any shell commands when the busybox was missing.
>
> Do you have the "ubifsls" command available in your u-boot? This
> should allow you to look around in the file system from u-boot. See
> here: https://gitlab.denx.de/u-boot/u-boot/blob/master/doc/README.ubi#L177
>

Thanks Jonatan for the link.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
