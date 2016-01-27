Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie1.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aORJv-0005RX-KR
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2016 14:43:45 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>, Jared Hulbert
 <jaredeh@gmail.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, David Woodhouse
 <dwmw2@infradead.org>, "ross.zwisler@linux.intel.com"
 <ross.zwisler@linux.intel.com>
Subject: RE: PMEM, DAX, MTD, and the quest for the Theory of Everything
Date: Wed, 27 Jan 2016 14:43:17 +0000
Message-ID: <SG2PR06MB05725F248DDD8B8B37E78D0D8AD90@SG2PR06MB0572.apcprd06.prod.outlook.com>
References: <CA+ZsKJ53E33rWmwv-v=_b8OjHT_20UW7WqD9XhhHJ0aYxJc=cA@mail.gmail.com>
 <100D68C7BA14664A8938383216E40DE04217A0C1@FMSMSX114.amr.corp.intel.com>,
 <CA+ZsKJ7Q8uBS6M4UV3Jvq19m-bowGCcqkp7AVtpJmnaOz+XfVg@mail.gmail.com>
 <100D68C7BA14664A8938383216E40DE04217BDF6@FMSMSX114.amr.corp.intel.com>
In-Reply-To: <100D68C7BA14664A8938383216E40DE04217BDF6@FMSMSX114.amr.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> So I CC:ed Chris Brandt because he's been working on AXFS with me
> lately on a very cool set of deep embedded applications where RAM
> is scarce

As a point of reference in an embedded system, this is how I'm using it:


The Renesas RZ/A1 MPU (400MHz Cortex A9) comes with either 3MB,5MB or 10MB =
internal RAM.
The quad SPI controllers (2 QSPIs can be connected to 1 channel...hence 8 b=
its of data per clock) on it will memory map QSPI devices into internal lin=
ear address space (as in, looks like a parallel NOR flash) and will also al=
low the CPU to XIP directly from the serial flash. These are not 'block' ac=
cesses, they are direct (as far as the CPU is concerned).

What I found is that if you run an XIP_KERNEL (XIP from QSPI) and all your =
application code (XIP from QSPI using AXFS), you can do a lot with only 3/5=
/10MB of RAM. And from there, you just pick the size QSPI device you need d=
epending on what applications to plan on running.

So..
 - read-only XIP/DAX of code pages are fine
 - block accesses not required


Of course the upstream XIP_KERNEL code for ARMV7 has been broken for years,=
 and I haven't been able to successfully get the fixes back in....but that'=
s a different topic.


Chris
