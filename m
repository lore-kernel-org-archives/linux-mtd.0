Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8glF-0003fK-0S
	for linux-mtd@lists.infradead.org; Thu, 12 Nov 2009 20:59:21 +0000
Date: Thu, 12 Nov 2009 20:59:10 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: "Govindarajan, Sriramakrishnan" <srk@ti.com>
Subject: Re: NAND: failure reported with mtd_oobtest(read delay violated)
Message-ID: <20091112205910.GB11304@n2100.arm.linux.org.uk>
References: <FCCFB4CDC6E5564B9182F639FC35608702FA5CC012@dbde02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FCCFB4CDC6E5564B9182F639FC35608702FA5CC012@dbde02.ent.ti.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2009 at 09:28:58PM +0530, Govindarajan, Sriramakrishnan wrote:
> OMAP3EVM implementation relies on command delay(chip_delay set to 50ms)
> and doesn't use wait pin monitoring. By adding a data memory barrier
> dmb() instruction right after the command phase the issue seems to be
> resolved.

Clearly adding ARM specific calls into generic code is the wrong thing
to do...  Why can't this dmb() go into whatever NAND driver OMAP is using?
