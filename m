From: David Woodhouse <dwmw2@infradead.org>
To: Selwyn Tang <selwyn@hectrix.com>
In-Reply-To: <3F7D31B7.7020400@hectrix.com>
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
	 <3F7CD9CA.5090805@hectrix.com>
	 <1065160480.16088.0.camel@imladris.demon.co.uk>
	 <3F7D31B7.7020400@hectrix.com>
Content-Type: text/plain
Message-Id: <1065171167.22491.53.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 03 Oct 2003 09:52:47 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: high cpu usage using nftl for DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-03 at 16:22 +0800, Selwyn Tang wrote:
> The followings, among others, are reported by readprofile:
> 
>   147 handle_IRQ_event			1.5978
>    17 ide_outb				1.4167
>  3288 _DoC_Delay			32.8800
>  6634 __rdtsc_delay			236.9286
> 
> I don't know how to interpret them :-)

Run it through 'sort -n'. Ignore the third column; the first tells you
how many times, when a timer tick happened, we interrupted the function
named in the second column.

So on 147 occasions when the timer tick happened, the CPU was in
handle_IRQ_event(). During the period of this profiling run, we
(statistically speaking) spent about 1.47 seconds in that function.

We also spend 33 seconds in _DoC_Delay() and 66 seconds in
__rdtsc_delay(). It looks like the flash is very busy. Can you show me
the rest of the profile too?

Also, can you reset the profile counts (readprofile -r) and get a
reading from the time when it's doing this alone, rather than including
everything from boot onwards.

If it does it only sometimes, is there any pattern to when it starts or
stops?

-- 
dwmw2
