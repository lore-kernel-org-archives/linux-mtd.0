Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HSFrD-0008TG-Su
	for linux-mtd@lists.infradead.org; Fri, 16 Mar 2007 17:04:51 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: <dedekind@infradead.org>
Subject: RE: [PATCH] Obsolete nodes that are unlinked when possible
Date: Fri, 16 Mar 2007 18:04:42 +0100
Message-ID: <006e01c767ed$30828a40$0667a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1174062429.11160.10.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind@infradead.org] 
> Sent: den 16 mars 2007 17:27
> To: joakim.tjernlund@transmode.se
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: [PATCH] Obsolete nodes that are unlinked when possible
> 
> Hi Joakim,
> 
> On Fri, 2007-03-16 at 17:14 +0100, Joakim Tjernlund wrote:
> > Ouch, I just discovered that JFFS2_SUMMARY disables
> > jffs2_can_mark_obsolete(c). Is this really needed for all
> > obsolete cases?
> > 
> > SUMMARY really implies that a better automatic GC is needed, since
> > your
> > fs will be littered with deletion entries. 
> 
> I am not the author of this stuff, so I probably not the right person
> for CC :-)

Oh, I took your name from memory. Obviously my memory
can't be trusted anymore :) 

> But it is understandable why they did this - because 
> otherwise it would
> need marking corresponding entries in summary as obsolete, 
> and here you
> have a problem of an unclean reboot between marking the node and the
> summary entry obsolete.

Would bad things happen if an unclean reboot happens or will
you just loose some performance?

 Jocke

PS.
   Do you know whats wrong with the list? Havn't got any mail from
   it for a week.
