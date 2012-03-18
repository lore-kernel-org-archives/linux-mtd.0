Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9N9l-0003O9-Rh
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2012 20:56:53 +0000
Date: Sun, 18 Mar 2012 21:56:45 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: Distinguishing bitflips due to read-disturb or due to wear-out
In-Reply-To: <20120318115946.5614a889@pixies.home.jungo.com>
Message-ID: <Pine.LNX.4.64.1203182145120.29156@lnxricardw.se.axis.com>
References: <20120318115946.5614a889@pixies.home.jungo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Peter Barada <peter.barada@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 18 Mar 2012, Shmulik Ladkani wrote:

>> The bigger issue is how to discern whether the degredation is due to
>> read-disturb (which can be recovered by erasing/reprogramming the block)
>> or the page physically wearing out (in which case it needs to be
>> retired).
>
> Question is, do we really need to distinguish between the two?
>
> If there is a "dangerously high" number of bit errors, then scrubbing
> should be performed.
> If the reason for the bit errors was due to read-disturb, then those
> error are gone after scrubbing (for now, until read-disturb affects
> again).
> If the reason was wear-out, then it is likely that high number of bit
> errors will be evident, again. But if the block is totally worn-out,
> shouldn't the device return an error status for the erase operation,
> eventually? (and as such, the MTD software will retire the block)?

Just my $0.02 worth ... in my experience, what happens as a block wears=20
out is that the frequency / probability of read disturb errors increases,=
=20
but there are not necessarily bit cells which have failed completely.

I once did a test on a single 32 Mbyte NAND flash device, by torturing a=20
block over and over again until the erase or write operation failed=20
according to the device. The guaranteed specified maximum erase/write=20
cycle count was 100000 (quite typical for SLC flash). In a particular=20
case, the erase operation returned an error status first when 2.3 million=
=20
cycles had been performed. In this state, it took about fifteen minutes=20
after writing until a bit flipped during read. However, immediately=20
reading back the data after writing showed no errors. Also, even after the=
=20
erase operation returned an error the first time, several more write/erase=
=20
cycles were completed with no errors.

From=20this can be concluded that the 'wearing out' issue is gradual and no=
t=20
a sudden transition into a 'failed' status. Also, when the chip begins=20
reporting errors during erase and write, the blocks may long have passed=20
their erase cycle specification. Finally, the 'read disturb' errors are=20
probably of the same nature independent of whether the blocks are new or=20
have been used a lot, it's just the error probability that increases.

Since it is not really possible to determine a block is by reading back=20
the data immedately after write, it would seem that any form of mechanism=
=20
that attempts to track how bad the block is, should either monitor the=20
erase cycle count for each block, and retire the block after a certain=20
number of cycles have been reached (say, per the specifications), or try=20
to keep some sort of statistic on how old the data is, i.e. for each read,=
=20
how long ago the data was written, and how many read cycles have been=20
performed since then, in order to determine how serious the 'read disturb'=
=20
errors (bitflips) are.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
