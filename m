Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPORY-00084h-Vh
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 21:47:36 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Received: from [IPv6:::1] ([74.59.45.108]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KDS00L9MHV6OHB0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 16:47:30 -0500 (EST)
Message-id: <C23A12FF-63CB-4E5C-B200-9FFCBBB0CFA4@b2n.ca>
From: David Bergeron <mho.linux-mtd@b2n.ca>
To: dedekind@infradead.org
In-reply-to: <1232442090.22350.45.camel@localhost.localdomain>
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
Date: Tue, 20 Jan 2009 16:47:29 -0500
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1231397205.6608.119.camel@localhost.localdomain>
	<A64FA742-7434-4BAD-9CCC-8BED4D4F7326@b2n.ca>
	<1232355362.31319.16.camel@localhost.localdomain>
	<3A5BB4FC-6A13-4B8A-94B2-80FCF75E2BBF@b2n.ca>
	<1232442090.22350.45.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2009-01-20, at 4:01, Artem Bityutskiy wrote:
> Yeah, our current theory is that you have your script running, which
> means it is opened, and it is orphan now, and you re-mount the FS R/O,
> and end up with a R/O FS + an orphan. We never considered this  
> scenario
> before. And the scenario is a little nasty because UBIFS may want to
> write when you release the orphan (close the file), but the FS is R/O.
> We'll work on this, thanks for excellent bug description!


I'm afraid I've misguided you here. It's actually not the case. The  
script is *not* open when I re-mount r/o, the kernel simply will not  
allow that to happen, and I get a "Device or resource busy" error if I  
even try.

considering:

exec /bin/sh -xc "lsof; sync; sleep 2; lsof; sync; sleep 2; \
                   mount -o remount,ro /; sleep 2; reboot -df;"

The running & orphaned script is history as soon as 'exec'. lsof  
confirms this. UBIFS gets two sync() + 4 seconds before the filesystem  
goes read-only to clean up, it should be plenty of time and opportunity.

There's gotta be something else. Especially since it doesn't break if  
I tell the kernel to mount 'rw' in the first place (bad practice, but  
a possible temporary workaround for me nonetheless).

One thing I wonder, UBIFS itself mentions "UBIFS: mounted read-only",  
is it just information for the human reader? or is UBIFS perhaps  
behaving as in read-only operation somewhere, even /after/ becoming  
writable, which could cause it mishandle the cleaning up of the orphan?

I very much appreciate all the time you've put looking at this.

Best regards,
-david
