Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AD8B-0003HC-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 17:04:31 +0100
Date: Wed, 13 Jun 2001 12:08:49 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: David Woodhouse <dwmw2@infradead.org>, Xavier DEBREUIL <xde@inventel.fr>,
        <linux-mtd@lists.infradead.org>
Subject: Re: root jffs2
In-Reply-To: <3B278F1E.93244E39@daniel.com>
Message-ID: <Pine.LNX.4.33.0106131207230.23397-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Wed, 13 Jun 2001, Vipin Malik wrote:

> More seriously, Nicolas just wrote that blank flash is not considered dirty
> and one can still mount a JFFS2 fs on it and hand populate it.

That was my belief.  It seemed logical.  I was aparently wrong.  I too
consider it a bug if it isn't that way.


Nicolas
