Received: from ext-ch1gw-2.online-age.net ([216.34.191.36])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B4MA9-00049W-TU
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2004 15:43:58 +0000
Received: from int-ch1gw-2.online-age.net (int-ch1gw-2 [3.159.232.66])
	id i2JFhqll009980	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Mar 2004 10:43:53 -0500 (EST)
Received: from uswaumsxb1medge.med.ge.com (localhost [127.0.0.1])
	id i2JFhoEM029797	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Mar 2004 10:43:52 -0500 (EST)
Message-ID: <77FE4A1FA59FF947845A42194AD6676277319C@uswaumsx07medge.med.ge.com>
From: "Eisenhut, Daniel (MED)" <Daniel.Eisenhut@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 19 Mar 2004 09:43:39 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Block lock-bits
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is probably a silly question with a very simple answer, but I can't
find anything on this online, in code comments, or in any documentation.

I've set up MTD to use my NOR flash chips (Intel StrataFlash J3) and can
successfully read and write using /dev/mtdblock/X.  Now I need to be able to
set and clear the lock-bits on the individual blocks.  My question is how?
>From the user end of things accessing this mtdblock device, what do I have
to do to have the two-step commands sent?  It looks like the code is all
there to do it, but I don't know how to access it.

If there is a better place to send these type of questions, let me know.
Thanks for your time...

Dan
