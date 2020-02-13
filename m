Return-Path: <SRS0=Kpiq=4B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F113C352A4
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2020 00:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4377F21739
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2020 00:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdvOZ1Ib";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="RWMKeXpe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4377F21739
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bM18GJyDjzTc32sU5lfLUOL9+HwHpihlrxzuoRpNrw=; b=pdvOZ1Ib83Vmhw
	QzVXL5TQNE/kGZiuciN9fo6HeMeTRlUqhvxWEWxrwwzYikRUKoy/iEcMI49NgjwZr9C0PHtwZy7qb
	TS5kjb1vOqD/Q2c36u7aYnNxjNkAjX0yaTVQwjHk41TECyAr7iyIWzzIQLwmEtobxVviJhQ7i5Ovm
	Sclpduvu3Jm4RmG/zSQgEZ2+CHml6XaeabRLO+K7/Fl2JS+l39ncMVR+DyNONUwSYTNhEGQsdumQg
	zw2vgSIb26Q6l/PmgDaqCpwrBsGKzguWwqGimhMoskFvtGdjOM5bQ/TkBXqMoEvtERLHdqzAie0U9
	VnjGgGybFCTpG/hgIhFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j21xO-0006kb-HI; Thu, 13 Feb 2020 00:02:14 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j21xM-0006jF-3V
 for linux-mtd@lists.infradead.org; Thu, 13 Feb 2020 00:02:13 +0000
Received: by mail-lf1-x142.google.com with SMTP id m30so2873818lfp.8
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2020 16:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1cKEY5t+7UGLMNY+kX0FLiVY/W040LvYDjzlGdRgdPU=;
 b=RWMKeXpeGH42+rpaTBaY7XsCjlCSDu3yJVkKUXDmdy4hkiakoosIZZ+d6uVCYzDWDO
 5iDnrZGxcIKb+OHP+CZIph9gqmrhIvdOCh83QjoFOz+7B10tPAayX01fsmMvjpokoX0b
 AH5PlkrZr2ScnDuRrZT5ZrELJuBK0rOOsQit0eMG6DfcghkgL8Ve4+nywycY5ATpb5+M
 RAGz01B0puB+TR2LJREbJOM+s0lFCZ+xPZHUVcuAJgdJ5cIfZFz846DWzIe8TbgqLBsY
 xjCVqGIlPd6DqGjVSKCe+3wczgidrU0xrXzv+jjs0MJ23BXdYAAGrVrkYUFxaxA76ALS
 dbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1cKEY5t+7UGLMNY+kX0FLiVY/W040LvYDjzlGdRgdPU=;
 b=p7SJ7yfKIXBTuLD1KGOHVWFgEgo14nKWHaSDNy2wCWHExIFOiz0D7fZOpQrLNaOvYT
 k1fjGD+F0K3t6VxuXABhoO5RPODpeIvKEudvhfpbTGyEjnvJZBMxSV4e46p9Ybpxty8p
 ihq/MXYtipa9npnGWbjiRUt39qDPPkB9zgLxLpYyOvRhNsmvQBqsT9zG9m2Tvb8wPV/6
 NB+4Gz830ARgA5ZHn3b4cg0X/sLgq0Gfw3Ctz9hJhOvZbx5YpcMD3KXQfN3ZWOjdY3V3
 V0tyukqykEHZK9YWL38l7V5dPR5etQkiR8I8KQm3GF6UyXZDVk05yjr94stgXg3GmSTH
 yMWQ==
X-Gm-Message-State: APjAAAV1TsnR6IBO3zUCyGEa5Hc6nAV7TGwnGYFLkhYaLqHbdiY2p6ev
 vrI0mmrPLBnennP8ASaE0JR32fwCrEgf0KzPaZUUOA==
X-Google-Smtp-Source: APXvYqx8tFG5jjHLonQJ8VXqCYuU/q3EHBj9Gtz8fRGkf+RG/SmbKainaG6ZMk409GO5DMimCh3Q4tyg2oufzLGpEck=
X-Received: by 2002:a05:6512:2035:: with SMTP id
 s21mr7421997lfs.99.1581552127242; 
 Wed, 12 Feb 2020 16:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
 <20200212061217.GK870@sol.localdomain>
In-Reply-To: <20200212061217.GK870@sol.localdomain>
From: Daniel Rosenberg <drosen@google.com>
Date: Wed, 12 Feb 2020 16:01:56 -0800
Message-ID: <CA+PiJmTS2fnCPwFnDimvTxZynaxAB1_mrYeTWySVvpbW_wA-mA@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Support fof Casefolding and Encryption
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_160212_146991_7C25220E 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2020 at 10:12 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Feb 07, 2020 at 05:35:44PM -0800, Daniel Rosenberg wrote:
> > Support fof Casefolding and Encryption
>
> You should fix the typo in the subject in the next version.  I assumed you'd
> notice, but both v6 and v7 have this...
>
> - Eric

Yeah, noticed just after I sent v7 :'(

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
