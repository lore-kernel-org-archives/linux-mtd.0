Date: Thu, 13 Jan 2005 15:05:16 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Jan 2005, Artem B. Bityuckiy wrote:

> > > P.S. By the way, we could put CRCs at the end of blocks (*after* data) 
> > > in this case CRC well be extremely strong detecting unclean reboots, 
> > > isn't it?
> >
> > Interesting idea.  Will make the code slightly messy, but it should be
> > worth it.
> Now I like this Idea more.
> 
> See the benefits:
> 1. We are able to use weaker then CRC32 checksums and still be good in 
> detecting wrong due to unclean reboot nodes.
> 2. We have principal ability to distingush between nodes corrupted due to 
> flash problems and due to unclean reboots.
> This is extreemly good do be able to distinguish. (JFFS2 has no such 
> ability). 
> 
> Examples:
> 	a. We will not print frightfull messges like "CRC ERROR!!!! 
> You'ra going to die!" and will not make users worry if the error was 
> cased by unclean reboot. Unclean reboots is qute frequent thing.
> 	b. When do iget() on file and see corrupted nodes, we just ignore 
> them if they are due to unclean reboot. But we return -EIO if they are due 
> to flash corruptions. Currently JFFS2 happily ignores corrupted nodes and 
> still keeps working with the corrupted file. That is no good.
> It is better, for example, to regect opening corrupted /lib/libc.o then 
> just open but corrupted file.
> 
> Thoughts?
Hmm, only one small note, putting CRC to the end does not allow us to 
recognize unclean reboots and flash media corruptions :-) But we still may 
do this putting some majic bitmask to the end of nodes.

> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
