Subject: Re: [Patch 04/18] include/linux/logfs.h
From: David Woodhouse <dwmw2@infradead.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
In-Reply-To: <18f622d94e9273fe6c93ef091fcec87c@kernel.crashing.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184205.GE8952@lazybastard.org>
	<200706032342.27252.arnd@arndb.de>
	<20070604091245.GF14823@lazybastard.org>
	<1180964303.25232.358.camel@pmac.infradead.org>
	<18f622d94e9273fe6c93ef091fcec87c@kernel.crashing.org>
Content-Type: text/plain
Date: Tue, 05 Jun 2007 16:53:55 +0100
Message-Id: <1181058836.16089.23.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>,
	linux-fsdevel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-05 at 17:49 +0200, Segher Boessenkool wrote:
> > It would be better if GCC had a 'nopadding' attribute which gave us 
> > what we need without the _extra_ implications about alignment.
> 
> That's impossible; removing the padding from a struct
> _will_ make accesses to its members unaligned (think
> about arrays of that struct).

It _might_ make accesses to _some_ of its members unaligned.

That's why I said 'without the __EXTRA__ implications about alignment'. 

Obviously the lack of padding has its own implications, but we don't
necessarily need to assume that the struct may be at arbitrary
locations.

-- 
dwmw2
