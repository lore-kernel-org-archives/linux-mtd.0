Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5A5C3DA7F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2024 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ostgJeQeN3/IWEi+dTH+7ByXjkUxpTx1aBDvxpapLS4=; b=s3JpdmO1t3O27/
	EcWANYr6gSqCilW05I4VCFCvjQjHiE/TfDrX/S2omB9qzTCKvgfdKcaa/4sx9uXFitHNNawFLNKFc
	kInk7omqJPcC8Pm3JnclLen5FvS4UgvE2Lwi2WBF0xOib8N2JgvuIg3g5AveXTW5zgwIDVQa8JdUS
	lCD+i8HU0GUX4ZE+eGj3doEl5Qh5plnZgxcmEK4hPtlC04w+CksZenRnddFl1KnmuD3ssrH42oLpR
	ucmKMNmNzmd0VpDU+IZ5ky/Ynl6/Jh+n72v8xvGew8MJnfqRAhzDfdko97LlGdnNkSc85DvIUt6U9
	RkFwDufvWdWx9nbJxMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbgrZ-00000005Aar-1eol;
	Wed, 07 Aug 2024 13:38:01 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbgrM-00000005AQy-0WcO
	for linux-mtd@lists.infradead.org;
	Wed, 07 Aug 2024 13:37:59 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024080713374201598c944edfcfe0b2
        for <linux-mtd@lists.infradead.org>;
        Wed, 07 Aug 2024 15:37:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hDMZFLANYzQPGz13BNr9gsq51EvdP4NttKLWXR3XOi4=;
 b=I0pPWZwns/HQYfIaPkrYEKXe9/+mN5Tpn3hWtlbnKJTwuuSVOpL8hpGOtJOX6t7FivflIF
 O5LcAThoOkZ80TVrA/Qq4uwFNOIu5ojh5G2R+K0t61vqcPN6Clvd2jfiKxbDTP+MwfME/m0j
 IU7IqajCfMCPwT4SbrO8FVSV+KdBDyQv4ikRRuGq5N2JT38gyHCQJTuXN70jn01RC47gUwLb
 yRZw39n9F2nJpeGFnJqew1T/2BSOj3dpBg4L3sktXPJTVwwiF7ZCotYhCfZ3iSPVSacCttJ5
 136w52xMdnovObz69rGXXQ57th8C1914GTlECauQlzghhLjXpBfodJOA==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: mwalle@kernel.org,
	linux-mtd@lists.infradead.org
Cc: alessandro.zini@siemens.com,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH 1/3] mtd: spi-nor: handle JEDEC manufacturer bank
Date: Wed,  7 Aug 2024 15:37:40 +0200
Message-ID: <20240807133741.27785-1-alessandro.zini@siemens.com>
In-Reply-To: <D37V6QTQZM50.2I613FUEQIWXG@kernel.org>
References: <D37V6QTQZM50.2I613FUEQIWXG@kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_063748_982760_00375BEC 
X-CRM114-Status: GOOD (  16.63  )
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

> > Given the fast expanding pace of JEP106, the read ID operation has
> > been expanded to 128 Bytes plus the pre-existing 6 Bytes for the ID
> > code, thus supporting up to 128 banks.
>
> I really don't like issuing a 128byte command for older flashes. So
> maybe we can just stick to the 6 bytes and if that's not enough we
> can use the extended format.

I agree that there may be better solutions than this. The idea for this
patch was indeed to gather some of them and trigger a discussion.

The question I have here is how can we determine when it's "enough"?

> I'd like to keep the .id as the primary index. This will now
> introduce a mfr_bank, so the unique key will be (mfr_bank,id). Can
> we somehow encode the continuation codes into the id itself? E.g.
> we know the manufacturer ID is always < 127. Honestly, I'm not sure
> this is the way to go as we know flash manufacturers sometimes don't
> care. So right now, we just compare the .id with whats returned by
> the RDID command without interpreting it.

Even though the manufacturer bank is technically not part of the ID as
per JEDEC standard, it's still a piece of information needed to
correctly identify a chip and avoid collisions.
Therefore, my opinion is that it should be part of the unique key,
whether encoded in the id itself or in a different field.

One other possibility could be, when needed, to add two bytes to the id
field, them being one continuation code and one multiplier factor
indicating how many continuation codes are present for this
manufacturer. The absence of the leading continuation code would
(obviously) be assumed as bank 1.
The spi_nor_match_id() function should of course be adapted to handle
this additional information, but we would not have to add an additional
mfr_bank field.

--
Alessandro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
