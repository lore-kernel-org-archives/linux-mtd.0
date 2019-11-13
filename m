Return-Path: <SRS0=mbSa=ZF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7D1C432C3
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 20:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC246206F6
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 20:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LH3a19PU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="umNxMXgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC246206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKgDFHfnuv/K32qsjzpRPJiUsldLOpsJ87EqU3t/qjY=; b=LH3a19PUqeZJUK
	O6K2L9DDYRYpVEpqHRqOeZ1dMSs/3RYuCJeXVNeWkhx5YtiPCa7/jJaQ2HTId8lXreiDL8mAhrM3f
	fsiymDHcYRZW+1U/0ul6ORNlVoNN3F/99m266MiHULLffpr29iyqNnnysV102TpCq1y23cZBxCTNL
	MKJwii5NAwMtrO/AdFatAsniqToJ4ZSi2ALrbiTKMg2m93gnwHxv1afZc/yhfi6i1BzsbESC4quFo
	oHKekn1PW9NJhCst+tMGd7va4XMlx00EaCIge207EDCLHxYYjFiemqNCjhd0nV1BWSpz8rs+liezs
	q8UbtYU6wY/x3IdSqETw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUzPh-0000SZ-O2; Wed, 13 Nov 2019 20:38:53 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUzPe-0000Rm-QM
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2019 20:38:52 +0000
Received: by mail-io1-xd44.google.com with SMTP id 1so4126664iou.4
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2019 12:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YxcRlNzcBiAlNudn6kLat8m1vGtNWaR0Jl7FMyM2EN0=;
 b=umNxMXgm8tIXimc6Ozqie+Gdq82fKd0dw3loWE9SmGvZAEvk9fJbiRnYW0NFTikUTG
 AOjEZDGuo6/TiRCPGgN68PH+TcYITjdsx3AcWZn/LTfuYDGh47Dlm2+jNYfaOHz1B+rn
 lh+5DE24bJugrp5ewgePSfZ2sFYuUCjLtxeJHa9LmOFcHA0/FvWGTw5rPGKb6YRTOiNT
 6F6uV/lMfmyuYvJ0HkxxSGTZfT4TADggleQ578z3uQzjueYa2Y9mRQ+pzkA4N2QCvCT1
 0JXRsA3pCFDDhBzpFcxtVHFmHbHddlGxGyo//LyBa6rA3QYAa49hiNhO/Ef7HakKmvBC
 tReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxcRlNzcBiAlNudn6kLat8m1vGtNWaR0Jl7FMyM2EN0=;
 b=akQTFCZlHZEzTmG8U+Hpy+SkdUpKe045tbSm5v3Iou5A3YOr/Q3e2NOFikhkEy+b+8
 hkQwA3S+91aq3Rz1GNZAVdHXqo0UC77KsnohLQ0Nq+A6g+gn62OSvcMSGxQG15xwmiq5
 /ghhja5xx1hNR+5MjiusZWwVgb2ezCx5fP3dSsFq9gi0eEQhRwSUTYPo8snv4Tv9/gNk
 zzztVK80F0LfwJlTWTtG3HWFehrKMQzzV4vImh3jlmiBv03V0fdObP0hYUbigpGzEqVo
 Vyn5nfRot4IuVanXbV1RT60wFteeKCLnSpt2+Fvy+Hpqvo2ecltAJKA2f6Ez4bYwdqq0
 hiDQ==
X-Gm-Message-State: APjAAAVWAerFfCm9H7+Q0bm8RkA1/wYoXp7yULYs+8CvziAue8st3Oyg
 KGU8+fk7LiKJTyBdBV2HBL7XToz5NkcRyhToUFw=
X-Google-Smtp-Source: APXvYqxRL9CM16SQPo7Zeq+ZHRXSjENb/hONgI8YRT826tl7bxT8C4vPD8W2YsYzu1nrCI82QHmInaBKQRJzcwW/y60=
X-Received: by 2002:a5d:8789:: with SMTP id f9mr5317745ion.237.1573677528331; 
 Wed, 13 Nov 2019 12:38:48 -0800 (PST)
MIME-Version: 1.0
References: <156950767876.30879.17024491763471689960.stgit@warthog.procyon.org.uk>
 <f34aaf61-955a-7867-ef93-f22d3d8732c3@cogentembedded.com>
In-Reply-To: <f34aaf61-955a-7867-ef93-f22d3d8732c3@cogentembedded.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Wed, 13 Nov 2019 14:38:37 -0600
Message-ID: <CA+EcR22=7F7X-9qYXb94dAp6w0_3FoKJPMRhFht+VWgKonoing@mail.gmail.com>
Subject: Re: [PATCH] jffs2: Fix mounting under new mount API
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_123850_859865_F674F1DD 
X-CRM114-Status: GOOD (  19.23  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tested the JFFS2 on 5.4 kernel as the instruction said, still got some
errors, any ideas?

Without the patch,

root@imx8mmevk:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00020000 "mtdram test device"
mtd1: 04000000 00020000 "5d120000.spi"
root@imx8mmevk:~# mtd_debug info /dev/mtd0
mtd.type = MTD_RAM
mtd.flags = MTD_CAP_RAM
mtd.size = 4194304 (4M)
mtd.erasesize = 131072 (128K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

root@imx8mmevk:~# flash_erase /dev/mtd0 0 0
Erasing 128 Kibyte @ 3e0000 -- 100 % complete
root@imx8mmevk:~# mount -t jffs2 /dev/mtdblock0 test_dir/
mount: /home/root/test_dir: wrong fs type, bad option, bad superblock
on /dev/mtdblock0, missing codepage or helper program, or other error.

With the patch,

root@imx8mmevk:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00020000 "mtdram test device"
mtd1: 04000000 00020000 "5d120000.spi"
root@imx8mmevk:~# mtd_debug info /dev/mtd0
mtd.type = MTD_RAM
mtd.flags = MTD_CAP_RAM
mtd.size = 4194304 (4M)
mtd.erasesize = 131072 (128K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

root@imx8mmevk:~# flash_erase /dev/mtd0 0 0
Erasing 128 Kibyte @ 3e0000 -- 100 % complete
root@imx8mmevk:~# mount -t jffs2 /dev/mtdblock0 test_dir/
root@imx8mmevk:~# mount
/dev/mtdblock0 on /home/root/test_dir type jffs2 (rw,relatime)

BUT, it's not writable.

root@imx8mmevk:~# cp test_file test_dir/
cp: error writing 'test_dir/test_file': Invalid argument

root@imx8mmevk:~# dd if=/dev/urandom of=test_dir/test_file bs=1k count=1
dd: error writing 'test_dir/test_file': Invalid argument
1+0 records in
0+0 records out
0 bytes copied, 0.000855156 s, 0.0 kB/s


On Fri, Sep 27, 2019 at 3:38 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>
> Hello!
>
> On 26.09.2019 17:21, David Howells wrote:
>
> > The mounting of jffs2 is broken due to the changes from the new mount API
> > because it specifies a "source" operation, but then doesn't actually
> > process it.  But because it specified it, it doesn't return -ENOPARAM and
>
>     What specified what? Too many "it"'s to figure that out. :-)
>
> > the caller doesn't process it either and the source gets lost.
> >
> > Fix this by simply removing the source parameter from jffs2 and letting the
> > VFS deal with it in the default manner.
> >
> > To test it, enable CONFIG_MTD_MTDRAM and allow the default size and erase
> > block size parameters, then try and mount the /dev/mtdblock<N> file that
> > that creates as jffs2.  No need to initialise it.
>
>     One "that" should be enough. :-)
>
> > Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
> > Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> > Signed-off-by: David Howells <dhowells@redhat.com>
> > cc: David Woodhouse <dwmw2@infradead.org>
> > cc: Richard Weinberger <richard@nod.at>
> > cc: linux-mtd@lists.infradead.org
> [...]
>
> MBR, Sergei
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Sincerely,

Han XU

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
