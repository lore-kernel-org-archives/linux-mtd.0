Return-Path: <SRS0=vJsE=D3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FDEC4363A
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 14:01:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4FF22200
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 14:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LXrqCihs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9i9DM48"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B4FF22200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DH7GdAVLb1Z8jfHR0GnTBFuqEHyV1DicZ94Du/xOH2Y=; b=LXrqCihs3JtmFydDVOYtGUkwN
	fU5tn4o3P0ZiqgEbnLq+MeoRW9TBwxlnlcHlKzxyg6kWCb74qCi8ExzNEzy1ziRFy00khB4lL8SX3
	xsp/ECa4+qgEtj8a6VnRRyjXm6IH8Zjwcgc5mhyB9XloMuMXWjnOscJnszNkZ+8jj72NSYwOs9vI9
	RnpI743pPo+KZGsKQTpG1qCudGeF0WJJ1wmUlSEE1d5RORfmCbp2n4GkHX8E/l5IZ/xQoba35Gj7w
	M9L/lqZt8vEHI28LC9wgUelSHssaJa2k882TZ+Mf2EskSarhCoqJFaSCzSGCa5zZCVuoPp6tbmAOl
	hiRPUgMxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUsC3-0004tR-QG; Tue, 20 Oct 2020 14:00:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUsC1-0004sw-8q
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2020 14:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603202448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sctD9GroQPGmZjA5ubyMJz3ARe9p1/I2rVYIjHWBII=;
 b=R9i9DM48mjEEbBz5JALtb8v32quaQ2vYYjSGqqWvZLl/VIaULPBpORt+AE39mhonbnoEAL
 GvEwwayWXF4O+Q95QSTKU5ACJoalMvxOjUk/JnNYymls6Eyq/ts/xGYNDD0OCVC0f4PQnw
 C/p+FozAzhe0uTZqgKwzkpflXlYdefA=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-hkZePJecOCSU3iMX5aT3vQ-1; Tue, 20 Oct 2020 10:00:46 -0400
X-MC-Unique: hkZePJecOCSU3iMX5aT3vQ-1
Received: by mail-io1-f70.google.com with SMTP id c5so1990097iok.12
 for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2020 07:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4sctD9GroQPGmZjA5ubyMJz3ARe9p1/I2rVYIjHWBII=;
 b=GmgF2RWCYgqbU+NsbZubAX8ax2ORjbEtQ4WhgBjNczZ71jQfCZNb8/XsnoBMI+Fl6M
 LOJW0uQdtOnURsqBA5mPBK1mLiNPMdJj+L1wPkEWj3p7VLVs0K/HBvQr1Ai5UVAyG8Jc
 ulIIZTWRcWqlnAaGZCPP14UV//5HZ5W1bzUo0KHInPtqviI9hsb4PRe+n8rlUCUPRMx4
 cpIO0REHjxeehBnCXkJoFFcwzlVDoaosiF6Fc6IOpKFqiz659Na1kT3hg/dBzwtczqGI
 fgxdJ05iqx4mJS9VUXsN2sUFi7BYgk2GtpzccD41sIeMOoaSHlkg8UyxJlmIM8uEB+Ro
 y46Q==
X-Gm-Message-State: AOAM531n2QnUMmshQ0NoIgxIAYImureCFy9VvunJ3+6maMFsS5CRIlUa
 t+fiRhdpmrJagMBIdfjUsoiETLORukVssRtO/57R7SN1hiNmUuaRzSiNALTL2O0TC09pC5K7shy
 wz1WbI13CAwcwA4CWhoyuQa4w+Q==
X-Received: by 2002:a92:d84a:: with SMTP id h10mr2186983ilq.39.1603202445101; 
 Tue, 20 Oct 2020 07:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf1jwBZUSK30L5Aua9DPGWks1GPDv4iyrEdkxaagg/LMxe0yoJf/NaKWNohG7sDyMtkGoHgQ==
X-Received: by 2002:a92:d84a:: with SMTP id h10mr2186961ilq.39.1603202444880; 
 Tue, 20 Oct 2020 07:00:44 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id p4sm1960555ilg.79.2020.10.20.07.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 07:00:44 -0700 (PDT)
Subject: Re: [PATCH] mtd: remove unneeded break
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20201019191631.9604-1-trix@redhat.com>
 <CAFLxGvwAVbpUe221N-qS19aFSaJ4hM=J=veHfi+4wAkNTNGAog@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <fef9fb1c-30ee-14fb-a9bd-4f4a554a8bbc@redhat.com>
Date: Tue, 20 Oct 2020 07:00:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwAVbpUe221N-qS19aFSaJ4hM=J=veHfi+4wAkNTNGAog@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_100049_380529_DE78F921 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, LKML <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 10/19/20 1:04 PM, Richard Weinberger wrote:
> On Mon, Oct 19, 2020 at 9:23 PM <trix@redhat.com> wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> A break is not needed if it is preceded by a return
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/mtd/mtdchar.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
>> index b40f46a43fc6..323035d4f2d0 100644
>> --- a/drivers/mtd/mtdchar.c
>> +++ b/drivers/mtd/mtdchar.c
>> @@ -881,7 +881,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>>                 if (copy_from_user(&offs, argp, sizeof(loff_t)))
>>                         return -EFAULT;
>>                 return mtd_block_isbad(mtd, offs);
>> -               break;
>>         }
>>
>>         case MEMSETBADBLOCK:
>> @@ -891,7 +890,6 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>>                 if (copy_from_user(&offs, argp, sizeof(loff_t)))
>>                         return -EFAULT;
>>                 return mtd_block_markbad(mtd, offs);
>> -               break;
> Acked-by: Richard Weinberger <richard@nod.at>
>
> Do you want to route this patch through mtd or do you carry it?

Not sure if this question is for me.

I do not maintain a subsystem/branch, so through mtd is what i was assuming.

Tom

>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
