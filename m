Subject: Re: patch with header files not in mtd includes
From: David Woodhouse <dwmw2@infradead.org>
To: Ben Dooks <ben-mtd@fluff.org>
In-Reply-To: <20060623172130.GA12107@home.fluff.org>
References: <20060623172130.GA12107@home.fluff.org>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 14:26:56 +0100
Message-Id: <1151414818.17609.126.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-06-23 at 18:21 +0100, Ben Dooks wrote:
> I have udpates for the s3c2410 nand driver which
> includes register updates for the header file
> include/asm-arm/arch-s3c2410/regs-nand.h.
> 
> Is it ok to send this as one patch, or does it
> need the include splitting and sending to rmk?
> A seperate split will mean a possible small period
> when the driver will not build. 

Stick it in a git tree, ask rmk if he's happy with it. If he is, ask me
to pull it.

-- 
dwmw2
