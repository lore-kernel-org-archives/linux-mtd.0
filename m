Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2N0g-0006oh-7C
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 13:54:47 +0000
Message-ID: <502E4D20.3090408@parrot.com>
Date: Fri, 17 Aug 2012 15:54:40 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: MLC NAND: all 0xff after erase?
References: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
 <20120711174309.GA25743@parrot.com>
 <1345197081.27859.37.camel@sauron.fi.intel.com>
In-Reply-To: <1345197081.27859.37.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Mike Dunn <mikedunn@newsguy.com>, Richard Weinberger <richard@nod.at>,
 Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Joel Reardon <reardonj@inf.ethz.ch>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Wed, 2012-07-11 at 19:43 +0200, Ivan Djelic wrote:
>> Or, conversely, we could decide that erased pages are simply not
>> ecc-protected
>> (which is the actual truth with many drivers), can contain anything
>> (including
>> bitflips), and should be signalled as erased and dealt with in upper
>> layers... 
> 
> I did not not investigate this in details, but I believe UBI and UBIFS
> can be changed and they can allow for a number of bit-flips. There are
> only few places (may be even 2 - one in UBI and one in UBIFS) which
> check if the area contains all 0xFFs. I do not see any obstacles
> improving this and implement a smarter functions which would take a
> buffer, it's length, ecc step size, and max allowable bit-flips as a
> parameter, and check if the page is empty. This could even be an MTD
> helper, something like 'mtd_area_is_empty()'.
> 
> I think in UBI we only verify if an area is empty in the debugging code,
> to make sure we never write over older data. Should be easily fixable.
AFAIK, we also check it when we do bit scrubbing on dynamic volume. We need to
guess the written data size to do crc on it and not on the whole LEB (become it
can be written later and will make the crc false).

Matthieu
