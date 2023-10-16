Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A35CDB482
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xr/bXgGxIG1BJ8Yt6lxUYsIE1Jc2abE/yhJ26I79898=; b=n7exOS+jQOeO0u
	cPQeICdalUdOyDMQdIwAZQRGQ9g8uL68+ypvBWMZRs+OXwoaNuXFGwnDPEI9CtdiA/BtLILtJcy9K
	2C5ML877/cEb/oMn1ZfXODLZEyFej8G0h4P+URZgmcsiv3fPD0rJ2gIOlUJKIDPR0ToKdfCRrNciZ
	LMYp9PWJBbgPf9GaxvocDESYcsDu3lt7c6/F2DuOaXtHquVWKvzu0YMRbSnHLomgds4Bv+0CCoW74
	kdO5qnmQda70osnpzhxGxQdLogxxGt9TDgzEf0rJT+pETe3oqrDrxh3HjMjFkrgFNDLCXtjFU4lzH
	ZuqhcC81KS0y/8h3e9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuw-0090uf-39;
	Mon, 16 Oct 2023 09:29:42 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJui-0090id-2I
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:29:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97DB01BF213;
	Mon, 16 Oct 2023 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxN6Hiq6hh5A7I3EawU7v5hFevCsqykqHH1deXglV+k=;
	b=MGwpxy9CljSmH6V8/je+dz8TC/qpnfTsknk6H+MO/d9m0oGp/fJIbZ0LArjBz1YKuNozPf
	lWgx0mMrjfi4dl6pywtfnEzTuXOMIWh9So9rFCf/MOW3Gp+ojnRFOn3PSoplcz74fZAoBf
	bnEddxIu6yAHp44CaLQa1acyaBcv1XGp0mt5mLq993m3vHzq9nRxjFUrj3iobwuWPdjY8k
	fK+humHlMEZvgB0HL/DHf4qmgHJ1A5W7lSvnRlHZQ4X/6YIahymhqIn9+jMmZzR7UvYXZc
	tSGRdRJfD7SP/N7UU38ZESqFh7O7Iw4eWVojp68o6Z4eBL0QY5Eccw5l3/nOag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: git@amd.com,
	michal.simek@amd.com,
	richard@nod.at,
	boris.brezillon@collabora.com,
	linux-mtd@lists.infradead.org,
	akumarma@amd.com,
	amitrkcian2002@gmail.com
Subject: Re: [PATCH v2] mtd: rawnand: arasan: Include ECC syndrome along with in-band data while checking for ECC failure
Date: Mon, 16 Oct 2023 11:29:21 +0200
Message-Id: <20231016092922.289254-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927055621.2906454-1-amit.kumar-mahapatra@amd.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f693b6485e251ddf849d862cf6406a4dfc0143b3'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022928_908756_CAD05F43 
X-CRM114-Status: GOOD (  10.00  )
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

On Wed, 2023-09-27 at 05:56:21 UTC, Amit Kumar Mahapatra wrote:
> Following an ECC failure condition upon page reads, we shall distinguish
> between a real ECC failure and an empty page. This is handled with a call
> to nand_check_erased_ecc_chunk() which looks at the data and counts the
> number of bits which are not 'ones'. If we get less zeros than the ECC
> strength, we assume the page was erased and we are in the presence of
> natural bitflips. Otherwise, if we are above, we assume some data was
> written and the ECC engine could not recover it all, so we report an ECC
> failure.
> 
> In order for this logic to be as close as the reality as we can (this is
> already a simplified condition but we can hardly be more precise), we
> should check all the data that is covered by the ECC step not only the
> in-band data, so we should also include the ECC syndrome in the check.
> 
> Fixes: 88ffef1b65cf ("mtd: rawnand: arasan: Support the hardware BCH ECC engine")
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
