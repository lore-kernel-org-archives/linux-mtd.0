Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMeVR-0007ix-Qa
	for linux-mtd@lists.infradead.org; Sun, 28 Nov 2010 10:29:18 +0000
Received: by wwj40 with SMTP id 40so1246258wwj.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Nov 2010 02:29:15 -0800 (PST)
Message-ID: <4CF22EF4.7010501@gmail.com>
Date: Sun, 28 Nov 2010 11:29:08 +0100
From: Marek Skuczynski <mareksk7@gmail.com>
MIME-Version: 1.0
To: Vladimir Khmelnitsky <vladimir@broadlight.com>
Subject: Re: simple ubi reader
References: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AE25@mailsrv.broadlight.com>
In-Reply-To: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AE25@mailsrv.broadlight.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vladimir,
> I need to write bootloader which should read its second stage binary
> from ubi volume.
> I wonder if there is some simple open source code I can use to implement
> ubi volume reader?
I can take a look at these places:
- U-boot <http://git.denx.de/?p=u-boot.git>
- Barebox aka U-boot2 <http://git.pengutronix.de/?p=barebox.git>

Regards,
 Marek
