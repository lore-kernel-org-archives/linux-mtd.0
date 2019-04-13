Return-Path: <SRS0=Ld/O=SP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342C3C10F14
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2019 08:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DA82084D
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2019 08:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jypW0ToU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="gTEcBrVK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DA82084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vQvMPRQvQ2kwd7AU3uY/+gz6pXbscrRX62FFfwvrtoM=; b=jypW0ToUGCs4mhJs9TIHLaubg
	PZsR7bCdvLLcgU/dlRfimhg0p94pKuZcLPxgAo/yd4V83K2gv/ZqTIBXC7bu27z/bv/XUOh0E4kbb
	wzdofLnOzfBUhbJeAGvplg7YYDJrKAz5tZiXKeut+O3W1MJnzaDXxdCP6yAR7TcY/u2w4JPfMiPrT
	B8GY+vkCTHEvE2UjdaNp/gjZGM3n1tb2R8sj7YfmJckQlJz2zAfeT7ABdQbzSuTRqge3+rChDSKJp
	26vMUQfEETWxTVL0vnvWshFPwYbKMf55GlnHXbLseIZZ/OhacRoxkJzn0Cnh4un+CNaDHEzrjYOB2
	o2EvUTAWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFEOE-00030y-CN; Sat, 13 Apr 2019 08:51:58 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFEOB-00030g-Lw
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2019 08:51:57 +0000
Received: by mail-lj1-x242.google.com with SMTP id f23so11034001ljc.0
 for <linux-mtd@lists.infradead.org>; Sat, 13 Apr 2019 01:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ve8OjLojDAr32NCY4CjJx01ZbEgIeFz3+fo38Qj3tXw=;
 b=gTEcBrVKxxTUM+I3AADq6DjewEgGBS4r7XMY4miwxSFgDSy/E0a433DL1UqXOb5cvq
 TMpegwt9mTgfGR10vecX3A6wz76i/GT1D1BI3Fi2T4eQTOj9HVM5hy7NqxlWBBERzFxf
 8Ao7hAXB9VhTWY7jH03MV2O0gjQCrvySuUxHi4alQdXKAu9gUlOYgBGKyn9gdIw4x417
 2+DssRtyukuHQflQmcxgWrdGGlKFxP9CCj0AQyR/gzHRBjuIi+bZlOgihlWacp5r0rdx
 pvW1ILO5cf5IAqldYNrrSc50GWvwAnaK/uonWiz6bPPznJ216PXt/BKjJ2za3k35/T1A
 owzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ve8OjLojDAr32NCY4CjJx01ZbEgIeFz3+fo38Qj3tXw=;
 b=s2kpj+bVwKNsMFw+K18NM1jZX/XheefANtYGw+sfB0VUMuqNlJ5eWQp3qZ5JEv3ZR7
 6mcV0Du/TxcS30FKi3SCo9wZ7uG9HXc4Hc7s7powGZ9JpMVTaAj41tLOiw288zf380ZL
 m+UcEIHlX/kKgTxcKZOIltTgph/Ne4UNJ1KBBDFyAsB9HsWFIPoaqIS6RM+2tXYX/qEN
 PKX+Gh9ZlZZ+OICn0qBnd1Xn9lMBCCIDeTHGYI6Xm/S8VqZhGWtcWdT9J2jQKbZ1ZWoN
 bXgaDllpATTrBYjP0P7D9iDT0wR8ICMSNqW+etGdLXdTPSoLLMYG37N/Q9i01NlrfhL0
 1emA==
X-Gm-Message-State: APjAAAVhrUOZPSeXR+ZUK6q7USRzSsVewwPiHMTZbONIMwwdbxTYJD8k
 oICmPry6B2meQh3YNIy2px/fDQ==
X-Google-Smtp-Source: APXvYqyb7er5dlqDQWzKVsqeL+ViwYHI2ySdsps5mJ6INdI9fbnG5vtbtW/fHuIa4m6Pquaeq97J9A==
X-Received: by 2002:a2e:8149:: with SMTP id t9mr34958188ljg.2.1555145513115;
 Sat, 13 Apr 2019 01:51:53 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.85.47])
 by smtp.gmail.com with ESMTPSA id b25sm8632670lje.71.2019.04.13.01.51.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 01:51:52 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: nandsim: Embed struct nand_chip in struct nandsim
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <20190413084052.15416-1-richard@nod.at>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <60d400af-245d-9eb4-c57b-ae5683c98da4@cogentembedded.com>
Date: Sat, 13 Apr 2019 11:51:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190413084052.15416-1-richard@nod.at>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_015155_785531_300DE12F 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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
Cc: bbrezillon@kernel.org, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 13.04.2019 11:40, Richard Weinberger wrote:

> We well need struct nand_controller soon, so more stuff need to

    We will, maybe?

> be parts of struct nandsim.
> While we are here, rename "nand" to "ns" to use the same naming scheme
> everywhere in nandsim.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
