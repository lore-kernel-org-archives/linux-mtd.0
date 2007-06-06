Received: from mx2.suse.de ([195.135.220.15])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HvrOC-0001TM-De
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 05:01:14 -0400
From: Andreas Schwab <schwab@suse.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [Patch 04/18] include/linux/logfs.h
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184205.GE8952@lazybastard.org>
	<200706032342.27252.arnd@arndb.de>
	<20070604091245.GF14823@lazybastard.org>
	<1180964303.25232.358.camel@pmac.infradead.org>
	<18f622d94e9273fe6c93ef091fcec87c@kernel.crashing.org>
	<1181058836.16089.23.camel@hades.cambridge.redhat.com>
	<db91817d295770e459727005108b05e2@kernel.crashing.org>
	<1181119820.25232.434.camel@pmac.infradead.org>
Date: Wed, 06 Jun 2007 10:59:48 +0200
In-Reply-To: <1181119820.25232.434.camel@pmac.infradead.org> (David
	Woodhouse's message of "Wed\, 06 Jun 2007 09\:50\:20 +0100")
Message-ID: <jemyzdpiez.fsf@sykes.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>,
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

David Woodhouse <dwmw2@infradead.org> writes:

> Won't a simple struct { uint16_t } get padded to a size of 4 bytes on
> ARM? Even if I'm misremembering that, I certainly can't guarantee that
> such a thing will _never_ happen on any newly-invented ABI. If you had
> 'nopadding' instead of 'packed', then there's no need to emit code to
> handle unaligned loads.

You can add aligned(N) to increase the alignment again.

Andreas.

-- 
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstraße 5, 90409 Nürnberg, Germany
PGP key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
