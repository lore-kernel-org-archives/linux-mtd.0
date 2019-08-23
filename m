Return-Path: <SRS0=tnEL=WT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5778C3A5A2
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 13:56:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936DD21848
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 13:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aS/Xy+UA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1kpl17y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936DD21848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jDD+x+QnGq1xAz8fUuIdei3VD5EG7Cb83pCjgsR50w=; b=aS/Xy+UAfDgo6q
	PjWbOhbhS5JXztcWHomK9ZjzYD8BaxuLpBd19u3CX6lwwekfKMY17628iy2boclDApJP8jFML7Tsc
	LppbwbHC5OJwr/A72enMNxLlbYGmk/7y4C8dqWvrDZ7rHgt5+R4DL1eHkplu5tWQ6WSxoD/Kkb6Us
	Gdw9oo1Zp6zNLqiuWcqoqbSor9+UgzxfONMXGAivtmF4zxMpqoXWv2wdLlwuRtIA1Wkp0gfe6Rldu
	r9AOIci0OP+OoQpxqyuYB48NKJvd0vFhNVraXdnrN1FWYalmkuFpSc0ZgchGTXNVDMBWvt43ZKBS8
	T8unlgofZIYYgDbp+TLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1A2k-0002uo-JE; Fri, 23 Aug 2019 13:55:54 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1A2Y-0002hq-Lg; Fri, 23 Aug 2019 13:55:43 +0000
Received: by mail-pf1-x442.google.com with SMTP id s11so584736pfe.6;
 Fri, 23 Aug 2019 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BUAiw1OCmJxcFhDfFwk6vJ4atOusYa0enlexPK5RdcM=;
 b=p1kpl17yQ70OZJjj0Ex1dhmfo2/01ZSY1fOdxj+J/0LKK1tvqbyWGApNp+RopSCBU9
 F4JDgPHlcLiS1iW8iLa6+Oz3hvJ93YLeeZOw8VI/PWR7yXZkQ2Y3BWj/9xw0zvYm8PgM
 xCORxywfStYr2iObddDIvw4uxyyFDzJ4nH8mOJxihZGgGGvOFtqX5rLKfVLumbHnUiDf
 cp+XG0kMNbLUq5HT5W+hUh/PxuwaBDz2hVRJ6ISjeckQ/denHk7F5JHtEBhHBSkgw5OY
 5pVQ0XdibEupNYaM8DhPTT4HkPLbYUHv2fszhaDZIjemQ/II2oo6OpoSBdKla1hplbzS
 Zchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BUAiw1OCmJxcFhDfFwk6vJ4atOusYa0enlexPK5RdcM=;
 b=ambJUDA6H77O2JRF1Xn0g4+hPaNFUVUrw6JSj2ov3BS7apT/4fYq3UmVfPKG8CuOwt
 M/VB5THFbE327DzQpzGNx4E8O2gw58/tvksIcY0h57W8avWm9JA59baENG6fR6N35F/C
 qzxtUizK4jC/l2g1xgTwNyatzBTDLnCv51mglMzwp6pOjyLGdlFaLWxcyV4mK78rbbqc
 A2PqPEZjsK8WMScP/ZkTPoWnG5gX8Hj6HyTw3RBe+xF9v/grZA3zJTZOUQVN20ANaEpC
 aDzfHtzCPCkiA9lHS7gofjyUdSplmA3osIAWzbo+Ml/u58EhRCu1yvlsWhLukfwB5KcK
 Ikdg==
X-Gm-Message-State: APjAAAVVn1vpPC/+INnH8YJMHNupDcG0SBAUCdb6QdfY8arfiUgTkYNM
 yBEQDMAJnN1di079NMoxqw4=
X-Google-Smtp-Source: APXvYqzeZA+QEa5Xq4+pVCPW2H7vItZxat4J0/SQ1XBxiBF3Po4TqLpUuSgHOh67wlOMVyJ/4CHLaQ==
X-Received: by 2002:a17:90a:aa90:: with SMTP id
 l16mr5454982pjq.73.1566568541762; 
 Fri, 23 Aug 2019 06:55:41 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 z13sm2477619pjn.32.2019.08.23.06.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 06:55:41 -0700 (PDT)
Date: Fri, 23 Aug 2019 22:55:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/26] openrisc: map as uncached in ioremap
Message-ID: <20190823135539.GC24874@lianli.shorne-pla.net>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190817073253.27819-6-hch@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_065542_713914_56EAAD7F 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Aug 17, 2019 at 09:32:32AM +0200, Christoph Hellwig wrote:
> Openrisc is the only architecture not mapping ioremap as uncached,
> which has been the default since the Linux 2.6.x days.  Switch it
> over to implement uncached semantics by default.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/openrisc/include/asm/io.h      | 20 +++-----------------
>  arch/openrisc/include/asm/pgtable.h |  2 +-
>  arch/openrisc/mm/ioremap.c          |  8 ++++----
>  3 files changed, 8 insertions(+), 22 deletions(-)

Acked-by: Stafford Horne <shorne@gmail.com>

Thanks,
 -Stafford 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
