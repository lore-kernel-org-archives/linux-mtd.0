Return-Path: <SRS0=IIRZ=RK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D98C43381
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 15:01:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E3820449
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 15:01:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PNzC1zGj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkHEwfDr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E3820449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40MJyOWY4hdIxSfycAXZeiHU7UGCb7GaOQ7sGreIhUA=; b=PNzC1zGj08WVR7
	aL76bi6Yf4xN6LII+YCg14sJQ9sgPcpWfqGXKLMyoaJHWxQXewHp+ribN8qLsWIMFDuw68gR0AHTN
	ABHjTiFoZlupG+z3rwj4f8RYj7xPyiQtO7h0kpldeXtIU/s6OhDCWohIt95xcjBs6dCAfgEPpcL1p
	6WwHPMH2zmkAVatHCbgsbLRx+NzlFZ5Q31Rw6fcWxk/WAJZ5x3WtPjxPDPqImtLgK3H7FuMEsYrMX
	KHX+rL8BlgJ5lc2VlOh5brdkWeT5S/0MLpmZJFJRveE5s87doseTII8LCpylp0/RchhUhrJnnMhBt
	eWs+VK39ttWFJk8ste8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1uWe-0007dL-Na; Thu, 07 Mar 2019 15:01:36 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uWW-0007cl-VD
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2019 15:01:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id i12so17793059wrw.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2019 07:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDRg5LvS4OI8kqBhNds2vXiNeGoOZqfeeoxeOxzTn9s=;
 b=bkHEwfDrIQncaDZ9Q/XuYMRJBQP4VVjAONKcbv9KC/i3BC9UF+Sz5fQ7TppIooIhgF
 ipTqvDvq4bEHGC7g/eO2xPB1lz5DP16sNtyM1EWPgJVvxz2FVt2xRsfgrZhxP3YdHmtz
 0xAfPoea0d4yWlr7r8SwGmpDV+pZsVQHzd52IzmuzLzq1az6ijSNtaXsIkKzT2NGycdT
 td28C8LGFmb8ScREpy5CW9cJ/3rH8OL6MNuSN0QCcInKYuparHMvGTa3mYBu71gZY0VW
 Oxh/9HdNkSdW2I6fhfj5d0/JYfQ9rECnE24+LOMjv/RFHRvpO8w/5OmVEplN9rMBwc66
 A8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDRg5LvS4OI8kqBhNds2vXiNeGoOZqfeeoxeOxzTn9s=;
 b=kWlaQv1+QUfNvaFGKrs1kL12QF7d3CL2QJmPl0AAVXy48ATOqpgR2kJFglSjXOIYpR
 LDFzgzx0PWYbpt3TfUSb1ksuJt8uNgBngHlDlUARVt3E/6oU9Gp3C5g+OtG+lOMVD/z/
 +K5j1iTUPXYySHhEu3szaWpiO3+G6jlf0iPaWa4blKNM/+IzYpHd2DTrA3yQghZCTvXG
 qEUrAA6CWKgp1oH5YCGu31saK+5+Fy/iKqV7zU3MkwINzuFgIUJYDjneQCUg2EE/GBqQ
 x5aIYecaotvw+l4FfYDKGik1rQd3+XhQzAApLRSUTgV9aoWVfa/ZkUklRALUJAibRjo2
 uYaA==
X-Gm-Message-State: APjAAAUG8zHrLETWKmvAUk00BvittcClnhVQtUqkokel5Pgx7ZLtcNUc
 1198FO8tywqDw9OXLOKLVcIykpicrJLwSrpeLneHnw==
X-Google-Smtp-Source: APXvYqw2ZFBXSQ7ABaiA1vApvpRCFdfPg/JjiE8RYNzYBCGYg0GCd1Ezjih4zJJK/GGUsUlqmFHeM2NV2oKdZP3bnDo=
X-Received: by 2002:adf:e50e:: with SMTP id j14mr7522387wrm.262.1551970886984; 
 Thu, 07 Mar 2019 07:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20190222123205.20015-1-daniel@dd-wrt.com>
 <20190307142049.3162e9d5@xps13>
In-Reply-To: <20190307142049.3162e9d5@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 7 Mar 2019 16:01:14 +0100
Message-ID: <CAFLxGvwpwiDTb65QN2Vcudjj=zabw0up1L5MSu0=Bdp3ztaebQ@mail.gmail.com>
Subject: Re: [PATCH] mtdram: Add module parameter name.
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_070129_004987_80599D01 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: linux-mtd@lists.infradead.org, Daniel Danzberger <daniel@dd-wrt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 7, 2019 at 2:21 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Daniel,
>
> Please Cc: the MTD maintainers as advised by get_maintainers.pl.
>
> Daniel Danzberger <daniel@dd-wrt.com> wrote on Fri, 22 Feb 2019
> 13:32:05 +0100:
>
> > This parameter will overwrite the default name "mtdram test device", when set.
>
> Do you have a use case?

Me best guess is dealing with existing mtdparts.
...which is a sane use case IMHO.

If we add this feature to mtdram, we should consider it for nandsim too.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
