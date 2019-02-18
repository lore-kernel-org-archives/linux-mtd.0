Return-Path: <SRS0=0vqE=QZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF7BC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 21:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC282084D
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 21:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvicOC25";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wahKuM5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC282084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me5QaFjTirQYbADxvKZPRjBTHzd+pKKhuuP2kFuM0bk=; b=VvicOC25MMOfup
	WFZ1/h4QvSewXX9HMmLxp3QHiTN31OjEBhrCdAF6rAiQzV/x/XXSlVf/I/aC68r0s2STeHRb+M889
	0kXmmb2CI79u3EA5F+z+ZMD3xRfNvHnQ9INokEvMtYfaPLw1ZMUI6ODWh/ivxMt9Bi1uk9BslPV9I
	AuV+aPBxZu88C9N5UURVAmOWfm8vpmrfRf8Cq7Pxwf5a2Vj+SHMUrxgoxOV+mCkVEw4s5Ht09abrx
	TqWbLakPqioWu5aUCGQTQnWF6259laDP4GxbnqTIoj4fS9d8A1Jsc0vZKc5bbRZEwMHUWTVDr5j3J
	PGSvdgiL8J3mEnm0SJYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvqTs-0000m6-38; Mon, 18 Feb 2019 21:29:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvqTq-0000lk-5h
 for linux-mtd@lists.infradead.org; Mon, 18 Feb 2019 21:29:39 +0000
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCE162084D
 for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2019 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550525377;
 bh=WfzLWur9OzOOSf7c8O3E6vkypMiWKMi33PHPciH6Udo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wahKuM5JbiGexuBAlZozULZ7mKm+xLMSEaG/3qmPr4scWKwCkI6AsLx9d1cqtQJ/N
 UYVH4kIWNe3RdqyI+BfipDLVLnTe7w3YICF8HPROchl/YzH1le8OWnjASWhFLuNGxM
 EF9TE7+GhKCcKwkvlGa9DNJo4AtnRKGekW91oA2o=
Received: by mail-qt1-f182.google.com with SMTP id z39so20920310qtz.0
 for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2019 13:29:37 -0800 (PST)
X-Gm-Message-State: AHQUAuaBIbaKu+H/09HMKiU0R13COD0zSYn5Lbh9pHqcW5R+B5ApjxnD
 etO4LuVDAB9DssriFRuD7qxU4ou0USZDEoW+sg==
X-Google-Smtp-Source: AHgI3IaN+/8H99NJcz9E4hSvfn7kjQEAFT3XwSLf0Y0m6j2LgXHL6E2AHBPEGQV+4NwnO5RPM1lKnUeCotIzmznGyGg=
X-Received: by 2002:aed:2a2f:: with SMTP id c44mr20174399qtd.144.1550525377019; 
 Mon, 18 Feb 2019 13:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20190201100421.27504-1-linus.walleij@linaro.org>
In-Reply-To: <20190201100421.27504-1-linus.walleij@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Feb 2019 15:29:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+tXtTftYKqp1YG=wU1JTtsXkh+Zjq6QwHuYg2=ahgKTw@mail.gmail.com>
Message-ID: <CAL_Jsq+tXtTftYKqp1YG=wU1JTtsXkh+Zjq6QwHuYg2=ahgKTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: add DT bindings for the Intel IXP4xx Flash
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_132938_228159_F4F736B9 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: devicetree@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 1, 2019 at 4:04 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Intel IXP4xx
> flash controller, a simple physmap which however need a
> specific big-endian or mixed-endian access pattern to the
> memory.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/mtd/intel,ixp4xx-flash.txt       | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
