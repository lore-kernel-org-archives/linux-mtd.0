Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFOiP-0007xL-UA
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 00:54:36 -0500
Date: Fri, 9 Feb 2007 05:50:14 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH] UBI: introduce sequential counter
Message-ID: <20070209055014.GA21893@lazybastard.org>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1170972968.4884.140.camel@zod.rchland.ibm.com>
Cc: MTDML <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 February 2007 16:16:02 -0600, Josh Boyer wrote:
>
> > 3. in the wear-leveling code we can distinguish between LEBs which were
> >    written to long time ago and recently. Indeed, if the sequential number
> 
> No you can't.

Yes, you can. :)

> You cannot determine time and rate from a simple counter
> number.  All you can determine is that LEB N is older than LEB M.  It
> could be older by 40 seconds, or older by 5 years.

This is an unusual way of looking at time, but it is perfectly valid.
Whether an LEB is 40 seconds or 40 million years old is completely
inconsequential.  What matters is not how much wall-clock time has
passed, but how much other data was written.  "Bytes of data written" is
a valid unit of time, really, and a very useful one.  Esp. for wear
leveling decisions.

Congratulations, Artem!

> Yes, this might help wear-leveling.  But if the data is used, I would
> recommend being very conservative about using the counter value to
> distinguish between "static" and "non-static" data.

Having a hard distinction between static and non-static data sounds bad,
agreed.  What this can (and will, in LogFS) be used for is not doing GC
on new data, if possible.  The newer your data, the higher the chances
of it becoming obsolete in the near future anyway.  So letting it sit
until it ages a little makes sense.

UBI is a bit coarser, as it has no clue about the LEB contents, but a
similar strategy may still make sense.

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
