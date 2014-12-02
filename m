Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvlPb-0005y1-Dn
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 11:14:32 +0000
Message-ID: <547D9EFA.4010006@nod.at>
Date: Tue, 02 Dec 2014 12:14:02 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bruno Vernay <brunovern.a@gmail.com>
Subject: Re: Building nandsim for Fedora
References: <CAF3KAoTMWCiAfHhNd_OR3QAteYC8vBLL=W_SUR28iCTOz+YbiA@mail.gmail.com>
 <CAFLxGvzOR92mqxqC-dzgr4SDke+K=NfC7mi4kZHi3KrBiVfcNQ@mail.gmail.com>
 <CAF3KAoTM9aQL4DmNXHNYSyo3sZhZgGOge6pBN7s5N9u_-S8jYA@mail.gmail.com>
In-Reply-To: <CAF3KAoTM9aQL4DmNXHNYSyo3sZhZgGOge6pBN7s5N9u_-S8jYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.12.2014 um 12:03 schrieb Bruno Vernay:
> On Mon, Dec 1, 2014 at 8:16 PM, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
>> On Mon, Dec 1, 2014 at 6:23 PM, Bruno Vernay <brunovern.a@gmail.com> wrote:
>>> Hi,
>>>
>>> I would like to mount a UBI  image, and for this I need "nandsim", but
>>> it is not available on Fedora.
>>> I can't even find a RPM for the sources.
>>>
>>> I would like to get the sources for nandsim, it seems that the repository is
>>> http://git.infradead.org/linux-mtd.git/tree/HEAD:/drivers/mtd/nand
>>>
>>> But I am not even sure, if it is the right place to start ???
>>
>> nandsim is a Linux kernel module.
> 
> So ... it means that this list is not the right place and I should go
> to the kernel sources to find this module??

The list is kind of correct. :-)

> I tried to download
> http://git.infradead.org/linux-mtd.git/blob_plain/HEAD:/drivers/mtd/nand/nandsim.c
>  and used
> This Makefile (http://www.cyberciti.biz/tips/compiling-linux-kernel-module.html):
> obj-m = nandsim.o
> KVERSION = $(shell uname -r)
> all:
> make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
> clean:
> make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
> 
> make -C /lib/modules/3.17.3-200.fc20.x86_64/build
> M=/home/bruno/dev/mtd-utils/reb modules
> make[1]: Entering directory `/usr/src/kernels/3.17.3-200.fc20.x86_64'
>   CC [M]  /home/bruno/dev/mtd-utils/reb/nandsim.o
>   Building modules, stage 2.
>   MODPOST 1 modules
> WARNING: "nand_release" [/home/bruno/dev/mtd-utils/reb/nandsim.ko] undefined!
> WARNING: "nand_scan_tail" [/home/bruno/dev/mtd-utils/reb/nandsim.ko] undefined!
> WARNING: "nand_scan_ident" [/home/bruno/dev/mtd-utils/reb/nandsim.ko] undefined!
>   CC      /home/bruno/dev/mtd-utils/reb/nandsim.mod.o
>   LD [M]  /home/bruno/dev/mtd-utils/reb/nandsim.ko
> make[1]: Leaving directory `/usr/src/kernels/3.17.3-200.fc20.x86_64'
> 
> 
> But then:
> sudo insmod nandsim.ko first_id_byte=0x20 second_id_byte=0x33
> insmod: ERROR: could not insert module nandsim.ko: Unknown symbol in module
> 
> I am stuck here.

On Linux you can only use/load kernel modules which match *exactly* you kernel.
IOW if you use the Fedora kernel you'll have to use their nandsim.ko.
In case they don't build it you have to rebuild the kernel.

Thanks,
//richard
