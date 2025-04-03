Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEE6C3600C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 11:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxj/rm10Icmvypc5Adu9MtLsJejtZLw/lVbIRzs3AgQ=; b=GVIaPJpIzuYMZY
	PrGpOdK+bYcJXnEU5VX2IeYsWxF6vMvrh9F85ZVZCEGZ197HarPuDVpyCI7puWOTenw6leQ8sS92p
	XrXUKeo/+M3FwuSHSdsSdQMyqnY9MWy3WxapmCLEvHRb02wadyzQ7OTwWeg6HwQYTUQXoHxv/aEUY
	zsYUeXFGL95HgBfdlKY61qjtrgsszQyNvlAm1YhcIdpEUkPT6le4GEzeoX0PJKhY5kv3YbmyRlvBe
	yOjn2L5ASZA/U2Qbxysh16i3zox2rSDiMiJzK9tw8V49LS28AptThZ0B23u0egxU7fn4Vur1eVmFM
	0h9xMLME0H5y0OjIjrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ib3-00000008gax-0d8l;
	Thu, 03 Apr 2025 11:18:57 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0IBv-00000008dB4-3bHz
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 10:53:01 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C8D9211B3;
	Thu,  3 Apr 2025 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743677574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJRwADuh9Gf8w3cJ3qkn0sEpYgoWwqfQMCfDUgsVJYo=;
	b=ucnJKdiMegpOJAdc2tH5ka7+226kXUodBZMjJOuH8o7n/l4F3VZl53M+C1+Jg0RD+JAcXA
	wWyEeEhrGSqmqmvZG4QGaAY/k1ax7ymRyFZrJeuduL/9BITbQp9PAHxk2ZnWjWHlotXj5D
	Vnxn0hnMxKJxTCgtybHZlzSZ9Juw+yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743677574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJRwADuh9Gf8w3cJ3qkn0sEpYgoWwqfQMCfDUgsVJYo=;
	b=CjPRKR3vdRJbDa0YIb0G/MQr/L2JCsmTMz2xbLc2iXEdn6EM9PYT/smyZRDaO+9bLxmDLX
	j0Drw6N2bPE2+dBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ucnJKdiM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CjPRKR3v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743677574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJRwADuh9Gf8w3cJ3qkn0sEpYgoWwqfQMCfDUgsVJYo=;
	b=ucnJKdiMegpOJAdc2tH5ka7+226kXUodBZMjJOuH8o7n/l4F3VZl53M+C1+Jg0RD+JAcXA
	wWyEeEhrGSqmqmvZG4QGaAY/k1ax7ymRyFZrJeuduL/9BITbQp9PAHxk2ZnWjWHlotXj5D
	Vnxn0hnMxKJxTCgtybHZlzSZ9Juw+yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743677574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RJRwADuh9Gf8w3cJ3qkn0sEpYgoWwqfQMCfDUgsVJYo=;
	b=CjPRKR3vdRJbDa0YIb0G/MQr/L2JCsmTMz2xbLc2iXEdn6EM9PYT/smyZRDaO+9bLxmDLX
	j0Drw6N2bPE2+dBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 048BC1392A;
	Thu,  3 Apr 2025 10:52:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XE+5OoVo7mfnDQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 03 Apr 2025 10:52:53 +0000
Date: Thu, 3 Apr 2025 12:52:52 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>, Steam Lin
 <stlin2@winbond.com>, kernel test robot <lkp@intel.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: Fix build with gcc < 7.5
Message-ID: <20250403125252.03432904@endymion>
In-Reply-To: <20250401133637.219618-1-miquel.raynal@bootlin.com>
References: <20250401133637.219618-1-miquel.raynal@bootlin.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Queue-Id: 7C8D9211B3
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,bootlin.com:email,intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_035300_050376_2C1BA9E5 
X-CRM114-Status: GOOD (  14.40  )
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

On Tue,  1 Apr 2025 15:36:37 +0200, Miquel Raynal wrote:
> __VA_OPT__ is a macro that is useful when some arguments can be present
> or not to entirely skip some part of a definition. Unfortunately, it
> is a too recent addition that some of the still supported old GCC
> versions do not know about, and is anyway not part of C11 that is the
> version used in the kernel.
> 
> Find a trick to remove this macro, typically '__VA_ARGS__ + 0' is a
> workaround used in netlink.h which works very well here, as we either
> expect:
> - 0
> - A positive value
> - No value, which means the field should be 0.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503181330.YcDXGy7F-lkp@intel.com/
> Fixes: 7ce0d16d5802 ("mtd: spinand: Add an optional frequency to read from cache macros")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Tested-by: Jean Delvare <jdelvare@suse.de>

Thanks Miquel!

-- 
Jean Delvare
SUSE L3 Support

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
