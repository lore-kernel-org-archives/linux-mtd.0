Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535CFE77188
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2024 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USemXfpSyDsKl0AQy3Ys8XoIsCjIRg5IeCKsQspcGNo=; b=uMfom1AnHiZXV3
	HfxK4jIPuvbCShQWskPz3L8dPzZyuW9YmufQ/f0K9tuhDgpffge/BalrRYx3CSnEsKzF+ZWbsDaLw
	0Npksnl2hbcEwfZQWOh+pwIF5K6GVdzuLGaHu462XEdtWtuq6xOjWLWKDMGOgrOG/nNo+aUD+XWoe
	QF7MD0oAWjImOtMksiMD2aA3ENuxVFrIPoDf1r86pvjn9IxE4PHbIoaeko4USeMQak3jruoqMRApO
	F2btkEOQeScGmEcqPgmNn/bBSZXknAEsDWo6G3CfZaEOoimXUuGDfvgv4R529lXY3mOdh1qtL8vD/
	qbR9HBM3Df9hJIotax/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYr8-00000004Ly4-1A8E;
	Fri, 20 Dec 2024 08:59:34 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYr5-00000004Lwh-25a4
	for linux-mtd@lists.infradead.org;
	Fri, 20 Dec 2024 08:59:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4932C000C;
	Fri, 20 Dec 2024 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734685168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFl+e92WgcWv4oL6XD26FejdeGSjob+yvZ/tKdgd5SI=;
	b=eUYgjtq6wotf+agczNaxA5iFE53oz9LFwCoaiGNsWAMxMpSM55xlfCBoBbwCt3VQRuWuUr
	eeBwpB4gvZMdG9Jsv3f8UfL4HYJqEzEsW4c66NcjXH7AXOiO5pUendmpUoPcl4c95XX1ME
	P6gWt3hJ6L4v30TL5l7ghVQXZ7WoJzLfTUK0+vZA9uwZOCabgzg8gC6sPR2eV2MUgZ9T54
	wqk6SahvL6BLec65gLCn0GdPykX7DySJeIlIlmzKqlTDKmHFMtBnyE0HEY+NlcKHH6WyHj
	f+xbB3S6MmOETH3+QkkKzng7fgMlGmLSyrxvY4gwdIzhlO0ewV1vGvY5kyTzkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Renjun Wang"
 <renjunw0@foxmail.com>,  "Pratyush Yadav" <pratyush@kernel.org>,  "Richard
 Weinberger" <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: extend description of size member of
 struct flash_info
In-Reply-To: <D6GE3CD5XK5F.35VL454SBGOID@kernel.org> (Michael Walle's message
	of "Fri, 20 Dec 2024 09:36:57 +0100")
References: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org>
	<87r064c8r3.fsf@bootlin.com>
	<4660f0ea-b1d1-46c3-b5ea-efe549c9adf6@linaro.org>
	<871py3abt3.fsf@bootlin.com> <D6GE3CD5XK5F.35VL454SBGOID@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 20 Dec 2024 09:59:20 +0100
Message-ID: <87frmiwx07.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_005931_667369_082684D3 
X-CRM114-Status: UNSURE (   7.83  )
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

>> >> TBH I'd be perfectly fine (and prefer) a dedicated member, because
>> >> code clarity is IMO more important than memory footprint today.
>
> But that would have meant more code churn, because the default
> should be the new method. Thus we'd have to change all the old
> entries.

Oh yeah, I feel it would be a patchset on its own. I'm just mentioning
it if someone has the willingness some day. As for now, it is important
to properly document how we use the fields.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
