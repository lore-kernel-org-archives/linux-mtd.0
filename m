Return-Path: <SRS0=lLyx=23=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EA3C32767
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 06:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C51220848
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 06:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U638CxkW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJpHhyL6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C51220848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:Subject:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxO+jArdGDiY5xypm6kmVuhiImUVS5QT3CH+XSzH5Qo=; b=U638CxkWQuYQOi
	pvRhEZrez2V8+uW814NsNI5sWEGb9nLGM0EAI6UKAU4sYc3cXNjfJbD4F5Rtl/I3Y+HdoovN+vqix
	LJXn1dQiw0YgHLAZKjbjnlW7KIE8VAg5wv9kfASwKG+4+mf2M7n8GKjeVZCPtVoZVXQ2OhiLAuFfn
	M/vZUHyuGk+cI0judajAht+NovuExLJnu0ya2SaHY6wwELemsWtApa8YKDYSrS5M+5jKOiIF4fZmZ
	G4kH2rt2sTZTF5cn17AVGH2kqepVoCVOvwYbzCtDFyAfMzyF16AexYIRVIsR2BXUVUOT1CU5OW9DC
	AZZWfu8b3n76vLuS1i5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioLTa-0005bQ-VL; Mon, 06 Jan 2020 06:02:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioLTS-0005TX-Vb; Mon, 06 Jan 2020 06:02:48 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49A5720848;
 Mon,  6 Jan 2020 06:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578290566;
 bh=5hxva25df32tAsqNh8cqFx9odnLgu5hRKNw8HZPCLjk=;
 h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
 b=eJpHhyL6Zn+jn0TWh26dV/uWPfkkWmsibBqQhvb21LVcA6A7krW1p2EYvzXNOKOcK
 ZHOPLcOkOfPCnDSxRNQ3b9pxbUrX2wYkH4wWSFdwiASwgMB9KVTYbGmcU+0aeg6ay6
 vV9ndySbUZQE22ipz4z55cTxtK2FyQVvBOuHX2Vk=
MIME-Version: 1.0
In-Reply-To: <20200106045833.1725-1-masahiroy@kernel.org>
References: <20200106045833.1725-1-masahiroy@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] treewide: remove redundent IS_ERR() before error code
 check
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Sun, 05 Jan 2020 22:02:45 -0800
Message-Id: <20200106060246.49A5720848@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_220247_037936_2102F9BD 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@lip6.fr>, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Quoting Masahiro Yamada (2020-01-05 20:58:33)
> 'PTR_ERR(p) == -E*' is a stronger condition than IS_ERR(p).
> Hence, IS_ERR(p) is unneeded.
> 
> The semantic patch that generates this commit is as follows:
> 
> // <smpl>
> @@
> expression ptr;
> constant error_code;
> @@
> -IS_ERR(ptr) && (PTR_ERR(ptr) == - error_code)
> +PTR_ERR(ptr) == - error_code
> // </smpl>
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

For

>  drivers/clk/clk.c                    | 2 +-

Acked-by: Stephen Boyd <sboyd@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
