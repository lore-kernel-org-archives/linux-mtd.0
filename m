Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB03C32750
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 21:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB6520665
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 21:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="abmF/l6Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv9GEOfx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB6520665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYBddrtrHw4E1uH1hicAjFJbUgNYDAYwZi+zLBL2lgw=; b=abmF/l6QA0kWu9
	+KyTUClFoEvsbMBHFQk05JozyGZ6UboE4z2LE9FwVd4EZ3UlLQQuzvTRUX9AO3xrSpHluMpybbsOU
	0HF15yQzXCc/EAbHCDlJsDsNW08+1znSKp0ppP7tf3EWRXs5aBkgptWhD4qHmHpmGORUi6wNHRwok
	ds17MGLCOsnZAy2raOPIOAOsuSSgXFNsCfDyOAHR98jw1MFc0n/4WoWtx9KR23mu1W8z5zFlJ49be
	rqjeV1wTK7Cj0JvQsAzBxpUO5kwtjGh6Vm2SZMeW++4YxLAXrFtTmeNHRK7I6rE87Dys8w4BHyFm8
	4L5DzBZ0N4xLpOYoUHPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxeSF-0002gZ-B3; Tue, 13 Aug 2019 21:35:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxeSB-0002g9-Jp
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 21:35:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id j16so6857121wrr.8
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 14:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPmQ/90WohjtU5OKNWTPc5ODjrlj2HSbowvzNr5pq+Y=;
 b=Sv9GEOfxMstnvEA9466oSyEjkdTgbzkKusddb7oL5Mz+rs5KzK4h0bZ8SUb9z9UzK4
 gXAv6PQNxSMR1oj0Y1IDkmStH7qUEqIW44Od7S9F5hmo7ORbNG2H+6b00ljCFHG9HMyH
 kkVOh8lksPvd4MBvTniAsBE9dK34SPaDdx+y8WK5YNM3xIqPV/n4pK9T1CXxlWR7rlDE
 337oDLbaoYA5AFMkPBKZzu9tW021FxIVuJKeWwQwFFpv3EHTItA38ejP4zJtxzT8Y9YT
 yAtfZPhhM+acTkzJxJPSSdI0BAZ0hHMDPe0limfpm1zKCx86qgnWqWpPnahV483tTjVc
 mWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPmQ/90WohjtU5OKNWTPc5ODjrlj2HSbowvzNr5pq+Y=;
 b=tW/FuxeaNzqUuC8SL8PlU7Zw6CBkF3mzfURMuJBhyaSEK/6l2XjplY+nIb4hL8/14c
 JYcEmJKXGSm5lEMz8pCNHVUlyd5jZzW56HcAacbNADNApCWD2WpmPd5lGs1Vejy/jusI
 7AjdOECPyJOqEYbnSKJa1PR7Wto1p6EqtSE+CR+Mu6t31CiDR1eLKnS5tLMD9Dt2UfIX
 MsLyCPRYVBwhgxDMMk6bzcdbQf4sSGFJnbHEj8IyFgkLxWCnaNIscfM30xGJ9dT2EMMZ
 prPJCtIUX+tAF0HH+DjYygiP2fQaPNLzZC3lv0jbqizDvWQl9zXY3U4L5R6TQfsbZTzF
 qOyQ==
X-Gm-Message-State: APjAAAVbW8+VOvqDyvtB13SRkKrUFehyOzV8qJl+eansBf0RGD5Qo2MQ
 E82rzwrpxRGRk4P8d1AxTd8jYyqptVwwWako6kTIxpor
X-Google-Smtp-Source: APXvYqxTKhVrvAZRUiIZU1b8ZXcoLV7go3VpfOyXlbpMdKmFL0g5ee0/GgNnxkuXqJDBEVSlH51oeZJa/2qk1Dfvzkk=
X-Received: by 2002:adf:e602:: with SMTP id p2mr49238001wrm.306.1565732137794; 
 Tue, 13 Aug 2019 14:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAMxq0fNSWrUFMmmTs8Ri9gFOvS+KQJvZN3-_KuiqXi9bbmCB0Q@mail.gmail.com>
 <CAFLxGvz92UR2M7KJ_dMMW-F47_pLLxSTOrGwdQ5Cc0kuSiTA8Q@mail.gmail.com>
 <CAMxq0fO=0P8972FKvscmNxCBxq0m8_f2DST-Oa9HtNeUA-FKsA@mail.gmail.com>
 <1019514474.57102.1564822129140.JavaMail.zimbra@nod.at>
 <CAMxq0fPvj+gMnUysDDN8j2wXNQj3Th_HwVV2NWmm8pjSe7Q_vQ@mail.gmail.com>
 <CAMxq0fOJ0uqqzPRW_wBiAZS=KzpRy_waGHODErhjcLgRbX5ALQ@mail.gmail.com>
In-Reply-To: <CAMxq0fOJ0uqqzPRW_wBiAZS=KzpRy_waGHODErhjcLgRbX5ALQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 13 Aug 2019 23:35:26 +0200
Message-ID: <CAFLxGvwn7j5Pttac-V_6o7dtRt=i39UrZPP=adNEB54PRej8xA@mail.gmail.com>
Subject: Re: UBIFS ECC errors
To: Sergeant Peppercorn <speppercorn109@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_143539_655922_E9FF8AAD 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 7, 2019 at 6:52 PM Sergeant Peppercorn
<speppercorn109@gmail.com> wrote:
>
> Also, would this apply fo my 4.9.88 IMX kernel as well as the TI 3.12.10 kernel?

We care only about mainline, sorry.

> On Wed, Aug 7, 2019 at 9:51 AM Sergeant Peppercorn
> <speppercorn109@gmail.com> wrote:
> >
> > Hi, so are you saying that I should try to merge in these two commits
> > for a proper fix for this?
> > 730a43fbc135 ("mtd: nand: add nand_check_erased helper functions")
> > fdf2e8210529 ("mtd: nand: gpmi: Fix failure when a erased page has a
> > bitflip at BBM")

No. I said you need most likely 730a43fbc135 and commits it depends on.
Commit fdf2e8210529 was just an example of a related bug.

> > I am assuming these are from the mainline kernel?

Sure.

> > If not, how do I fix this? this other patch, instead or with those two commits?
> > http://lists.infradead.org/pipermail/linux-mtd/2014-January/051357.html
> >
> > The patch doesn't seem to be able to apply cleanly to my kernel so I
> > must do some deep merging. I have not looked for the two commits yet.

This patch was AFAIK not applied because we decided to work around the issue
in NAND core.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
