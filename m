Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q8NL-0005cK-W3
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:23:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <3EE756EA.6040001@imc-berlin.de>
References: <3EE752EE.8090902@imc-berlin.de>
	 <1055347637.2097.240.camel@passion.cambridge.redhat.com>
	 <3EE754E4.7080800@imc-berlin.de>
	 <1055348281.2097.245.camel@passion.cambridge.redhat.com>
	 <3EE756EA.6040001@imc-berlin.de>
Message-Id: <1055348617.2097.253.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 17:23:37 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Stopping the GC thread?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 17:20, Steven Scholz wrote:
> So for now I just could hardcode the thresholds (ehm which BTW?) to 
> some low value, recompile and test?

Hacking the thread_should_wake() function to _always_ return 1 ought to
suffice.

Don't leave it running for ever on a flash chip you actually want to
continue working though :)

-- 
dwmw2
