Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8DDCDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaYUfMbQDvJRNVp+BzO7hWn5DudRnBSQ39RiG+izHyE=; b=lKvnYgfaXTnH+j
	oM9GowMczKR96Qu6v2zu0wJR8V3zdCtlCO7J+ZLVeAAEUKQvTvPHGPms2Y9a3aQW1OKnhSuNlZ4HC
	cZS1J21X+k/JeMfUcx4RvQ8WEo8ByeKSFwEhMhvq5rMX5Mkik9WT9n7CEZcYFkum3PyCMa7gHhye9
	9Vb05NpaokysbmIiIS/S5KiNJlIbBn7ML/Pd9mmj88wI6fnk1+aPXSbKq5vW9oDJ7l8Lk1m7zdLYD
	a0VBAFxXFOIZ5rw30k2rIUqpyORqpF5l3NqwF+Uwm7KcRp0u8vtUEtDX/22ZAyvZBbhow3SNs+YeX
	uv2LNLK75crhKQCBaT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskOU-00CSAJ-2V;
	Tue, 17 Oct 2023 13:45:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskOS-00CS93-0E
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 13:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA1BDCE1DD7;
	Tue, 17 Oct 2023 13:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD1FC433C7;
	Tue, 17 Oct 2023 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697550352;
	bh=bsGdEMFXOwsrc60Ta6ha6me6H2zHsuO05hAgJWbwpiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgJ6lMzTY4x4C6eh4m7YVU51SLRvmFHQTRv6yULW4c0fXz/vvOHbyenm1Ovb+PsZD
	 BcOEcT4T/hrzyYTpT4lsR0l0v5R8aH0sWJGrwBWarq0Jw6oukHR1OEZrVRBvrheUGp
	 sN+b4OeXaZhkcYq1FurKUW/KGUFUWyB2eB552cJk=
Date: Tue, 17 Oct 2023 15:45:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <2023101727-undying-hull-1e4b@gregkh>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
 <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
 <4c27130c-e924-4f24-b833-794e0acac858@app.fastmail.com>
 <20231016102134.q6k2jb5ewu3flg6j@pengutronix.de>
 <CAK7LNARSxEZeKGoFAdGp1uhQVBrdGByDD4cJNMc_HCkmTiFF+g@mail.gmail.com>
 <20231017132045.afswdgcv4axjf6jj@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017132045.afswdgcv4axjf6jj@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_064556_335944_81750B56 
X-CRM114-Status: UNSURE (   8.52  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 17, 2023 at 03:20:45PM +0200, Uwe Kleine-K=F6nig wrote:
> with 19 in drivers/rtc (I added Alexandre to Cc:), 4 in drivers/mtd, 6
> in drivers/usb and otherwise here and there a driver. That doesn't look
> insurmountable.

I'll gladly take patches to change this for drivers/usb/ stuff.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
