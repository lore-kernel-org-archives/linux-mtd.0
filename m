Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7FBC4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 21:25:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF0420732
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 21:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF0420732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8MKEGMeOcFEYnbrcT9XeoTcRJIL9kf65civ6mWdBfAs=; b=br86FJO3qLfSRFHirVMCEgDvG
	kdfO8HajAm0ToDNZj4peRzoNQ+tDWIInS+6p8/934seyUOCxNZZUyvE5xe3uc0ECNJ0noaegeKkRH
	XBS7yQeSa8oK5YFNiXOI1DcduBRitdWKezSM4x9D3k1Lon/rQwQLkCLgfilUgKS0h26OP/qMxB8kh
	3zS8nln7ay8U+goufEIHy2K02/haYc4DiLzdIzKcbIYy7EoYvz/1sB3iAq2szCD8d6a5NGQW9niZP
	GQeCsDqvdXjUpvMBPZQAvyOk2Q8gDyvK4LNE7RmjfYD5/RZkC6NI70A5LXGLX+4bd9kr3IcAoNH8J
	h8nBo3dkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kovKp-0001s9-3K; Mon, 14 Dec 2020 21:24:47 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kovKi-0001rM-Eo
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 21:24:41 +0000
Received: by mail-qt1-x831.google.com with SMTP id c14so13035535qtn.0
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2020 13:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=If+EE8LxJY14QJJGCoZKEJsEs1DvPjQaafObiLK53nk=;
 b=hYgzq6I1Xquml9i6p64Sgp/cnYBBISgbIiQHoHYj2bUh0FAB1h66IahRMj+xvpNvB2
 irWmLpWNIvDJFgO1fAz04WMdhXMRh6egLrvMAajlY1l9j8MG2A2NBnXzE3rBlKZktF+3
 lYw1CK4lOuph9Qhqkej9vakPaNbQFG/8il9TNVB+8x5ULsVjW2uU1EzHCvYLiZb60VpH
 SR9CeumwwRORB4AmWCVtn3YwbQEkzWdI3O9+0tZM/5kVkh4xUQyPnnIF3yhcUgPyyEU/
 6VpPzSfto2MZ9+usN1mUkKa83MbpYMcNREZOseV1+xdnW5FPLb48rzlJUk6wHfjot4aJ
 s7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=If+EE8LxJY14QJJGCoZKEJsEs1DvPjQaafObiLK53nk=;
 b=awA5lVKLmrnMEzvaeIg0FsvKbYBxOzPHW1nW5hrDH654sTPNJGg+NkLSwOv4+++mcL
 74RCLvjVItD6Sv5J3uABKwahfxsR8z3rzZoHtv7rjpTPseMdejPW4rmwnUPoiZCfwKm/
 DLZX0/MT4p1X0TIWsia2AyjcN3C7N5ybKJ/X79TP33LN9vK9/tJNqCoS1KKi8UaA6wD5
 GAu7scOmpS3HsBc9cK7QaC6LNj3ctAz0AYRzqMlJz2FRGKlHjPsSiN7vFy3r4ik7Oyfv
 8C4FIZHftJx1Jva+v/7g7U07XyWRO/0ZC5N2vQ9ouqVxfWwOVZySFEmf2GR/WshJgj1s
 JpSQ==
X-Gm-Message-State: AOAM533QdOLg+qTxzhje0hIaidzWqUdgLUiKQ5vCSIEIH3TW17PHvhl5
 ZbYHx0fA+eYauGKNzrokm3t4+Dv2mOL6K0LBh+o=
X-Google-Smtp-Source: ABdhPJwYs1kC85oSjDKWl2nDomi5YfsYHDhuB/FLXkP7E9Qbgl0J+bcuS6SPsPqdRkmpRN85GMpa8/ee74cZcOVS0yU=
X-Received: by 2002:a05:622a:24b:: with SMTP id
 c11mr31600519qtx.166.1607981076157; 
 Mon, 14 Dec 2020 13:24:36 -0800 (PST)
MIME-Version: 1.0
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
 <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
In-Reply-To: <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 14 Dec 2020 22:24:24 +0100
Message-ID: <CAFLxGvx4eZ3ZrciBLpF6qiQ7Srev=jGtyf50sC-qN9Q=z+xDQQ@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: David Schaefer <david.tillmann.schaefer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_162440_523504_AB7A111B 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 14, 2020 at 6:22 PM David Schaefer
<david.tillmann.schaefer@gmail.com> wrote:
>
> If this is a regression, how can we continue here? Can I give hardware
> specs and logs? I have soldered on the board to access UART. I can
> provide e.g. boot logs.

No need to worry. Let's wait for Miquel, I'm sure he has an idea.
In the absolute worst case we reconstruct the old driver.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
