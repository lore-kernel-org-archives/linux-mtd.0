Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AD8I-0003HH-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 17:04:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B278F1E.93244E39@daniel.com> 
References: <3B278F1E.93244E39@daniel.com>  <3B278787.2CD486C3@daniel.com> <Pine.LNX.4.33.0106131120100.23397-100000@xanadu.home> <31256.992447116@redhat.com> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: Nicolas Pitre <nico@cam.org>, Xavier DEBREUIL <xde@inventel.fr>,
    linux-mtd@lists.infradead.org
Subject: Re: root jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Jun 2001 17:10:02 +0100
Message-ID: <1796.992448602@redhat.com>
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

vipin.malik@daniel.com said:
>  David, that's an easy one. I'll just do a:
> $diff -u <new_version_that's_broken>   <old_version_that_worked>
> ;)


Where "broken" just isn't particularly convenient for you, and "worked" is 
the version that would wipe a cramfs root filesystem if jffs2 happened to 
be linked into the kernel first.

Quick way to get your CVS access revoked, that one :)

> More seriously, Nicolas just wrote that blank flash is not considered
> dirty and one can still mount a JFFS2 fs on it and hand populate it.

> Do you concur? 

No, we treat any block which is completely empty and doesn't contain a 
cleanmarker as dirty, because we can't be sure it was properly erased. 

How about changing the if(!c->used_size) at line 133 of scan.c to 
if(c->dirty_size) ?

Thinks... are we getting the accounting right in that case anyway? Why 
doesn't the final else case (/* Nothing valid... ) a few lines above change 
free_size?

--
dwmw2
