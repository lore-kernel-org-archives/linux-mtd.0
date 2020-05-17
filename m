Return-Path: <SRS0=YkXI=67=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F25BC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 17 May 2020 21:34:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8F920758
	for <linux-mtd@archiver.kernel.org>; Sun, 17 May 2020 21:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SVvM2V8f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmtTJ2BM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8F920758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukHLDWeSWZeDAA2jQIsNdVw/S2ju25x0cZ1bLBP+FHs=; b=SVvM2V8fR9Xznt
	6f1dg8/vbhGK2nPvZWbjRLj49hFNuqwPV9v/4VKtxPPcZJqX+oX22bfiasBe3NwDsRKHawwen2Jc5
	Ofu0azXWRRLD1xxYot9rn5Kds9tL7zZ5ai/MA/IBTfQkIQ+l6UAwNMSLDIVW09mr9r+4kj8jIfP5d
	s/7e+8Ms/M+nUhMz3MZKtcjH93npb9UC9ifrGlHPhh3oOvJ5jsn6x2m79R7IFr/GPwSWSeVBJIkam
	/S0QK+eOWX2Czz/gzIRkXSF6yyG6ygJ+J/OFMl8b4kSe/qcmVV5xRBD7nwLXC64aqYg+H/Sh1rjL/
	ekkeEgFkrObHVaxhDC7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaQv9-0001y4-Gn; Sun, 17 May 2020 21:34:07 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaQv6-0001xW-AP
 for linux-mtd@lists.infradead.org; Sun, 17 May 2020 21:34:05 +0000
Received: by mail-qv1-xf42.google.com with SMTP id z9so3804830qvi.12
 for <linux-mtd@lists.infradead.org>; Sun, 17 May 2020 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h58NoxhrwutEOO/i6WHH79mYCqA6TEjjGXeXRn8zYEs=;
 b=UmtTJ2BMCTMTjbn8r+iAOkEs5uxIQn9C/ni9V4NK5RZwIfSzA4GIjn659dDeAPXL6C
 1A4SWuUm+HXafq+5WGEKhfglPlmG6kI8cv4BFPNB8HFI7xDskDasAKvYxSi9ovL0aq2H
 Tm6ZVVv9hxzU2prN4rwermiJnW3vqGQU6cafN3eA18Mn1byt2g38b4uxkcLy/nZ2tP8U
 CKqIWCHqmtVWaNEvyxAyfMaMjIx4K9BWz0oehFEKHtg8NR24x1GHG2KTMvITjX3J61OI
 u3wP5jpoczUK4FmLMKO4O7+mFWNcsA3qhBg5jvW10P7fC823CgVjCoMoCpgPTLEvCCCk
 eUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h58NoxhrwutEOO/i6WHH79mYCqA6TEjjGXeXRn8zYEs=;
 b=he2KImDlloCldcdJftzyzpDZd9q2ZyOQ+bzYvXd79vfQ2EiCldVUKPUxRO7GHKYVbd
 OfIXwJam+7ve1ZOVvQJGOYBNncVTBK2mTZYXFr/9RqU6S/Iy/1irmjs0Cp2bbFEHNI2H
 moxx2qj+a5LIdzMJx9w5fECgZslS/mnDtNBB0bZdZulsI/jkCId+wzTUFXpe3rj8Cvxa
 y3UYRYMGFHl/UvHgn1K0I2+SUlHpRrGxQ2I0EISNLtJykz9ERak+hd0mMt3NCk99fi84
 xZd6yDqyv5PSyDVtTENZ8U7UAyXd16JePMcVrpurysmt/PfV4c0sjrAOLNs0AMcVbMsC
 VvvA==
X-Gm-Message-State: AOAM530g+M/39jgecu8INvibcm3Aysfhia57UnQeVJrqkZscqiXVPVAs
 go/0EYdzep7JYy4ogmuDJ3n8bht/Wy4qj4lt+0E=
X-Google-Smtp-Source: ABdhPJwdC36nYRTzJK193yXb6dTqE/QQlNO10W26hhvizObYt2mBKDQYjilOOHupZ4rO0IlOLf4cYhnYfnlfi7YE0qo=
X-Received: by 2002:a0c:a184:: with SMTP id e4mr12545828qva.153.1589751241213; 
 Sun, 17 May 2020 14:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200113145622.18357-1-arne.edholm@axis.com>
 <CAFLxGvzEHdxDKfNnDxMXAd0Fct2Yo1+sJDmKfT8eUwUDukRYXg@mail.gmail.com>
 <6b360811-a227-c32f-f9a5-660bea4861c3@axis.com>
 <24ef4730-83e4-ff91-21e8-739153a44a8e@axis.com>
 <CAFLxGvwNxNkwdiovrWQzDfPNr9t2WnXU2VNyNs5caFNZ1WsySQ@mail.gmail.com>
 <CAFLxGvyTnsk_dGdozQp5OYYyhJCiAD4Yxiy19=-05jRX1oU=Tg@mail.gmail.com>
In-Reply-To: <CAFLxGvyTnsk_dGdozQp5OYYyhJCiAD4Yxiy19=-05jRX1oU=Tg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 17 May 2020 23:33:50 +0200
Message-ID: <CAFLxGvzyVcjLEw8dboAPT9EnHSV9uHnEsnv2QXA04PKme8ydwQ@mail.gmail.com>
Subject: Re: [PATCH] ubi: Select fastmap anchor PEBs considering wear level
 rules
To: Arne Edholm <arne.edholm@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_143404_380294_14086FF6 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: kernel <kernel@axis.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2020 at 4:35 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, Apr 30, 2020 at 4:29 PM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > On Thu, Apr 30, 2020 at 10:34 AM Arne Edholm <arne.edholm@axis.com> wrote:
> > > Are you satisfied with my answers or are there additional
> > > information/changes needed?
> >
> > Yes. In the meanwhile I did more testing and with your changes the
> > anchor PEB selection
> > is *much* better. Testing took some time and then I scheduled away to
> > other stuff...
> > Critical workloads are these where a fastmap is not written due to
> > heavy write load,
> > but other events like volume change/creation.
> >
> > A good reproducer seems something stupid like that:
> > for i in `seq 1000` ; do ubimkvol -N test -m /dev/ubi0 >/dev/null &&
> > ubirmvol /dev/ubi0 -n 0 ; done
> > Wearleveling threshold is 50, btw.
> >
> > Without your patch, the erase counter of the first 64 PEBs:
> > 4    4    4    4    4    4    4    4
> > 4    4    4    4    4    4    4    4
> > 4    4    4    4    4    4    4    4
> > 4    4    4    4    4    4    4    4
> > 4    4    4    4    4    4    4    4
> > 4    4    4    4    4    4    22   4
> > 4    19   4    4    4    4    4    4
> > 4    4    4    4    8    908  906  1
> >
> > And with your patch:
> > 95   95   95   95   95   95   95   95
> > 95   95   95   95   95   95   95   95
> > 95   95   95   95   95   95   95   95
> > 95   95   95   95   95   95   95   95
> > 95   95   95   95   95   95   95   95
> > 95   95   95   95   95   95   95   95
> > 95   95   95   94   94   94   94   94
> > 94   94   94   94   94   94   94   95
>
> While observing my own mail on the mailing list I discovered something
> I didn't notice
> last time on my terminal.
> If we summarize all numbers in the squares it should be more or less 2000.
> because the test triggered 2000 fastmap writes.
> But 95 times 64 is much more than 2000.
>
> Your patch produces almost a perfect distribution, the overall erase count
> is three times as much as it is expected.
> Hmmm.

I did more tests and can no longer reproduce the problem with too much
wear-leveling.
Maybe my initial tests were wonky. So, patch looks good, results too.
Let's merge it with 5.8. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
