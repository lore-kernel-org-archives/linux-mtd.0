Received: from ns2.townisp.com ([216.195.0.134])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B9Y7G-0006Q4-61
	for linux-mtd@lists.infradead.org; Sat, 03 Apr 2004 00:30:26 +0100
Received: from gemini.home.net (dhcp-0-10-57-0-7-57.cpe.townisp.com
	[216.195.15.243])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by ns2.townisp.com (Postfix) with ESMTP id 0669A881D
	for <linux-mtd@lists.infradead.org>;
	Fri,  2 Apr 2004 18:30:18 -0500 (EST)
Date: Fri, 2 Apr 2004 18:30:18 -0500 (EST)
From: Jamie Guinan <guinan@bluebutton.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0404021808100.22997-100000@gemini.home.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: SST 39VF1601
Reply-To: Jamie Guinan <guinan@bluebutton.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

I've been struggling to get a pair of these chips working, under Linux
2.6.4, on a custom ARM board based on the Sharp/LogicPD LPD7A404.  I have
two 1Mbx16 chips side-by-side for 32-bit data access.

The chip is not CFI compliant, as is the case with a similar chip
mentioned in this thread,

   http://lists.infradead.org/pipermail/linux-mtd/2002-May/005059.html

but unfortunately that thread kind of petered out without a clear
solution.

I made some progress by adding a few bits to jedec_probe.c[1], and I got 
as far as this:

Search for id:(bf 234b) interleave(2) type(2)
MTD jedec_match(): Check fit 0x00000000 + 0x00020000 = 0x00020000
MTD jedec_match(): check unlock addrs 0xaaaa 0x5554
MTD jedec_match(): check ID's disappear when not in ID mode
MTD jedec_match(): return to ID mode
MTD jedec_probe_chip(): matched device 0xbf,0x234b unlock_addrs: 0xaaaa 0x5554
Found: SST 39VF1601

Things get a bit weird after that (Probe at addr_unlock1 ... past the
end), but I wanted to start with the basics.

Questions:

1) What are "unlock addrs"?  The chip does not have an "unlock bypass"
mode like I've seen in other chips, if that is what it means.  Will not
having this cause problems later on?  I'm using MTD_UADDR_UNNECESSARY for
all 3 .uaddr[] elements.

2) The .DevSize field is per-chip or for the pair of devices?
I obviously haven't set that right yet.

-Jamie

[1]

#define SST39VF1601     0x234b

...

         }, {
                .mfr_id         = MANUFACTURER_SST,
                .dev_id         = SST39VF1601,
                .name           = "SST 39VF1601",
                /* I don't think this is supported.*/
                .uaddr          = {
                  [0] = MTD_UADDR_UNNECESSARY,
                  [1] = MTD_UADDR_UNNECESSARY,
                  [2] = MTD_UADDR_UNNECESSARY,
                },
                .DevSize        = SIZE_128KiB,
                .CmdSet         = P_ID_AMD_STD,
                .NumEraseRegions= 1,
                .regions        = {
                        ERASEINFO(0x01000,64),
                }
