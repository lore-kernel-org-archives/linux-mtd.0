Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKvTX-00026V-VR
	for <linux-mtd@lists.infradead.org>; Sat, 15 Nov 2003 08:08:12 +0000
To: Joshua Wise <joshua@joshuawise.com>
References: <200311150109.39539.joshua@joshuawise.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 15 Nov 2003 01:08:24 -0700
In-Reply-To: <200311150109.39539.joshua@joshuawise.com>
Message-ID: <m3ptfuoxzb.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Sender: "Eric W. Biederman" <eric@lnxi.com>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joshua Wise <joshua@joshuawise.com> writes:

> I'm thinking two things here: 1) I'm assuming that the unlock address verify 
> is just paranoia. Can I nuke that? (Will it break anyone's board?)

It will break things.  Some flash chips will ID but nothing else with
the wrong unlock address.  So without the test some boards will not
work.

> and 2) Is 
> there a better way to say that we should be left-shifting all the unlock 
> addresses over?

I am wondering if your map driver could handle that.  Either or
a solution like LART endian might be appropriate.

Handling flash chips that are connected up peculiarly seems to be
a recurring theme.  If this isn't something the map driver can't do
we may want to enhance that interface so it can handle more peculiar
cases in the future.

Eric
