Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWBPw-0007OS-Vc
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 05:27:35 -0500
From: Ian Campbell <icampbell@arcom.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1100968467.7949.8.camel@localhost.localdomain>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
	<20041120145020.GA15782@synertronixx3>
	<1100962661.8600.41.camel@localhost.localdomain>
	<20041120163510.GD7984@ku-gbr.de>
	<1100968467.7949.8.camel@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 22 Nov 2004 10:27:29 +0000
Message-Id: <1101119250.2922.276.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-11-20 at 16:34 +0000, David Woodhouse wrote:
> On Sat, 2004-11-20 at 17:35 +0100, Konstantin Kletschke wrote:
> > Sadly I overlooked your other (cvs comitted) patch this evening and I am
> > at home now, what a pity... That would have cleared the situation up in
> > 5 minutes :/
> 
> No it wouldn't -- that isn't the problem either. I _think_ this is...

Just FYI, either this fix (to build.c) or the other one (to nodemgmt.c)
also fixed the BUG_ON I reported earlier in the month...

Many thanks! 
Ian.

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
