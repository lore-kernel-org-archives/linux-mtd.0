From: David Woodhouse <dwmw2@infradead.org>
To: Dan Eisenhut <deisenhut@wi.rr.com>
In-Reply-To: <1080221409.21277.30.camel@localhost>
References: <1080221409.21277.30.camel@localhost>
Content-Type: text/plain
Message-Id: <1080222037.29835.50.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 25 Mar 2004 13:40:37 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: do_erase_oneblock failing to detect lock-bit failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-25 at 07:30 -0600, Dan Eisenhut wrote:
> Is byte-lane swapping common?  

Not really. It's generally a symptom of hardware engineers who really
don't understand the problem, and think it might help.

> Wouldn't this code fail for someone
> without byte-lane swapping but requiring little endian enabled?  By
> changing the if statements with (chipstatus & 0xNN) with (status &
> CMD(0xNN)) appears to correct my problem, but I sure this is not the
> best solution.

You made me think about it again and now my head hurts. I suspect that
we should be using cfi_read_query() to read the status bits, not
cfi_read(). 


-- 
dwmw2
