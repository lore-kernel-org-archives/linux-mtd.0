Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QkBA8-0001he-KY
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2011 08:32:49 +0000
Received: by pzk1 with SMTP id 1so3336742pzk.16
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jul 2011 01:32:45 -0700 (PDT)
Subject: Re: Can major re-organization activities of the UBIfs be
	"deliberately provoked"?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Fri, 22 Jul 2011 11:34:02 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A7208F97E@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD32A7208F97E@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311323646.20707.18.camel@sauron>
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

On Thu, 2011-07-21 at 09:33 -0400, Atlant Schmidt wrote:
> Folks:
> 
>   We're using the UBIfs with our realtime equipment. We've
>   noticed a behavior where, every so often, the flush-ubifs
>   thread demands very, very large amounts of CPU time, blocking
>   all of our other processes that use the Linux time-sliced
>   scheduler. These bursts come at arbitrary intervals but
>   commonly last ten to fifteen seconds.

If the bursts are probably dues to write-back which is initiated by VFS.
When UBIFS is doing write-back it needs to compress data, it may need to
do GC if there is not space.

First - check if the bursts are indeed about write-back - change the
period of write-back and see. Or type sync and see the utilization. Then
you can play with VFS knobs and lessen the write-back intervals
in /proc.


-- 
Best Regards,
Artem Bityutskiy
