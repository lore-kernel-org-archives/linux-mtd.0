Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E321C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 20:49:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C371721872
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 20:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1gEMiaU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C371721872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bY6tx98UMkS2KH8JnVfxa+PY+K7BVjTTS/FOZVEIgYI=; b=f1gEMiaUADsawx
	t4x7N2/lq5wAmdbmI9MVIkhdiW5NKrdSV+CXpIzKGP1DN8f2XA4anHx/PTZjmmRQbGD9negcr5lVv
	UuV+pDKBneOBJS5aRQNHhdqZ9GQY4qE7EjfwrB4UbksDmnKOYlwWZ+oCHDJU10Jad+6BLGfoMf5eO
	2TJWxMc8kqb0t6J51SIUty3BLmlnhIbfZwS4pIousuzvcxg9bEQlgenLhmPUvNiTGa0i7JL8Fq10d
	8YqGplgqBzHy3gaGF43qyPx3wpEH4JG1OcOgddD3+YFMzvSArehLbxjE9+eYXN83kf5ne6Qp6kPJ+
	t9zMoj7N9oajyFZD7I1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmPSp-0001F0-PZ; Wed, 23 Jan 2019 20:49:35 +0000
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmPSl-0001E6-8K
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 20:49:33 +0000
Received: from belgarion ([86.206.19.74]) by mwinf5d65 with ME
 id TwpF1z0071btlZA03wpNuL; Wed, 23 Jan 2019 21:49:24 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 23 Jan 2019 21:49:24 +0100
X-ME-IP: 86.206.19.74
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH -next] mtd: docg3: Fix passing zero to 'PTR_ERR' warning
 in doc_probe_device
References: <20190123065827.16748-1-yuehaibing@huawei.com>
 <20190123101253.243add9d@bbrezillon>
 <86533285-e800-5cc0-f495-88fff8326b5a@huawei.com>
 <20190123105253.1f4487f2@bbrezillon>
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 23 Jan 2019 21:49:15 +0100
In-Reply-To: <20190123105253.1f4487f2@bbrezillon> (Boris Brezillon's message
 of "Wed, 23 Jan 2019 10:52:53 +0100")
Message-ID: <87va2fyu9g.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_124931_612602_9C6C23B9 
X-CRM114-Status: GOOD (  18.60  )
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
Cc: richard@nod.at, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Boris Brezillon <bbrezillon@kernel.org> writes:

> On Wed, 23 Jan 2019 17:43:58 +0800
> YueHaibing <yuehaibing@huawei.com> wrote:
>
>> On 2019/1/23 17:12, Boris Brezillon wrote:
>> > On Wed, 23 Jan 2019 14:58:27 +0800
>> > YueHaibing <yuehaibing@huawei.com> wrote:
>> >   
>> >> Fix a static code checker warning:
>> >> drivers/mtd/devices/docg3.c:1875
>> >>  doc_probe_device() warn: passing zero to 'ERR_PTR'
>> >>
>> >> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
>> >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> >> ---
>> >>  drivers/mtd/devices/docg3.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
>> >> index 4c94fc0..60ddc38 100644
>> >> --- a/drivers/mtd/devices/docg3.c
>> >> +++ b/drivers/mtd/devices/docg3.c
>> >> @@ -1872,7 +1872,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
>> >>  nomem2:
>> >>  	kfree(docg3);
>> >>  nomem1:
>> >> -	return ERR_PTR(ret);
>> >> +	return ret ? ERR_PTR(ret) : NULL;
>> >>  }
>> >>    
>> > 
>> > This is not the right fix, you should instead set ret to -EINVAL:  
>> 
>> Thanks , will fix it in v2.
>> 
>> And seems doc_probe_device cannot return NULL. The NULL check of doc_probe_device
>> in docg3_probe also can been removed, right?
>
> Hm, looks like the ret = 0 was intentional (to identify when ID is
> invalid). Let's just keep your initial patch.
Indeed, that's for the multiple floor configuration if I remember correctly.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
