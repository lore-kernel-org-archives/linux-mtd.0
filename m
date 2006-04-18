Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FVoxb-000846-Uk
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 08:05:56 -0400
Date: Tue, 18 Apr 2006 14:05:27 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20060418120527.GB4720@wohnheim.fh-wedel.de>
References: <4444C8FD.1070406@inf.u-szeged.hu> <4444D18E.80104@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4444D18E.80104@yandex.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: A JFFS2 optimization related to syslog
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 April 2006 15:46:22 +0400, Artem B. Bityutskiy wrote:
> Ferenc Havasi wrote:
> >Dear All,
> >
> >If JFFS2 is used as root filesystem, syslogd/klogd can cause problems,
> >because every log line are written out individually, so the log file
> >will contain a lot of small nodes. Because a log file can be very large
> >(over 30M in our case) it can cause large memory consuption and can make
> >the system very slow, especially at opening it after next reboot
> >(becauseof the large frag-tree). Unforunatelly garbage collecting also
> >does not help, because none of the nodes is obsocalated.
> Hmm,
> 
> for this testcase you actually want to write entire page if this is the 
> last page of this file. But your patch writes entire page if the current 
> fragment ends at the end of page, which is different.
> 
> I mean, you probably want to do something like this instead:
> 
> if ((inode->i_size >> PAGE_CACHE_SHIFT) >= pg->index) {
>     /*
>      * This is the last page, so unconditionally re-write it fully.
>      */
>     start = 0;
> }

When appending single bytes to a file, this would be rather wasteful,
wouldn't it?  Ferenc's trick is to rewrite the full page only when
completing it, not all the time.

But it might make sense to only add the optimization for the end of a
file, which catches the syslog case and misses others where the
optimization would hurt more than it helps.

Jörn

-- 
You ain't got no problem, Jules. I'm on the motherfucker. Go back in
there, chill them niggers out and wait for the Wolf, who should be
coming directly.
-- Marsellus Wallace
