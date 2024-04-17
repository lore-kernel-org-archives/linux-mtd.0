Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B9AC4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfrW/att3ViYC4z9FPBQdymjjIDciSUBkUpherae5MU=; b=UQOpbQxR3WeV+5
	3ZNvA6S4ECpQ0j7upi47LOw0oaARv53IyOMf5ZUkjnw/R7oeRf/bm5i27FKsulo1GvMnIoRDo3bC+
	QH9JvwC8A8ClOZJ+OuIIDNJZ8jDE3APrg2sQ0PQD/IbPCD20a57QJq0SbfAXS3obQ7xMxT0t6i5+L
	5iBObfDPcD0TG7Pl/yw7ZvlFE876dTDt9FtlpX5FToFIOLyAniJ4044E0gTjdGj9CNECIP0YO8mA3
	NKJpfFNFJUmMVK6nJzJx23wWuYBmoBenjbMeDw0aVQ3O/YSQpaIY92XEuAF1SdNeaYZrtP4UrnGci
	wcRNxmJWncvknGI9LXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7cA-0000000GhF1-2HO8;
	Wed, 17 Apr 2024 15:54:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7c8-0000000GhEX-0D2G
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 15:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C9F7615DE;
	Wed, 17 Apr 2024 15:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89155C072AA;
	Wed, 17 Apr 2024 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713369262;
	bh=W0YWw5vLPqHHsCnnmSR86Q1J8YxmqvWrAh+Q7H1bIBI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UZTwn/r+Fvv6swnbxOfWV4DDq8j/kIxriBCJTZzt84QD2a75YIl42j647fTKSV7KX
	 Bxt645CujvhBakPtpfeCicQOuhgQWa9fSrQKseJGGR/o4HW37wXo3YnR07UJWXFYCv
	 upWBUessqnYZN0IWlMqs5ipfyIrtfY/QGn64IXfldeHU59xmIU7cyhjV/6OEBiM7gl
	 wZ+hXjP/Srhg7MmFqv+6PsADlUVlmdqoCi1GevYU7vuOYQ2AWrC9XQgyYzXOGaXRAd
	 F66ftSF7ZnK6BxnoFV9WInhLQg2T6QcPooz5UCqgS6Oy8vTrXgYeaCm+UdAE0hWyhN
	 xBr3EV0dYeFhQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
In-Reply-To: <D0MIJ6FT9Q2J.3B75NFD9SOJ7P@kernel.org> (Michael Walle's message
	of "Wed, 17 Apr 2024 17:45:51 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-4-mwalle@kernel.org>
	<mafs0sezk6rcr.fsf@kernel.org> <D0MH78KYG87L.ETRH24X6MK6X@kernel.org>
	<mafs0frvk6luy.fsf@kernel.org> <D0MIJ6FT9Q2J.3B75NFD9SOJ7P@kernel.org>
Date: Wed, 17 Apr 2024 17:54:20 +0200
Message-ID: <mafs07cgw6l3n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_085424_154642_4D3C30BD 
X-CRM114-Status: UNSURE (   8.76  )
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

On Wed, Apr 17 2024, Michael Walle wrote:

> Hi,
>
> On Wed Apr 17, 2024 at 5:37 PM CEST, Pratyush Yadav wrote:
>> BTW, -M and -C options for git-blame can help you a bit. They can detect
>> moved and copied lines, and look for the original one to blame. From man
>> git-blame:
>
> I know, did you saw "So You Think You Know Git - FOSDEM 2024", too? ;)

Hahaha, yes :-)

> Anyway, at least in netdev unnecessary code churn is frowned upon ;)
>
> -michael
>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
