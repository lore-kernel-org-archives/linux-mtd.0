From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <69BCB2F40B2B@baydel.com>
References: <4034E8ED.5757.55A2D9@localhost> <698FD51A64D6@baydel.com>
	 <1077636903.7826.487.camel@hades.cambridge.redhat.com>
	 <69BCB2F40B2B@baydel.com>
Content-Type: text/plain
Message-Id: <1077639264.7826.516.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Feb 2004 16:14:24 +0000
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

On Tue, 2004-02-24 at 15:47 +0000, Simon Haynes wrote:
> I hacked fs/jffs2/super.c and fs/jffs2/super_v24.c. Only the v24 got 
> compiled. I guess this is because my kernel is 2.4.21.  I had to also include 
> ramdisk in the kernel as it was previously missing ? Does this effect MTD ?

No, it neither effects nor affects the MTD drivers.

> This mounted rw.

OK... now can you reproduce the same _problem_ that way?

-- 
dwmw2
