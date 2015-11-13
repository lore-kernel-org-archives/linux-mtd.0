Subject: Re: [PATCH v3 1/5] spi: introduce mmap read support for spi flash
 devices
To: "R, Vignesh" <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>
References: <1447133399-25658-1-git-send-email-vigneshr@ti.com>
 <1447133399-25658-2-git-send-email-vigneshr@ti.com>
 <20151110232341.GU12143@google.com> <5642E546.3040806@ti.com>
CC: Michal Suchanek <hramrach@gmail.com>, Russell King
 <linux@arm.linux.org.uk>, <devicetree@vger.kernel.org>, Tony Lindgren
 <tony@atomide.com>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <5645EE7F.5040101@topic.nl>
Date: Fri, 13 Nov 2015 15:06:55 +0100
MIME-Version: 1.0
In-Reply-To: <5642E546.3040806@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BFOn 11-11-15 07:50, R, Vignesh wrote:
> Hi Brain,
>
> On 11/11/2015 4:53 AM, Brian Norris wrote:
>> Hi Vignesh,
...

>> Also, this API doesn't actually have anything to do with memory mapping.
>> It has to do with the de facto standard flash protocol. So I don't think
>> mmap belongs in the name; it should be something about flash. (I know of
>> at least one other controller that could probably use this API, excpet
>> it doesn't use memory mapping to accomplish the accelerated flash read.)

The Zynq has a similar way of accessing QSPI flash through a memory map. Th=
e=20
memory window is only 16MB, so some form of paging would be needed.

It's why I have been following this thread with great interest, since the Q=
SPI=20
performance on the Zynq is way below what it could potentially be.

> As far as TI QSPI controller is concerned, the accelerated read happens
> via mmap port whereby a predefined memory address space of SoC is
> exposed as QSPI mmap region. This region can be accessed like normal
> RAM(via memcpy()) and the QSPI controller interface takes care of
> fetching data from flash on SPI bus automatically hence, I named it as
> above. But, I have no hard feelings if it needs to be generalized to
> spi_mtd_read() or something else.

I know that on the Zynq, you can even let the DMA controller access the QSP=
I=20
flash via this memory mapping. The QSPI controller itself doesn't support a=
ny=20
DMA at all.

If something similar applies to the TI platform (most of the TI procs have=
=20
nice DMA controllers) one could go one step further and implement a generic=
=20
DMA-through-mmap access to QSPI flash.

Mike.


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Visit us at : Aerospace Electrical Systems Expo Europe which will be held f=
rom 17.11.2015 till 19.11.2015, Findorffstrasse 101 Bremen, Germany, Hall 5=
, stand number C65
http://www.aesexpo.eu
