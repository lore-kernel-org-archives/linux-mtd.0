Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157HdD-0004op-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 15:16:27 +0100
Message-ID: <3B1CEB15.FFB2EADB@daniel.com>
Date: Tue, 05 Jun 2001 09:22:13 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Bjorn Wesen <bjorn.wesen@axis.com>
CC: David Woodhouse <dwmw2@infradead.org>,
 	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush.
References: <Pine.LNX.4.21.0106051105110.1078-100000@godzilla.axis.se>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Bjorn Wesen wrote:

>
> I'd agree that to be really certain, a "flush_dcache()" function
> should be implemented and used when an erase finishes. Like David Miller
> wrote somewhere in the thread, one way is to use your knowledge of the
> arch's cache and do suitable dummy accesses to flush it, if there is no
> explicit command to do it. But that's just up to the arch coders..
>

Here's a stupid question: Are there any processors out there that have a cache
but no explicit cache-flush command?

If not (i.e. no such "funny" processors), then what's wrong with the arch
dependent include through a define to execute the
arch specific asm command?

The only issue (besides knowing the cache size at run time) that I can think
about the "dummy" eviction scheme is that you now need to xfer potentially 3
times the cache
size data to and from memory:

#1. The dummy read
#2. The eviction of the entire cache data being evicted
#3. The refilling of the cache with good data again, as the dummy data cannot
really represent anything useful.

Is my thinking here completely non coherent with others? ;)

Vipin
