Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0263C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E05E2087C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRLl56pb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="Cw10Lf3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E05E2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGMlJpCpMlUJwoD1UL6KA37RM2KfPL6boIj+L+RJifo=; b=rRLl56pb7pgpLU
	qLVqGz1v4CaLiVmrkhv5fDWPVR+hV8M6oyqsaZ/jImCVl9Pd9ev9ejBJ7g9/4QKqoib2JEb08ssxH
	HqV9ZwCvC0ShB/juuRlIuftdnxTXa9RBKO7eAXzRRaVQwj1XKlG4Y1NPEZI2Y2VQxgLR7AwVs7LRC
	xjh13yBp9w1zAcDxL0RIm8qwNRoJX3YZSByXJ1H+y+Q/Cr9NiEgcOWl2rgVD5YBqsQiYqTlhgtjkr
	oi/fpRR8/K/2ngMqgP++KDzHzUJ22g19+JWDTwXHNmlvMW0quorMPe1R4VXpkTCGR/GBNatLfpJjp
	8979keTzdWNKwoMptGeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqizp-0001h7-Gb; Mon, 04 Feb 2019 18:29:29 +0000
Received: from nh601-vm2.bullet.mail.ssk.yahoo.co.jp ([182.22.90.11])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqizC-0001gL-5i
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:29:25 +0000
Received: from [182.22.66.105] by nh601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:27:44 -0000
Received: from [182.22.91.133] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:27:44 -0000
Received: from [127.0.0.1] by omp606.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:27:44 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 53181.47022.bm@omp606.mail.ssk.yahoo.co.jp
Received: (qmail 50072 invoked by alias); 4 Feb 2019 18:27:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304863; bh=h9F05Lp42UlYi10BiF7ZTrp0PNLEBrFeHqidBG8mPyE=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
 b=Cw10Lf3b227imd9E/OMKcT4h/AASDMCTV33zP5VwgL8nTcqqzFbQMHZwYzZQ+3PHVXqtS8lBY4XVqduXfkWh1ug/Vnn+2NkbXN7D3tZeG1HcQ/QIBBnXjL56GkQ5AFCQzy4qi6c0AqtrmYthV8UIBZKm1UpvkclxMylQZAPFaO4=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
 b=TkbWPUXE51VpHGAqNd2FEyYqZYGCP93v7uL+vvLOVoBk2yFtnPD7l0nwtnbhw7BzO8vYf8b6fL6OENqqGI6kSJRl4Wcp4JP5jka1NqUUm+5u0TOlUQVfkw7zg2IAVzN06DBjt7SysHy3kH7jPOt0pPVj2tKSmrvsv8406A9Ufig=
 ; 
Received: from unknown (HELO ikegamiPC) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP; 4 Feb 2019 18:27:43 -0000
X-YMail-JAS: gc8jcWYVM1kqSpmmkpA1Te8EQJv84_L57GYZQsnWwpG.h5W3kjd0BWOyJvbKD3cXGVLexQjEoQ814z7ZI2U8cqdUDw7oSKEJbo8oxnVD86Ii_gjgRN1VHDC4wr5HpJtT0vRoYollEg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 87Hz4A4VM1lormeeBktq7vTcixZScYwBtwL85uuDgWustKX
 s9qxC5rf1sEKYNDk_SauZCrU5O8ko0KDVP4Po5vhR8IEFg3P7J8lgN6OE5Vn
 UgzPgaO_0dyVlR2LV8gfslhmoglZLZ1iOSxW_bvdJUvLUzhBYrKT7yvemJeh
 1vnGcK9wHTB9Tj7EGa_MML3ZrS5AJfao4aZ1kOSDn_1uHSzSbJWNgv4Fp262
 F6TPG22RKXJMwuveP_y9RgRziDtjuZU1X8WnpmzoxE9Z9Ejoinz2OJbBK76n
 MFRb3av.j0i7MXgkR7Jt_XHb9KdHYER085mCbDjfZgDaNKK8W9a4zB6RoWf_
 4FiHzkXuklUPVv2Ff6aq0xHjlfeQ2RubSnkI4sGrNKapSljcAPMin44NwC0i
 WKbekrzAt3AMT9id5_.quGds.m7OkgEqIIhUe_CJhfUltclg5sN4WPQCK4w8
 zMHD6j1mm8Ws2qbE3tAPGCHXBow_edtjtZwYc0WaECci4VTQyLuhDeB_u4T5
 uOqevJd3zoYU07jIoj8TzrWZtAZKXIBOcfnoG_kidP9D8gQI9GaIEy5zCYjr
 _VANmZkmywrHZjOCgTIuZY7AeDJpW_4qrEDIhvqG.QYFBicUt
From: "Tokunori Ikegami" <ikegami_to@yahoo.co.jp>
To: "'Boris Brezillon'" <bbrezillon@kernel.org>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>	<20190204173550.29703-3-ikegami_to@yahoo.co.jp>
 <20190204190534.456d7bb4@bbrezillon>
In-Reply-To: <20190204190534.456d7bb4@bbrezillon>
Subject: RE: [PATCH v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Date: Tue, 5 Feb 2019 03:27:41 +0900
Message-ID: <002701d4bcb7$50b47db0$f21d7910$@yahoo.co.jp>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQITFMB2buvM7RscwGDN/9ZvoNjxcwFaP3ntAu2efYGlMQXgYA==
Content-Language: ja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102912_963399_F03784FD 
X-CRM114-Status: GOOD (  23.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: 'Boris Brezillon' <boris.brezillon@free-electrons.com>,
 'Chris Packham' <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, 'Fabio Bettoni' <fbettoni@gmail.com>,
 'Joakim Tjernlund' <Joakim.Tjernlund@infinera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris-san,

Thank you so much for your quick reviewing.
I see and will do that later.

> This patch actually fixes a bug (as reported in the other thread), so
> please add Fixes and Cc-stable tags and explain why it might cause
> an infinite loop in the commit message.

Regards,
Ikegami

> -----Original Message-----
> From: Boris Brezillon [mailto:bbrezillon@kernel.org]
> Sent: Tuesday, February 5, 2019 3:06 AM
> To: Tokunori Ikegami
> Cc: Boris Brezillon; Joakim Tjernlund; linux-mtd@lists.infradead.org;
> Chris Packham; Fabio Bettoni
> Subject: Re: [PATCH v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready()
> from do_write_buffer()
> 
> On Tue,  5 Feb 2019 02:35:41 +0900
> Tokunori Ikegami <ikegami_to@yahoo.co.jp> wrote:
> 
> > It is enough to use chip_good() only so chip_ready() is not necessary.
> > Since chip_good() is doing the same check chip_ready() is doing plus an
> extra
> > check to make sure we end up with the data we wrote.
> >
> > For this change the order to check timeout also will be changed at same
> time.
> > The order is not a hard requirement, it's just better to avoid the case
> where
> > the data update happens just after the timeout has expired.
> >
> > Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
> 
> This patch actually fixes a bug (as reported in the other thread), so
> please add Fixes and Cc-stable tags and explain why it might cause
> an infinite loop in the commit message.
> 
> > Cc: Fabio Bettoni <fbettoni@gmail.com>
> > Co: Hauke Mehrtens <hauke@hauke-m.de>
> > Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: linux-mtd@lists.infradead.org
> > ---
> > Changes since v3:
> > - Update the commit message for the comment.
> > - Change the email address of Tokunori Ikegami to
ikegami_to@yahoo.co.jp.
> >
> > Changes since v2:
> > - None.
> >
> > Changes since v1:
> > - None.
> >
> >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index 91a491b..ca9d5fa 100755
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1878,14 +1878,14 @@ static int __xipram do_write_buffer(struct
> map_info *map, struct flchip *chip,
> >  			continue;
> >  		}
> >
> > -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> > -			break;
> > -
> >  		if (chip_good(map, adr, datum)) {
> >  			xip_enable(map, chip, adr);
> >  			goto op_done;
> >  		}
> >
> > +		if (time_after(jiffies, timeo))
> > +			break;
> > +
> >  		/* Latency issues. Drop the lock, wait a while and retry
> */
> >  		UDELAY(map, chip, adr, 1);
> >  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
