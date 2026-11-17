Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E910606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KDOj71Ha;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i6NcTrGo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kljc4Wiy0TNr/ObfsE2PREeuDvYoKkvnssU/X1/f3pk=; b=KDOj71HaTsfv7926wx//gWeNsY
	AYqFoXkVq+Y4sjVrIGeT2NKuXh/MHfUiFDfOAjLdSKrnmm4/AlH4TPrY6a8OSMkgO4xw+aMPRlLou
	xHaXUR4LSOXaHsVcVLxdva0TTeFRsS5WGV9nkntAYphNPEk8cASeTNMXzSjHNLb/n3ZFFSMM++fny
	ZAT61GGt0gAgNuYbLtx40dhaX47CMeq6NmS2pjyF/A5dYHJ+xUflxd3NFQS0ZAz1/BnqNTxhQLpLG
	+Gm7yZlbtf9MwCJMOP3I9WtFn+VN8WUY2miBzqpxdi4FtkM/swfV3ssbaL00PGgkvd0w0izjh9AiH
	r2e1pq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGY7-00000005Hod-2iFE;
	Tue, 17 Nov 2026 10:36:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGY2-00000005HnW-45PS
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 10:36:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B8D3C4E41471;
	Tue, 17 Nov 2026 10:36:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D29D5FC81;
	Tue, 17 Nov 2026 10:36:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C43E11BC025C;
	Tue, 17 Nov 2026 11:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794911775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9vdN6y1G2nELn9LraDSoLy0IYPDjkvIY23fxYzj6Ado=;
	b=i6NcTrGoY7UUepB//+4GFB09Y0oI5v7K8Byc0ZULOw9hUAq/sbQFEUXqiSKnjz1mW9+T+r
	5rRf1wiTOS882jFl/tlWk3LHI58J82gY68m679bG32+DyiWWSIKy9TJ2i5iw8ULft5zRGp
	pMXqKHDgCzlXrjSO5BhOvoy5+4ztJ5h/iIpEY77sE34kiqPztW9soyJQ0THBugomPY0b0Q
	DbVwZ9YvpWUsUavNdi2sQ5KGmUcVTcX0rVfAsr4Sa5PITgnzSpcc09vP0NkI8imPLsNjZy
	NAAnCQfQD7NbIHgRVxWo7nAUdw1Lzvthy/3r6b3dCrPwk64MpU7Ci6dPYqMiQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Brian Norris <computersforpeace@gmail.com>,
  Alexey Klimov <alexey.klimov@linaro.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: vf610_nfc: return an error when a
 command times out
In-Reply-To: <20261114201054.975225-1-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Sat, 14 Nov 2026 21:10:54 +0100")
References: <20261114201054.975225-1-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 11:36:12 +0100
Message-ID: <87a4n7n3s3.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023623_712920_3618007A 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mehmet,

On 14/11/2026 at 21:10:54 +01, Mehmet Fide <mehmet.fide@gmail.com> wrote:

> Hi Miquel,
>
> Please do not apply this patch as it is. Sashiko is right: when the
> timeout hits the raw re-read in vf610_nfc_correct_data(),
> vf610_nfc_read_page() counts it as an ECC failure and returns 0 instead
> of the error. I could reproduce it by forcing the timeout there.
>
> v3 will return it. Patches 1/3 and 2/3 are not affected.

Thanks for the feedback, waiting for v3.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
