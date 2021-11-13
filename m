Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4042FC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Nov 2021 02:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B3760F39
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Nov 2021 02:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0B3760F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	References:Subject:In-reply-to:CC:To:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeLR+HMwliT1/h8A4mg+qAm+y5axtsqf0Qjze0xrFs0=; b=uJhPEu1FTQCzGW
	xEYWCIgambKTFvihC4fNGHPdaxjNZTvA5XhfmOkJREwkOfGbJmvzd8ey+i9l7ugDt6y/VXGh+ihK/
	dcqYbHdsdwle09Wr6WcC/Fn6+Hag/PUlHKPkQcKqFO0wGixseyAqaRTjuNKFQMGxC1ovfGy9WdxPS
	NrRtrY482qKrKtQUC21bImyQt9QXSihneffiZZHdvqxLWyE1QDIZol07vQfJ40FRI7Zu4x2Wdihns
	vrbfFRULSlW2+4lDggAQeVXMTR2CultoCPSIwLLIEM9vHZdltVBmpA70KjsQV/L0y4VcOg5G2Hwrt
	LJG0JXsTzA5nwmGPXWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mliYP-00C2dl-18; Sat, 13 Nov 2021 02:14:05 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mliYM-00C2dP-Cl
 for linux-mtd@lists.infradead.org; Sat, 13 Nov 2021 02:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636769622;
 bh=TF1auNeXyQ/vVgA7rEfAoHjYQOhBDApJJemihsdWRsA=;
 h=X-UI-Sender-Class:From:To:CC:In-reply-to:Subject:Reply-to:
 References:Date;
 b=gbWWj1Wv538147jpKCJFlzBRkG1pi0pEJz142PLw7ad89iZMPo9dYWZR1sLYRdnmr
 CYpWGK55nmacWZ0/uXe0RrRq2pLlAllrQvsOPI7tk8PWdFOQllQigQNyKn6wQo8Em4
 Ejme7ixnI2SPMcsmIs1ccwBn7ExCtRiMrZWDlwmM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.131]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MMGRA-1n1jEJ2jyQ-00JGi1; Sat, 13 Nov 2021 03:13:42 +0100
Received: by corona.crabdance.com (Postfix, from userid 1000)
 id 3CA4527F135; Fri, 12 Nov 2021 18:13:30 -0800 (PST)
From: Stefan Schaeckeler <schaecsn@gmx.net>
To: richard@nod.at
CC: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sschaeck@cisco.com
In-reply-to: <2065858791.38760.1635277003599.JavaMail.zimbra@nod.at> (message
 from Richard Weinberger on Tue, 26 Oct 2021 21:36:43 +0200 (CEST))
Subject: Re: [PATCH v2] ubifs: ubifs to export filesystem error counters
References: <20211010042239.2888-1-schaecsn@gmx.net>
 <2065858791.38760.1635277003599.JavaMail.zimbra@nod.at>
Message-Id: <20211113021330.3CA4527F135@corona.crabdance.com>
Date: Fri, 12 Nov 2021 18:13:30 -0800 (PST)
X-Provags-ID: V03:K1:0qd41HjEcZBd+PnmoOlKHviqrjoKVBOiTJOM5tu1C6jSGxVvuVM
 hP09SQmQPn8ylbGNGnaJhuLlTeBzBcRL8Uo87l+m1qp84IyKoNP+O4aXDaKkXKo2GYtCkt9
 jB6zm92RzsxKP1sNwxLZEcbs6Y/E64d6J85UvQLAa8nWNw+e4G1L2HHx8Z3L9oGmd69KVO3
 8TjzLbVQ9zDsqRmHxhpsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:crHexG1+UvI=:D5ZXXgwgUp4EnCGmUM+z68
 8jM72AIGxp0fIN/KH7Cb7IqCaaG15ogjdmXqGFScWB7f8jeRd9LY/yzbHfuKbmrB1EsQ/lzNF
 0JNHDR/VSmoIeNWQzCpE0TbOa90rdPICn1JCBrFzOj89dVGWJQvNO6IgPZEXermfr2ow5o/Rc
 dzkuJKxobEVjPWt/RGiE33LiB9NmD8vV7eWEGhHR5dSKxgZ0thOctG9/Pe6u1hJ+EfIaesEtx
 qZ7BkYXYHZ6CSFwG3gyYT0Ugy3ivzxS5Ry/BLv4++mTa1lHJE+PT8NRoQ4HeFXDPy5BbN+LyK
 wPikUyMW9ZMfCTgn6u1MKNQTbIw7i0OuL8uRYEKtDd0IhHQIY2pzRWz6LxOZDtHGt8bmPHF8v
 cuMIB5miaC+F6r9AWOaZj4SZPxrCVry2cvasD02dYtjT0HYh1ZptHcCirQMZsvcgtizmrh+hd
 unlH/pk2Mb2yPWiBtZ8+DSo4tphW6tW+Y/1BZ0VNZjLOFtEBk6lBU0u6PF0rjOe3ttRKECJ8O
 DYUz/i59k/klgwBeQenZXBgHMU22RocHAw+XJwT2LLYoYFA1YMzKvoN9FGFkMEhV3vBm8JYzB
 0F9dehOuIfD84ejjXqDtPh9puYO7lbQ2ldNOcBSuoa/6iJoSIDN/6LM/WQ4CJslruBgT9/Ps/
 PuGst14lSVCHpgXCG1ocFJ6sQi5N6TIFnvUJHOVeEeDLqlXtyicijxG7CWOu43hAr0RSLgE0A
 aS6bXJ4M5eh/lv1BVvAL2B8wrATNEnnhWtwwBVQza7iXtoKLegc0HTSsKI6sP4sDb1yl5DZTN
 dBj0RAc9Hp0TZmTulQD0aBMjkTTqvxfsJ57wnPHDEKNnXPHuk0Nj81jhVEMQNlzcP/fQcmi9G
 /ZvU+HIU9h4Oka11A+Yk7qrRSFAlg0upfdJm4txQ/klO/sVLKZujI1r9CHT1oH/6JI9umJ0t7
 rB52QESr6k2fswMID8qpfw6EjnRabGiD5SKHm51UMeSLxtKtIHFDb1XTQUY1VgR51Ffz7cGLv
 dcBNBQbbLCpqwLb9YVXFZztDIc+lopztYtOB49PxFWeGOCSjPZKIAFF4rR4QlTSmX1mumyE+c
 WJGMb/qqZnbItM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_181402_811362_8A22F6FE 
X-CRM114-Status: GOOD (  13.08  )
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
Reply-To: schaecsn@gmx.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

> > Not all ubifs filesystem errors are propagated to userspace.
> >
> > Export bad magic, bad node and crc errors via sysfs. This allows userspace
> > to notice filesystem errors:
> >
> > /sys/fs/ubifs/ubiX_Y/errors_magic
> > /sys/fs/ubifs/ubiX_Y/errors_node
> > /sys/fs/ubifs/ubiX_Y/errors_crc
> >
> > The counters are reset to 0 with a remount.
> >
> > Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>
> > ---
> > Changes in v2:
> >  - merged sysfs.h header into ubifs.h.
> >  - io.c: wrapped incrementing error counters into new functions
> >    record_*_error().
> >  - sysfs.c: removed sysfs write callback for clearing stats.
> >  - sysfs.c: ubifs_sysfs_register(): free c->stats on error.
> >  - sysfs.c: ubifs_attr_show(): use sysfs_emit().
> >
> > fs/ubifs/Makefile |   2 +-
> > fs/ubifs/io.c     |  21 +++++++
> > fs/ubifs/super.c  |  16 ++++-
> > fs/ubifs/sysfs.c  | 153 ++++++++++++++++++++++++++++++++++++++++++++++
> > fs/ubifs/ubifs.h  |  35 +++++++++++
> > 5 files changed, 225 insertions(+), 2 deletions(-)
> > create mode 100644 fs/ubifs/sysfs.c
>
> Queued for 5.16.

The merge window for 5.16 is about to close. May I point out that, as far as I
can tell, you have not sent a pull request for ubifs, yet.

 Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
