Received: from co202.xi-lite.net ([149.6.83.202])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RO62W-0004MV-Pk
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 11:09:58 +0000
Message-ID: <4EBA5F7C.6000506@parrot.com>
Date: Wed, 9 Nov 2011 12:09:48 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 1/3] Add the snappy-c compressor to lib
References: <1319978255.2126.33.camel@koala> <1319978545.2126.37.camel@koala>
In-Reply-To: <1319978545.2126.37.camel@koala>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Andi Kleen <ak@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Artem Bityutskiy a écrit :
> On Sun, 2011-10-30 at 14:37 +0200, Artem Bityutskiy wrote:
>> From: Andi Kleen <ak@linux.intel.com>
>>
>> This is a C port of the google snappy compressor. It has roughly
>> comparable compression to LZO, but is significantly faster on many file
>> types. For example it beats all other compressors on already
>> compressed data.
> 
> Sounds cool, thanks Andi! Is any UBIFS user interested to try this out?
> I think this stuff needs some real users to make it go into mainline
> smoothly.
> 
I could be interresting to have benchmarks on arm (or other system where UBIFS
is used).

snappy use lot's of unaligned access.
They need to be emulated on pre-armv6 core.
And even in newer core (armv6+), u64 unaligned access are not supported.

Matthieu
