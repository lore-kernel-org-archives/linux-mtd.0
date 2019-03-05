Return-Path: <SRS0=LjUq=RI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0088C43381
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 09:21:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDCEE206DD
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 09:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z8TfsNFx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="oszpQX22"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDCEE206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAyI8abXkHBqmTpZJ++DYBQ3WWqBNlzLSIUyP2YzvVY=; b=Z8TfsNFxIzAya6
	jufPYQU6GvIQ1W4e0UCjqECeKeFAOO0tQCqt3v/ZtS+u9ib/gdyKv3T2kPMxoyRJK1nyH5RDcE5VQ
	Q1AyiefxyBF9YSZKz5fU2iEEbf6TDfLodVPsGOVoD8GrOll8Kac29BthCDA9QV+WSpKwr/9L0EN/H
	wFbjzB1bug58NcGGiPje6zjk+y03xIlpSmuOavU3EFVdBn0Ta6Dky+yaMjdtVphg7nC1he4s++pFR
	xlDeqfZBhlbQmELdl+xsXPchXQ9v62elaGxChHsKbeDNX742wj4ofDkH1RZQO1ZSA1wcgHYuk0j9/
	4ejQ1tuX07F+5ukPCF+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h16GQ-00007u-9q; Tue, 05 Mar 2019 09:21:30 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h16GN-00007G-L2
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2019 09:21:29 +0000
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x259Kw9w002931
 for <linux-mtd@lists.infradead.org>; Tue, 5 Mar 2019 18:20:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x259Kw9w002931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1551777659;
 bh=n3KJVYBv09wgsRhWLTES9R+R2x0ss4Nx5o5rZ9eHyZs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oszpQX22Y6OGB4iLb19PNA2O+ohym8GNBBjoN247Q0Pyu04oDluRGXpE/6hsQPCVn
 RpLbOwdAG63/wINPF6ilzvKT7mWc41CJgtEUGRyo2Fw5oj/Hzq6mRLwFozAIGcLdzT
 mjmvqKzoTAWqJZXFcjWsFMTTmVz2i319TgAAQPSBLzyQ2ykoc1QvfQNHGlHRbXiiyk
 Hh3KmH+jwbZzWq2olspQiHoOfEVZHddJrsujS0h+bBPfAoJ/yS8tz0dFDQIUtIEZbp
 7n7KDzXZJdRLgAymCAYHmPpIyv6vLNMMz8VKry6GHfqKFq0yKpJjRY0c6sInA6J1z6
 FtjVSDHkU7FUQ==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id f88so7122401uaf.2
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2019 01:20:59 -0800 (PST)
X-Gm-Message-State: APjAAAVF0fEkG98bLbztz8RAdoxgAWWKpauTbB6++kO8RSxYB3Lm4V+0
 rXwmeuypGmCPYBru8JRb5lKBpBpX/3ZxaPfbTXg=
X-Google-Smtp-Source: APXvYqwUxPcFCDcq1pmH3zcXmYu/REIVSy9qiCLgsC89JWmmdlOhe3nFAEaGSbdmyo2dPLjaK0/hFjV3uPdc5mbD5JU=
X-Received: by 2002:a9f:314d:: with SMTP id n13mr718977uab.6.1551777658294;
 Tue, 05 Mar 2019 01:20:58 -0800 (PST)
MIME-Version: 1.0
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-3-git-send-email-yamada.masahiro@socionext.com>
 <20190304100106.72ad49c3@xps13>
In-Reply-To: <20190304100106.72ad49c3@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Mar 2019 18:20:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNASeBDxsUj2fu0bh9G6dXV2jxeHp6iBG+8FytNbHGtVHKQ@mail.gmail.com>
Message-ID: <CAK7LNASeBDxsUj2fu0bh9G6dXV2jxeHp6iBG+8FytNbHGtVHKQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] mtd: rawnand: denali: refactor syndrome layout
 handling for raw access
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_012127_903179_A63C9765 
X-CRM114-Status: GOOD (  25.89  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Mon, Mar 4, 2019 at 6:01 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Masahiro,
>
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 12 Feb
> 2019 16:12:54 +0900:
>
> > The Denali IP adopts the syndrome page layout (payload and ECC are
> > interleaved). The *_page_raw() and *_oob() callbacks are complicated
> > because they must hide the underlying layout used by the hardware,
> > and always return contiguous in-band and out-of-band data.
> >
> > Currently, similar code is duplicated to reorganize the data layout.
> > For example, denali_read_page_raw() and denali_write_page_raw() look
> > almost the same.
> >
> > The idea for refactoring is to split the code into two parts:
> >   [1] conversion of page layout
> >   [2] what to do at every ECC chunk boundary
> >
> > For [1], I wrote denali_raw_payload_op() and denali_raw_oob_op().
> > They manipulate data for the Denali controller's specific page layout
> > of in-band, out-of-band, respectively.
>
> Could you please comment the purpose of these two functions in the code
> as well?


OK, I will.



> >
> > The difference between write and read is just the operation at
> > ECC chunk boundaries. For example, denali_read_oob() calls
> > nand_change_read_column_op(), whereas denali_write_oob() calls
> > nand_change_write_column_op(). So, I implemented [2] as a callback
> > passed into [1].
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > Changes in v2: None
> >
> > drivers/mtd/nand/raw/denali.c | 354 +++++++++++++++++++-----------------------
> > 1 file changed, 163 insertions(+), 191 deletions(-)
>
> Too bad that the size of the driver did not shrink more than that :)

Indeed, less than expected.

But, please do not miss this commit is adding
error check to every operation.

Prior to this commit, the code just ignored the return code
because 97d90da8a886949f simply replaced old hooks
despite the new ones return the error code.


Generally, every error check costs two lines
in the following form:


  ret = (do something)
  if (ret)
           return ret;



> > +
> > +static int denali_memcpy_in(void *buf, unsigned int offset, unsigned int len,
> > +                         void *priv)
> > +{
> > +     memcpy(buf, priv + offset, len);
> > +     return 0;
> >  }
>
> Maybe this "callback" and the (_out cousin) could be part of you
> controller's structure,
> and you could use a read/write flag instead of
> passing the functions' pointer?

This is what the old code does.

There are 4 callbacks for the combination
of raw/oob, and write/read.

I do not know how your suggestion looks like,
and whether it will make the code cleaner.



--
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
