Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA498C44515
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-ID:MIME-Version:To:Cc:
	Date:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UFD6om8K3wDpiGgNaaOG2K4N8X7S/HWUS1KVADgmo8=; b=ScqXY7oMvXfYI2
	cOj0lsgxc6W3DGdP/gh+OeOKdRhLrwufulS4o/dOtbhQx4NlghqygNRzJWfRL164LFeJfAU6r39+L
	1MKfRbD2ihr5QXn4oOZKX2bCmN1IYLyc/6qUowIpGnPDb8ZvrGfxqFyOGjqqtwPoY6Wj13s2k040G
	kutZy+D90Thoo5SgExiFu/JQduqpo5gFJNvTEzdTzA+7ansustJxJ6WL0rI+a8A2aXiETq1fdUu0/
	SF75IrmirCLYvg5sFZU+Vtg5WZTuX+H3lnSfoKKI0vJBGp/o7DYBZ3zG9UG8IRibKMZRz8LgsNKJ8
	0HpH41mQ5FgbkZ9dvpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsxu-00000007gJa-1fAY;
	Mon, 20 Jul 2026 18:43:46 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsxr-00000007gIH-0BRz
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 18:43:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 68FD511A717;
	Mon, 20 Jul 2026 20:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784573014;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NcTuLyhrb1waCwhbHOWB9uuAijaDbkAfMULNnNW122k=;
	b=PoR1D0NruHbRcRi+jsp8s89cC7XK7JDyv35aeGISBVrTvVVUQrvUEeBYp7JPdovFW+c83Z
	fatev5eYJx2/KI6NjF/54rQvmqKMHYZg4qX7jkCThVG3EU8HoazklXRI2vGvbplk6K7i3B
	yPztrhvM0cDvmjwo35tLDNqPvnqP71o9X372DMU7OUfOLOirPFJIapvhSU1OQ+Ke6LRNTY
	lhMZDllv36sEi2Op8pZpFTT0dUw9DJUx4fNBiBmxCaHcPQ18hjVVZX2kImY0dFAik9zcBc
	txPKQPYEEO9ScIsK0PdTCFkw4/tEOSm2Wl2rpvLESfd5rJ3GyYF3UAymRVaTTA==
From: "Fabio Estevam" <festevam@nabladev.com>
In-Reply-To: <DK372KBK7E8X.383DA8L7J4JIX@kernel.org>
References: <20260718213827.701787-1-festevam@gmail.com> <DK372KBK7E8X.383DA8L7J4JIX@kernel.org>
Date: Mon, 20 Jul 2026 20:43:31 +0200
Cc: "Fabio Estevam" <festevam@gmail.com>, pratyush@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, heiko@sntech.de, linux-mtd@lists.infradead.org
To: "Michael Walle" <mwalle@kernel.org>
MIME-Version: 1.0
Message-ID: <12de54ff-0f0f-a101-4f63-c0b72fd81cf4@nabladev.com>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?mtd=3A?==?utf-8?q?_spi-nor=3A?=
 =?utf-8?q?_xmc=3A?= Add XM25QH128C identification
User-Agent: SOGoMail 5.12.9
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_114343_308816_B1358642 
X-CRM114-Status: UNSURE (   4.27  )
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

On Monday, July 20, 2026 03:45 -03, "Michael Walle" <mwalle@kernel.org> wrote:

> So why do you need an entry? We don't add .names on new entries.

Currently, I see:

root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
spi-nor-generic
root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
204018204018
root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
cat: /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer: No such file or directory
root@rk3399-station-p1:~# 

After this patch:

root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
XM25QH128C
root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
204018
root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
xmc

The advantage of this patch is to provide the partname and manufacturer entries for userspace.

If this is not wanted, feel free to discard this change.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
