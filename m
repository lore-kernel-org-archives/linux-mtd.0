Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DjH0Y-0003N8-Uc
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2005 09:35:44 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DjGuZ-0000Dk-7G
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2005 15:29:37 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jun 2005 15:29:31 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jun 2005 15:29:31 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Fri, 17 Jun 2005 13:28:46 +0000 (UTC)
Message-ID: <loom.20050617T144811-785@post.gmane.org>
References: <loom.20050616T213451-152@post.gmane.org>
	<42B2BAE3.7040709@anagramm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: I2C FRAM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> For I2C related stuff please have a look at the lm_sensors project at
> http://secure.netroedge.com/~lm78/

Thanks, man. Yea, I've see that page.

> There are generic drivers for the widely used I2C eeproms which you
> can use/modify/... for several platforms.
> Please check the documentation there.

It looks like it is geared more towards sensors and really small eeproms.
I thought that FRAM would be more on line with MTD. I was/am hoping to use
FRAM for a transaction log and possibly do a bit of buffering for NAND.

Sergei
