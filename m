Received: from mail-in-02.arcor-online.net ([151.189.21.42])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HvbHS-0007rn-6F
	for linux-mtd@lists.infradead.org; Tue, 05 Jun 2007 11:49:12 -0400
In-Reply-To: <1180964303.25232.358.camel@pmac.infradead.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184205.GE8952@lazybastard.org>
	<200706032342.27252.arnd@arndb.de>
	<20070604091245.GF14823@lazybastard.org>
	<1180964303.25232.358.camel@pmac.infradead.org>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <18f622d94e9273fe6c93ef091fcec87c@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [Patch 04/18] include/linux/logfs.h
Date: Tue, 5 Jun 2007 17:49:01 +0200
To: David Woodhouse <dwmw2@infradead.org>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@lazybastard.org>,
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

> It would be better if GCC had a 'nopadding' attribute which gave us 
> what
> we need without the _extra_ implications about alignment.

That's impossible; removing the padding from a struct
_will_ make accesses to its members unaligned (think
about arrays of that struct).


Segher
