Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88106CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoThOHJLa3XteOrvsGuGNd0uG/EcWQV4QvhCCcXT8Ic=; b=IcdLmaTHVFpx7J
	QyPCDv4zHOaur3FQUckyW6cKr79uHrQVle7Sc1hUo3jJsGn/1x6+IMGEFgq3tE61xH1hwLytZXw+v
	i3/cMyk44PQ906buo7/0inxZnkWPlUNP6UQbbv3RWsTF/RBlo6R77iMY/zLJnH5YJ9+nrg6TMtgQR
	Uz3njreTcUIMDeKQGaMgNdbUcHD/IFKXM99Cuu2jrBWdJqh5p520qOT8SWAAIfhljnrAFrkpnLuEq
	lfVWYKCcT6RB+qkY69ufS9KeXMcsYb3D7WFX/5WyetF/TakaIDzlm12MvbZOm8ZE0Gy+hXizRVLdK
	au1szjep2bWMND1J7fLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJxC-000000001a4-1avf;
	Thu, 15 Oct 2026 11:48:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJx8-000000001ZN-35vF
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 11:48:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9783F1A1236;
	Thu, 15 Oct 2026 11:48:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6320F60360;
	Thu, 15 Oct 2026 11:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0176010328140;
	Thu, 15 Oct 2026 13:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792064925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=smGVRYkYdnmDVo/2i+sOKFmQ+byIW1pUk9kwI9T/rNQ=;
	b=k0XwEo0rKEQVFkouD9BBa1Ld3P6phThadWYWsf37KLa7pe3s0ZuSmb+IDyF8hwn88V2kts
	snsywukWi//JOG791J2T2qWzHT2RAk2BspZntBtqo/Dg5erx43l7zCcHoeI75JcCvJb9el
	DOm0b5UdtEEUXNIgnsLfc02RjY/1eQeNm8YQNX2c1q59HH+CJomqNqlYLgzdFNmmWhCYA9
	ZfiCN1eSy+QKIMeaWQB6YrhRIfCU+dXoi+Sk642By6dJTt8M5fjVnwR1qNlhnj3dW+mY1h
	T98rL1f3hcJ4mWAHlL4qWIqf0q31Yn9Tk4rJRgVHfQewDjn4USsJCPd/KdIczA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Arnd Bergmann <arnd@arndb.de>,
  David Laight <david.laight.linux@gmail.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: sfdp: reduce stack usage in
 spi_nor_parse_sfdp()
In-Reply-To: <20261015113209.975641-1-mwalle@kernel.org> (Michael Walle's
	message of "Thu, 15 Oct 2026 13:31:52 +0200")
References: <20261015113209.975641-1-mwalle@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 13:48:42 +0200
Message-ID: <87tsmnuqud.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_044854_935802_5CC40240 
X-CRM114-Status: GOOD (  10.92  )
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

On 15/10/2026 at 13:31:52 +02, Michael Walle <mwalle@kernel.org> wrote:

> Two large spi_nor_flash_parameter structures on a function stack
> are really too much, and this can exceed an otherwise reasonable
> frame limit:
>
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>
> Allocate both rollback copies on the heap and use structure copies
> for type safety.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> v2:
>  - don't use the cleanup helpers to not mix them with gotos as
>    suggested by Miquel. I didn't carry your Rb over because there
>    is quite a bit more code change.

Would have been fine.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
