Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=TX2EHSOBE003.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmkgq-0005iA-6h
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 11:25:28 +0000
Message-ID: <4F14097D.9060601@freescale.com>
Date: Mon, 16 Jan 2012 19:26:53 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: linux/mtd/gpmi-nand.h: No such file or directory
References: <4F1013DC.8040902@prolan.hu>
 <1326712888.14299.55.camel@sauron.fi.intel.com>
In-Reply-To: <1326712888.14299.55.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Peter Rusko <rusko.peter@prolan.hu>,
 Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B401=E6=9C=8816=E6=97=A5 19:21, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Fri, 2012-01-13 at 12:22 +0100, Peter Rusko wrote:
>> Hi all,
>>
>> I can't compile the gpmi-nand module. Currently I'm using the
>> pengutronix/imx repository, but I've tried the master branch in
>> mtd-2.6-git and got the same results:
>>
>>     CC      drivers/mtd/nand/gpmi-nand/gpmi-nand.o
>> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:24:33: fatal error:
>> linux/mtd/gpmi-nand.h: No such file or directory
>> compilation terminated.
>>
>> Where can I find that header?
> It looks like it has never been added to the kernel tree. Huang?
>
Shawn has added it to his git tree to fix the compiling error.



Best Regards
Huang Shijie
