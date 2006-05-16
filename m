From: David Woodhouse <dwmw2@infradead.org>
To: sebrlw@gmail.com
In-Reply-To: <a3cf34de0605161037x2ebff8a3w3b85dbd52d1bba6f@mail.gmail.com>
References: <a3cf34de0605161037x2ebff8a3w3b85dbd52d1bba6f@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 17 May 2006 00:35:05 +0100
Message-Id: <1147822505.30771.13.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Strange "raw node error"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-16 at 13:37 -0400, sebrlw@gmail.com wrote:
> I'm receiving the following message in my syslog.
> 
>    Raw node at 0x01c622c0 wasn't in node lists for ino #46
> 
> I'd like to know what might cause this problem.  I have looked at the
> driver source code, but it is not obvious to me what causes the error
> to occur.

It means that the physical node at location 0x01c622c0 was _supposed_ to
be part of inode #46 -- but when we opened inode #46 and then went
looking through its data nodes, we didn't _find_ the node we were
looking for.

This basically shouldn't happen. Is it repeatable? Every time you boot,
perhaps? Can you take a raw image of that flash chip?

-- 
dwmw2
