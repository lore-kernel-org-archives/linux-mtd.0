Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1145BC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 16:10:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E902080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 16:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BzyF+Rmk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YsTdy6Hn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmmt7s5v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E902080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rH5yk6WaQJxFhQKNdHjsQ3xUxWy2BFmFWIeRgV2Lqbw=; b=BzyF+RmkS4XIva
	a6XIrD/AuhffYFkVU/nxBjvB4fo6FuSJvZS/z/wYGZLr2FH4YN8l97EePmk011HW85O8WHXuNGGPL
	ngc8s0hwpPG7mhNnE3MDFJmpi7YobkzZaKPD74l3J3nuq81pOoE88fEwIjFcEhDWSvOz4qLpkcU5s
	GJ7rHJz7qtnhb2pXZzHINzG3JNX25I8yZta13CeLziOanW1Lvc/SVfZvLS4IGW0uAwXxBzfCCobgY
	4Y6Y4iCGeNF3sgyj1K5hrwNNL0NoAcZfw3cQpZI3XkowkCMRZ19GLDJ6rx54cI/YZeheONr6JKqs8
	cU2BTXUo0qPKqKV55KUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr3J8-0004fW-Kq; Tue, 05 Feb 2019 16:10:46 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr3J7-0004fQ-AL
 for linux-mtd@bombadil.infradead.org; Tue, 05 Feb 2019 16:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fYq3wHJRiEUQYz1qs8P8cUA+dgwTRO8dIxATL5QPICE=; b=YsTdy6Hn9E+8/cBeJw3z3qG5E
 PAJMYtbLq0kNGb1DQoKZw4klXo+YQYzqQTPafeLpJGy5lBursHhb0lx/ZNS9zqCw1yJMNGi8uTRic
 EXeJq/Xe7TzpzmqWpxdC51motITRVBs46YI5mjfKoESkjo94L2drG4M6Z0Qw0LiK31bIo6pQ6NHUR
 tXUgrcSHWvNUysywAYsX7FDSYEsDboc6N18DNUZ13Gx7eRVpa0acvg1u2SC35L0e12C4BGu7Ygxsl
 9Dto1BGvh7mDiA+3VgcqLUdlY2htB9y2z5e55nYoFErrryhPFIqNHxFYGMGdfGloynJUccUZY7tlr
 fpUTwSHtg==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr2uW-0004fd-4A
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 15:45:21 +0000
Received: by mail-ot1-x334.google.com with SMTP id t5so6469299otk.1
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2019 07:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fYq3wHJRiEUQYz1qs8P8cUA+dgwTRO8dIxATL5QPICE=;
 b=qmmt7s5vjOFw7IeeXu5/iM5qpc7v3pYOZul+/rFmctCCxGE24f5Kf2a5MBBHPSc05G
 oDwxr9HQK+RiQLtsFfrwlbaH/HnGdkDuaoCDmgyszvDmucW9q6n2KYlPbIhYWPAShZwa
 gwl/PHWdbsVfkYbSiG8KiZl5IsP5de60hH2Q1MXpvMStMAKIM/17QYM3WMRc525qQQ3j
 o9haB/y+jp5nbzKYZk8JWqajNqPY52QTQ6fhlF4Q2mZ159AgtTL5rpppU01EleaQC4Y8
 WWfaAUrHXd5XUacVoY/wTZ1hKUmke/RM8MzGBql78gEwc9jMN+GrNr4ycjMPg+BzjK3Z
 LlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fYq3wHJRiEUQYz1qs8P8cUA+dgwTRO8dIxATL5QPICE=;
 b=TZkwt03cM2bl0tw/4CU5uzkdjsGi1ssNhTIy8FUG8uSosSKnAbVjgtGz4DmRB+yn7s
 DvFlxwkf/eTCH39Bm3qdM7/ySPSx5z8TYQQdvksCzdRPJhVqfM52BsVTcJZa5w4crO8I
 2i6/7qNZhLlESrILX1TpWR9o+vUoVqddftwGoNLsnXG5ynvFjhO9iwH2pTnCrlYaqNSC
 rsrxSx8R6P4Cik/lAhfvJzCgCpJ4fAaAQe7m+N8II62sWugVvGiXNZfNPyFhoXX6k4W5
 0PejXU7jD8yGOcEfJnTDq3sXsdjlrP7Xv5ylEYQfPd6t+ybtJ9M5mz+1biacZKMzC8Xc
 wuAw==
X-Gm-Message-State: AHQUAuZkarQ9+dySfzo2CQauCYEQOpmZobk0WUVOeI5i/fRJmvI6vxx7
 C/6QdCem4ttA9x5sjOJs8hUedp/mFrOPrDSTdZk=
X-Google-Smtp-Source: AHgI3IbSeg9YA4CNc0hy/OOoEqmD0WnfDiL7wwpwv5bkWXbd5yttWfwM1ebkoEf5PBfhncH8I3hgCIa2fH/6sDjutZM=
X-Received: by 2002:aca:3092:: with SMTP id w140mr2911879oiw.237.1549381515227; 
 Tue, 05 Feb 2019 07:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20190129153700.18717-1-martink@posteo.de>
 <20190205135946.64eda55c@xps13>
 <CAOMZO5Cbhr-Wxu8W-oCKBP9NS3UN92=NUfYdkyYp-yy2oy12SQ@mail.gmail.com>
 <ff0c92b8-f26c-eb86-30bf-ec9f255b8ed5@ginzinger.com>
In-Reply-To: <ff0c92b8-f26c-eb86-30bf-ec9f255b8ed5@ginzinger.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 5 Feb 2019 13:45:11 -0200
Message-ID: <CAOMZO5AOcjbvhd+SJVL==+ieFH1pvpCzE7ZHBA+N8MPp_=a+mw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix MX28 bus master lockup problem
To: Martin Kepplinger <martin.kepplinger@ginzinger.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_104520_191191_CE0D3428 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: bbrezillon@kernel.org, Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Martin Kepplinger <martink@posteo.de>, Han Xu <han.xu@nxp.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Tue, Feb 5, 2019 at 1:42 PM Martin Kepplinger
<martin.kepplinger@ginzinger.com> wrote:

> Actually I rebased this from our 4.14 stable tree, so yes, I just forgot
> about that and I guess it would be
>
> Fixes: 6f2a6a52560a ("mtd: nand: gpmi: reset BCH earlier, too, to avoid
> NAND startup problems")
>
> Do you want me to add this and CC stable?

That would be nice. You can also add:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
