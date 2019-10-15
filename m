Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDCFECE58C
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 20:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284C22083B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 20:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s161JcKE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Euz9W2Gm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 284C22083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13zrlvDqjlUuydvaEAaGOZ/m/ZXCUplId+u7K0O8Ovw=; b=s161JcKE9TofNi
	AuxIXT6xwyJudqr3F9qPRtfhAMejJbt9JSJ9+U3+L0Ey/xW391xl/FGug5r5FHMQQUaarmxm7nYdU
	Cn8kdfsZzYABJeJuzHyUE9ZL+LhHhft0ZAVfj8hhFJZ4/EOrHIGwUg4yPvNj1I4vd5EYHrOY8CjaU
	PIKORoaC0abcvaARpPeOnuZFYuqwsS/7VfXgl+EyQRyh3+L1J/YYbJQkCZEfZ63JJ3seL+PcJ+ocE
	SR3LLZpMOjc/qrDXX+EFxiKGRbAuPPuoUetWYrRS8TZFbk+TqvU9nE5TF7xd1ZZwkU9FQqll8MTfe
	Bq/zalLxdH9XaEkYwovw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKT9O-0006r8-3t; Tue, 15 Oct 2019 20:10:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKT9H-0006qI-00
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 20:10:33 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5so410899wmg.0
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 13:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZdBLEJTlOoFDFu107QLngMW0L6BkYGjgAcmm/SHsv64=;
 b=Euz9W2GmUBypPIleN6bl02AeOPacAhGC0FExq+OvVjuiHn743JU/fyccFBztF4tbpr
 mL+9Wm+Bmvl/YnK2uFCgha5j5peci5SIrTIrGKbz/Vgn1adpZa2ngUiLhxXtYOlaloWj
 5NqxtbzjT1KriF5Oyxv0Qu3pOLinvxPrFu/d0yax0WWiDcka3mrQCiwYcrt/heEtbjeX
 8VmjG8dIPwnDggsbWmy/vx5qakSbPpTjc2II2mQbyCmctSM7/5g0x0XXaxj0KJHMxmlD
 qA7PUNqPLORoHzXxqtriU9ZY58HBOWG5AC1fy3M36o9z42qewTJ/brpZn40HEjHCp/+R
 hUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdBLEJTlOoFDFu107QLngMW0L6BkYGjgAcmm/SHsv64=;
 b=AfQ35uEP8PypTaWohhiMgAUmDS4PLQbfg5Frlk2LqsqaBWO628hMkZrvmjPRIR++Cm
 gwY7zAoQH5v59T75NGnCPdgErYq91FHy/lRQVIzHQRKlZOCaZ4Cj7DVgixR1QjZy/eDW
 kDQ9SV7OcMLYEmlVqb3CXS4sdMEeNDLKkzC2GKsHVccg2oTFCwPV16OgneEv8qwej6IW
 OXzopsAxtypDi/xy0ctAmYAwviFgq+TWMLs1mUw8UAbR+LSyHBqAqVNDzzRmfp2ilZO/
 yRszODZoGnz4KFUt5BytlDOWv15IUskEIcdLpQeNkuUKynhYZuLrU9nBqvnWYddFMrTj
 o9iA==
X-Gm-Message-State: APjAAAUpy3rhifBV8LCgZP7YL9rEQhwRebdQs8XdiYGKXI6bS1Vd3J+1
 qtzrmT8UnQXyUEQpCjYVvASs8e/tfqEAidcXty8=
X-Google-Smtp-Source: APXvYqwPb89PqIBv99gIp/GXZe0/kuuQHFziiM4T5IfKbCY8RwNG5vu6pm97pUMgzK1xeIPszL/U+ryZTJO+8WcnDSs=
X-Received: by 2002:a1c:9990:: with SMTP id b138mr188355wme.176.1571170225515; 
 Tue, 15 Oct 2019 13:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190929141157.115845-1-houtao1@huawei.com>
In-Reply-To: <20190929141157.115845-1-houtao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 15 Oct 2019 22:10:13 +0200
Message-ID: <CAFLxGvwQ=4UOuscf0uuoOvckrncF2RC+rF_Pr70SpayFKfCg7Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: blkdevs: protect tr->devs list by mtd_table_mutex
To: Hou Tao <houtao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_131031_398143_CBD4F01E 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Sep 29, 2019 at 4:05 PM Hou Tao <houtao1@huawei.com> wrote:
>
> There may be list corruption if there are concurrent list traversal
> and list deletion on tr->devs as showed in the following case:
>
> CPU 0                               CPU 1
>
> open /dev/mtdblock1
>
> // remove mtd1
> blktrans_notify_remove()
>     del_mtd_blktrans_dev()
>
> close /dev/mtdblock1
>   blktrans_release
>     blktrans_dev_put
>       acquire blktrans_ref_mutex     // remove mtd0
>       // the final release           acquire mtd_table_mutex
>       blktrans_dev_release()         blktrans_notify_remove()
>         // remove mtdblock1            // next is mtdblock1
>         list_del(&dev->list)           list_for_each_entry_safe()
>
> We could fix the problem by acquiring blktrans_ref_mutex during
> the traversal of tr->devs, but blktrans_ref_mutex needs to be released
> before invoking tr->remote_dev(), so we also need to increase the kref
> of current device else the device may be freed and decrease the kref
> after the removal.
>
> Or we could move the list deletion to del_mtd_blktrans_dev(), and protect
> the operations on tr->devs by mtd_table_mutex which has already be taken.
>
> The latter fix is simpler. We also can remove the unnecessary acquisitions
> of blktrans_ref_mutex in add_mtd_blktrans_dev() because operations on
> tr->devs have already been protected by mtd_table_mutex.
>
> Fixes: 048d87199566 ("mtd: blktrans: Hotplug fixes")
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
> I found the problem by code review, and could not find a way to
> ensure the problem, because the removal of mtd devices almost
> comes from the removal of modules, and the open of /dev/mtdblockX
> will prevent the module from removing.

I'm confused. Can the problem only happen if you remove a mtd while
it is open?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
