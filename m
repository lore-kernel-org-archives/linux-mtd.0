Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AD0t-0003Fd-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 16:56:59 +0100
Message-ID: <3B278F1E.93244E39@daniel.com>
Date: Wed, 13 Jun 2001 11:04:46 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Nicolas Pitre <nico@cam.org>, Xavier DEBREUIL <xde@inventel.fr>,
 	linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <3B278787.2CD486C3@daniel.com>  <Pine.LNX.4.33.0106131120100.23397-100000@xanadu.home> <31256.992447116@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:

> > If so, then I lodge my official protest!
>
> Protests are only accepted in 'diff -u' form. :)
>

David, that's an easy one. I'll just do a:

$diff -u <new_version_that's_broken>   <old_version_that_worked>

;)

More seriously, Nicolas just wrote that blank flash is not considered dirty
and one can still mount a JFFS2 fs on it and hand populate it.

Do you concur?

Vipin
