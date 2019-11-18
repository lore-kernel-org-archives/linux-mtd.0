Return-Path: <SRS0=x2+d=ZK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8AAC432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 07:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8466420692
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 07:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMtax87i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgyal0lw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8466420692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4WKCU9whQn5rYIX0mjfJWm1EiPvN/mceb/ZWLUc130=; b=SMtax87iVzjR6j
	p1SG8gbfLRHRQraMlLWzHNcJ9A775ImquzNN+3kIMqenRbngf+wLytpdSs/RvnwqKsKo7aovXRgbU
	eMgeiiOqOiQS1Qv/4LJxPyl1EXPyr/eytIrAmQKp5Lm75gtdvmG/eUIf0WSMy77AsA9gY3Ka1ouIi
	QAyKadKR2VPBx0ELex1YICqR5V8mV57T/TV7nwXbvCYUM1MYC1oKDUH6MTlV0CrW03kJeqiTg8Ntt
	FOf+CEaCZ4Q2ojEzvU/y4lBxHDj/UCwUA7a4y58bYTDZulAGXiZDzHir/YPD8rq39yrzemIggLOgX
	Oxdmxdv3kputJM20vJ9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWbwF-0000Sd-2m; Mon, 18 Nov 2019 07:59:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWbwB-0000RN-Rw
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2019 07:59:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f3so17564974wmc.5
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2019 23:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWwA/juD9yfeURmdIv1IjOSUDgiVZNQb1h6u2htaRbk=;
 b=jgyal0lwkvo3iS9Ix7sJhOWlmDlBE4qllu/wygngkjvVtmeWSEIZeXxkti635/YN9m
 pn0WzOlLxHUuqppUZZrNylMRyzaFMPrG0n/NYR5G/iqLZVdaQTM/aYmW35uUFgsMzPBm
 mVBE4ILKcFOrsmls4kUIznZU4LZr01aUnbJBvbNz2JUFzT3RxddYfuNMSHa+wmjckBC0
 HuG4kf4JE+Quh2YYgi59Xi9ItTHoPaH4/z1T+GwafLoTt5F6nVkoXdPC6l1HpKvy67TJ
 02rdCJ2rqXaqlpz/87OrKf3TZ/aAMMLc1e6soOveEwNCD/q+dKIYxTwtlGTz2a2YiSzx
 Ujnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWwA/juD9yfeURmdIv1IjOSUDgiVZNQb1h6u2htaRbk=;
 b=hnFE2NhDwOf4dr+ilIovQeUddSZdOnPK8qD9bSIpPEdgktGt1+bxp6Ti2jxehgz6TP
 cdaPeXgsi+vZE/ew1c1a9XOlaLQXuiMVnRYTM6nxzQ4bsEQKkLuUaCE5qCClhSdElMSM
 F9gjtAbsaXIn66dquwm7XtH3EfUJhremE11kdO/F4aYQU8S2B7Vav2+cPsDDjACeHiFz
 Mi+s6ZyUv+FDa/NGeaDcORiQg96n3t6h8HaIelHsbn9sK4irrWRkru0pWwq0xhXyl9gN
 AtrfIJ8LpcZrRPcZgqmNsErs/9Ldc4zD1RWbaJgyu92ewzv+tnIrHUPdQTc2I3iUmB/B
 yfvw==
X-Gm-Message-State: APjAAAWkZQGf65xVUMkAP8CyUJxpOhnF3+dZgDbqZ8yRcbghtp89sinY
 jcjfDLUPospi7YVq6da4ceAABUbs/OnsZTPa9S8=
X-Google-Smtp-Source: APXvYqwGtmB9SaFXPemT/jWyKgERBZH80PI5cRZrnQD2sdEhHOn+h+SIcE1xaKGMUPlKrdQo4lwujGCw3xrj2WDOG0Q=
X-Received: by 2002:a1c:8086:: with SMTP id
 b128mr27188767wmd.104.1574063945944; 
 Sun, 17 Nov 2019 23:59:05 -0800 (PST)
MIME-Version: 1.0
References: <CAAHdpOcJcq2spnM9f=9BoycG8oyhw0ufjzF3BemMY2aNFt+5cw@mail.gmail.com>
In-Reply-To: <CAAHdpOcJcq2spnM9f=9BoycG8oyhw0ufjzF3BemMY2aNFt+5cw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 18 Nov 2019 08:58:54 +0100
Message-ID: <CAFLxGvwvftmiRsQWo0+S_=-bd0b-XqUBBt=SML5AigJ-FCgCYw@mail.gmail.com>
Subject: Re: ubi corrupted list not counted as bad block
To: Balachandra KUMAR <balachandra.kumar.ext@valeo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_235907_930563_864D42E6 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 13, 2019 at 9:05 AM Balachandra KUMAR
<balachandra.kumar.ext@valeo.com> wrote:
>
> Hi MTD Experts,
>
>  I am hitting the below problem :
> UBI assert failed in ubi_wl_init at line 1632
> -> ubi_assert(ubi->good_peb_count == found_pebs);
>
> The issue is because, in the scan_peb( ) , a specific PEB is found to
> be corrupted in the volume header CRC calculation which is a
> UBI_IO_BAD_HDR error.

It is not just a CRC error. UBI found that the a volume header is bad *and*
follow up data is good. This must not happen.
Like the error message says, this needs manual inspection.

> Later in scan_peb ( ), my target hits the else part saying its an
> unexpected corruption.
> [attach.c]
> else if (!err)
>                         /* This corruption is caused by a power cut */
>                         err = add_to_list(ai, pnum, UBI_UNKNOWN,
>                                           UBI_UNKNOWN, ec, 1, &ai->erase);
>                 else {
>                         /* This is an unexpected corruption */
>                        err = add_corrupted(ai, pnum, ec);
>                  }

If you hit this code path you are already in deep trouble.
Data corrupted and UBI cannot say why.

> The count of good peb is done as below :
> /* code snippet in attach.c */
>    ubi->bad_peb_count = ai->bad_peb_count; (this is 0 in my case)
>    ubi->good_peb_count = ubi->peb_count - ubi->bad_peb_count;
> (total_peb_count(3464) - 0 = 3464) but what about the corrupted one?
>    ubi->corr_peb_count = ai->corr_peb_count;   (this is 1)
>
> Why is
> good_peb_count = peb_count - bad_peb_count ? (why not minus
> corrupt_peb_count or add it to erase list?)
>
> in the ubi_wl_init ( ) , the found_pebs is calculated from erase list
> and free list and we skip the corrupted peb list. But the good_count
> cotains the corrupted count as well.
> So , i hit this problem ->
>   ubi_assert(ubi->good_peb_count == found_pebs);
>
> What is the logic behind this good_peb_count?

It counts the good PEBs, as the name denotes.
But the key here is that "good" means anything which is not a bad block.

Corrupted PEBs are something in between. These are blocks which should
be good but aren't.

What is the value of accounting them? Like I said if you face this type of
error you lost already data and the upper layer (maybe UBIFS) is dead.

> --
> *This e-mail message is intended for the internal use of the intended
> recipient(s) only.
> The information contained herein is
> confidential/privileged. Its disclosure or reproduction is strictly
> prohibited.
> If you are not the intended recipient, please inform the sender
> immediately, do not disclose it internally or to third parties and destroy
> it.

Please don't send to public mailing lists with this footer. Many
people will ignore
your mails otherwise.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
