Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ACkL-0003DU-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 16:39:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B278787.2CD486C3@daniel.com> 
References: <3B278787.2CD486C3@daniel.com>  <Pine.LNX.4.33.0106131120100.23397-100000@xanadu.home> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: Nicolas Pitre <nico@cam.org>, Xavier DEBREUIL <xde@inventel.fr>,
    linux-mtd@lists.infradead.org
Subject: Re: root jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Jun 2001 16:45:16 +0100
Message-ID: <31256.992447116@redhat.com>
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
>  Does this mean that you can no longer mount JFFS2 on an erased
> (blank) flash mtd device and hand populate the blank fs ?

It refuses to mount if it would be erasing some blocks to start with and
it's found no valid nodes. Thinks.... if the device is completely 
pre-erased then it'd be erasing every block 'to make sure', so it'd fail to 
mount. 

We could special-case this - if the device _was_ entirely empty beforehand 
- if it contained only 0xFF, then we can go ahead with the mount. Only if 
it actually had some data on should we fail.

> If so, then I lodge my official protest!

Protests are only accepted in 'diff -u' form. :)


--
dwmw2
