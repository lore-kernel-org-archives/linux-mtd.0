Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta02.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16l4pH-00007c-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 09:13:40 +0000
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Wed, 13 Mar 2002 01:25:05 -0800 (PST)
From: Jim Zeus <zeusj@firstlinux.net>
To: "David  Woodhouse" <dwmw2@infradead.org>,
	"David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: why the kernel doesnt work
Reply-To: zeusj@firstlinux.net
Message-Id: <20020313092505.3D9472756@sitemail.everyone.net>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

HI , David 
 
I am trying to add a intel 28f128 strataflash to perseus borad 
I think what I should do is just to:
1.create a file named perseus-flash.c in /drivers/mtd/maps based on physmap
2.modify the Config.in and Makefile in the same directory
3.set the configuration and remake the kernel image to restart

is that right? and if it is,what should happen or how can i check whether the flash works well.

thanks

_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com from Everyone.net  http://www.everyone.net?tag
