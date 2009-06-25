Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJyFS-00019N-5A
	for linux-mtd@lists.infradead.org; Thu, 25 Jun 2009 23:21:00 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1036236qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Jun 2009 16:20:52 -0700 (PDT)
Message-ID: <4A440651.9000409@billgatliff.com>
Date: Thu, 25 Jun 2009 18:20:49 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: Roger Lucas <roger@hiddenengine.co.uk>
Subject: Re: Longs spinlock on NOR reads
References: <1F23C41C60CC4CA08789AE8461EF6044@wolverine>
In-Reply-To: <1F23C41C60CC4CA08789AE8461EF6044@wolverine>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Roger Lucas wrote:
> Before going through the process of submitting patches etc., is this a 
> problem that has been identified or experienced before?  I have searched the
> mailing list but not seen any obvious references...
>   

I haven't seen the problem you are describing, but I haven't studied the
performance of JFFS2 down at those time levels.  Your problem
description sounds very reasonable, however, as does the proposed fix.

I think you'll probably get down to 7ms only if the compiler is doing a
lot of ldm/stm, which I'd be surprised to see.  But the overhead of a
function call for every 512 bytes might be measurable--- is there a
point within the lowest-level code that might be a good place to briefly
unlock and then re-lock the spinlock?  That would reduce the overhead of
the fix by avoiding the function call.

Regardless, if someone is paying attention to the numbers then they're
probably more concerned with the latency than throughput.  In that case,
if the only way to substantially improve latency is to take a
per-512-byte function call hit then I (for one) can live with that.

> If it seems a reasonable observation and fix, would you like me to post a 
> patch?  I can only patch and test the 'cfi_cmdset_0002.c' driver but it 
> would be a simple process for it to be applied to the other chips.
>   

Definitely post the patch.  Can't reject something we haven't seen.  :)

Maybe it needs to be surrounded by a CONFIG_MTD_<something> so that
people can turn it on or off via menuconfig.


b.g.
