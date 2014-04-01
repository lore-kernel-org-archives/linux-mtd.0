Received: from smtp10.mail.ru ([94.100.176.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV4JR-0003Qf-9a
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 19:25:35 +0000
Message-ID: <533B128C.7050603@list.ru>
Date: Tue, 01 Apr 2014 23:25:00 +0400
From: Stas Sergeev <stsp@list.ru>
MIME-Version: 1.0
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: nandwrite and contiguous space
References: <533A8749.4050802@list.ru>
 <20140401182350.GS2775@book.gsilab.sittig.org>
In-Reply-To: <20140401182350.GS2775@book.gsilab.sittig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

01.04.2014 22:23, Gerhard Sittig пишет:
> On Tue, 2014-04-01 at 13:30 +0400, Stas Sergeev wrote:
>> I am looking for a NAND flasher that supports searching
>> for the contiguous region of good blocks (within a specified
>> range), and flashes an image to it. It seems nandwrite - the
>> default linux flasher - can only skip bad blocks, but the scenario
>> I need, doesn't seem to be supported.
> Isn't the point that the set of good blocks keeps changing over
> time?  What might be good now, may be bad a second later or next
> year, doesn't matter as long as it won't stay good forever.
Hi, I think the point is that if they are no longer ever written,
they won't change its goodness...
Anyway, this is how the ST soc chips work.
They search NAND for a specific signature, and once
found, they map the contiguous block, starting from
that signature, to memory, which allows to run u-boot
in a nor-alike fashion. They do not do BBT lookups when
mapping, AFAIK, and so such a requirement for flasher
does exist.

>> Is there any other flasher that does support this?
>> Or maybe some trick with nandwrite exists?
>> If not, how difficult is it to implement such a capability into
>> nandwrite?
> If you want a sequence of good blocks, this very much sounds like
> the LEBs which UBI provides.  Aren't you asking for an UBI
> volume?  What am I missing?
Unfortunately, I don't think the aforementioned ST chips
can boot from UBI. Once booted, I want UBI for sure.
But the only alternative to the aforementioned requirement
would be to assume that 2 first blocks are good, and fit
u-boot there, and it they are bad - throw away such a nand.
I am considering this too, but I wonder how many nands
will be wasted this way... Likely none, but who knows. :)
