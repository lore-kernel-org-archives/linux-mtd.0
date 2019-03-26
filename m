Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCB2C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 09:22:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B875B2084B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 09:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UdDQJn/b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bofh-nu.20150623.gappssmtp.com header.i=@bofh-nu.20150623.gappssmtp.com header.b="YWQ3iZDs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B875B2084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bofh.nu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4hf2b1TNfbep3XnTWZqU2SG48c9ay0faQcVN4O+cArA=; b=UdDQJn/bbn0tUIedfpDu3W9qb3
	2PwKJWcjQh0R+RIHoyDn31Hg7OjPROh28Diuwcv0kPG8I3Dc9S6DarsPBpjBVPZG9Tim4n1w8RHiz
	8cG5n8oZm5iAO8GnbGS3mo9OTLAcyimnqAlrFWXczGxfKXByajlfNHVHqy43TZBmrv+ILUDAAIEha
	46aESjjOESaU8psubI9StmQE2aGhN4OQ1/i7pDYEW9zS7HtwW/oFTH7AfB9NuNN5hHQXWYchk+mf2
	ZaZ93BtKKcQnD61S0k2CtiT3+85kqkCOpYpI85Lxj7ll6nb6tuzMZYKSSjMXAPjxUSsMfoSt5Y1+u
	CaZp5maw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8iHP-0002Z6-PQ; Tue, 26 Mar 2019 09:21:59 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8iHM-0002Yl-QG
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 09:21:58 +0000
Received: by mail-oi1-x22d.google.com with SMTP id x188so9321013oia.13
 for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2019 02:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bofh-nu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=McBHJysv7Ds6KNlOowVOdfKso2GTiHUszDHy6ivKaKA=;
 b=YWQ3iZDs1Ec21xEiw5nOwZeVyLgb2f6vOc3YeUH1vHtr1UOhTXL4pIwrIA1aHY8qZc
 xE0OFvImJvvOdfEnRPBLYL0hbAvf7OzCGmNKTuSl54uSleQEqoiMDpFobUczLUNNekc5
 XFLRjdfodUfX1UOUArYNuL2Iww/U7ojRvAJ0h9YT/nBzP/4ROeej8WelUfcjvo2HUjgH
 1UBonnqY1c0EPPvm6RRGDmgky4TQUPDFXRADKmyaYnMd/UTW5tv476jzyPnTh8n+Msxg
 2Dh4+af473ue9pI08Jr85bHKXXXs53ysDg9RciYoXAnWoFBF8aTG/rHh7sVfGDUSSxAu
 jclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=McBHJysv7Ds6KNlOowVOdfKso2GTiHUszDHy6ivKaKA=;
 b=jlSD1KPqJKx0OFJ9DkEtBAvSy7AzBOKhFEbNiy6KxWtdS0kLq+1V6nqOBgww+YfXXS
 e318+FjczPE23VkslAVBfnvQJnyf1E71rjOGigZa5wioWMzzrsuG1cM2uPilH0z25CjL
 U2iLumpj/tPvlKPxoO03K9godIjIRZKk8Zyzewb1CrAYRdVWRDBzq5vAx/OA7VFD359W
 aqtJ2Lb1RZEdUMU/JS5ideI+Yp2w/n9+FBFQB6zK280PD7qEiH/b8ln5yPCgp+Ruuhv8
 MmKpUafDAZQCN9ilvyVxLkf4vs19VT2Iv/I1Dxz6KRPG8evBsac5M3ObByi6tFBbZrmJ
 qbkA==
X-Gm-Message-State: APjAAAV29FMUdvl03FMVIqS1Fm7cN5B/9maPs4uOU095fdDO77YlODpU
 wR+5j3LOw2xvjujBi0iJbdfsGtQ8gbdxnHQ8rVg8FS4x
X-Google-Smtp-Source: APXvYqwdACCvjPvcUXEgQ19BVdmsCjnbudIbrRbI+jpa6Q8LANU0VcbHPUTYExAmVafNW2T7dHqX/GymTTdIwll742w=
X-Received: by 2002:aca:ef83:: with SMTP id n125mr13960602oih.80.1553592105130; 
 Tue, 26 Mar 2019 02:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
In-Reply-To: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
From: Lars Persson <lists@bofh.nu>
Date: Tue, 26 Mar 2019 10:21:34 +0100
Message-ID: <CADnJP=shWk7qcK1V9v0JiDGqmOD4-B3zyXzbj7ZbTf2H3BLnRg@mail.gmail.com>
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_022156_899327_9E6C8C57 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 21, 2019 at 11:02 AM Lars Persson <lists@bofh.nu> wrote:
>
> The missing inode is always triggered on those two particular files
> emotiond.conf and tampering.conf that share the same write pattern at startup:
>
>  cp file file.tmp
>  echo some data > file.tmp
>  mv file.tmp file
>  fsync file
>

A closer look at that script shows that the atomic file update part
was bypassed. It only performs a chown operation on that file.
That simple chown will trigger an overlayfs copyup operation.

With a proper unmount after the system has finished writing to /etc I
cannot reproduce any corruption. An unclean shutdown triggers
corruption in about 1/3 of the attempts, also when I cut power tens of
seconds after the problematic script has executed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
