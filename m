Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CCAC282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 23:00:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA8A2175B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 23:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dblREN/s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="vru5NM2g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FA8A2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WscAVydxN648cF/ciDtJW6miIJSa5epujY8pu9JsjZw=; b=dblREN/sCREW9K
	UxyVl2bLA4mPy9Doo+GWQ6AZinRirZhUlFktUaoVZ+TtkvRUI6L8cmQC3dlRSy4xlHLMw8TS//rre
	9t4f19mnBLoWDpyHDyjFg6UWpR5Tc802hdhY2GKzUaz2cqiMoq9SS4SBSlF/P6HbHYY6QraWiXmjU
	bZH083HZI6etAugspJiRaHQ3y12CFxRrXOFb2qdB7IJ1e90r4VghgVubuHAVBsfB3xbEq9KRl0Srf
	HuNOTk883fMR2h+v5MqdhFZ+po0UZThu35gEWMLZwrNCUh00pVlAW3N1iej8rwdhxEyIS9/5eozxb
	RQULBHjmduqJ/4jGMBEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grseD-00043l-R4; Thu, 07 Feb 2019 22:59:57 +0000
Received: from nh505-vm7.bullet.mail.kks.yahoo.co.jp ([183.79.57.109])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grse9-000431-EV
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 22:59:56 +0000
Received: from [183.79.100.141] by nh505.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 07 Feb 2019 22:59:50 -0000
Received: from [183.79.100.133] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 07 Feb 2019 22:59:50 -0000
Received: from [127.0.0.1] by omp502.mail.kks.yahoo.co.jp with NNFMP;
 07 Feb 2019 22:59:50 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 733283.74999.bm@omp502.mail.kks.yahoo.co.jp
Received: from jws702002.mail.kks.yahoo.co.jp by
 sendmailws519.mail.kks.yahoo.co.jp; Fri, 08 Feb 2019 07:59:48 +0000;
 1549580388.094
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1549580390; 
 s=yj20110701; d=yahoo.co.jp;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=sPtKGkFDhWCOBvt91ycLKEmxFtEkVXsPYZ4pVg39vE8=;
 b=vru5NM2g5pEGfLGIpEjozllJ/daePMkeQndZXVFuvVGuPVG4YOIEl5pCxjwC5hv5
 By1lX6tXxqFmeLWXPwDfRfs9EZgYPjp2OpzwiUxEJu8TRfzinHWtY7y2wx54uZ4Ixa0
 AlCm7ctyfCKiOchHYAG6hUSE7EM6IlJG7UDvWyFA=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp; 
 h=Date:From:Cc:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=ep6OO7Fu+ZviYsyb47I0q6JEmAzdsvWm7H1+IaLoA1VIO7uai6YRjd6H4t5hohD/
 DXrJ8lc2eq3bK9pulNMB64JIGjgbLISufMYRkGDAYPKjD8xEj8JU4j/+3k+C6xT6g6F
 j79DNylFylxKOxODk5K21tOl7iC5ZkE4b8ROdhWs=;
Date: Fri, 8 Feb 2019 07:59:47 +0900 (JST)
From: <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 "Sobon, Przemyslaw" <psobon@amazon.com>
Message-ID: <193621849.44066.1549580387922.JavaMail.yahoo@mail.yahoo.co.jp>
In-Reply-To: <20190207095635.0fc3b411@kernel.org>
References: <1548977439-318904-1-git-send-email-liujian56@huawei.com>
 <20190203092645.18d1495b@bbrezillon> <20190203093509.269bf1e1@bbrezillon>
 <acd16b85676e4d1d89f3acfbeda30107@EX13D07UWA001.ant.amazon.com>
 <20190207095635.0fc3b411@kernel.org>
Subject: Re: Re: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_145953_830266_11B79A91 
X-CRM114-Status: GOOD (  25.98  )
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
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joakim.tjernlund@infinera.com" <joakim.tjernlund@infinera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, Liu Jian <liujian56@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Przemek-san,

Could you please explain the case detail that the value is written incorrectly?
I think that the value is only written correctly except a bug.

Regards,
Ikegami

--- boris.brezillon@collabora.com wrote --- :
> Hi Sobon,
> 
> On Tue, 5 Feb 2019 22:28:44 +0000
> "Sobon, Przemyslaw" <psobon@amazon.com> wrote:
> 
> > > From: Boris Brezillon <bbrezillon@kernel.org> 
> > > Sent: Sunday, February 3, 2019 12:35 AM  
> > > > +Przemyslaw
> > > > 
> > > > On Fri, 1 Feb 2019 07:30:39 +0800
> > > > Liu Jian <liujian56@huawei.com> wrote:
> > > >   
> > > > > In function do_write_buffer(), in the for loop, there is a case
> > > > > chip_ready() returns 1 while chip_good() returns 0, so it never 
> > > > > break the loop.
> > > > > To fix this, chip_good() is enough and it should timeout if it stay 
> > > > > bad for a while.  
> > > > 
> > > > Looks like Przemyslaw reported and fixed the same problem.
> > > >   
> > > > > 
> > > > > Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to 
> > > > > check correct value)  
> > > > 
> > > > Can you put the Fixes tag on a single, and the format is
> > > > 
> > > > Fixes: <hash> ("message")
> > > >   
> > > > > Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> > > > > Signed-off-by: Liu Jian <liujian56@huawei.com>  
> > > > 
> > > > [1]http://patchwork.ozlabs.org/patch/1025566/ 
> > > >   
> > > > > ---
> > > > >  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c 
> > > > > b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > index 72428b6..818e94b 100644
> > > > > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > > > > @@ -1876,14 +1876,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
> > > > >              continue;
> > > > >          }
> > > > >  
> > > > > -        if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> > > > > -            break;
> > > > > -
> > > > >          if (chip_good(map, adr, datum)) {
> > > > >              xip_enable(map, chip, adr);
> > > > >              goto op_done;
> > > > >          }
> > > > >  
> > > > > +        if (time_after(jiffies, timeo))
> > > > > +            break;
> > > > > +
> > > > >          /* Latency issues. Drop the lock, wait a while and retry */
> > > > >          UDELAY(map, chip, adr, 1);
> > > > >      }  
> > > >   
> > > 
> > > BTW, the patch itself looks good to me. Ikegami, can you confirm it does the right thing?
> > > 
> > > Thanks,
> > > 
> > > Boris
> > >   
> > 
> > One comment to this patch. If value is written incorrectly quickly we will be
> > stuck in the loop even though nothing is going to change. For example a value was
> > written incorrectly after 1us, the loop was set to 1ms, function will return
> > after 1ms, this solution is not optimized for performance. I considered same
> > when working on this change and decided to do it different way.
> 
> Seems like you're right if we assume that checking for GOOD state does
> not require a delay after the READY check, but if that's not the case
> and an extra delay is actually required, you might end up with a BAD
> status while it could have turned GOOD at some point with the 'check
> only for GOOD state until we timeout' approach.
> 
> TBH, I don't know how CFI flashes work, so I'll let you guys sort this
> out.
> 
> Regards,
> 
> Boris
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
