From: David Woodhouse <dwmw2@infradead.org>
To: Esben Nielsen <ESN@vestas.com>
In-Reply-To: <72F54639F41FD643A2349136F3E33DAD2C3BE5@rkbexch02.vws.vestas.dom>
References: 
	 <72F54639F41FD643A2349136F3E33DAD2C3BE5@rkbexch02.vws.vestas.dom>
Content-Type: text/plain
Message-Id: <1070446326.15108.74.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 03 Dec 2003 10:12:07 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: M-System's DiskOnChip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-12-03 at 10:53 +0100, Esben Nielsen wrote:
> 1) They provide a TFFS-driver but there huge problems with license (it
> isn't GPL). 

We have proper GPL'd support for this too. For the DiskOnChip 2000 and
Millennium it's fine. For the DiskOnChip Millennium Plus (and also the
larger, new DiskOnChip 2000 which uses a newer TFFS), we still have
problems with the bad block management, because it's not implemented.

> 2) We can skip M-system's TFFS and jump to JFFS2. But how stable is
> that on DiskOnChip? As far as I could see from the website there are
> still problems with bad blocks support. How does that affect the
> stability? What is your experience?
> Is it stable enough for production use?

The bad block management is unimplemented. Do not use JFFS2 on
DiskOnChip until someone's spent a couple of weeks implementing it.

-- 
dwmw2
