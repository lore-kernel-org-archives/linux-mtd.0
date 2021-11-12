Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ABFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 07:19:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E104E60FE7
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 07:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E104E60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sB5nA67gb9YQ25s9Di3i8Sga8yzT0f0682838P+JPFM=; b=37EMds3smKH2AgXFXJkAa8fv/M
	w61KDt0T7iK9bxUWOy6Ey0AU1kqkqt2FeYRBaWn6WRJ0obEkpaCEHLJ3qAvY3O3ky3HmoemluVEwo
	amQc0B9hzvmb7q0gcpxxTZvryJfOLj762h7AeY8F1tfHfqaptFr0KMc/jC02m51TNjmZsaXnEKCHB
	16oO91xqjzaeawFBwNXsenf5JrNzIogFJCLnuDQmnSR1g2IGKdxjpqsDClVp+8NTv1/fPmUmObaFk
	G8ZcfP4ap2BZAZf58H/div5lzHF69JI6anYZDtRVgXyiLuGclFvJ+CtW29bv1AOyQyzVCRboFpwbT
	FcfJyzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlQq7-009b6H-Gb; Fri, 12 Nov 2021 07:19:11 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlQq4-009b5F-IU
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 07:19:09 +0000
Received: by mail-ed1-x531.google.com with SMTP id f8so34237412edy.4
 for <linux-mtd@lists.infradead.org>; Thu, 11 Nov 2021 23:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=23MuWJBgLsmpo3DWwY1zc1kp+jWhxY7Ijuwd9E4NgEk=;
 b=Vkfd+Ngmf8e5tezD37bbnSLTKfHJ1YCgXEOfo9QxnVJIx47FaMesIQllT+O2nZMOr2
 gAvUVCbxZ8MBfAjvB4r83cGCaZGmeit88cjzDaNHcUu6pZPw0LYuW9JyqobxIA/dxQZC
 4eMP7qYVNhdEXe1ow2gyqCBNF0azrNp8981zXIHktGMkqw21iUqvWRw/80AjHMwDrACB
 0u7izw69vSTCT6iREHudCfWLd7Tv9y4WYCS1LzBUA/Fxm/yMntlh8RW77MekZwOP1cRP
 Nt4Q9tYszsWb72N4DV3BNTytV9coyEbqgmvvT1+gadXKqa26AKoGnusvqJMxfdIHWVYW
 2zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=23MuWJBgLsmpo3DWwY1zc1kp+jWhxY7Ijuwd9E4NgEk=;
 b=YZpjvcEm0158Arlg5XLwaECIhHRkFnTiThxVsRsryspKeFEdEq/yWz7HuKn1M062Lp
 44ru6STfUqyLTaoAdQ3nkRFLofF+jWWkW2gLxYRgkc8EYO3tRdG1tioFx6C7p/7mWu5r
 83BrRvpVKmyNzqYeHsfxCDwYjd39hAEWbFYp5qP/EHoPoxLPVF5n7EQGGHJyQm7iUwMa
 ZFu8QcWkkvjlquIqZwinUgRKjsZkM6kKLIJmZmS82SGDQEZT4PK6qJJ+lSMNW3O2iWVO
 4Atnbof2QZc2zMR58L4CXxm8Ljpt7kT4jJLG1S2feq0bRrPzvW2TKsjFXi7GQIKDY2Fl
 9EPQ==
X-Gm-Message-State: AOAM530BkJvDICOeWYuGsMdqXkcJVi3wxVzGCNX9SQJat6QHZqPuqyi5
 VTHPLmU2jtJwOHRmfEa3IxlALUPudrWwJgZPmyE=
X-Google-Smtp-Source: ABdhPJx13NMWj+ghQdIXzWAZXD21zp7HK2PPcgzpsVoQ5oiXGPhrERb6kk1sCFUWYPnyLmUI/dMVXMZ3WHQjPvatP2I=
X-Received: by 2002:a17:906:fca3:: with SMTP id
 qw3mr17312375ejb.285.1636701546085; 
 Thu, 11 Nov 2021 23:19:06 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLinoW5Cx=xbUcT-DB4RiQkAPpe=9hsc-Rkch0LxD0mh+Q@mail.gmail.com>
 <CAOuPNLgquwOJg85kDcf67+4kTYP9N=45FvV+VDTJr6txYi5-wg@mail.gmail.com>
 <CAOuPNLjFtS7ftg=+-K3S+0ndyNYmUNqXo7SHkyV4zK4G9bZ4Og@mail.gmail.com>
In-Reply-To: <CAOuPNLjFtS7ftg=+-K3S+0ndyNYmUNqXo7SHkyV4zK4G9bZ4Og@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 12 Nov 2021 12:48:55 +0530
Message-ID: <CAOuPNLg_YwyhK6iPZZbRWe57Kkr1d8LjJaDniCvvOqk4t2-Sog@mail.gmail.com>
Subject: Re: Kernel-4.14: With ubuntu-18.04 building rootfs images and booting
 gives SQUASHFS error: xz decompression failed, data probably corrupt
To: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, dm-devel@redhat.com, 
 Phillip Lougher <phillip@squashfs.org.uk>,
 Mikulas Patocka <mpatocka@redhat.com>, 
 Richard Weinberger <richard@nod.at>, Florian Fainelli <f.fainelli@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 drosen@google.com, astrachan@google.com, speed.eom@samsung.com, 
 Sami Tolvanen <samitolvanen@google.com>, snitzer@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_231908_654160_4C94C8E1 
X-CRM114-Status: GOOD (  12.06  )
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

Hi,

On Tue, 9 Nov 2021 at 21:04, Pintu Agarwal <pintu.ping@gmail.com> wrote:

> > > We only get these squashfs errors flooded in the boot logs:
> > > {{{
> > > ....
> > > [    5.153479] device-mapper: init: dm-0 is ready
> > > [    5.334282] VFS: Mounted root (squashfs filesystem) readonly on device 253:0.
> > > ....
> > > [    8.954120] SQUASHFS error: xz decompression failed, data probably corrupt
> > > [    8.954153] SQUASHFS error: squashfs_read_data failed to read block 0x1106
> > > [    8.970316] SQUASHFS error: Unable to read data cache entry [1106]
> > > [    8.970349] SQUASHFS error: Unable to read page, block 1106, size 776c
> > > [    8.980298] SQUASHFS error: Unable to read data cache entry [1106]
> > > [    8.981911] SQUASHFS error: Unable to read page, block 1106, size 776c
> > > [    8.988280] SQUASHFS error: Unable to read data cache entry [1106]
> > > ....
> > > }}}
> > >

One more observation:
When I disable FEC flag in bootloader, I see the below error:
[    8.360791] device-mapper: verity: 253:0: data block 2 is corrupted
[    8.361134] device-mapper: verity: 253:0: data block 3 is corrupted
[    8.366016] SQUASHFS error: squashfs_read_data failed to read block 0x1106
[    8.379652] SQUASHFS error: Unable to read data cache entry [1106]
[    8.379680] SQUASHFS error: Unable to read page, block 1106, size 7770

Also, now I see that the decompress error is gone, but the read error
is still there.

This seems to me that dm-verity detects some corrupted blocks but with
FEC it auto corrects itself, how when dm-verity auto corrects itself,
the squashfs decompression algorithm somehow could not understand it.

So, it seems like there is some mis-match between the way FEC
correction and the squashfs decompression happens ?

Is this issue seen by anybody else here ?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
