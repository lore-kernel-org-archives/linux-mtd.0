Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29127C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5aEbYzRaIT/G9Budjphy3zbl/ctP1w+qYxqJtj0eNoI=; b=OyS
	vebDJVPJVazDW/zrVibm8s62dMhFELzGeO1iu+Fi81mpcvZl9KpP/riGLH5yweazSTasze2glzYRP
	ssvFBXnqNsypcO3eDsxeAUfE6zqXLd0IzZlMP+e562UNtrdJvvO5O9VtH5rmI7vt0y8v2Ll1uu4i5
	+V/aB5AK1kzB2wRO5UOnrzpagByWCNpbbZJYRy35fJYjDKj6DBZ3/6vxg6LL92CsPf2tPzeKiV0Xm
	zZ9WIa1PlRxZ06GSY8PtloD5M9LyXRwPqCqfzJutJ7a8aNaxsAs1lp4/FuPZ47Jpr203A03v7ro7B
	z9vR7KmXwS6XknMbESOGOo8uncrF6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1U9M-00Eyj0-3R; Wed, 15 Jun 2022 14:37:40 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1U9K-00Eyia-AW
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 14:37:39 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31756c8143aso14854247b3.12
        for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2022 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=1L875HB2891PfPTiRfpgrWU9o4RsmbqFGyMf6TOpDh0=;
        b=h0L8hDbAx91p6ZQXR4l3DL1A8baHYfLLtxoVXYfATxbBT2ijyC87JaNnnLcmlm8UME
         NVLljotF5JTx1PHOJ8nSxBRr+gEESpMdpMrRwlRrgvqr3K691BBjTUVE+PqrvBYSfsJ0
         gd+3YJD+DuDeMOJ618KhaHlhH38m9CmbctHixAaWx3eG2k3Nf48XwdqumNuNvv4CuUDd
         N4F0KTruNcVUgFS/0BgkJlkMdZw1JlaC/ZmUJbkaTBCr/tWVXbmrVIjiCoWnDoJO4oVv
         +wvGsLMCy/UJFGt7fmOxffUMgCvekpcBdQpaRS49LC1xFZU+3jJKA/dUqFeJAerWOXmK
         tjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1L875HB2891PfPTiRfpgrWU9o4RsmbqFGyMf6TOpDh0=;
        b=fNLf+xZavyyq7TEIBj6U3BODN4B9BnlMY3L05zGH1D5VwRU3ojL0csaMXnXS0plPpn
         epdG31td36vfFqgnKwpgy1TQNvOSKNGXYjh3fTubeX7nV3SBKPOxtMSYfL/I74tjpPP9
         Xc2HVeu9cG3PK+/E6+Ux7yhHj8QTp7zTjAMNsdNmLGZ6KFGzN1Tz95KuyePYtZIrxM34
         Z7HuUYOI+91E1oSXIhnOzVeoOmx2l2Q0U8svfmpmplQiiKqJ/lckJ1ANGQtoCRhNYR+Z
         ES9hphjcwJojrT5XHoidXfK1x69lD29Abh0Fi3d/qbkYJ4FgzJk3pmOE9aPY1LeAPD5T
         jeEQ==
X-Gm-Message-State: AJIora9rlrllGdfixRv1wDntOfgwze4OaFMK65PWj6atl4Ui2i83F9OS
	B15UvnnKBA/GPeDkakXsioq/QXPw6tGCML32ez3xwiaA
X-Google-Smtp-Source: AGRyM1uIXkL5lRVUyhlpHHnpEgPCEPJ56jkDqNPJIXnMunrzVmL/NNIkHJDyaSiB9eqa1yszcjyP4hOIlig1c8cvodk=
X-Received: by 2002:a0d:e601:0:b0:313:ffa6:2f6e with SMTP id
 p1-20020a0de601000000b00313ffa62f6emr11892803ywe.420.1655303856637; Wed, 15
 Jun 2022 07:37:36 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 15 Jun 2022 20:07:25 +0530
Message-ID: <CAOuPNLgroO6GsVwmbUhegrWJqp=a==LxNB11CvYeCrv5=3MXSA@mail.gmail.com>
Subject: Reserving a dedicated space inside UBI volume
To: linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, dwmw2@infradead.org, 
	computersforpeace@gmail.com, boris.brezillon@free-electrons.com, 
	marek.vasut@gmail.com, Richard Weinberger <richard@nod.at>, cyrille.pitchen@wedev4u.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_073738_396883_72FFE013 
X-CRM114-Status: UNSURE (   6.87  )
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

Hi,

We have a requirement where we need to reserve a space (say 100MB,
just like RAM) for a specific folder inside a UBI partition/volume.
This space will be used for a specific purpose only and  not
accessible by others.
Something like the reserved area for bad block management.

Is there a way to achieve this from the user space application at runtime ?

One option is to create a dedicated volume and operate, but we are
looking for a reserve-folder within the existing ubi volume itself (if
possible).

Regards,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
