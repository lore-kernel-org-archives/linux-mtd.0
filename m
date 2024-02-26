Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74D9C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlzU/PdWo+LX3u+6THeV9UrftNwrLBBtUft+/YjmGsE=; b=gVUSh7f6gQBYNj
	H+ZDxiS33+VGPudr/cRGgwGORm4cgiSK+FLSVKWE+x6jJZmvLgp/jznLx3NJwjMdccRVwF44Gczjz
	4a5RvcNUJ9LdX4abNi2OlVDRnTAHWuFLRmlkym9vLa4iNHobBzz77X0dE0s6fM/Uty7rpPi7aaED2
	9Gwlhc0pqJGmymBAwjSV3KV6UnruxsCe8dPsj3YZ6E9hSRY/5Lh5T0YboxO5eBl/2CA1GFbfwanIi
	AHLblTrBDDsR4CMQTtzjkXHqH5FEQPVtmuRwdzpWXmJKQ5yDA2UAI+bPYILY2sogObTGfHd+dzYTh
	N3N9v2mzjs4SsPnu6uVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYU4-000000009ZU-0NZd;
	Mon, 26 Feb 2024 10:45:20 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSp-000000008sM-2YzE;
	Mon, 26 Feb 2024 10:44:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E152E000B;
	Mon, 26 Feb 2024 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cklK17Bwm5dwBiAf8H9FByFXeybvyyj8OaQ0L7tSqfc=;
	b=a5WSTTU//vOfhGJSrNKVRWhognBOZfXM5o6uMH5qd/xQ5QclC+cvGqrQKva2gxQqmNS5lK
	50ZLsTuBIvd9yN7EYOf/n5l+BEvOZdzdnNKec5jMLivZUih2Jzkht3qKi898KB8qTA3RAw
	6klNIii/oohf5a+6xA0eJeVKWE1zyUs/h3cXf0rHow/brugefKODt+XJqKXuh6mavqlzcQ
	rmhjzUfdaTMz0A1JrSMEmPdjhPsNURWEMWgBTZvuV5B6cMMrowaMZX+5hlLlv3dSpGunVa
	bVHjmkDQLF4Wb7lM57IwhrTeaLqEJWjmhJdo3RmrEAwKGOIZ5DSIUnyVpDXG/Q==
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH v6 10/13] mtd: rawnand: brcmnand: Rename bcm63138 nand driver
Date: Mon, 26 Feb 2024 11:43:59 +0100
Message-Id: <20240226104359.489391-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-11-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2276ebe099cacb471ebff9a971f10ebd04edbd47'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024403_961222_D6F6CE2D 
X-CRM114-Status: UNSURE (   6.90  )
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

On Fri, 2024-02-23 at 03:47:55 UTC, William Zhang wrote:
> In preparing to support multiple BCMBCA SoCs, rename bcm63138 to bcmbca
> in the driver code and driver file name.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
