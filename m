From: David Woodhouse <dwmw2@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce050113103077c06b4d@mail.gmail.com>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
	<1105569824.3896.44.camel@weaponx.rchland.ibm.com>
	<6934efce05011214553465438@mail.gmail.com>
	<1105631437.15265.12.camel@weaponx.rchland.ibm.com>
	<6934efce050113103077c06b4d@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 13 Jan 2005 18:36:53 +0000
Message-Id: <1105641413.26551.230.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-13 at 10:30 -0800, Jared Hulbert wrote:
> I think it says it's worth adding a no-checksum option to serve this
> potential userbase that just doesn't need the checksums but does need
> the speed.

You may be right. That doesn't make me relish the thought of providing
support to people who do that though :)

Perhaps we could make it a mount option, and that way it's easy enough
for people to turn it on if they have problems, before we'll talk to
them about it.

-- 
dwmw2
