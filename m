Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176A9C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 04:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D92A921850
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 04:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gIQqN6nK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rcG/Bw3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D92A921850
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSEeRwYSuQL6iO72Pnk/QokFwqcYNuhTT/M1iyws6kc=; b=gIQqN6nKEYD18E
	Ew2e3U5mRPek3VmekzHNZc3ozuHcUOUwhH0eiNhTJLsEkSI+zoIjnBViYliSci0fRaobAO26qGwD2
	Lbtw2Y09VuXTb5Ul3Ct5a7bVidL39WF9eLu2tYGd5qZOR2J44BzTTLGRcxRS+W4h/HF00e+hFMVUM
	M0BqNNchRVUh+40qhf+XuVlMAuLxs63dK86T3wdvXhU+M1ensfQ6cKymG9DdN3Jh59f1pcRNjTKB8
	2ou3jkyGZ0aip4hdN0JUGhIGHeem0fFM6O5r4tcwVc8m7qPQLUIbdY/YKU9/NF0/Sp/1vghDsrF/p
	CYEriHl2f2vFjUz8zhBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCGVP-0002Bw-Uh; Fri, 05 Apr 2019 04:31:07 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCGVM-0002Ao-Rp; Fri, 05 Apr 2019 04:31:06 +0000
Received: by mail-ot1-x342.google.com with SMTP id t8so4463702otp.7;
 Thu, 04 Apr 2019 21:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+7lBtA8vKkwjwj7PTowhExzIEuTQG9ZRxuYeTf2eq3c=;
 b=rcG/Bw3Vg4FKUUKeWMIhWWl+Dot5HReKA20TPVY5QGg0EZEWRVdHuNhLlde7bDr2LC
 4BLBBvJSbBRGJmPDGv/B6B0rJypBhrdF5rRlIxvZXGI6AyaQV/QvN2X9FZAL4uqIxvFF
 miIIBZxbDgDNVzJ/lGJ/EBoek9bgSj4A1HSOtmQfmLnXEmanh30ShC/bY2ZcyriSLwpm
 HJ17qsUzqkpKAVjuE32VzvhlvR+54/yQxLNHib6tk3DOBIMIqtcnyY2m1gL/JdQOi1/R
 QxeG6Bf9FzsGG4r4TRGLWd5iqlCDZx90ws5uYaxpFB3/w+torG7AzrLAig+aSkflXOjg
 WPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+7lBtA8vKkwjwj7PTowhExzIEuTQG9ZRxuYeTf2eq3c=;
 b=ePChc4Va+r+5P6SHhHmBq/ZoCpxnznAXIsgZyuvcBVlWzMJ8dzUGcxKL/bn5RnHBh9
 XL59pdEagacxiaG3sC7E/wxnFzsu0nJJevZYhAvx/gV3U2dZroxU2ZVz3ONbw8q6gC+e
 rFz01pdmZ5AWzyJX4xHmsre52eSJydm1uKZoakLVciUS7DEQzmDT0rp69g+vGsOuhKG3
 blx//g30dD/rmJTFdn8/RpH34LvNiPCVjoffiWxRnAD+xVvSexHtyr17ksb/ntgtpNHh
 54/5VUrtYc4prpdisuBum7GGi5dd7W8vQXk+/IXLUsg6stPXCJhqc/XhYKAImAWZJMkS
 YWpA==
X-Gm-Message-State: APjAAAUBLXSmVVDyww23Y2Awg0AI5ltH/As/ZM025WdHPZ+BKSfzGkLw
 oJf09WqOH18Pt93kcZbavGCkwzmJtI9xGnK/AS0=
X-Google-Smtp-Source: APXvYqwxFoWU7xp487Ebvt3wzo5VYHnSYc2CvTe5RZAI/ctb22VitfNeaCIFtIGcIC9xMiHlKjZ8oQ+fxNcB9ZMAh5k=
X-Received: by 2002:a9d:7856:: with SMTP id c22mr6972611otm.261.1554438662631; 
 Thu, 04 Apr 2019 21:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCBOX8HyY-UocsVQvsnTr4XWXyE9oU+f2xhO1=JU0i_9ow@mail.gmail.com>
 <20190321214401.GC19508@bombadil.infradead.org>
 <CAFBinCA6oK5UhDAt9kva5qRisxr2gxMF26AMK8vC4b1DN5RXrw@mail.gmail.com>
 <5cad2529-8776-687e-58d0-4fb9e2ec59b1@amlogic.com>
 <CAFBinCA=0XSSVmzfTgb4eSiVFr=XRHqLOVFGyK0++XRty6VjnQ@mail.gmail.com>
 <32799846-b8f0-758f-32eb-a9ce435e0b79@amlogic.com>
 <CAFBinCDHmuNZxuDf3pe2ij6m8aX2fho7L+B9ZMaMOo28tPZ62Q@mail.gmail.com>
 <79b81748-8508-414f-c08a-c99cb4ae4b2a@amlogic.com>
In-Reply-To: <79b81748-8508-414f-c08a-c99cb4ae4b2a@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 5 Apr 2019 06:30:51 +0200
Message-ID: <CAFBinCCSkVGp_iWKf=o=7UGuDUWxyLPGdrqGy_P-HPuEJiU1zQ@mail.gmail.com>
Subject: Re: 32-bit Amlogic (ARM) SoC: kernel BUG in kfree()
To: Liang Yang <liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_213104_927007_5DCDF476 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: mhocko@suse.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Matthew Wilcox <willy@infradead.org>, rppt@linux.ibm.com, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Liang,

On Fri, Mar 29, 2019 at 8:44 AM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Hi Martin,
>
> On 2019/3/29 2:03, Martin Blumenstingl wrote:
> > Hi Liang,
> [......]
> >> I don't think it is caused by a different NAND type, but i have followed
> >> the some test on my GXL platform. we can see the result from the
> >> attachment. By the way, i don't find any information about this on meson
> >> NFC datasheet, so i will ask our VLSI.
> >> Martin, May you reproduce it with the new patch on meson8b platform ? I
> >> need a more clear and easier compared log like gxl.txt. Thanks.
> > your gxl.txt is great, finally I can also compare my own results with
> > something that works for you!
> > in my results (see attachment) the "DATA_IN  [256 B, force 8-bit]"
> > instructions result in a different info buffer output.
> > does this make any sense to you?
> >
> I have asked our VLSI designer for explanation or simulation result by
> an e-mail. Thanks.
do you have any update on this?


Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
