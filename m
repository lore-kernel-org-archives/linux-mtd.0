Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RGB3g-0002uL-Ed
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 14:54:25 +0000
Date: Tue, 18 Oct 2011 16:54:13 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: =?utf-8?Q?Jean-S=C3=A9bastien?= Gagnon <jsgagnon@vizimax.com>
Subject: Re: UBIFS recovery fails
Message-ID: <20111018145413.GA8576@parrot.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 18, 2011 at 01:47:26PM +0100, Jean-Sébastien Gagnon wrote:
> Hi, 
> Actually, I think the empty space corruption is the only thing to address in this 
> Specific problem, since any other error cause by unstable bits on valid data should be 
> corrected by the parities in the flash driver.

Hi Jean-Sébastien,

If you cut power during a page programming operation, you can easily get more
unstable bits than what the manufacturer-specified ecc supports (for instance,
3 unstable bits on a 1bit-ecc device). We experienced this on several different
devices.
Having a lot of bitflips (more than what ecc supports) is not the problem here:
the page was indeed partially programmed, it contains garbage and its contents
should be discarded.

The real problem appears when those faulty bits are unstable: during the first
few read attempts, the page may be successfully read (possibly with ecc
corrections); and then, a bit later, the page becomes unreadable because of too
many faulty bits.

Therefore, software using MTD (UBI, UBIFS) cannot just rely on being able to
read a page at some point to decide that this page reliably stores data.
It should also be able to trace power failures, and treat the NAND area being
modified (programmed or erased) during the power cut as potentially unstable.

HTH,
-- 
Ivan
