Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DD3C43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 16:54:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2746C20818
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 16:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i3mdI0Zu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6r9OupR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2746C20818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYYLjeoQwGHD8cvC2uzaOGt8uvxh5JIiqODexTTxZeY=; b=i3mdI0Zu0XJ09X
	pwhRSJCg62LmFl/vU+9Y/n37n0JFbmGiDrVtwSiaGMrpnf0aa9jTw2tfllrG0UoSZdaIg9S6mcI2G
	P+RBW0PPc10HRpgUVUObr5su9JMcuvUADr20p80G6JhXPMbjjnNn7ZS5bALUr7zGzAZ6UvSY0qqSO
	YbxrcTDdKzJuxVSdUmstJlM9lf8E97yERWdbltkfSBVtt+V/cuHng2gECloRJHaz6LRl/GKNLzPB2
	Ar/xqNvputKNIj3iGvX1jWOoVMAcIX21SXJDQn3lPXucZX/xy3rPC5bhHyFR323Ayi+Obbadve119
	DQihVXyYWtHUm/7AP57A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlQu-00035W-2g; Fri, 01 Mar 2019 16:54:48 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlQq-00034X-CP
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 16:54:47 +0000
Received: by mail-pg1-x542.google.com with SMTP id h8so11195091pgp.6
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2019 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=v8H6VN36oH6WU7j+Z98Gq/uFnx5u2KaHkgPBc2ET138=;
 b=I6r9OupRZemMH0yWoIO6KKAxYf1g2M9H6rIYxzDE493TA0OORw7nelbafwVUPhXM4m
 fVD4MwEgb4GOuPkKJ4WVetfD0KEQSqKOh7DB81MrH4hKom+rWxKVYI6L0iqNL+Z0tVUI
 pmf+vk8V5qFpHYhxrpXASF4weaVEsISeF0AY/NY3JLNk/DyCCFB5UcXj+gFIwEvmpp9z
 qE4f9M9vdeMyH6mh0xTm1kuJvzvufpznNYV5WUhx2rEB6ZvvAocTbTX1TT1N9moogyxW
 IUFZSDXwkGHjT26040ToE7KEzOhTD3xqUSPTyqBNEyuPUHbkRCpz+dUzSeHHAOf3yjCh
 3D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=v8H6VN36oH6WU7j+Z98Gq/uFnx5u2KaHkgPBc2ET138=;
 b=SLbJ3dFp/50AqRvS855pXVUZHkr+GK+Wt2Xc/NXJSKjs7zKK2EtfJ2o5iK8ddBMwpl
 4NPOIFRE7Px3vZ/k+D+UhOM+gV7szR3+ZptFkXBYB5dQ06hDpSQ26q9IzvFHmB1901oN
 5Zq+GEfCebImFB9B2m0THvsw1GNc/rEpZ2TwOTQycyL02I2Gh6kzAc63UvwfUWTV5Fyw
 ieoyN9xNGijlfFOQ5Yq7cg1Nq/r1sHENVzlSxmjMebP00aI9D215qHZ0ZwP06EkjOW3P
 llaL2ZJTVoHDgFAJ88Hw2H4QIRP/IPoLWsdDLHH5D9jGbiMSN9FhxvSSNeyGV6Vt7riJ
 L2mw==
X-Gm-Message-State: APjAAAXfibs/yahFIYAzCG48ygiLZ8PhfD/K+F1RezHpYHzpmIZujjoA
 YkF2qtqxXY9k92f6+MOfJqQ=
X-Google-Smtp-Source: APXvYqyCVrv6u79M3KrfhXHDimG5Wc3rxFXSj1v+2cybauUCmNrKyP1NPu86Bxe/Xx9wHvkCtzn6lA==
X-Received: by 2002:a63:cc03:: with SMTP id x3mr5678881pgf.121.1551459282838; 
 Fri, 01 Mar 2019 08:54:42 -0800 (PST)
Received: from ikegamiPC (M106072039032.v4.enabler.ne.jp. [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id m13sm47711334pff.175.2019.03.01.08.54.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 08:54:41 -0800 (PST)
From: "Tokunori Ikegami" <ikegami.t@gmail.com>
To: "'Boris Brezillon'" <boris.brezillon@collabora.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
 <016001d4cf71$865e7b60$931b7220$@gmail.com>
 <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
 <20190228164228.734ede80@collabora.com>
 <005a01d4d03e$39b0e0f0$ad12a2d0$@yahoo.co.jp>
 <20190301170715.68d89e84@collabora.com>
In-Reply-To: <20190301170715.68d89e84@collabora.com>
Subject: RE: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Date: Sat, 2 Mar 2019 01:54:16 +0900
Message-ID: <000301d4d04f$76c2aad0$64480070$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Content-Language: ja
Thread-Index: AQHOptjmAmqem5WpXlLpfOi8uScBsQIgzkq5Atg5CjYCPRAs9gF4c9/ZAQMTnbultcD/MA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_085444_725557_9AC298A0 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: 'Tokunori Ikegami' <ikegami.t@gmail.com>, keescook@chromium.org,
 bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 "'liujian \(CE\)'" <liujian56@huawei.com>, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris-san,

> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Boris Brezillon
> Sent: Saturday, March 2, 2019 1:07 AM
> To: Tokunori Ikegami
> Cc: 'Tokunori Ikegami'; keescook@chromium.org; bbrezillon@kernel.org;
> ikegami@allied-telesis.co.jp; richard@nod.at;
> linux-kernel@vger.kernel.org; marek.vasut@gmail.com;
> linux-mtd@lists.infradead.org; computersforpeace@gmail.com;
> dwmw2@infradead.org; 'liujian (CE)'; vigneshr@ti.com
> Subject: Re: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c
> do_write_buffer
> 
> Hi Ikegami,
> 
> On Fri, 1 Mar 2019 23:51:16 +0900
> "Tokunori Ikegami" <ikegami_to@yahoo.co.jp> wrote:
> 
> > > Except this version no longer does what Vignesh suggested. See how you
> > > no longer test if chip_good() is true if time_after() returns true.
> So,
> > > imagine the thread entering this function is preempted just after the
> > > first chip_good() test, and resumed a few ms later. time_after() will
> > > return true, but chip_good() might also return true, and you ignore
> it.
> >
> > I think that the following 3 versions will be worked for time_after()
> as a same result and follow the Vignesh-san suggestion.
> 
> Let me show you how they are different:
> 
> >
> > 1. Original Vignesh-san suggestion
> >
> > 	if (chip_good(map, adr, datum)) {
> > 		xip_enable(map, chip, adr);
> > 		goto op_done;
> > 	}
> 
> --> thread preempted here
> ==> chip_good() test becomes valid here
> --> thread resumed here, but timeout has expired
> 
> >
> > 	if (time_after(jiffies, timeo)) {
> 
> you enter this branch
> 
> > 		/* Test chip_good() if TRUE incorrectly again so write
> failure by time_after() can be avoided. */
> > 		if (chip_good(map, adr, datum)) {
> 
> chip_good() returns true
> 
> > 			xip_enable(map, chip, adr);
> > 			goto op_done;
> > 		}
> > 		break;
> > 	}
> >
> > 2. Liujian-san v3 patch
> >
> > 	/* Test chip_good() if FALSE correctly so write failure by
> time_after() can be avoided. */
> 
> --> thread preempted here
> ==> chip_good() test becomes valid here
> --> thread resumed here, but timeout has expired
> 
> > 	if (time_after(jiffies, timeo) && !chip_good(map, adr))
> 
> You do not enter this branch because the chip_good() test is done once
> more in case of timeout.
> 
> > 		break;
> >
> > 	if (chip_good(map, adr, datum)) {
> > 		xip_enable(map, chip, adr);
> > 		goto op_done;
> > 	}
> >
> > 3. My idea
> >
> > 	/* Save current jiffies value before chip_good() to avoid write
> failure by time_after() without testing chip_good() again. */
> > 	unsigned long now = jiffies;
> >
> > 	if (chip_good(map, adr, datum)) {
> > 		xip_enable(map, chip, adr);
> > 		goto op_done;
> > 	}
> >
> 
> --> thread preempted here
> ==> chip_good() test becomes valid here
> --> thread resumed here, but timeout has expired
> 
> > 	if (time_after(now, timeo))
> 
> You do enter this branch, and erroneously report a failure.

I do not think that it is not entered here since the value timeo is compare
with the saved value now before the chip_bood() by time_after().

> 
> > 		break;
> >
> 
> See now why your version is not correct?
> 
> Regards,
> 
> Boris
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
