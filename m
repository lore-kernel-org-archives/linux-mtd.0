Date: Fri, 28 Jan 2005 08:50:31 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <1106857409.21196.58.camel@tglx.tec.linutronix.de>
Message-ID: <Pine.LNX.4.58.0501280849500.11160@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
	<1106857409.21196.58.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> That's just imagination. Analyse a couple of JFFS2 images to figure out
> how many 4k multiple data chunks you have. Those which are live usually
> in a part of the filesystem which is almost never updated
> (/bin, /lib ....) on embedded systems.
Hmm, I tend to agree with you.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
