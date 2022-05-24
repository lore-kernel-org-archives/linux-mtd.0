Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D0DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYQ6UeXuIMeYl/2AvQDwhR5mi3dH73dr3lw8Kd+ZNFI=; b=lIjoSq2B52CwyG
	U58i7FYC42lg4uQmuymUIzxmsaU75gNa+nAaIhaXO6mW39jdnA5S8HeivyFfYgRYDUUqqeGoQ6nQK
	oDpFWtudCQTzchGVZOIHkHxOAGROHgFoWGTSuWSprwX0PLuvQXzW7QWeY+8KgbNu3WGnQI7yQkaSe
	usCz/rpPZRpvqoh3WnyPS0i8eIweDiZtXwgTLxD42y0Lq76Vk3Sq1LDlGm8U3Gv0NciauSNGv0re9
	XPJ3aQXW2vl/B0nQ7ak3BxzRgf0OKiznhvnQ1awOiY4tGzL8HqTPAJa5tsIU5dxkY8N2SLqbrLUxJ
	8Z7TExxREYwwPgN9178w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntOjm-00728o-Q3; Tue, 24 May 2022 07:13:50 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntOji-007281-PE
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 07:13:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id i27so33382025ejd.9
 for <linux-mtd@lists.infradead.org>; Tue, 24 May 2022 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malat-biz.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eunu73/8rviOeHUzBMMB6FIOIz37GALKRdpDRhaNFC0=;
 b=z+alSYku/zecfz4dsYeNtbJLpLWjCHXWWjA3QK+XPcKBlpmeNZBmH/5/fvsx2SR9ng
 uWNNkIri6AlIvZrnsE5YfJ/5MiC/krGK/33Waum1Lkwn0u9CrsjmGdhEv8cmMW1qau2e
 ueoBmn/oQpKn6uYPa4Rfyh9ZWr0lHIrR5aYXi1wIO5NdSaxYGjJJztPMIHNWX5OpsWQh
 +LGfYGZ7/csDux8l6avPyC0i6uNoNwzdPL71AjNZHZUOU/P/1qxcnpjWRbGoEGExClLr
 GFUhaatl5OBjomy4aatrZQxqb9xGAcalTWOBz9Dkdp8ZNFG1FtENIKbf55rbn6HKqoQt
 WHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eunu73/8rviOeHUzBMMB6FIOIz37GALKRdpDRhaNFC0=;
 b=NCZIiuSfCCVIH1NjJWXIeK7aIsjb5KS0HMEd6oKx/N3g1+tZg7ntkw+6A96t4cHYxP
 glE6FuSdk+x+fWMYmbXrQOLopnn7KhBNlTAWvHi8jKnJqhelBOTaK8yqHBO44FTW9n5w
 pZB1UHQj5lmHMglxWsBaJsm4z+zTFI03iNL3TS0FySvi60UZH+r3SesPN5HtIW05W0GA
 rkKeONOTA8KfV+666EMmUzRF0y2IP+1fsrZVbqUFRheW2XTtPE4kJSSK6e3NHh+BnAaO
 mhlJZaK9RUPCxx9QBZzfCAmgzU4XpBWmxUm7eDZWSUsaUKf8pU0D9tknq5DUwhe6HoRT
 Pvzg==
X-Gm-Message-State: AOAM530Mby5own2kwCoum/q2YonZy8AHKSoBiMovvx7h02rHvk4NAkcE
 AzoYMFkKNpi3KzF0GyJ4mZpWqkN9cOheozvB
X-Google-Smtp-Source: ABdhPJyxpBX7gEiMHY622uqEJnEc+74EkHsDKkKTLnzD3C0VLXIHvwms/bjENrYL/Aah+zTlqZeh0g==
X-Received: by 2002:a17:907:6e22:b0:6fe:b668:101 with SMTP id
 sd34-20020a1709076e2200b006feb6680101mr15613909ejc.247.1653376423765; 
 Tue, 24 May 2022 00:13:43 -0700 (PDT)
Received: from ntb.petris.klfree.czf
 ([2a02:8070:d483:ed00:4bcc:154f:5c11:5870])
 by smtp.gmail.com with ESMTPSA id
 ee46-20020a056402292e00b0042617ba63aesm9193489edb.56.2022.05.24.00.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 00:13:43 -0700 (PDT)
Date: Tue, 24 May 2022 09:13:41 +0200
From: Petr Malat <oss@malat.biz>
To: David Laight <David.Laight@aculab.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Joern Engel <joern@lazybastard.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: phram: Map RAM using memremap instead of ioremap
Message-ID: <YoyFpbhLB1E+8ilr@ntb.petris.klfree.czf>
References: <20220523142825.3144904-1-oss@malat.biz>
 <3cab9a7f4ed34ca0b742a62c2bdc3bce@AcuMS.aculab.com>
 <Youn9AmqY6/EExDw@ntb.petris.klfree.czf>
 <e33f91a3eacc4aa3a08e6465fef9265c@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e33f91a3eacc4aa3a08e6465fef9265c@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_001347_081452_A7A5A39B 
X-CRM114-Status: GOOD (  25.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 23, 2022 at 04:09:20PM +0000, David Laight wrote:
> From: Petr Malat
> > Sent: 23 May 2022 16:28
> > On Mon, May 23, 2022 at 02:51:41PM +0000, David Laight wrote:
> > > From: Petr Malat
> > > > Sent: 23 May 2022 15:28
> > > >
> > > > One can't use memcpy on memory obtained by ioremap, because IO memory
> > > > may have different alignment and size access restriction than the system
> > > > memory. Use memremap as phram driver operates on RAM.
> > >
> > > Does that actually help?
> > > The memcpy() is still likely to issue unaligned accesses
> > > that the hardware can't handle.
> > 
> > Yes, it solves the issue. Memcpy can cause unaligned access only on
> > platforms, which can handle it. And on ARM64 it's handled only for
> > RAM and not for a device memory (__pgprot(PROT_DEVICE_*)).
> 
> Does mapping it as memory cause it to be cached?
> So the hardware only sees cache line reads (which are aligned)
> and the cpu support for misaligned memory accesses then
> stop the faults?
Yes, this is controlled by the MEMREMAP_WB flag, which sets up
a mapping, which "matches the default mapping for System RAM on
the architecture. This is usually a read-allocate write-back cache.

> On x86 (which I know a lot more about) memcpy() has a nasty
> habit of getting implemented as 'rep movsb' relying on the
> cpu to speed it up.
> But that doesn't happen for uncached addresses - so you get
> very slow byte copies.
> OTOH misaligned PCIe transfers generate TLP that have the
> correct byte enables for the end words.
> Provided the PCIe target isn't broken they are fine.
With memremap one should get the same behavior and performance
as with the system memory and it seems to be a good choice for
"Physical system RAM" MTD driver, but if one uses it for actual
IO memory, he should use ioremam, memcpy_toio and memcpy_fromio.
Using these prevents the crash on arm64 as well, but could lead
to a performance degradation on some platforms.

If you think there could be users using the driver for a real IO
mem, I can provide both behaviors and let the user choose with an
option.
  Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
