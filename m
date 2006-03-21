Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLhpx-0001w2-I2
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 09:28:34 -0500
Message-ID: <44200D27.2060404@intel.com>
Date: Tue, 21 Mar 2006 17:26:47 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>
> I'm back, sorry for the delay.
>
I'm sorry too. I just returned from vacations.

> But the thing is, if you look at get_chip(), you'll see that nothing can
> go and erase another flash sector when a write is suspended.  In other
> words, completion of a write operation always has priority on any erase
> attempt.  So the problem you're describing may not be due to any erase
> delay occurring in another thread.
>
Oh. Seems if XIP while write is happened get chip will not allow to erase?

> The only possibility I can see is that xip_udelay() is interrupted so
> often that the UDELAY(map, chip, cmd_adr, 1) call never gets a chance to
> make any progress, even in the course of a half second wall clock time.
>
> Do you have a high interrupt rate in your system?
>
Iterrupt rate is not high. It's about one per 10ms. I'm going to make 
some more investigations.
I would be happy to hear your suggestions.

Thanks a lot,
Alexey
