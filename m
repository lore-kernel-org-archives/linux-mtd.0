From: David Woodhouse <dwmw2@infradead.org>
To: Ed Co <edityacomm_knb@yahoo.com>
In-Reply-To: <20040824120929.1377.qmail@web52204.mail.yahoo.com>
References: <20040824120929.1377.qmail@web52204.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1093350246.14552.12435.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Aug 2004 13:24:06 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bottom halves being disabled
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-24 at 05:09 -0700, Ed Co wrote:
> Hi All,
> 
> In the NOR driver code, the spin locks are acquired
> everywhere with bottom halves disabled using the
> spin_lock_bh() API. My doubt is why are the bottom
> halves disabled? (Doesn't that add to the real time
> latency on the system!)
> 
> Hoping someone would clear the doubt

Because we intend the erase completion to be asynchronous, hence we lock
against the timers which may one day check for it. There's no real
reason we couldn't switch to spin_lock() for now.

-- 
dwmw2
