Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19c2Tn-00044H-5c
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 13:30:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Zachi Friedman <zachi.friedman@m-sys.com>
In-Reply-To: <87F9EFDE786B68428C807B4F74CC348106E9EA@msi-ex6.msu.m-sys.com>
References: <87F9EFDE786B68428C807B4F74CC348106E9EA@msi-ex6.msu.m-sys.com>
Message-Id: <1058185861.26819.109.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 14 Jul 2003 13:31:01 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip 2000 128Mb problem - clarifications
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-02 at 20:58, Zachi Friedman wrote:
> Here is the deal:
> 
> Newer (and higher capacity) DiskOnChip 2000 devices have a new ASIC
> controller. This ASIC controller has the chip ID of 0x30 (instead of
> 0x20). I guess that is the reason the MTD driver identifies the 128MB
> as a Millennium... 

OK. So if we ignore that and treat it precisely as a DiskOnChip 2000
with an anomalous ChipID, will that work? Are the toggle registers and
_everything_ else precisely the same as the 2000 and it's just the
ChipID which is different?

> Also, to solve the confusion here once and for all: Millennium comes
> _ONLY_ 8MB. There never was, and never will be a Millennium is
> different capacity! 

Erm, but I think there's one on my desk. :)

It's a DIL unit in a square plastic case with a sticker, like all the
DiskOnChip 2000 DIL units I've seen -- whereas other Millennium units
I've seen have been a plain black case with white stencil on. It's an
orange sticker and says 'Millennium Module' 'MD2841-D016' '00910104864
1.21'. IIRC the Linux driver works with it just fine and claims it's a
Millennium with a single 16MiB chip.
 
> So, once you have chip ID of 0x30, how can you tell whether it's a
> Millennium or the newer DiskOnChip 2000?  You have to read chip ID 4
> times. If the 4th read is NOT 0x30 - it's a new DiskOnChip 2000 !

OK... what _will_ the 4th read return? Is it always safe just to read
ChipID four times and use the fourth answer, or should we read four
times _only_ in the case where it first says it's a Millennium?

For the case where the fourth read indicates it's one of these newer
DiskOnChip 2000 units and not actually a Millennium, do we need to do
anything else? Is absolutely everything else going to be precisely like
an old DiskOnChip 2000, including the 'TOGGLE' test &c.? I seem to
recall someone trying to get it to work just by overriding the ChipID
check, and failing further down the line.

Would it be possible to get me one of these units for further testing,
please? I think it's the last of your devices which isn't properly
supported by the Linux drivers.

> Also, these new DiskOnChip 2000 SHOULD be used with INFTL.

OK; we actually use either NFTL or INFTL according to what we find on it
-- the decision is actually made at format time, not really in the
kernel at all. It's probably actually worth us fixing
nftl_format/inftl_format to automatically do the right thing according
to the detected hardware, just as your DFORMAT will.

-- 
dwmw2
