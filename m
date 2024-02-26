Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6039C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzdMYYUs2eyZjyQ41p+C4RXiRXlWYQWSQE/saXQbBkI=; b=lYok0v6ypu0wZN
	uy0TC7qHPuGoNxpU7CI8C/z9KvLCu+I0nr19eG3/9nEQ7SMvr34rrXCH+sJDjBZW93np6q8Vlc4YC
	zQKwRWIdys0FBUqe/u4NuVY7p/5T+h4elVtMOAjiZO4NaIJhEeAG8J3q95EDYTTpOyx+wkDJ5Be73
	lr8wBsfxZIafu4thAmiginWt0WTqJDBHmos4rTztAczaSSCu+h3PyBcFc+8aTAYnbx6t3R8bes75w
	pfpMMjJ5ju6ROPdf38K9rbrFf3pW3EeWrqOUau03bnh6R+CFT+CC6ScnrEqerZfORcI5gtJicnuQK
	RvynJoXvpOpC2nob+j4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaNW-00000000fMT-1JYJ;
	Mon, 26 Feb 2024 12:46:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSs-000000008vW-1YVN;
	Mon, 26 Feb 2024 10:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sxwncBqF1qChlTGcNzhdeu4dak1hlGz+T1xYbis3nVE=; b=OWqMtgx1JFDc23jnec7vqWBtAO
	PF34rDiaVCOqR9bW1M0Gb0qJNjSxnqPGe8aTKuL11Fdkfv04RNJ4Z+MkCHXf3bFXs4mg/EkBBG2AT
	7sqcnrRRBPHRhVIhrgqMi9K0+/BU8Ggd5CJ2zham7qwwm2Zo0+0uDescSRweHGWfMyMbRjIU6s6Dt
	8PNeGZg2S9VWxOXF0iGA+9i2BhLhPDrVKGuxTJkEufni4pz0TAlzQJUZMf4QxlXyUOpezX1uHtzhY
	+kqMCc51bDzPuQpp5/zKQaeo7zpG6eLXX6X1eN2DOHRiilpUTSSv7iKrnp68m/TUSMJ+tIheeU2nf
	hlKNF6xg==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSl-000000017nf-4A5S;
	Mon, 26 Feb 2024 10:44:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAD1F24000C;
	Mon, 26 Feb 2024 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sxwncBqF1qChlTGcNzhdeu4dak1hlGz+T1xYbis3nVE=;
	b=jq0JikuMnQnPzXUbLe14yIF7SUov0LVLSA1b8GHSmwLsk/ScG6LAChVhvoUV23EHMSmsgI
	QWfLAiogK3Gx2vpH7VUEoIh6rvmQ8qvUsIoOvE7y5Tj4/oT1X39RWa7Az8Ye3zoggRRvyO
	7NrbSZXeuD38EIkD45v5VJK5M6Pdm0LtdV+MkxL9V/TrMewyemWaBl8G3qcOtapZgL/ToQ
	Y60u6SPXqzfqbPRcsWLw4+uQAABn/tiEIPbKNHENp39n2m9NjK6mQ5Lu9pOwhy7LbqPH6d
	+4EUk86u9as0t4hwb7KGsqeB4sUp/0IC+ZvsrbA0pV0/znaDDY1RynE4+l8pjw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	David Regan <dregan@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v6 11/13] mtd: rawnand: brcmnand: Add BCMBCA read data bus interface
Date: Mon, 26 Feb 2024 11:43:54 +0100
Message-Id: <20240226104354.489350-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-12-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c52c16d1bee5c3b074989e839eeceed2a0a8cc43'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_104400_240119_6E958DC3 
X-CRM114-Status: UNSURE (   7.32  )
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

On Fri, 2024-02-23 at 03:47:56 UTC, William Zhang wrote:
> The BCMBCA broadband SoC integrates the NAND controller differently than
> STB, iProc and other SoCs.  It has different endianness for NAND cache
> data.
> 
> Add a SoC read data bus shim for BCMBCA to meet the specific SoC need
> and performance improvement using the optimized memcpy function on NAND
> cache memory.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
