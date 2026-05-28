Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DA4CD5BD1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pOexAuTnMVyzGEQa+SSiCuNoOuG0V8Mw+dRSmCJ5lo=; b=RZL/+LOXX6FPk5
	igfYllSwbcvt6jiQNSM1RwPkFriTHElvKs5COCMQdqqdKzg0VvLGbKYCrwk6/7jzNodRg5qb2IyzG
	OHI9RPyLq72RYNQauOT9us+YAPSumvrycGhJ92Czz1FxTuBQG5bPvuQbY1WwPXk4D9x9+n51iQDkm
	Zsw67+m9zhEu0R+M1ZsR8ZclnkXmt+GiNjD6J0aFip0vDzd6ovdjuRx2SMbwO9Js/ZnAPDgoYvpBC
	IYInx1ySSo+OTFxIFu8CJZVYHZomxuE19fIlRqCIe0qG8vJ+yfFWujQV+/7f0PeZhwgV/8rzrG/DG
	GbfHfMWMFRQtLyLW1rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWA7-00000005OYU-2Raf;
	Thu, 28 May 2026 08:32:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWA5-00000005OXe-1jCz
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 08:32:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 482264E42D66;
	Thu, 28 May 2026 08:32:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D79960495;
	Thu, 28 May 2026 08:32:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69D5B1088877F;
	Thu, 28 May 2026 10:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779957133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gidRamgj8eDUV29xH6yqYbCKwqD3sPaJu+YvLyMkSfY=;
	b=1hSr5TXVmnTbPtQJKgkpYV2a6Ek9sgxLDA/SpJIuDB8+3FqniU/CttkWAwfZNa22p8tXNN
	SMos1Jy2TqWsZ+IhlVdlAWXGO7ry+BLa4tRRISyytzxH0cRnxQ82DbvDfxvbwhcbW316SZ
	spCHpG3/xXk/cdeVVKP8yvQCJRlDW2EThFLlmuV6R5SdQdkZG2YzaIWJmZMe5iZErbvbIv
	pyoi0IFqjH40+GkKa7b4XP2qxKmjy0eS4BlQKLrZbgG05BbKXQCkslXYIjuT61HcoEOREb
	19rZRbaWUB6t147UqyddLmGN+wgjPD04DippIctN7RVYUPvknSIsBmw0JB68zQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
In-Reply-To: <20260527175527.2247679-2-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 27 May 2026 23:25:15 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-2-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 10:32:10 +0200
Message-ID: <87wlwogcj9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_013217_605563_30018A44 
X-CRM114-Status: UNSURE (   7.19  )
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

On 27/05/2026 at 23:25:15 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:

> Some SPI controllers support high-speed operating modes that require
> controller-side configuration before the device can be driven at its
> rated maximum frequency. In these cases two frequencies are relevant:
> a conservative speed usable without any such configuration, and the
> maximum speed achievable once the controller is set up accordingly.
>
> The existing spi-max-frequency property accepts only a single u32,
> which cannot express this distinction. Extend it to accept either a
> single value (retaining full backward compatibility) or a two-element
> array [base-frequency, max-frequency], where base-frequency is the
> conservative operating speed and max-frequency is the highest speed
> the device supports after controller-side configuration.
>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
