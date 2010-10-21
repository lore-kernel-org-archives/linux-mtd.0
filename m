Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8qcI-0003dR-L9
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 08:35:20 +0000
Received: by fxm15 with SMTP id 15so3562341fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 01:35:17 -0700 (PDT)
Subject: Re: ubifs: sync() causes writes even if nothing is changed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Adrian Hunter
	<adrian.hunter@nokia.com>
In-Reply-To: <4CBFF865.9010706@linutronix.de>
References: <20101013163005.GB1889@silverbox.local>
	<1287581218.9272.67.camel@localhost> <4CBFF865.9010706@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Oct 2010 11:32:11 +0300
Message-ID: <1287649931.2932.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Hans J. Koch" <hjk@linutronix.de>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-21 at 10:23 +0200, Sebastian Andrzej Siewior wrote:
> Artem Bityutskiy wrote:
> >> From a quick glance at the ubifs code, this might come out of the
> >> garbage collector that is triggered on every sync() and writes
> >> something even if nothing has changed.
> >>
> >> Is that really needed?
> > 
> > I briefly looked, and UBIFS is doing a lot of I/O in that case, which is
> > unnecessary and should not be done, I'll need to investigate this.
> 
>  From what I've seen from the code there are two parts:
> - writing "unwritten" data (the write back part I guess). Nothing is done
>    here as long as no data is queued
> - writing the journal. The first step seems to be to write a node "begin
>    write" and the last one is "end write".
> 
> Since hjk sees only two erases I would guess that they are initiated by 
> the "journal begin" & "end" requests.

Yeah, the UBIFS must be writing the commit start and commit end nodes,
and then erasing the previous log LEB (all this is done in log.c). As
soon as I have time I'll look at this, I really do not have time right
now. And there is Matthiew's problem which is actually quite big, but
for some reasons affects only him :-)

May be it is just matter of looking at all journal heads and if they are
empty, do nothing and return from ubifs_commit().

Adrian, would you help with this, may be?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
