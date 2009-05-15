Received: from gateway-1237.mvista.com ([63.81.120.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4ylY-0000Lx-4N
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 14:52:11 +0000
Date: Fri, 15 May 2009 10:52:02 -0400
From: "George G. Davis" <gdavis@mvista.com>
To: Hemagiri C <hemagiric@gmail.com>
Subject: Re: jffs2 on MTD-Onenand driver - LTP test fails for ftest
Message-ID: <20090515145202.GF10977@mvista.com>
References: <627b7eea0808180452i35bc99ecyc99fca8b997cd346@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <627b7eea0808180452i35bc99ecyc99fca8b997cd346@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Aug 18, 2008 at 05:22:11PM +0530, Hemagiri C wrote:
> Hi,
> 
> I am new to JFFS2 and now I am running the LTP FS Tests for
> MTD-Onenand driver on JFFS2.
> 
> Kernel version is linux-2.6.25.
> The following tests are failing while running the  LTP FS test for
> MTD-Onenand driver on JFFS2.
> 
> ftest01                        FAIL       1
> ftest02                        PASS       0
> ftest03                        FAIL       1
> ftest04                        FAIL       1
> ftest05                        FAIL       1
> ftest06                        PASS       0
> ftest07                        FAIL       1
> ftest08                        FAIL       1

I've run into the exact same problem.  This problem persists in
GIT HEAD to this very day.

> But with linux-2.6.22 version, except ftest03 all other test cases are passing.
> 
> Does any one know the reason for failure/possible cause.

I've git bisected this regression down to this change:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff_plain;h=a32ea1e1f925399e0d81ca3f7394a44a6dafa12c


Reverting the above resolves LTP ftest regressions for JFFS2
on NAND flash devices.  Oddly, these LTP regressions do _not_
occur on NOR flash devices.  They only occur on NAND flash
devices, e.g. nandsim.  FWIW, I've confirmed that there are
no LTP ftest regersions for the EXT2 on NAND (nandsim : )
test case.

I'm trying to get a handle on why MTD NAND exhibits these LTP
regressions while MTD NOR does not.

If any one can hit me with a clue bat, I'ld greatly appreciate
it.

TIA!

--
Regards,
George
