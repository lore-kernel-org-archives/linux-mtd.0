Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESJ1e-0008BY-2w
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 14:51:04 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: Vitaly Wool <vwool@ru.mvista.com>
Date: Thu, 20 Oct 2005 07:57:11 +1300
References: <20051018211330.GA28414@slurryseal.ddns.mvista.com>
	<200510191158.49192.manningc2@actrix.gen.nz>
	<4356354A.9020805@ru.mvista.com>
In-Reply-To: <4356354A.9020805@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510200757.11770.manningc2@actrix.gen.nz>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 ignore ECC bytes in cleanmarker
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 20 October 2005 01:00, Vitaly Wool wrote:
> Hi,
>
> I do agree that the OOB data returned should be in the same format as
> OOB data provided. The layout-based model for handling NAND reads/writes
> is capable of fixing that, however, I didn't implement that in my
> layout-based patch due to the fact that I wanted to make it compatible
> with the current drivers.

Sounds good. Fix one thing at a time.

In the mean time I (or maybe someone else) will see if that proposal patch can 
be made to work properly. If so, I think we can get useful semantics pretty 
quickly too (without impacting on your work).

I wonder whether fixing things the other way around makes your life easier for 
what you're doing now (ie. if you are not boxed in by the current oobsel 
stuff)?

>
> So, I suggest the following way to go:
>
> 1. After linux-mtd is merged into the kernel, commit layout-based patch
> and fix the problems found (if any :)).
> 2. Agree on the format of OOB data.
> 3. Implement what was agreed upon.
> 4. Get rid of redundant structures (I hope that redundant will become
> eccbytes and maybe even oobfree).
Most definitely progress. We've had about four or five iterations of these and 
keeping everyone on the same page all the time is tricky.
> 5. Update the MTD userland utilities accordingly.
>
> Does that make sense?

Makes good sense to me.

-- Charles
