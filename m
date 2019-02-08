Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE801C282D7
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 14:24:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F28D20863
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 14:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itQob527";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nz/j3uMD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F28D20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxT3vbBROapXb/pkSavW+ImjQXj66zWxAYJBWZNtn6o=; b=itQob52768Z9JI
	WYvh/lchsPPM0kJ5rHEAsQuht62XP5omPgmkWq2GF/6sEDXilsrm9YKsYWGHUdU0Q0FoUeTQmt3ij
	ZMGTyTg65y63IeZkKIivC5CKAbBF3ltO+kWnbww3aAKj9SU5Tfe9FTR21w5grhxz16BOyvNorv2l1
	RjdOGb5d/oproZYVSCx8k1koqzaVsPgR9/xKJXcR+l7ZLYm/a8vaaXmlRJSI/w7GcApy2tt37sdBj
	qp/ijl/yQvnD0ZdV/acnyaa9Adlmgqye0VUeEDvtTW82XHuqL9PXICPIzp6ePoHgjOufxzsqjCorM
	ys2GFKFIJIaPFcxmfzJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs753-0005T5-0V; Fri, 08 Feb 2019 14:24:37 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs74w-0005S8-Sv
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 14:24:34 +0000
Received: by mail-pf1-x444.google.com with SMTP id j3so1721415pfi.12
 for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2019 06:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=x+4xnTqcwhgr98uo5XuFLhUJxPlaJMi636SG2kQk7Gc=;
 b=Nz/j3uMDOKKjlKfg8XkmSjsG+hq2GR57pmu0ELyhtTHaop/CIhVuBiNmxAs7/l4tAN
 IH7DDFeg2O3lQoH2msMZB5B/Sv3dSO44F6NfISmiVVc7i9K5li5IFXUSL7dPPHAUnBjv
 jHyoBdO8IFrRB80q/A2jg0qitDMXVHmjY4Ez3kpFaSd3gxAJ/Nvk1nYi1eGg++1lnmJt
 MrI3kFS/n2Txb5QmiVQ2LNf0Vr6jmxZOshrL9lUmPxHBd4g0MYkMnfBQNjK+QzeZHrNz
 JIu0KcWGIax+ElLWafh0ggLLr1yya+MvO4fdqhuyfebBHtxJa4pd3ifXt4wMsLODY4Cf
 +ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=x+4xnTqcwhgr98uo5XuFLhUJxPlaJMi636SG2kQk7Gc=;
 b=TN/sfwLeZ2tkFYTampBMnhfbykTQtczuOq+ttlrjH+cL0yZr/hBXU5xf805HVf7TuX
 bEFjj3xOkEfDujpSh8lI8vrYHrW7Cy/0fF6kvPy3CVpXYgfxVJr7/ZQ4dTT6PqFA461+
 O5BfHnHu7nQm1eV1m61XScWVnaRfVQtl2qy100y3hKrTw08fcuK1pHAUQhD9/YVM/w+4
 35a/AYIgC9/IvjBkr/cSAKsOJW68hTrhGRXxLtT7W6Y7s7tlAO5P74ht3X686bZU50Qc
 HaCOA7ZNacaA0nGapx/7rYV+2TtubIbbeg0KbQwPH4L4VpUw7DQ97GU1KVUOFWDETccp
 uEAQ==
X-Gm-Message-State: AHQUAuYDUCj17xARuXP1CH2QGt94korsi64Tn+kGLwXsQX2jsVk2cttY
 5YO4+zkI2M77rsuU+L1jTlY=
X-Google-Smtp-Source: AHgI3IY4R6s1tLE+JvJyuE1UiIUeBdRtoYeDhXLsW1itG54bMV7XXx3OOKwfh+GIO/qb+YohauwqiA==
X-Received: by 2002:a62:1c86:: with SMTP id c128mr23246203pfc.54.1549635869414; 
 Fri, 08 Feb 2019 06:24:29 -0800 (PST)
Received: from ikegamiPC (M106072039032.v4.enabler.ne.jp. [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id f12sm2680980pgo.13.2019.02.08.06.24.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Feb 2019 06:24:28 -0800 (PST)
From: "Tokunori Ikegami" <ikegami.t@gmail.com>
To: "'Sobon, Przemyslaw'" <psobon@amazon.com>,
 "'Boris Brezillon'" <boris.brezillon@collabora.com>
References: <1548977439-318904-1-git-send-email-liujian56@huawei.com>
 <20190203092645.18d1495b@bbrezillon> <20190203093509.269bf1e1@bbrezillon>
 <acd16b85676e4d1d89f3acfbeda30107@EX13D07UWA001.ant.amazon.com>
 <20190207095635.0fc3b411@kernel.org>
 <193621849.44066.1549580387922.JavaMail.yahoo@mail.yahoo.co.jp>
 <632ed76bd3844ceab75066d1f30a7115@EX13D07UWA001.ant.amazon.com>
In-Reply-To: <632ed76bd3844ceab75066d1f30a7115@EX13D07UWA001.ant.amazon.com>
Subject: RE: Re: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Date: Fri, 8 Feb 2019 23:23:59 +0900
Message-ID: <149101d4bfb9$fdc5a330$f950e990$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKzD+8bzTNJb3fYn6g+Txlclt4a6gHKPVnTAnthz5oB7umc8AJnC6FFAd0fx9ABvvwx96O3jtDw
Content-Language: ja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_062431_079708_77EF88E6 
X-CRM114-Status: GOOD (  36.34  )
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
Cc: keescook@chromium.org, joakim.tjernlund@infinera.com, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, ikegami_to@yahoo.co.jp,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, 'Liu Jian' <liujian56@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Przemek-san,

Thank you so much for your explanation.

> I have seen a case myself where a value was written, chip changed
> state to "ready" but when I was reading the value was incorrect.

I also know the similar issues for the both buffer and word write.
Both issues were able to reproduce the write error behavior.
  Note: The word write issue is able to reproduce now also.

Those were resolved by using chip_good() instead to check the state.

> This can happen as result of intermittent issue with flash. It is
> hard to fall into scenario when testing on limited number of devices
> but with large enough population you can see that.

If possible I would like to know the issue detail and its cause also.

> Another situation
> is when a flash chip reaches its maximum number of writes. So for
> example a chip is designed for 100k writes to a page. Once you
> reach that number of writes you can have invalid data written to
> flash but chip itself reports everything was good and switches to
> "ready" state.

Yes I see.

Regards,
Ikegami

> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Sobon, Przemyslaw
> Sent: Friday, February 8, 2019 8:51 AM
> To: ikegami_to@yahoo.co.jp; Boris Brezillon
> Cc: keescook@chromium.org; marek.vasut@gmail.com;
> ikegami@allied-telesis.co.jp; richard@nod.at;
> linux-kernel@vger.kernel.org; joakim.tjernlund@infinera.com;
> linux-mtd@lists.infradead.org; computersforpeace@gmail.com;
> dwmw2@infradead.org; Liu Jian
> Subject: RE: Re: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c
> do_write_buffer
> 
> Hi Ikegami,
> 
> I have seen a case myself where a value was written, chip changed
> state to "ready" but when I was reading the value was incorrect.
> This can happen as result of intermittent issue with flash. It is
> hard to fall into scenario when testing on limited number of devices
> but with large enough population you can see that. Another situation
> is when a flash chip reaches its maximum number of writes. So for
> example a chip is designed for 100k writes to a page. Once you
> reach that number of writes you can have invalid data written to
> flash but chip itself reports everything was good and switches to
> "ready" state.
> 
> Hope this explanation is clear. Please let me know.
> 
> Regards,
> Przemek
> 
> > -----Original Message-----
> > From: ikegami_to@yahoo.co.jp <ikegami_to@yahoo.co.jp>
> > Sent: Thursday, February 7, 2019 3:00 PM
> >
> > Hi Przemek-san,
> >
> > Could you please explain the case detail that the value is written
> incorrectly?
> > I think that the value is only written correctly except a bug.
> >
> > Regards,
> > Ikegami
> >
> > --- boris.brezillon@collabora.com wrote --- :
> > > Hi Sobon,
> > >
> > > On Tue, 5 Feb 2019 22:28:44 +0000
> > > "Sobon, Przemyslaw" <psobon@amazon.com> wrote:
> > >
> > > > > From: Boris Brezillon <bbrezillon@kernel.org>
> > > > > Sent: Sunday, February 3, 2019 12:35 AM
> > > > > > +Przemyslaw
> > > > > >
> > > > > > On Fri, 1 Feb 2019 07:30:39 +0800 Liu Jian
> > > > > > <liujian56@huawei.com> wrote:
> > > > > >
> > > > > > > In function do_write_buffer(), in the for loop, there is a
> > > > > > > case
> > > > > > > chip_ready() returns 1 while chip_good() returns 0, so it
> > > > > > > never break the loop.
> > > > > > > To fix this, chip_good() is enough and it should timeout if
> it
> > > > > > > stay bad for a while.
> > > > > >
> > > > > > Looks like Przemyslaw reported and fixed the same problem.
> > > > > >
> > > > > > >
> > > > > > > Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer
> > > > > > > to check correct value)
> > > > > >
> > > > > > Can you put the Fixes tag on a single, and the format is
> > > > > >
> > > > > > Fixes: <hash> ("message")
> > > > > >
> > > > > > > Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> > > > > > > Signed-off-by: Liu Jian <liujian56@huawei.com>
> > > > > >
> > > > > > [1]http://patchwork.ozlabs.org/patch/1025566/
> > > > > >
> > > > > > > ---
> > > > > > >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> > > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > > > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > > > index 72428b6..818e94b 100644
> > > > > > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > > > @@ -1876,14 +1876,14 @@ static int __xipram
> do_write_buffer(struct map_info *map, struct flchip *chip,
> > > > > > >              continue;
> > > > > > >          }
> > > > > > >
> > > > > > > -        if (time_after(jiffies, timeo) && !chip_ready(map,
> adr))
> > > > > > > -            break;
> > > > > > > -
> > > > > > >          if (chip_good(map, adr, datum)) {
> > > > > > >              xip_enable(map, chip, adr);
> > > > > > >              goto op_done;
> > > > > > >          }
> > > > > > >
> > > > > > > +        if (time_after(jiffies, timeo))
> > > > > > > +            break;
> > > > > > > +
> > > > > > >          /* Latency issues. Drop the lock, wait a while and
> retry */
> > > > > > >          UDELAY(map, chip, adr, 1);
> > > > > > >      }
> > > > > >
> > > > >
> > > > > BTW, the patch itself looks good to me. Ikegami, can you confirm
> it does the right thing?
> > > > >
> > > > > Thanks,
> > > > >
> > > > > Boris
> > > > >
> > > >
> > > > One comment to this patch. If value is written incorrectly quickly
> > > > we will be stuck in the loop even though nothing is going to change.
> > > > For example a value was written incorrectly after 1us, the loop was
> > > > set to 1ms, function will return after 1ms, this solution is not
> > > > optimized for performance. I considered same when working on this
> change and decided to do it different way.
> > >
> > > Seems like you're right if we assume that checking for GOOD state does
> > > not require a delay after the READY check, but if that's not the case
> > > and an extra delay is actually required, you might end up with a BAD
> > > status while it could have turned GOOD at some point with the 'check
> > > only for GOOD state until we timeout' approach.
> > >
> > > TBH, I don't know how CFI flashes work, so I'll let you guys sort this
> > > out.
> > >
> > > Regards,
> > >
> > > Boris
> > >
> > > ______________________________________________________
> > > Linux MTD discussion mailing list
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > >
> >
> >
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
