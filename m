Date: Wed, 12 Jan 2005 15:11:09 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41E52EAD.2090302@imc-berlin.de>
Message-ID: <Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
References: <41E4D6E5.1090407@imc-berlin.de> <41E4EDBE.8070302@inf.u-szeged.hu>
	<41E52EAD.2090302@imc-berlin.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Jan 2005, Steven Scholz wrote:

> Hi Ferenc,
> 
> Ferenc Havasi wrote:
> 
> > If I am right there are two kind of CRC: hdr_crc and node_crc. At 
> > mounting time only the hdr_crc is checked which depends on only the 
> > header. (using summary there is only one summary CRC check)
> > 
> > Later (when the data is readed or in the background by GC) the node_crc 
> > will also be checked. GC is running on a "niced" (10) priority, so it 
> > should not disturb any other process.
> Well, it does. On small, slow systems.
> 
> > If I am right the CRC protects against unclean reboots and hardware 
> > corruptions. If you need we can modify the summary patch not to check 
> > node_crc for summarized nodes (where the unclean reboots is no problem), 
> That would be nice.
> 
> > but if we do it you lose the ability to detect the hardware corruption 
> > (flash errors). Unfortunatelly NOR flash doesn't have any error detection.
> Well. I think when a sectors gots written correctly (and summary is correct), I 
> have to assume that the sector stay intact. So no need for checks.
> 
> If a sector got broken just by reading it then the whole embedded system is 
> broken and has to be replaced ...
This seems to be true for NOR. But  chrcking CRC helps at least *detect* 
and *report* media problems.

> 
> -- 
> Steven Scholz
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
