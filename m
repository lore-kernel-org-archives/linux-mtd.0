Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIuUJ-0003CM-KS
 for linux-mtd@lists.infradead.org; Sat, 14 Apr 2012 04:21:28 +0000
Date: Sat, 14 Apr 2012 06:21:14 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: RE: Unstable bits and JFFS2
In-Reply-To: <1334336505.13160.19.camel@sauron.fi.intel.com>
Message-ID: <Pine.LNX.4.64.1204140618350.7481@lnxricardw.se.axis.com>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
 <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
 <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
 <1334334462.13160.10.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADBE@dekaexchange07.deka.local>
 <1334336505.13160.19.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: 'Matej Kupljen' <matej.kupljen@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Atlant Schmidt <aschmidt@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 13 Apr 2012, Artem Bityutskiy wrote:

> On Fri, 2012-04-13 at 12:40 -0400, Atlant Schmidt wrote:
>>
>>   Unfortunately, ECC can only fix those PEBs that
>>   are actually read. If one of the PEBs in your
>>   filesystem is being used entirely to contain
>>   obscure data that only gets read once in a
>>   blue moon (i.e., very rarely), then multiple
>>   read-/write-disturbs can hit accumulate in
>>   that PEB and when it is finally read, it may
>>   already contains too many errors to be
>>   corrected by the ECC.
>>
>>   We've seen this exact scenario occur with the
>>   current UBI/UBIfs and will be implementing a
>>   userland "scrubbing" system to ensure that
>>   every PEB gets read at least once in a while
>>   (e.g., weekly or whatever interval seems right).
>
> This is right, people should have a user-space app which periodically
> reads all /dev/ubiX_Y. Care to send a patch against mtd-www with some
> explantion of this issue and extend the unstable bits issue?

Would it not be preferable to have this functionality within UBI itself,=20
so that, for instance governed by some sysfs parameter, UBI reads through=
=20
all PEBs at some interval, triggering scrubbing of any blocks that require=
=20
too much ECC for comfort?

To me it seems something that userspace should not be concerned with,=20
given the rest of the features that UBI deals with so that userspace does=
=20
not have to.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
