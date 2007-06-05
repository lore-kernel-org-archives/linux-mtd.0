Received: from mail.tmr.com ([64.65.253.246] helo=gaimboi.tmr.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hvftz-0002jM-TR
	for linux-mtd@lists.infradead.org; Tue, 05 Jun 2007 16:45:29 -0400
Message-ID: <4665C9FA.5060207@tmr.com>
Date: Tue, 05 Jun 2007 16:39:22 -0400
From: Bill Davidsen <davidsen@tmr.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [Patch 04/18] include/linux/logfs.h
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184205.GE8952@lazybastard.org>
	<200706032342.27252.arnd@arndb.de>
	<20070604091245.GF14823@lazybastard.org>
	<1180964303.25232.358.camel@pmac.infradead.org>
	<18f622d94e9273fe6c93ef091fcec87c@kernel.crashing.org>
In-Reply-To: <18f622d94e9273fe6c93ef091fcec87c@kernel.crashing.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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
	Thomas Gleixner <tglx@linutronix.de>, Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Segher Boessenkool wrote:
>> It would be better if GCC had a 'nopadding' attribute which gave us what
>> we need without the _extra_ implications about alignment.
>
> That's impossible; removing the padding from a struct
> _will_ make accesses to its members unaligned (think
> about arrays of that struct).
And many platforms happily support unaligned CPU access in hardware at a 
price in performance, while other support it in software at great cost 
in performance. None of that maps into impossible, Some i/o hardware may 
not support at all and require some bounce buffering, at cost in memory 
and CPU.

None of that equates with impossible. It is readily argued that it could 
mean inadvisable on some architectures, slow as government assistance 
and ugly as the north end of a south-bound hedgehog, but it's not 
impossible.

Do NOT take this to mean I think it would be a good thing in a Linux 
kernel, or that it should be added to gcc, but in some use like embedded 
applications where memory use is an important cost driver, people are 
probably doing it already by hand to pack struct arrays into minimal 
bytes. It's neither impossible nor totally useless.

-- 
bill davidsen <davidsen@tmr.com>
  CTO TMR Associates, Inc
  Doing interesting things with small computers since 1979
