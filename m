From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <69481CB84E71@baydel.com>
References: <4034E8ED.5757.55A2D9@localhost>
	 <1077624009.7826.266.camel@hades.cambridge.redhat.com>
	 <6927194562DA@baydel.com>  <69481CB84E71@baydel.com>
Content-Type: text/plain
Message-Id: <1077632578.7826.415.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Feb 2004 14:22:58 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-24 at 13:40 +0000, Simon Haynes wrote:
> I don't understand. I changed the kernel to use the read only device. I 
> expected this to work rw without caching but it does not. 

You can't use flash RW without caching. It _has_ to
read/modify/erase/writeback to write to flash.

But for JFFS2, you _don't_ use flash RW through mtdblock. It operates
directly and should work fine. What failure mode do you observe?

> I have already 
> tried mounting root ro via the caching mtd block and although my system does 
> not fully start I can't see how I would get corruption ? 

As I said -- I don't know. Maybe there's a bug which causes the mtdblock
device to consider its cache dirty, and write it out to the detriment of
the real data which JFFS2 has already put there on the flash. That's why
I was asking you to test mtdblock_ro.

> I have looked at the mtdblock_ro code and it seems you allow writing if flag 
> certain bits are set you allow writing. Do I need to set these somewhere ?

No. Leave them turned off. We don't actually want to write via the
mtdblock device -- that's the whole _point_ in this experiment.

-- 
dwmw2
