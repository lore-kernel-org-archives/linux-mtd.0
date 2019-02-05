Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3026C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 23:03:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7026F20844
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 23:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oV1JHP0V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="dOU3aD+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7026F20844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkv+EtZsMliBtXqi218DUAaxAqSdKfk5kgBfcZyfp40=; b=oV1JHP0Vt4T8a3
	DKH1Omt6GZ/JBPwOlTklSJSx/RcjOxH2L5mnFPo38aErSIAi3XLS+I2BAqbo7OW1ngLnR6SwvOe2U
	B9J7yv+pI6spRfjFy0cC5bdr47sEyC9hsqNvKBwD90tGE0VTQxgX42XEFKuaRi4rMGa9A7IrdqgAp
	wuxcgiBCtnqUwKfjmnmBjut2QV11BHBcuBYx4EwOqdjJB54mq/JNIQ4y81CjNF5JsGUoNKW56nfGu
	LLktvhHOz7lY3qBzCSWZL36v0jqAXKhpbI8OqhTxi8Cy8Kq7t0pScc1rqNEF0q7SiDC7Nh05Qmmdl
	O9qtE9FAMAzdLJKZ779A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr9kk-0007Tp-PH; Tue, 05 Feb 2019 23:03:42 +0000
Received: from nh603-vm7.bullet.mail.ssk.yahoo.co.jp ([182.22.90.48])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr9kh-0007TN-9A
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 23:03:41 +0000
Received: from [182.22.66.105] by nh603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 23:03:36 -0000
Received: from [182.22.91.206] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 23:03:36 -0000
Received: from [127.0.0.1] by omp609.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 23:03:36 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 163475.3055.bm@omp609.mail.ssk.yahoo.co.jp
Received: from jws700005.mail.kks.yahoo.co.jp by
 sendmailws520.mail.kks.yahoo.co.jp; Wed, 06 Feb 2019 08:03:35 +0000;
 1549407815.409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1549407815; 
 s=yj20110701; d=yahoo.co.jp;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=yJeblMwr0lkgdxn1nulAjiyI1mgacsp/J9oOV2YTbBg=;
 b=dOU3aD+PSyyD3I+a7ggUoRjyhY7sdYdLX2v80dAH0ZxQcGVZd9+0jq+4SsT1k5i4
 rU4rFvVUhRynQD0XeDbX0TMjLlXCJLKN6AOzopktpvcoz0otQkNQo6XqUgim5M/eFyA
 gR6EWBIdU7wBgy+2GJf4oFtsevlsvNsXEAZbTjCY=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp; 
 h=Date:From:Cc:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=fSd6Uf38+3QqYGk47RQAlHyojjWFmTolKyQFhvybU/SZKoscO2BXdkQdnfQ+c0rK
 D310HUNcr5bkgPUnIdlmd9l3dS+iMeG3DZh+6t/lfCVZ83lm7SFLgrL6LAFItCOaWjC
 66W5jvnNB3OPWV5DrodWTd3afKnmJBVWbZd/8ePE=;
Date: Wed, 6 Feb 2019 08:03:35 +0900 (JST)
From: <ikegami_to@yahoo.co.jp>
To: "Sobon, Przemyslaw" <psobon@amazon.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Liu Jian <liujian56@huawei.com>
Message-ID: <1427705426.3193193.1549407815190.JavaMail.yahoo@mail.yahoo.co.jp>
In-Reply-To: <acd16b85676e4d1d89f3acfbeda30107@EX13D07UWA001.ant.amazon.com>
References: <1548977439-318904-1-git-send-email-liujian56@huawei.com>
 <20190203092645.18d1495b@bbrezillon> <20190203093509.269bf1e1@bbrezillon>
 <acd16b85676e4d1d89f3acfbeda30107@EX13D07UWA001.ant.amazon.com>
Subject: Re: RE: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_150339_652616_C00AE3E2 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: "keescook@chromium.org" <keescook@chromium.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joakim.tjernlund@infinera.com" <joakim.tjernlund@infinera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch looks good to me.
About the performance issue it seems that it is expected by this do_write_buffer() function.
If this patch will be applied I will do rebase my patches with this.

Reviewed-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>


--- psobon@amazon.com wrote --- :
> > From: Boris Brezillon <bbrezillon@kernel.org> 
> > Sent: Sunday, February 3, 2019 12:35 AM
> > > +Przemyslaw
> > > 
> > > On Fri, 1 Feb 2019 07:30:39 +0800
> > > Liu Jian <liujian56@huawei.com> wrote:
> > > 
> > > > In function do_write_buffer(), in the for loop, there is a case
> > > > chip_ready() returns 1 while chip_good() returns 0, so it never 
> > > > break the loop.
> > > > To fix this, chip_good() is enough and it should timeout if it stay 
> > > > bad for a while.
> > > 
> > > Looks like Przemyslaw reported and fixed the same problem.
> > > 
> > > > 
> > > > Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to 
> > > > check correct value)
> > > 
> > > Can you put the Fixes tag on a single, and the format is
> > > 
> > > Fixes: <hash> ("message")
> > > 
> > > > Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> > > > Signed-off-by: Liu Jian <liujian56@huawei.com>
> > > 
> > > [1]http://patchwork.ozlabs.org/patch/1025566/ 
> > > 
> > > > ---
> > > >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c 
> > > > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > index 72428b6..818e94b 100644
> > > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > @@ -1876,14 +1876,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
> > > >              continue;
> > > >          }
> > > >  
> > > > -        if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> > > > -            break;
> > > > -
> > > >          if (chip_good(map, adr, datum)) {
> > > >              xip_enable(map, chip, adr);
> > > >              goto op_done;
> > > >          }
> > > >  
> > > > +        if (time_after(jiffies, timeo))
> > > > +            break;
> > > > +
> > > >          /* Latency issues. Drop the lock, wait a while and retry */
> > > >          UDELAY(map, chip, adr, 1);
> > > >      }
> > > 
> > 
> > BTW, the patch itself looks good to me. Ikegami, can you confirm it does the right thing?
> > 
> > Thanks,
> > 
> > Boris
> > 
> 
> One comment to this patch. If value is written incorrectly quickly we will be
> stuck in the loop even though nothing is going to change. For example a value was
> written incorrectly after 1us, the loop was set to 1ms, function will return
> after 1ms, this solution is not optimized for performance. I considered same
> when working on this change and decided to do it different way.
> 
> Regards,
> Przemek
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
