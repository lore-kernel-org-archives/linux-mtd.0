Received: from wproxy.gmail.com ([64.233.184.197])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgqEm-0000qd-0B
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 15:04:05 -0500
Received: by wproxy.gmail.com with SMTP id 67so6794wri
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Dec 2004 12:04:02 -0800 (PST)
Message-ID: <1f9886eb04122112011e89a5f4@mail.gmail.com>
Date: Tue, 21 Dec 2004 14:01:35 -0600
From: xemc <xemcnet@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1103632766.6111.74.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <20041217231645.79122.qmail@web52701.mail.yahoo.com>
	<1103632766.6111.74.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Rootfs choice ideas
Reply-To: xemc <xemcnet@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > And we can modify files freely.
> 
> Yes but you don't _have_ to modify files freely. You can exercise a
> little restraint :)

Well, perhaps you don't know me too well.  =]  But you have a good point.

> Yes. This is usually done in packages -- by RPM or more usefully on an
> embedded system by something smaller like ipkg. Take a look at the
> Familiar distribution.

Thanks, I will do that.  I guess I just haven't thought along those lines.

> 'rpm -Vva'
> 
> Not sure if ipkg stores checksums of the installed files.

Aha.  Well, I'd have to say I've never used rpm before.  I usually use
Slackware, just starting with Debian (laptop) and Gentoo (x86-64
desktop)
 
> >  3. I could perhaps run into problems when updating it, for
> > instance if the update fails part-way through.
> 
> You reattempt the update after you come back up.

If I can come back up with a partially failed update.  But yes, the
same thing can be done that I was proposing, but using packages on a
JFFS2 filesystem as well.

> Basically it's up to you -- if you can manage to live with a read-only
> file system, as presumably you could since you seem to consider
> writeability a disadvantage, then you might as well stick with cramfs.

Well, I suppose I considered it a disadvantage when I don't need it. 
My idea was to partition read-only areas (maybe CRAMFS) separately
from a read-write area (JFFS2).  But there seem to be multiple ways of
doing this.

Thanks for your feedback.  It is appreciated, and I'll mull over it for a bit.

Mike
