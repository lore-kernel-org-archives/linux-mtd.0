Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JhAF-0000O0-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 21:34:39 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6M00B5K7ZVK5@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 04 Dec 2002 23:04:44 +0100 (MET)
Date: Wed, 04 Dec 2002 23:02:44 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Problem: 51MB partition max size on jffs2
In-reply-to: <D3E3F7BC-07D3-11D7-937A-000393467F1A@arlut.utexas.edu>
To: Ken Offer <koffer@arlut.utexas.edu>
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200212042302.44177.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <D3E3F7BC-07D3-11D7-937A-000393467F1A@arlut.utexas.edu>
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

On Wednesday 04 December 2002 23:00, Ken Offer wrote:
> On Wednesday, December 4, 2002, at 11:47  AM, Thomas Gleixner wrote:
> > Latest CVS code ?
>
> I tried it with an older version (circa 20020819) and the latest code
> (20021202).  Same result.  I am going to try the change Dave Ellis
> <DGE@sixnetio.com> suggested.
Strange. Could you please tell me, what output the latest CVS code produces

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
