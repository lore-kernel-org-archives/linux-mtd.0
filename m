Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEA5C5AC67
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMU08zDNCf0madxzHYmdv3FJ0aGGDL2XGLy7xS/im3c=; b=KhLNg6NkQAs4is
	V6nv2tvDZcEJSDY+NcbPO+XvlbDJuT8ZQ3Mk/1XOgcfxAO23Y7ONmn7lgVRezxSRJTKp4596DZaZr
	6aHjAubCWEzam2MHuNFkKZcnw7v7lkLAJF8oqbBRdzx0CvIR19B3fkzs+Z1WRcBxDThqD6+UUfnwr
	NwIjkwtxNZX7IdNB3BYFQeFDOh2dVmj1D4A5CCjkI5G57Y8kBTU6F+xJ21ZbjYsjAsyCGGZXvm/bj
	R0j5wqWpGFnMyP1PCDrftlWJ+Zqh6FS181B/449U8Zm0sER+63XYs9Lrezrvsu1kElTYN7Zfpe6ZW
	zlMk7+tYt3CeuN9C+D3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQk5-000000007t9-2vep;
	Thu, 13 Aug 2026 08:24:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQk3-000000007s4-0YDT
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 08:24:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 53B164E411E8;
	Thu, 13 Aug 2026 08:24:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DFC7602B8;
	Thu, 13 Aug 2026 08:24:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EE4711C4DAEC;
	Thu, 13 Aug 2026 10:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786609480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zCmrUfoFVJwXdZazRDmnPM7pLBXRf6epSgmPkjDgOcI=;
	b=rVLtUGg2Dk3e+r0bPCqesTd0e6w3dX7swr7xoa9wFodaKu0BRNLjn4yQOpwgmZfOVAl6cv
	n+zYLuQ8FhSImpDShQifSqqcMy90ELbRV4JjiG2weHHsoHVpgWoUdkWFVDCJLn8CvKzfkg
	/7hW1T+90dDrAw0t4DX/i/eUu/eH8Sl8WBOeXJbM8tzhREOhSHMfBbFW3+s4sON2AiFlcg
	h787fzWXAp0qRHU4EeSzcXEk2qQk3LlyvwSuCpQgWgK+6md3cqz9wqa29I78gpMdfHDppi
	sAxmCurdbD2U/PuGUQFFtXLvK/K77TtIdCkwvl3AVMy7XRHVFT9Q66rSJfie1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v7 15/18] mtd: spinand: extract variant ranking logic
 into spinand_op_find_best_variant()
In-Reply-To: <20260811183313.1550425-16-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 12 Aug 2026 00:03:10 +0530")
References: <20260811183313.1550425-1-s-k6@ti.com>
	<20260811183313.1550425-16-s-k6@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 13 Aug 2026 10:24:36 +0200
Message-ID: <87h5kyl96j.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_012447_307941_126E030E 
X-CRM114-Status: UNSURE (   3.90  )
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

On 12/08/2026 at 00:03:10 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:

> Refactor spinand_select_op_variant() to extract the inner loop into a
> shared helper spinand_op_find_best_variant(). The helper takes a
> skip_mask bitmask of already-tried variant indices, enabling callers to
> iterate variants in ranked performance order while skipping those
> already attempted. spinand_select_op_variant() becomes a one-liner
> wrapper. No functional change.
>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
