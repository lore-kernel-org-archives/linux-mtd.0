From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1107382472.21196.616.camel@tglx.tec.linutronix.de>
References: <20050202.135036.2985.7488@webmail13.lax.untd.com>
	<1107382472.21196.616.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Wed, 02 Feb 2005 22:20:23 +0000
Message-Id: <1107382823.12383.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CONFIG_MTD_PHYSMAP_START
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-02 at 23:14 +0100, Thomas Gleixner wrote:
> Keep your postings in the Mail thread by hitting the reply button.

His reply button is broken; his mailer doesn't conform to RFC2822.

Alex, please use a non-broken mailer if you want to use this forum.
Omitting 'Re:' from the subject to get round the automatic filtering
isn't acceptable either. All traffic from you will be trapped for
moderation until I'm sure you are behaving correctly.

The address 0x04000801 is definitely not correct for the physical
address of the start of flash. Consult your board documentation or
schematics and find the correct value.

-- 
dwmw2
