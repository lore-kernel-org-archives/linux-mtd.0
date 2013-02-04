Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2GXQ-0005EO-D6
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 07:32:24 +0000
Message-ID: <510F6404.9060504@freescale.com>
Date: Mon, 4 Feb 2013 15:32:20 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: question about mtd_torturetest.c
References: <50F9023D.5040408@freescale.com> <50F93F65.90805@parrot.com>	
 <50FCB75D.1000200@freescale.com> <50FD02EA.5050209@parrot.com>	
 <50FD0554.8030108@freescale.com> <50FD073C.8050209@parrot.com>	
 <50FD0981.8050507@freescale.com> <50FD0B3D.2070803@parrot.com>	
 <50FD0BE9.3020506@freescale.com> <50FF9068.1030709@freescale.com>	
 <1359737889.2942.17.camel@sauron.fi.intel.com>	
 <20980858CB6D3A4BAE95CA194937D5E73E995A7B@DBDE01.ent.ti.com>
 <1359961124.13791.1.camel@sauron.fi.intel.com>
In-Reply-To: <1359961124.13791.1.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 Lin Wei-B34918 <B34918@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8804=E6=97=A5 14:58, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Mon, 2013-02-04 at 05:19 +0000, Gupta, Pekon wrote:
>>> On Wed, 2013-01-23 at 15:25 +0800, Huang Shijie wrote:
>>>> Hi all:
>>>>
>>>>      The mtd_torturetest.c uses the 55/AA patterns to torture the na=
nd
>>> block.
>>>> Are the 55/AA patterns more tougher then the random data?
>>> Probably not, please, improve the test.
>>>
>> (0x55/0xAA/0x55) pattern ensures that _all_ bits in the byte transitio=
n from 0->  1, and 1->0,
>> Whereas, a random pattern may miss a bit-cell or miss transition seque=
nce, of an bad bit-cell.
>> Exercising each bit both ways is important so as to differentiate a ba=
d bit-cell (permanent error) from read-disturb errors (temporary error).
>>
>> For read-disturb: http://download.micron.com/pdf/presentations/events/=
flash_mem_summit_jcooke_inconvenient_truths_nand.pdf
> Sure, I did not mean remove those, I meant that random data test can
> also be added and that would be an improvement.
>
I think the random data test is much like the simulation of the nand=20
real use, such as the nand is used in
the filesystem.

thank
Huang Shijie
