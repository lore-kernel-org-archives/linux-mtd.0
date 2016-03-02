Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab6Q1-0003J9-Hi
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 13:02:22 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/1] mtd: mtdram: Add parameter for setting writebuf size
Date: Wed, 02 Mar 2016 14:01:50 +0100
Message-ID: <6654580.lx3DHdo0Ov@ws-stein>
In-Reply-To: <56D6E0F6.8070905@nod.at>
References: <1456911954-12929-1-git-send-email-alexander.stein@systec-electronic.com>
 <2781096.oJXdWOB4df@ws-stein> <56D6E0F6.8070905@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 02 March 2016 13:47:50, Richard Weinberger wrote:
> Am 02.03.2016 um 11:41 schrieb Alexander Stein:
> > On Wednesday 02 March 2016 11:23:59, Richard Weinberger wrote:
> >> On Wed, Mar 2, 2016 at 10:45 AM, Alexander Stein
> >> <alexander.stein@systec-electronic.com> wrote:
> >>> ubifs uses the write buffer size in recovery algorithm. When inspecting
> >>> an unclean ubifs recovery fails with writebuf size 64 in mtdram while
> >>> recovery on actual mtd device with writebuf size of 1024 succeeds.
> >>> So add a parameter for setting this property.
> >>
> >> Can it be that you've tested an NAND image on mtdram?
> > 
> > Nope. We copied that image within barebox from device /dev/nor0 (the whole 128MiB NOR flash) and used that in mtdram.
> > Unfortunately mounting that "broken" ubifs in barebox suffers from essentially the same problem: using a different writebuf size for recovery results in failure. But that's another issue.
> > The apparently important changes in linux are the commits:
> > 428ff9d2e37d3a82af0f56b476f70c244cf550d1 ("UBIFS: remove dead code")
> > 2765df7da540687c4d57ca840182122f074c5b9c ("UBIFS: use max_write_size during recovery")
> > With those two the writebuf size gets used by ubifs.
> 
> Makes sense to me!
> One minor nitpick, the comment "Mimic CFI NOR flashes" is no longer valid then.
> Maybe you can note in Kconfig that the default value 64 mimics CFI NOR...

Well, I stumbled also on that because we actually do use a CFI NOR flash. The commit message introducing that states: "Set the 'mtd->writebufsize' field to 64 to mimic modern CFI flashes." I guess 64 Bytes was modern at that time. I'll remove it all together in v2.

> Beside of that:
> Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks, best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010
