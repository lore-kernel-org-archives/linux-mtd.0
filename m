Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0788AC001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kawEP18b5hNRBFadxcGFiF278hogLmOdHud67647Yuw=; b=2+7z780Cug5onm
	1Dt3tsUG7N59fph5JT4mMuN7OfGLXVw/yW+Ws+4mMA11qd5AwQR3IJ8B3sB9HtPSmNYa5jHQjmcC+
	wEQf8NXQqjyXh1ccUd3LUsTOV7gEI94i/5VLxFxfk8e7urbuTWsV2EAyuVZjCFyop/CBUN0gPTHY2
	pS46kH291ffBmPXemNVWxcUodiWXvot6t2sH10wNxLTcpVxwnRdMyoFv639xZXrmUy9UfEgfDC5xo
	J8NndDhfnG2NQPMXDaB2MRlDDVbC4+8mEQbNnIOYzgVTFWWwVFJdp55d/gNrV+hLMW4p9YXdzl5Vw
	mofbjawGyEngnCdBFshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8c-0089XQ-1S;
	Wed, 19 Jul 2023 16:34:54 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8Y-0089Un-2P
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 16:34:53 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6b9af1826b6so5412476a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nanometrics.ca; s=google; t=1689784487; x=1692376487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OHZmtj0tjbGb5GlrzhI193C4phlH86gSe8UN3gPcG9w=;
        b=lR/VDWZek6Y4RFdfC3fACZY8gsp3errzTWyKc7KrhlKryVOXVOuGJRAy+ZJBgR/17D
         D+8vCFSzhSXyQHoEeoeCVskWlVkxyt7wL5sQVg3pRAnP6MY36Hj1oM+n7uNH0McDiwdl
         sBuBLzkUgoRwppxwd9DPUb61x47PQ4Exixf9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784487; x=1692376487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHZmtj0tjbGb5GlrzhI193C4phlH86gSe8UN3gPcG9w=;
        b=GnAb1zfX5JsGrK63Rrhmzqsc3Mhenqgvk8xDvJX2lkEcLS9WYUR4q+6l+F4CyKfQ6V
         BbHIXG0Q6HaYezHRELP3hMUJXdtxBVTrZE4bfBrrei94NPGABY/027qQAmZgwlK7DXVz
         zAISr8zeHOU3Z0nByNC1V1uLcr2TA/pb4PQpgZ707s/0wf2DKadbKd/iA6s8a0S7ZmFI
         DmMkA1q3lns20HyZUSySaNQUFW0JD0NaJQ9v2I6dMYyqwGqtdPwOs8rT47UgDuIW3CCE
         e6wdbWfqiJspzEjKzp6NLPpyw9qiXZScg8PKTVAVqnpAz+pVWf2/o1f8iP/GlxLuc6hE
         th9g==
X-Gm-Message-State: ABy/qLZN9dN2hYbgBeFBejmWavOYgrW1IDSz1Mgd9N3B29gQkHkL/TO2
	/eOGPLRqLXg6clm43kiQmdVnpa4y6m22+AgiIcBZQCdImPrKH8DAUeURQiB91ToKqtlwQ7Y3Zqp
	C4VNiUrit/03d3RQmfhEU8XMhCszkvSOB1a6eCOcvVvPM/CM=
X-Google-Smtp-Source: APBJJlF7XWddjAPyBxeIn9qwW6cptUCLgt7vmTPskjnMqQPDlr0EimygVcMHlTL1h6iGrSXhX4Yiy6il/uPX3O97pwU=
X-Received: by 2002:a05:6870:a707:b0:1b7:15ac:ab9c with SMTP id
 g7-20020a056870a70700b001b715acab9cmr3063215oam.36.1689784486954; Wed, 19 Jul
 2023 09:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_O4Js97E_MEK=jrFxUqd4yFOUk4wJg89-LhtDruA67=9_r1A@mail.gmail.com>
 <CAF_O4JuesBTVT806SfMirk2tFG28T7kt5HWSjx9LPEbC9K5zBg@mail.gmail.com>
 <CAF_O4JvYE8HPQDEmhesndwBsOTk134netTTSYNE-dc0o0ik59A@mail.gmail.com> <20230718100237.69545cde@xps-13>
In-Reply-To: <20230718100237.69545cde@xps-13>
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
Date: Wed, 19 Jul 2023 12:34:36 -0400
Message-ID: <CAF_O4Jt3MfYBwd0qF8vv1eHzApEZQOcGhthLCV4suetxYqVacA@mail.gmail.com>
Subject: Re: Question about Davinci NAND using 4 bit ECC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_093451_763971_B9B16BA1 
X-CRM114-Status: GOOD (  20.26  )
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

On Tue, 18 Jul 2023 at 04:02, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

Thanks Miquel for the quick response

And apologies for sending you the question 3 times.  My first attempt included
an HTML copy which was rejected by the mailing list, and it took me an extra
attempt to force my email client to use plain text.  And the third email is
still awaiting approval by the mailing list moderator, I suspect due to how I
forwarded and reformatted the original email back to the mailing list.

> It is hard to tell whether these changes are legitimate or not without
> properly testing. If you benchmark your changes and never see any
> error, it does not mean you fall into the pits during your tests.

OK, I was hoping to avoid my own testing because as you write, no errors
doesn't mean it's better.  And I was overly optimistic in hoping for an
explanation as to why this driver mostly written by TI 15 years ago doesn't
match their documented procedure.

> Observing bitflips in userspace and detecting them can be achieved
> easily with the nandbiterrs -i tool from the mtd-utils test suite.

Thanks for this tip, I'll look into extending the Yocto mtd-utils recipe [1]
to install it.  I see the kernel also has a nandbiterrs mtd test driver[2].
Can it be used? Is there any documentation on how to use this kernel test?

[1] https://git.yoctoproject.org/poky/plain/meta/recipes-devtools/mtd/mtd-utils_git.bb
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/mtd/tests/nandbiterrs.c

--
Chris

-- 
This message is intended exclusively for the individual or entity to which 
it is addressed. This communication may contain information that is 
proprietary, privileged, confidential or otherwise legally exempt from 
disclosure. If you are not the named addressee, or have been inadvertently 
and erroneously referenced in the address line, you are not authorized to 
read, print, retain, copy or disseminate this message or any part of it. If 
you have received this message in error, please notify the sender 
immediately by e-mail and delete all copies of the message.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
