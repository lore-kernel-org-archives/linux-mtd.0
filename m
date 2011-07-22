Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QkDQS-0003QE-Ld
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2011 10:57:49 +0000
Received: by pzk1 with SMTP id 1so3523082pzk.16
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jul 2011 03:57:44 -0700 (PDT)
Subject: RE: Can major re-organization activities of the UBIfs be
	"deliberately provoked"?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Fri, 22 Jul 2011 13:59:01 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A7208F982@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD32A7208F97E@dekaexchange07.deka.local>
	<1311323646.20707.18.camel@sauron>
	<0A40042D85E7C84DB443060EC44B3FD32A7208F982@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311332345.20707.22.camel@sauron>
Mime-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-07-22 at 06:50 -0400, Atlant Schmidt wrote:
> Artem:
> 
>   Thanks! We've already tuned the Linux page cache
>   to be quite a lot less bursty (for example, by
>   decreasing the dirty_expire_centisecs from 3000
>   (30 seconds) to 500 (5 seconds); this substantially
>   removed the burstiness associated with the VFS
>   (and the associated pagecache flushing tasks).
> 
>   Now, though, we assume we're up against garbage
>   collection in the UBIfs so we wonder if there's
>   a way to make *THAT* operation either:
> 
>     1. Less bursty (perhaps by making it run more
>        often but have less work to do at each run),
>        or
> 
>     2. Externally schedulable so we could cause it
>        to occur when we have idle CPU time and its
>        running won't affect the realtime behavior
>        of the rest of our system.
> 
>   Can either of those things be done?

Yes, I think both can be done. Someone just needs to do this :-)

-- 
Best Regards,
Artem Bityutskiy
