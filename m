Return-Path: <SRS0=qEsD=TR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4966C46460
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 08:12:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93D0720848
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 08:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gfZvPK/e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUDORxpc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93D0720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2v+TnmvVZ64aqMAqstHILOm3r3akuHCSqVBI2AaeY/8=; b=gfZvPK/eCKYVk0
	xQbF3G5igfkOOZcftSxtRihxSZAmThIfFV8pw3kEa9RNnjk/KPV3dq1U5kqWSXdRWYfG1wKvWk2yr
	711EXoZDZdlTPH1OhGdOohxHFY5SHb4IKx9dA9J71zTWvWeEzkfOEkbFwJmrWXklw/xuAz72NjKkl
	uYAIIbHCQ8zyUa4Gqefj46vm0f5ZtJiv8hdLzNX0wOyW8+TBEe3H03fuprPPrv03OMAFojBmt1FEk
	sjsmaaqHmaG7y7Zds19btir8GyQbqwL02I5rEBJTYzUzugRCzs+K88DUyzS/bM7OdqvJOeFSWu+KR
	92cbRuj6DmDuiEXd6Aag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRXym-0003od-LZ; Fri, 17 May 2019 08:12:36 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRXyj-0003oH-LC
 for linux-mtd@lists.infradead.org; Fri, 17 May 2019 08:12:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id m3so5933545wrv.2
 for <linux-mtd@lists.infradead.org>; Fri, 17 May 2019 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8O+9BQEfJYc0g0qK+OD9OThVTAdpC5JdjbcFfzDR2ZA=;
 b=oUDORxpc5eA58F9PCGt7zt9qul2JIcPUhYvzn7WXi+pb3gin/izl1PNFoKbAnr3UYE
 nrQoODTAY1iC52tLWWXGejfZX1dJhvOat1Os8EsQxvcxL6y4J8dvKncqU7jHgvb5erG3
 ++WwlKTymT86TxTsfnUyFaWd6l57W78vHcZrpkNQceYPR56Eyoaaa5+espX5QGjITDUi
 kxhwRQ3MdqxQyV2Pqn24hzxppSILQqP78JYxf5DV8WfQ3gjVgcbSPBB8SPEzG+oW1I98
 KGQuEHX3qN9YIkQXmYKylMrs+0L3EAQ6VWCTn/JMgCn6DDHUCyRmilaZva/MiDmBONSw
 T9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8O+9BQEfJYc0g0qK+OD9OThVTAdpC5JdjbcFfzDR2ZA=;
 b=Km9/EzdqMfHu9RvZzeJ4Q9GSt4SkW6CyNim5Mk0Ip50ZMtTvKy7q0mORPGIV5+IX4Z
 3xcaTnJFmCuQ+B9CS8yFj/vGK1wR+7JCUgKItZmAf6rogot2dF8eHr8Ygi+92atZNftd
 ePYtNB5srmKDjgAE3Exwp9wbOv7FHsro/NIKHnU1XIN0Vn4Q9UeVyP4LkH7e8CRk+Yo6
 CeSBstMV7Tvi7FP2a/WDq6Emrh/4iNQWxzmC3nNf7MaZGPy1FF00Xf4ByTn5q/3nLWeH
 YyjDpkFGm3C8EUdcYo7eewLCqVHms95HJtXizLzXDA6yzkZ6zP7KyHhBgK6jyp0dUy/l
 0oKg==
X-Gm-Message-State: APjAAAU55BMPRVaDoU2XOOILKrwqMFmNS+FQfO5JRbMX85Qq0OULXbZ7
 gwu5qfidIuHiUu5+i0GEMkGOg7JYvDvCcogsnME=
X-Google-Smtp-Source: APXvYqxlNXvGX9Z5g/e9+tcRIXbot97JHSo4sVwFlLpLdTHuG73ENSQzTxHi7DK+95dl36jYqkWr1B/Q5HoSVlPk6Rc=
X-Received: by 2002:adf:db81:: with SMTP id u1mr6031003wri.296.1558080752113; 
 Fri, 17 May 2019 01:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <1558024913-26502-1-git-send-email-kdasu.kdev@gmail.com>
 <1558024913-26502-2-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1558024913-26502-2-git-send-email-kdasu.kdev@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 17 May 2019 10:12:21 +0200
Message-ID: <CAFLxGvyZCpKthJevFHjjBQXo=j5f-FUip0MAsLy0HaoJzLZ2rA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: nand: raw: brcmnand: When oops in progress
 use pio and interrupt polling
To: Kamal Dasu <kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_011233_695611_95AFDA40 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 16, 2019 at 6:42 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
> If mtd_oops is in progress, switch to polling during NAND command
> completion instead of relying on DMA/interrupts so that the mtd_oops
> buffer can be completely written in the assigned NAND partition.

With the new flag the semantics change, as soon a panic write happened,
the flag will stay and *all* future operates will take the polling/pio path.

IMHO this is fine since the kernel cannot recover from an oops.
But just to make sure we all get this. :-)
An alternative would be to block all further non-panic writes.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
