Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17647T-0000Id-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 07:43:12 +0100
Received: from sitemail.everyone.net (dsnat [216.200.145.62])
	by omta03.mta.everyone.net (Postfix) with ESMTP id 289F449C42
	for <linux-mtd@lists.infradead.org>; Thu,  9 May 2002 23:43:10 -0700 (PDT)
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Thu, 9 May 2002 23:43:06 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: misc question about MTD
Reply-To: zeusj@firstlinux.net
Message-Id: <20020510064306.462BF2756@sitemail.everyone.net>
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

Hi, folks

when I am reading the code of MTD, I meet some questions :
1.in cfi_probe_chip(cfi_probe.c), what is an 'alias ' of a flash chip? is that the same flash chip mapping in different address?
2.if I send Query command (98h, I mean) twice, would the 'QRY' disappear? and if I send it once, can I read the 'QRY' for several times? (in my deduce , the answer of these two questions should be 'yes')

Thanks

Jim Zeus



_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
