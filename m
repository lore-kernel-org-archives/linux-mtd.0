From: David Woodhouse <dwmw2@infradead.org>
To: Dan Brown <dan_brown@ieee.org>
In-Reply-To: <41DA9D43.70807@ieee.org>
References: <41D9949B.5070207@ieee.org> <200501041119.25138.rezso@rdsor.ro>
	<41DA9D43.70807@ieee.org>
Content-Type: text/plain
Date: Tue, 04 Jan 2005 13:44:14 +0000
Message-Id: <1104846254.13016.293.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCBoot update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-01-04 at 08:42 -0500, Dan Brown wrote:
> Balint Cristian wrote:
> 
> >Just a undocumented Question:
> >
> > Can please tell me if run on ARM/xscale not on intel only ?
> >If not, it is difficult to adapt ?, or you already have some plans for this.
> >  
> >
> DOCBoot only runs on intel hardware.  In fact it only runs on intel 
> hardware with a somewhat standard PC configuration, namely a standard 
> BIOS which supplies certain functionality.  Also, the Linux bootloading 
> process is very specific to i386.  I would guess that a variant of 
> DOCBoot for ARM/xscale would probably be a complete rewrite.  Sorry :(

You'd probably do better to add DiskOnChip support to RedBoot.

-- 
dwmw2
