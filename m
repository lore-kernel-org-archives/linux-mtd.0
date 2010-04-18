Received: from www.wegener-net.de ([145.253.158.94] helo=wegener-net.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O3YnK-0005HN-71
	for linux-mtd@lists.infradead.org; Sun, 18 Apr 2010 18:00:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by wegener-net.de (Postfix) with ESMTP id 2EEA74779
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Apr 2010 20:35:40 +0200 (CEST)
Received: from wegener-net.de ([127.0.0.1])
	by localhost (linux-shhd.site [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTS6sccZNx88 for <linux-mtd@lists.infradead.org>;
	Sun, 18 Apr 2010 20:35:39 +0200 (CEST)
Received: from www.wegener-net.de (localhost [127.0.0.1])
	by wegener-net.de (Postfix) with ESMTP id 9F2984761
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Apr 2010 20:35:38 +0200 (CEST)
Message-ID: <079cd4cf4df1896c779040a2d18e41f5.squirrel@www.wegener-net.de>
Date: Sun, 18 Apr 2010 20:35:38 +0200
Subject: Changing u-boot paramters via nandwrite?
From: "Norbert Wegener" <nw@wegener-net.de>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: nw@wegener-net.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I have a Sheeva Plug and am experimenting with it.
At the U-Boot boot prompt I can change among others the boot parameters.
Is it possible to modify those boot parameters when the Plug has booted
into Linux via e.g. nandwrite and some parameters?
Is there any documentation that I might read?
Thanks
Norbert Wegener
