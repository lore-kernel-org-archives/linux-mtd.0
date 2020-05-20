Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE985C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 13:59:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7979B20829
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 13:59:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dspC3ZDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7979B20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wln8XcVcNWN1cIyyx9UfOg3Z8P66DJTMLfpGjdUnLI=; b=dspC3ZDMp0Vd6L
	jybRZAtrczI7NNKzGgD2FkwRoeodYS7adzzRkivMqrBtSrcdp2fdwtZH8gH2F67W42/Yng/XIOlX3
	e01vXIDi6CWCAJEq/N0JtR9qAz01t0ynfIRzg3orOXl/AG2UwwIgHoRJ9CKMryAos6vZlALFUN/E1
	AZPz35S0TCzgPCYiuZeJk2EUF9XjTy0M30qNuGLazsiZsGlv8I2HZTnJCCg0NSSxugQ9Ve3gU7L+3
	fXbo+n1q+NX0W7vkQLjfR0I9GuslF0co6S/NSIjFB5CT9A53+o/3K90v1/2+reS1egWa4ZUt7NreT
	q667KD9dz/c7FHTWbpag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbPFL-0000Ls-RG; Wed, 20 May 2020 13:58:59 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbPFI-0000LE-Sl; Wed, 20 May 2020 13:58:58 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5gAG-1jiXqO3kAE-007BOp; Wed, 20 May 2020 15:58:55 +0200
Received: by mail-qk1-f178.google.com with SMTP id n14so3569253qke.8;
 Wed, 20 May 2020 06:58:54 -0700 (PDT)
X-Gm-Message-State: AOAM5329rd5T52GO/7RLn6hor41w0jbARTNdWX6+l/SpCY8bKXDsID4F
 5QmW4YejCPisfeOEAzAeyYjMUkt4O5SpuGOcXPI=
X-Google-Smtp-Source: ABdhPJx4ENYagzo5Gfr37kUrjNr2Lnc/XweiU7zCRwONCX+I6FGqkGHE9iYPDuazm8/99EsA6nl4Ctj9yyfEMM8iO3Q=
X-Received: by 2002:a37:46c9:: with SMTP id t192mr1902078qka.3.1589983133263; 
 Wed, 20 May 2020 06:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <20200520102125.8934-3-robert.jarzmik@free.fr>
In-Reply-To: <20200520102125.8934-3-robert.jarzmik@free.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 May 2020 15:58:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ju_eZqrUW3j2wZTDKd0ijV6iP7tDd4wbx8qdyd7EPBw@mail.gmail.com>
Message-ID: <CAK8P3a0ju_eZqrUW3j2wZTDKd0ijV6iP7tDd4wbx8qdyd7EPBw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: pxa: remove Compulab pxa2xx boards
To: Robert Jarzmik <robert.jarzmik@free.fr>
X-Provags-ID: V03:K1:n/XzOclCosQS73AgmS6K5JYYLpOMaXhgh19KjxBQPAbNfm1J3gX
 kHfjhHH1SCHRmCEVsTH28F9BEU70eem7rk8UMH4q1y0+uLOO67Et/5BcpOm540LzaG7vz9U
 kcAtJcXzCuqw19MmzS3jLLvdmBwlSeiVD4sNftpDUePdWwZiaqvNN89vNhBzP0oVzW47tow
 d2vbr0IYdVi+StiYYPH6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yVD4CzHIxQY=:0C47d2i2kzacDZzCl8YUt8
 eKH7ai5QR3uClPx9nFrEzzKOChfrkWNAMLfTEFMvN1q2F9PZVaZqbG6XXcInWc+14sKVFHins
 BxFHzbukr1L0I9k5DhKtA7UsUcLG+YwN7l7dhQoOj2PFaHKK9VUMXi/hEjOEz1MzZyuoEcujQ
 qfGgB6k2Ep0Wkw26+IFU+TyTqnoDrkx0de41q1tACKCZTL7njPBRKeUdvBEJdZ3qSmwQYZj5v
 JsdjYz8ky1Js/MSdL7L8cWtP2vRBg3x4DzNOOXTcAFpTllgBMSWGOGMZmLuVBX2aDXczD1anK
 +Z1qarI9XTQJCrW0kkYttXvYvUvFKCJotvxr6JLmHAwD1CgqTeQ+nLZLZ5occOhO/6+hXfynP
 +MxDzQRTtOwv/cETd8miVV0fux94m9U3bUIuipZw2PFPxWf/vgFvEuNIUg/T5vdTh7NMXmG4n
 VnLQ97jBKic3A6Pnsu1O0MjiKnnOlTGjWLWt+emyNoazw1AVkiLZcV0fXLyBKpQHcT9AiVYdP
 PX5+ZQBFg1mM+zezPxVjNAzpaYVrX3pOznb6QrYL0qSKbHK6Lm+Ndhi2V5jsSV7ndkIjuKM5r
 Eufsm00zQJU1L+nkHiggs9kxyNxKT+8PKGOzaJLVJ6RDe5Z5iW3S/28Mx30RFcq6d7JLTlcvF
 kIMFbpT4xQmK3tdwBx24kzrzzuo5ttpct+6vUr0Bwk3mwahgbEEC2SkBO/YkvdQUzT/CIeYy6
 AZVL7OZ4Oc1yeMH8rJ/O/AHrrTybqv8IeX9aJYdyO+iBPsw6OGs3YcLzYPxI/JTtPw47bP47K
 QFRxhhST96WsFiU8tLRr/oi0ONQwNOGuzKGD4OThRSMr2849XU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_065857_280643_02CE6D19 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Mike Rapoport <mike@compulab.co.il>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 20, 2020 at 12:21 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
> As these boards have been removed from the pxa tree, amend accordingly
> the sound subsystem.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Acked-by: Arnd Bergmann <arnd@arndb.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
