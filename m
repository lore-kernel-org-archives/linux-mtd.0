Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmxZe-0007Ds-JN
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 04:56:47 +0000
Date: Tue, 28 Apr 2015 06:56:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Qi Wang =?UTF-8?B?546L6LW3?= (qiwang)" <qiwang@micron.com>
Subject: Re: detect and manage power cut on MLC NAND
Message-ID: <20150428065620.6de8cd4f@bbrezillon>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A9DF42BF4@NTXXIAMBX02.xacn.micron.com>
References: <mailman.37706.1426822709.22890.linux-mtd@lists.infradead.org>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7717444D@NTXXIAMBX02.xacn.micron.com>
 <EACD232272DA4849B060F0828564D13B57804E26B6@ntcex01.corp.netcomm.com.au>
 <71CF8D7F32C5C24C9CD1D0E02D52498A771744B0@NTXXIAMBX02.xacn.micron.com>
 <20150320095822.7e1979ff@bbrezillon>
 <71CF8D7F32C5C24C9CD1D0E02D52498A9DF42BF4@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "rnd4@dave-tech.it" <rnd4@dave-tech.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Frank Liu =?UTF-8?B?5YiY576k?= \(frankliu\)" <frankliu@micron.com>,
 "andrea.marson@dave.eu" <andrea.marson@dave.eu>,
 "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Qi,

Sorry for the late reply (I was quite busy on other projects
lately :-/).

On Mon, 13 Apr 2015 00:44:35 +0000
Qi Wang =E7=8E=8B=E8=B5=B7 (qiwang) <qiwang@micron.com> wrote:


>=20
> Glad to meet in you ELC.

I was glad to meet you too.

> Is there any planning or idea to fix MLC power loss problem?

For the ideas part, I haven't thought about it since my talk at ELC.
I guess the solution proposed on the MTD website is a good starting
point [1].
Some guys are also considering the "avoid any erase/program operation
when you're about to loose power", but as I already explained I think
the MTD/UBI/UBIFS layers should not rely on this assumption and take
appropriate action to prevent any issue caused by unstable bits.

Best Regards,

Boris

[1]http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
