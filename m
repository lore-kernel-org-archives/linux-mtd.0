From: David Woodhouse <dwmw2@infradead.org>
To: karim@opersys.com
In-Reply-To: <3FB17F30.7090006@opersys.com>
References: <3FB17F30.7090006@opersys.com>
Content-Type: text/plain
Message-Id: <1068631075.10450.3.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 12 Nov 2003 09:57:56 +0000
Content-Transfer-Encoding: 7bit
cc: Linux-MTD <linux-mtd@lists.infradead.org>
Subject: Re: Problems with NFTL in 2.4.22
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-11-11 at 19:30 -0500, Karim Yaghmour wrote:
> I haven't seen anything in the archives about this, so here goes:
> 
> I've had quite a few problems trying to interface with an 8MB DOC with
> 2.4.22. The system would simply freeze when I tried doing things like
> mount, unmount, mke2fs, cat fs image to device, etc. No oops no nothing,
> just the tools would not return to the command line and I'd have to
> hard-reset the system.

Did you get a backtrace of the offending process(es) with SysRq-T?

I suspected it might be because we're calling cond_resched() when one of
our callers has already set current->state to TASK_UNINTERRUPTIBLE. But
I've had a report that it still happens in the current CVS code, in
which that definitely shouldn't be the case. Can you confirm that?

-- 
dwmw2
