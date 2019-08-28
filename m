Return-Path: <SRS0=Lrxn=WY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEBFC3A5A1
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 14:13:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C90822CED
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 14:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oqdK36Uk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCg8+ADE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C90822CED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAfC/nMyhKU7czhWGrrxZExCV4/BsKeqKOmrONk2Kkg=; b=oqdK36UktXyihx
	Mg9vwss9PMda0IFywQWV+i7wd0ti0qcw+P2l7UhRY6LSBm21QZN0YGoktLPKLNHQKJ0qA2h6wWbX4
	DHofILd3QMVaBKAy9/+ICEE4vIE9EmIQ0guPBzO8G9XBlLR9CA4NLIplHlV496vqtLl/pCYcdvCox
	NfTYjOnLfaefuLA8eRXRqqjhDQwdxTeZUFr9igrXSItJidqH8Pi/GCL42oI6jzjOtgwMis4Ko+HCM
	nbcYVg2Cz9yMI4FXWdhL8QB5shDUHkOL1tVCDuqrzDA4wdQdXyvTF5hGtKoVFCqJk7pvzyhcwBJe+
	Xpl+WlWD4a2iSvV5I27Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2yhR-0000B9-1K; Wed, 28 Aug 2019 14:13:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2yhN-0000AY-Na
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2019 14:13:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id e8so4960916wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2019 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LvKL8oM2dFRz8MOhsFKkkZ5Q0ogVFLxMguJHTZTcGFo=;
 b=HCg8+ADEEAXAHKVLD7WtG8LCIH38iHklp34b1Mqq7kp5uvhKELjNP7zbVJFH+AaLsH
 JLJ4SmReTRP72ZuY7xYdkN94EgqUV/5OVyaRRrhfGZuCD9e9IGVxdkVzKlWLTCUkFIcl
 xkCTxN1GMOsgi04oTdFStm842tT5QoofEgynSOP5on/X57+1eyLsuhE3qanf7w9P6eTQ
 tOUdzvQeC1KaeX900fQ1KsxEPd+vWtnqmF4pUcWUbHQCb9dLowkxBVopqSDbo6X2SUvM
 gXMom9lqigZTvBaByoc5YY2yy8DeYqzxlVQCmWVRXeA5huPNTr3MgZX28WguREZ/Uu9B
 CQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LvKL8oM2dFRz8MOhsFKkkZ5Q0ogVFLxMguJHTZTcGFo=;
 b=qT9X02KvIV2OLZVn6dxI7JZTD0+D4dWHRpNBRu/E/nnzD/kugcPzN5Pqol9PGenwaW
 l8xJlrjwUWjGDSwFJVCbUa/X4Ult4XTGsNByGmBaoyJepepu698m6jg68jzllzH7u67a
 22butmVd/LBQFjv6ZmbD4HKpNg1K/EntFQwAbfq3NWoIE+i0ih/7kbXk5o8YthNmfp4l
 asuTSZpoTPcsaeawr26sIg5ZxRoHAbVkRZ0ItLJKIdw2ozt3RWXC5J8ILlMdbTsKV4NH
 AC9gTmNw+hh8Gup4iAyg6GEIxbP+5R/b4X5cpJwUKnOYl+XhhYKXMM8mYcTAhAsGYjmO
 1oWQ==
X-Gm-Message-State: APjAAAWR56VehBbO/XNXugkVkwlabIN3j2rHQvCmWwl0aHl6ED8h4osG
 CftJ/XjS4CA4y3cQdRRjfG5411hSq5pvKMfgaJgzAjv3
X-Google-Smtp-Source: APXvYqyytt0O6cgaBfK3f5r9NLHUm+waGy64QGju2a2Km48TPCyi6L2oLTIazNAqGhCnpwkC7H0BixRCUdZR1UrMjCc=
X-Received: by 2002:a7b:c155:: with SMTP id z21mr5163419wmi.137.1567001599970; 
 Wed, 28 Aug 2019 07:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
 <23922253.ayd0uQntjt@blindfold>
 <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
 <CAFLxGvxoR2kWoEz38QfO2sZDh4=4KXHBm9OrzXAQJWAR8Shmew@mail.gmail.com>
 <CAO1O6sdEw2xjmKQFEA6YXE5vLAtd90ew4t_zynRUvK_ZztDp0w@mail.gmail.com>
In-Reply-To: <CAO1O6sdEw2xjmKQFEA6YXE5vLAtd90ew4t_zynRUvK_ZztDp0w@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 28 Aug 2019 16:13:08 +0200
Message-ID: <CAFLxGvxT3qDJT+7T4DQOq2j45OPV1AuvErEaYfpLP6SH7LX0OQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
To: Emil Lenngren <emil.lenngren@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_071321_788676_B77A098D 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Patrick Doyle <wpdster@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 28, 2019 at 3:39 PM Emil Lenngren <emil.lenngren@gmail.com> wrote:
> Will this really work when passing the rootfs to the kernel command
> line like "root=/dev/ubiblock0_rootfs"? If the udev rules that set up
> the symbolic link /dev/ubiblock0_rootfs are stored in a file on the
> rootfs itself, I guess that symlink can't be made available before the
> rootfs is mounted...

No, this will not work directly from the kernel command line.
For any kind non-trivial root you need an initramfs,
that's the whole point of initramfs. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
