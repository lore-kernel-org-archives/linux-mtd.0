Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta04.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1783km-0002GN-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 19:44:00 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Wed, 15 May 2002 11:43:59 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: "David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Quesion on copying to mtdblock0
Reply-To: zeusj@firstlinux.net
Message-Id: <20020515184359.301BD36F9@sitemail.everyone.net>
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

Hi, David

I've got some confusion:
1.Is the command"cp jffs.img /dev/mtdblock0" after booting result as same as to burn the jffs.img into flash chip(which is presented as mtdblock0)with kernel Image?
2.Is "cp somefile /dev/mtd0" as same as "cp somefile /dev/mtdblock0"?
3.by the way , May I know the reason that you dont register the master MTD like you register the MTD partition?(just like hda and hda1,2,3...)

Thanks in advance

Jim Zeus

_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
