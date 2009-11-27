Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NE1hQ-000103-N0
	for linux-mtd@lists.infradead.org; Fri, 27 Nov 2009 14:21:32 +0000
Subject: Re: UBIFS synchronisation questions about file create/delete
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4B0FD7D9.5060904@nokia.com>
References: <001301ca6edc$5fc49660$1f4dc320$@dierckx@telenet.be>
	<4B0F8B78.5080405@nokia.com>
	<000001ca6f65$4752a8e0$d5f7faa0$@dierckx@telenet.be>
	<4B0FD7D9.5060904@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Nov 2009 16:21:00 +0200
Message-Id: <1259331660.7518.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ronny Dierckx <ronny.dierckx@telenet.be>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-11-27 at 15:44 +0200, Adrian Hunter wrote:
> > I tried some different versions from
> > git://git.infradead.org/~dedekind/ubifs-v2.6.27.git
> > and the problem is caused by commit " UBIFS: fix 64-bit divisions in debug
> > print " 
> > 9d016dc4b3006ef3493b21442394028614e26da5 :
> > 
> > dbg_io("set timer for jhead %d, %llu millisecs", wbuf->jhead,
> > -       ktime_to_ns(wbuf->hardlimit)/USEC_PER_SEC);
> > -       hrtimer_start(&wbuf->timer, wbuf->hardlimit, HRTIMER_MODE_REL);
> > +       div_u64(ktime_to_ns(wbuf->hardlimit), USEC_PER_SEC)); 
> > }
> > 
> > As you can see the timer is no longer started. Could you please fix this ?
> 
> It is Artem's git tree.
> 
> Artem, can you look at this?

Done.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
