Received: from mail-io0-x233.google.com ([2607:f8b0:4001:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aKEsy-0002T4-5i
 for linux-mtd@lists.infradead.org; Sat, 16 Jan 2016 00:38:32 +0000
Received: by mail-io0-x233.google.com with SMTP id g73so309730854ioe.3
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2016 16:38:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1601090058430.29879@eddie.linux-mips.org>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
 <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
 <20160107230513.GL109450@google.com>
 <CACna6rw6Q=zaSo91ZK26zgjQ+0j+7=b6C_fPYngaKhnw0OmWeQ@mail.gmail.com>
 <alpine.LFD.2.20.1601081358300.29879@eddie.linux-mips.org>
 <20160108185120.GQ109450@google.com>
 <alpine.LFD.2.20.1601090058430.29879@eddie.linux-mips.org>
Date: Sat, 16 Jan 2016 01:38:11 +0100
Message-ID: <CACna6rwAfXQxX8o0+DxroB6vOGZax70VVdPOAjeoGGUsDjdNhA@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use devm_ioremap_nocache() instead of
 KSEG0ADDR()
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9 January 2016 at 03:10, Maciej W. Rozycki <macro@linux-mips.org> wrote:
> On Fri, 8 Jan 2016, Brian Norris wrote:
>> > > It results in different address than KSEG0ADDR:
>> > > [    1.339752] [bcm47xxsflash_bcma_probe] KSEG0ADDR(BCMA_SOC_FLASH2)=
:9c000000
>> > > [    1.346848] [bcm47xxsflash_bcma_probe] devm_ioremap_nocache:bc000=
000
>> > >
>> > > But it still works as expected! :)
>> > > [    1.609426] 6 bcm47xxpart partitions found on MTD device bcm47xxs=
flash
>> > > [    1.616169] Creating 6 MTD partitions on "bcm47xxsflash":
>> >
>> >  It is a functional change though and I think the change from a cached=
 to
>> > uncached mapping (i.e. from `ioremap' to `ioremap_nocache') has to be =
a
>> > separate patch, so that both changes can be reviewed independently.
>>
>> As I noted before sending my patch, I don't think this driver should
>> have been using KSEG0 anyway; it should have been KSEG1, right? I can
>> note that in the patch description, but I don't really see why it needs
>> to be a separate patch.
>
>  You did mention that, but didn't actually justify why an uncached mappin=
g
> is required here.
>
>  This code is in a function called `bcm47xxsflash_read' and reads from an
> MMIO region, presumably flash memory which behaves like ordinary memory o=
n
> reads (i.e. no side effects).  Therefore using a cached mapping will in
> most cases result in much better performance as the CPU will load
> (prefetch) data in cacheline-sized quantities rather than hitting the
> external bus every time with a word-sized quantity transferred only.

So I wanted to stick to the cached mapping, but it appears it's not
possible with devm_*. We have two options:
1) devm_ioremap_nocache - it obviously won't be cached mapping
2) devm_ioremap_resource - it uses devm_ioremap which uses ioremap
which is nocache on MIPS

Should I introduce a new
devm_ioremap_resource_cache
with some
devm_ioremap_cache
helper? And then use it in bcm47xxsflash?

--=20
Rafa=C5=82
