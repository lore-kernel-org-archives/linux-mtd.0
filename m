Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELc2q-00087V-7H
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2005 03:44:38 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Peter Grayson <pgrayson@realmsys.com>
In-Reply-To: <1128122579.6926.110.camel@localhost.localdomain>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<1128010237.6926.10.camel@localhost.localdomain>
	<loom.20050929T193349-733@post.gmane.org>
	<1128053984.6926.59.camel@localhost.localdomain>
	<loom.20050930T223859-922@post.gmane.org>
	<1128122579.6926.110.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sat, 01 Oct 2005 11:43:58 +0400
Message-Id: <1128152638.3546.12.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Great jffs2 speedup
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-09-30 at 17:22 -0600, Peter Grayson wrote:
> On Fri, 2005-09-30 at 21:15 +0000, Sergei Sharonov wrote:
> > Aha!!! Of course, CS reduced your time to first write down to seconds.
> > Could you repeat the test after the un-clean unmount (e.g. power off without
> > sync)? I bet the numbers will be very different. Probably you also need to 
> > be writing to flash during the power off to force full scan on startup.
> 
> I'll add this to my list of "things to try for the list".
Mount should be anyway fast enough with EBS but w/o CS. But
unfortunately:
1. your CPU will be busy for quite long time afterwords;
2. you will in general unable to write during that time - writers will
be blocked (sometimes they may write, though).

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
