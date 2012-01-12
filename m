Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlBYX-0007zj-LW
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2012 03:42:27 +0000
Message-ID: <4F0E567F.8020405@newsguy.com>
Date: Wed, 11 Jan 2012 19:41:51 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
 <1326183912.8847.10.camel@sauron.fi.intel.com>
In-Reply-To: <1326183912.8847.10.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: robert.jarzmik@free.fr, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/10/2012 12:25 AM, Artem Bityutskiy wrote:
>
> Would be nice if DoC guys could also fix huge amount of GCC warnings -
> there are DoC I/O macro definitions which produce a warning every time
> they are used - very annoying noise. I guess those macros can be turned
> into static inline functions? Would someone take the initiative?


Yeah, this thought crossed my mind every time I recompiled while working on the
aborted api change patches.  Gives DoC a bad name.  I'll get to it shortly.

Ping Robert.  Care to take a look at the G4 driver?

Thanks,
Mike
