Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C55C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 21:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B5C60FA0
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 21:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27B5C60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlJccs1KcpDQxu/uWUVsHJ+iu6m6ril43dAhgg6AAag=; b=HlYSzSzktlEGQ9
	C4X/UKJGqd1+4ufCZRfZr0vmWcdjf8VZ0yJTU+WShtKSMSY1i4pMDu+5onITzJAU23EF6mQ72wMgU
	8SrOFKoVH/VUZfx8F8poGw2Yo4Fv6XQvT3U2DGXQ0xiRNQFz1l431RZs9WJJHKGZXY7IEYa/mb22t
	7Su6ZP5fVQyNWViVMi3JlA/GN4O+sKPEBo0vCI9CjmL3RGsBhylLgZXCW8GZ3MaxaLhKZBNI0vhYk
	r4+Q6N2rzYrCX+J2IBus26ENPM51HeR+P6AHV6/jCnzTXpa0Vu3XKHfTY2D7w+sLSGZqEXLfFWCki
	OkyW7XY07LCJhoH/YOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8UHz-00GMiP-CC; Tue, 27 Jul 2021 21:06:59 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8UHw-00GMeJ-Cq
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 21:06:58 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id s14so444779qvm.4
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jul 2021 14:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+9Iep22xlaxvoXsXUaG6MGv2vbQjS56sjVhRa+T1M54=;
 b=SvsjiKUM1FDjSitZnc88ZJMejn7kW+zFfHahjF4Kj17C+GA5J1Rk7OTCWQVgSPK/3D
 LPH7V6UqRliImwE1s/W4WtQszPzpstTxJ8+7B9cAEJk1ZBv6SW4ID113hX4I49kPV7E+
 OQlDvCZzqxifZDmbi70ccEr00e70Kj5SSdx7MgjKRREpdom12x5J2ooI0eXTJAxsYdqS
 rakXs8e7I4Ajnw1ea9ogBoCn2v/3Rneo5FmXSbdCZshS9L7aHDx3nj7tY4xzMzaHU3Q5
 21lg2ErEz8ses/zQJAwf7mURM+2d0XJUtuv7d8VU/BXZN7UqW+tgOTqPbfNyRJf3mPPt
 /A0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+9Iep22xlaxvoXsXUaG6MGv2vbQjS56sjVhRa+T1M54=;
 b=uByZaPYYvEzG6YGsMvQGRAzw9vqpDjSDXRaHDoDTniqFPp4QvzdxDwx9gphjjCJ1V1
 nl6YILvkl9dd96L5BabsA2al7Ul/qVQysBxGh2sYOFbXAuvA9JwgHOD9U4Ozw+GOuioQ
 vM0Ntt7xtvpqHB+7YS56nl5L16DofO0dbOe4VquGhd48a6Ju9O/YH4OYdT+3Pg/+Fgg8
 zvygXVshkyleraJKMS80PBpr3+xSjT+ZwfTsV6RmW3EIAg4jFdQQaiJNPwftfJCnRhSa
 rIOHCrzaHGUwLfnn0pQHBEYE+ubHjrEwVZ90mJmQJH9RrS2ANg6fY6tdUAKCH68KY34f
 hqdA==
X-Gm-Message-State: AOAM533knRjKXDC/TbIXhV+l7HDjx2MIiSM4neiBZy3JGsAkMBPhXYBm
 obtgD1EkDaRzelx5ziWuebyC852YlJZWTOwzOE9VHaYbQug=
X-Google-Smtp-Source: ABdhPJwMRO6HR28xQTMfEoL41dJA7+D2EHiGd02d8Mm4UKFUUGldPqjFMX6ys4IXUh5ZkkLq4yKgnCKE/Rm8hqnvHzo=
X-Received: by 2002:ad4:46ed:: with SMTP id h13mr8500206qvw.56.1627420014506; 
 Tue, 27 Jul 2021 14:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <YPkj9NUxNLGG5tjL@emlix.com>
 <2125418384.6749.1626942814175.JavaMail.zimbra@nod.at>
 <3b009a01-1f13-e029-0341-9728d4dc16ea@emlix.com>
In-Reply-To: <3b009a01-1f13-e029-0341-9728d4dc16ea@emlix.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 27 Jul 2021 23:06:42 +0200
Message-ID: <CAFLxGvwPCvtVKf9zCcU5DaTah3jeuiCX7-S-CPNkK0Zdd92nXQ@mail.gmail.com>
Subject: Re: ubifs: corrupted dirent (ENOENT), problably related to O_TMPFILE
 and linkat
To: Sebastian Gross <sebastian.gross@emlix.com>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 chengzhihao1 <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_140656_498575_08270374 
X-CRM114-Status: GOOD (  20.74  )
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

On Thu, Jul 22, 2021 at 12:56 PM Sebastian Gross
<sebastian.gross@emlix.com> wrote:
> > Can you reproduce using a recent kernel?
> As stated I am already having a hard time to reproduce it as it is. The last time took me ~2000 runs.
> But I will try anyway.
> Can you give me a pointer when there might a good time/place to cut the power?
> During the linkat or fsync call? Or maybe a certain function in the ubifs driver?

I'd try first with linkat().
You can always emulate a power-cut by placing ubifs_ro_mode() calls at
code paths where you suspect
the bug.
But often it is more complicated. Especially when the bug is in the
recovery code when the filesystem
is mounted the next time.

> > Yes. Maybe it makes sense to make UBIFS at this stage more forgiving instead of
> > the current situation.
> ubifs_readdir had then to check if the inodes it got are actually be found by tnc and then remove it.
> Seems quite hacky to me and not really upstream-worthy.
> Are there other places where a "faulty" inode can be "discovered"?

If you enable /sys/kernel/debug/ubifs/chk_fs, it will do a full scan
upon mount time.
This can detect such problems. But not fix them.
I have some ideas how to turn this feature into a minimal repair tool
but this has to be
done with extreme care.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
