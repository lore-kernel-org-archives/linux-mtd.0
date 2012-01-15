Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RmNvL-0008VF-7R
 for linux-mtd@lists.infradead.org; Sun, 15 Jan 2012 11:06:56 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
 <1326183912.8847.10.camel@sauron.fi.intel.com>
 <4F0E567F.8020405@newsguy.com>
Date: Sun, 15 Jan 2012 12:06:44 +0100
In-Reply-To: <4F0E567F.8020405@newsguy.com> (Mike Dunn's message of "Wed, 11
 Jan 2012 19:41:51 -0800")
Message-ID: <87y5t9xm0r.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> On 01/10/2012 12:25 AM, Artem Bityutskiy wrote:
>>
>> Would be nice if DoC guys could also fix huge amount of GCC warnings -
>> there are DoC I/O macro definitions which produce a warning every time
>> they are used - very annoying noise. I guess those macros can be turned
>> into static inline functions? Would someone take the initiative?
>
>
> Yeah, this thought crossed my mind every time I recompiled while working on the
> aborted api change patches.  Gives DoC a bad name.  I'll get to it shortly.
>
> Ping Robert.  Care to take a look at the G4 driver?

I looked through. It looks good to me.
I have one warning remaining (on top of Linus tree):
drivers/mtd/nand/docg4.c: In function '__check_ignore_badblocks':
drivers/mtd/nand/docg4.c:52: warning: return from incompatible pointer type

My feeling is that the driver is good to be sent upstream, with my:
Reviewed-by: Robert Jarzmik <robert.jarzmik@free.fr>

If anything comes up, it can be fixed later, and I think we should go forward.

Cheers.

--
Robert
