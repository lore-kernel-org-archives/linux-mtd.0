Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16q8Na-0001Fw-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 08:01:58 +0000
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Wed, 27 Mar 2002 00:01:51 -0800 (PST)
From: Jim Zeus <zeusj@firstlinux.net>
To: "David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Reply-To: zeusj@firstlinux.net
Message-Id: <20020327080151.2CD8C36F9@sitemail.everyone.net>
Subject: (no subject)
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

Hi,David
    Can you tell me why only my mtd char device with even minor deivce number works? and there is no such thing happened on my mtd block device.

and I find that in drivers/mtd/mtdchar.c/mtd_open there is a line :
	int devnum = minor >> 1;
I think if this is the reason, the odd mtd char devs should works just like the even devs, 
that means the dev1 should be the same thing as dev0,and dev3==dev2... isnt it?

Thanks

Jim Zeus

_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com from Everyone.net  http://www.everyone.net?tag
