Date: Fri, 17 Dec 2004 17:08:23 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
In-Reply-To: <1103302002.15927.198.camel@squizzey.bult.co.uk>
Message-ID: <Pine.LNX.4.58.0412171702310.15617@phoenix.infradead.org>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<1103288058.3018.4.camel@weaponx.rchland.ibm.com>
	<1103297611.15917.184.camel@squizzey.bult.co.uk>
	<41C3030D.8040607@us.ibm.com>
	<1103302002.15927.198.camel@squizzey.bult.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Dec 2004, Gareth Bult (Encryptec) wrote:

> On Fri, 2004-12-17 at 10:02 -0600, Josh Boyer wrote:
> > For disk devices I don't think it's required, but it could help.  Or 
> > maybe your code does this at the MTD level.  I dunno.  I could be 
> > spouting nonsense again ;).
> 
> Mmm, as long as writes are aligned on 2k pages and are linear / 
> unidirectional, I'm not sure anything else is really a problem 
> for USB flash drives ..
> 
> > Yes, it is a Journaled _Flash_ File System.  So of course it's written 
> > for MTD devices.  Not sure why blkmtd.c was originally written.  Test 
> > vehicle for JFFS2, "why not", "I'm bored", etc.  Who knows? :)
> 
> Mm, my point exactly , Journaled _Flash_ File System - as opposed to
> Journaled _MTD_ _Flash_ File System .. !!
> 
> USB flash is still flash! - just presented via a generic interface as
> opposed to an embedded one .. (AFAIK)
> 
> I guess I was sort of hoping blkmtd.c was written to enable JFFS2 to be
> more generic and embedded device independent. I suspect however it was
> written purely for testing purposes .. :(
> 
> As I understand it, the Flash in USB keys is identical to the MTD type
> embedded devices, except that the USB keys always come with
> micro-controllers that handle and optimise read/write/erase operations
> and present them via a generic PC/USB based disk interface. I'm not sure
> how fast MTD can be driven, but key manufacturers seem to think that
> keys should be able to run at 20Mb/sec read and 10Mb/sec write [for
> large block read/writes] which is much faster than is required for a key
> to replace a hard disk in a workstation.
> 
> I'm thinking that JFFS2 could draw in a huge additional user base if it
> catered for (or at least supported) such devices .. (!

My understanding was that it is only seen as SCSI block device from 
outside. E.g. it is not possible, say, to erase sector, to write one 
page, etc. If so, just foget about JFFS2 on that, IMHO.

> 
> Gareth.
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
