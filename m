Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9EFC433E6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 05:24:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593B1208DB
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 05:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1DYMy+/C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcQFEIkz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 593B1208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NlHPN11bFAtq2kUmhdhUOmt0pp08BpIKGDbnf8spIv8=; b=1DYMy+/CFsMAlVbDAdZbFbiV6
	76pskj0M7qJHYvOAokYaAtKl3WMwmd/tugV5LklHXFSIzlMmtD3Rn01Nbj29aQf2vEmEVjoH7yKCf
	bvF5rOa32gXF54UxoIafn5EMCQtuKtYByVZgrTxsUF7zkM6boNIDvy9m1TAOZhCcssKVs0XSQsqy4
	CkuU4LJ/MknlWds6A2WWp/pzZHPEIydcZIgqDAyZVOq6hiUoKUPsLhWGkhZSeWsHwKpzN7l4d9HA2
	SM4HcYp9t8DqwxAeGgf5ZqCWKB40+/MsPpSm7y17cuIaGAa3oFrqO1kkDRtoUQyFMd8N4wo6fSRku
	/6o0Qgpxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCym0-0006fN-CH; Tue, 01 Sep 2020 05:24:00 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCyly-0006ef-Cg
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2020 05:23:59 +0000
Received: by mail-il1-x142.google.com with SMTP id c6so107394ilo.13
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2020 22:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6aVV4g/1sX3xm/XLCYvNmecf872NELYSZqCT91C2zMA=;
 b=RcQFEIkzAfrW+KwVU85osr00XBjcJiFBRY8Zbv8I9mZR0J2l+jTh/vcKAls1DEzSbw
 RUkYYoRLbbwg0z/Ooy31rUqSaks0ZJLT63n8ZhHigWSXtudVZtPlgXsqq3Gp8I7tyfTU
 JTTILBQ8ujiU//Z6Fa2iV+jkY0fw5s20GWsGiDwRRVNSliwz1TXjTiqn0NMSPTjr2HOd
 CAFb/8xVuQvkYuq2ZAJghvSrdUBVb8Cz8t5W8dWKXqEhzyB9IA7vyrTCaS6MyZKcsAAb
 btNUJJtoMWcLnYSI/V4mvyGM8JR9ktXIoBDmqyfW8W4fPrDtT066N2nEpNhnlFCxjY50
 pV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6aVV4g/1sX3xm/XLCYvNmecf872NELYSZqCT91C2zMA=;
 b=cDjWbZhGoyjNEi5USKyWsZih4WL5sHdEPobz90yeoRnVOVZMwyqIm8LE0hiyncdFhH
 bj2w91rbIKg6ugc/9zKj7G9nFjYiBBwukBQ21609s0mFsamX4JmlrKQcAFQVSXVwN4tg
 LoE5ZHsYaFVFeFwI0hSvYfNd+IAYgDDxJmq56Xe0BGKv/vJXwUbg83QxvfZY9CnofjcP
 0P6wWkDC+alXiqTca3gYSx7N2NgqVNVA1sEcBXJP6MYT9q6MJhADFlXKiavLlIb+tjob
 tJ8GOjQnltkZpzboB1jDzfmLuKu3hizrlRjqN+/8hVzM4MvcZKCXh0iIXE93Ye3g/qzn
 fdXQ==
X-Gm-Message-State: AOAM531Pjc+f2Cqri84Lz+/Kk6crqftO0eQdOIeAkyIKNkOk+Wt7ePRn
 qa95CzxpO5wJ8++mZbp5XZvYmDo4KErCFSYQuUE=
X-Google-Smtp-Source: ABdhPJw5CiM18TTvB7fbJcngFNgp2xkvak5U2SEO81YvqN9XPwqgRXQeu+eU2WM4Fh1Cv+uU9m4cMWXJmQQj2AEZ/CA=
X-Received: by 2002:a92:dd01:: with SMTP id n1mr4276052ilm.243.1598937836685; 
 Mon, 31 Aug 2020 22:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200820165121.3192-1-hauke@hauke-m.de>
 <20200820165121.3192-3-hauke@hauke-m.de>
In-Reply-To: <20200820165121.3192-3-hauke@hauke-m.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 1 Sep 2020 13:23:45 +0800
Message-ID: <CAJsYDV+sLT0oBGNe1=MuiVZ4TeY82FEpzHmwE3Eoo8CN+Bh14g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: spinand: gigadevice: Add QE Bit
To: Hauke Mehrtens <hauke@hauke-m.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_012358_445477_CA7F6385 
X-CRM114-Status: GOOD (  10.49  )
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
 Vignesh Raghavendra <vigneshr@ti.com>, wigyori@uid0.hu,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 21, 2020 at 12:53 AM Hauke Mehrtens <hauke@hauke-m.de> wrote:
>
> The following GigaDevice chips have the QE BIT in the feature flags, I
> checked the datasheets, but did not try this.
> * GD5F1GQ4xExxG
> * GD5F1GQ4xFxxG
> * GD5F1GQ4UAYIG
> * GD5F4GQ4UAYIG
>
> The Quad operations like 0xEB mention that the QE bit has to be set.
>
> Fixes: c93c613214ac ("mtd: spinand: add support for GigaDevice GD5FxGQ4xA")
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Tested-by: Chuanhong Guo <gch981213@gmail.com>

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
