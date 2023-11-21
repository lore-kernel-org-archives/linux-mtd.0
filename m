Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E6CC5ACB3
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qE11RtLyl4G37NO9Fi/TCc5nIHS6CleyR4x1TP5jsuc=; b=G2NFSRV2V3eAIs
	cFrU7Ag5/a97NEBJK0PKFQ/lYEO2QVayMXoRGZF0pAmiLk0wW2qt9EAvsgeeqDKfBC7CvhSLq+ha/
	gNOMxB8iN6Ww2bxxxAcNF1prqa6z+uLrYBvEvNFmOzdjf5kkCCh1O/vEFgUheI52K2jyoH5kenmDj
	i69XbVY1z+lKQcHQPnsUETk9liWiQJybYedJMFA1oQMimLp0pL1QTaqh30sPplEsGSfBKnDgch5z7
	IdmFDt/HzRqsUvcHtYnU9hg8Xyk+Jtn9hlyz6fIRUPOm9FKM/g4losQ/zqvnzTXWIB9zsGfZqEqR4
	7BjCyNC+pCoe2qjpvBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MBh-00G0qJ-1w;
	Tue, 21 Nov 2023 08:32:53 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MBf-00G0pc-0F
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 08:32:52 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6be0277c05bso4685383b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 21 Nov 2023 00:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700555569; x=1701160369; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IXIZWGe6AFShwi9G6Cj0vi7e8Bo5zKzheSnjNNJBuhU=;
        b=DU3czVspjIM2MF7YWlOYNuvanM35+Qyj9Amt+AZDjfbVfb9mS7vnJ/1Zf2RRFGeOb7
         bdeNoHnmXwFz+j84sAzKzeynuoo3wMdHk0j6Te8m451ccfXSfmAehaU6QLWMJ19A4GHc
         G23SG4PuYk/rN8RTWcjvdgewO0LCvkxPpIR4O79uu4nRNMCrTsbIV5CMxXc80kO90FXm
         7TDSLt4MotQRrWx/gXk3fGK05+R6KGCgvaz3dsTcFjjUb5aQJGxbcebiOvTgNMtztqgn
         QwZB4oq1dPi5/6NjBxqo6OCdI6joxpaS/IlnOcbg+dGDpJ1k6B0WoFCv8S/KIAFRVktM
         W0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700555569; x=1701160369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXIZWGe6AFShwi9G6Cj0vi7e8Bo5zKzheSnjNNJBuhU=;
        b=nYD09D7EfC0bYv8TuqVXR+LheCEhKc7neb4JAvuCJ0CManYA4hKPNFspnBFL0xMs/7
         rF8wz2ae9fMMKieuVQyi7hUYWU+1VUPqJqp8DRdRhQYBqLVTF9AEmWqIz0tTbnBdbZFu
         NXbS0HrasvLo2cof+MDBzjgLFSdLbJ4AOmxC/Engsfp1WvbYPT0ZqJgXfA31LTdtJuFU
         CFc+3mVA07MgavX/rRDW3/XMm0wg9FNZl07Xc6uOUp+U+s6lYJ4Zk8jwxlb82f/o7KrW
         nBu8KeOs8DxVxg0B0xwJOwhcO7EjqPRtNUNUbeIgb6Ivl1vBN5o+Jg9UJXHazu4eQnwr
         vnMQ==
X-Gm-Message-State: AOJu0YyWvuZxXdxTprMHw7XeLjbHPQs9Ii6z/0yqj9QZhV6iH5/cIlaN
	UGlL5fjHeKr3EYGD0TrCSOM8hXANUNxkrd1LCCg=
X-Google-Smtp-Source: AGHT+IF5c23/KTDR2NtmZVAHacbTru2C4e7xj4PITYqx84ZgCbikvnPWz1X7RV2oAqZGFldZSvi/xleycK8EM4UvaMM=
X-Received: by 2002:a05:6a20:4427:b0:188:290d:17dc with SMTP id
 ce39-20020a056a20442700b00188290d17dcmr10269264pzb.60.1700555568816; Tue, 21
 Nov 2023 00:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <bdcaa357da0d1d3861831761b428dee9@walle.cc> <CAAQoYRkMjq6R+6ZpyW0upDz0ScBQQd00gCx=BcS-_K9nypnUCQ@mail.gmail.com>
 <1e36423d84074b8056985a08737a7768@walle.cc> <CAAQoYRnRxFjBq7afwHOWi_EbCjdrpLPL6dR2WMs-HC2TdsByAQ@mail.gmail.com>
 <5ec9ea53184695ed43716eec97d76e37@walle.cc>
In-Reply-To: <5ec9ea53184695ed43716eec97d76e37@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 21 Nov 2023 16:32:36 +0800
Message-ID: <CAAQoYRk0gewQTBKVCtUwe4cYD70fzGNCTB1zT+AewyOwUQHJEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add octal DTR support for Macronix flash
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_003251_113712_1FBFC1BF 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Hi Michael


>
> Hi,
>
> > Do you mean that I need to patch dtr_swab16 support for spi-mxic.c as
> > well?
>
> Yes. Otherwise, this code wouldn't be used at all.
Got it.
Thanks for your reply.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
