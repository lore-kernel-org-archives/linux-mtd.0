Date: Sat, 20 Nov 2004 15:13:21 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1100962661.8600.41.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.58.0411201512100.17041@phoenix.infradead.org>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
	<20041120145020.GA15782@synertronixx3>
	<1100962661.8600.41.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just to exclude the race errors, could you try to disable Preemption and 
try?

On Sat, 20 Nov 2004, David Woodhouse wrote:

> On Sat, 2004-11-20 at 15:50 +0100, Konstantin Kletschke wrote:
> > No, that does not help. I replaced my disabling #defines by the
> > lock<->unlcocp pair, no avail:
> 
> Hm, OK. I don't think the other patch is likely to fix it either then.
> I'll take another look.
> 
> Are you able to join us on IRC? Channel #mtd of irc.freenode.net
> 
> -- 
> dwmw2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
