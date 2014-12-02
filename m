Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvpHd-0007k2-EY
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 15:22:34 +0000
Received: by mail-wi0-f182.google.com with SMTP id h11so21296402wiw.9
 for <linux-mtd@lists.infradead.org>; Tue, 02 Dec 2014 07:22:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <547D9EFA.4010006@nod.at>
References: <CAF3KAoTMWCiAfHhNd_OR3QAteYC8vBLL=W_SUR28iCTOz+YbiA@mail.gmail.com>
 <CAFLxGvzOR92mqxqC-dzgr4SDke+K=NfC7mi4kZHi3KrBiVfcNQ@mail.gmail.com>
 <CAF3KAoTM9aQL4DmNXHNYSyo3sZhZgGOge6pBN7s5N9u_-S8jYA@mail.gmail.com>
 <547D9EFA.4010006@nod.at>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Tue, 2 Dec 2014 16:21:51 +0100
Message-ID: <CAF3KAoQY6KEVUWaAbPxtPxmERSi7AS0ykOknGx3Vzd6sWKSMow@mail.gmail.com>
Subject: Re: Building nandsim for Fedora
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 2, 2014 at 12:14 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 02.12.2014 um 12:03 schrieb Bruno Vernay:
>> On Mon, Dec 1, 2014 at 8:16 PM, Richard Weinberger
>> <richard.weinberger@gmail.com> wrote:
>>> On Mon, Dec 1, 2014 at 6:23 PM, Bruno Vernay <brunovern.a@gmail.com> wrote:
>>>> Hi,
>>>>
>>>> I would like to mount a UBI  image, and for this I need "nandsim", but
>>>> it is not available on Fedora.
>>>> I can't even find a RPM for the sources.
>>>>
>>>> I would like to get the sources for nandsim, it seems that the repository is
>>>> http://git.infradead.org/linux-mtd.git/tree/HEAD:/drivers/mtd/nand
>>>>
>>>> But I am not even sure, if it is the right place to start ???
>>>
>>> nandsim is a Linux kernel module.
>>
>> So ... it means that this list is not the right place and I should go
>> to the kernel sources to find this module??
>
> The list is kind of correct. :-)
>
>> I tried to download
>> http://git.infradead.org/linux-mtd.git/blob_plain/HEAD:/drivers/mtd/nand/nandsim.c
>>  and used
>> This Makefile (http://www.cyberciti.biz/tips/compiling-linux-kernel-module.html):
>> obj-m = nandsim.o
>> KVERSION = $(shell uname -r)
>> all:
>> make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
>> clean:
>> make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
>>
>> make -C /lib/modules/3.17.3-200.fc20.x86_64/build
>> M=/home/bruno/dev/mtd-utils/reb modules
>> make[1]: Entering directory `/usr/src/kernels/3.17.3-200.fc20.x86_64'
>>   CC [M]  /home/bruno/dev/mtd-utils/reb/nandsim.o
>>   Building modules, stage 2.
>>   MODPOST 1 modules
>> WARNING: "nand_release" [/home/bruno/dev/mtd-utils/reb/nandsim.ko] undefined!
>> WARNING: "nand_scan_tail" [/home/bruno/dev/mtd-utils/reb/nandsim.ko] undefined!
>> WARNING: "nand_scan_ident" [/home/bruno/dev/mtd-utils/reb/nandsim.ko] undefined!
>>   CC      /home/bruno/dev/mtd-utils/reb/nandsim.mod.o
>>   LD [M]  /home/bruno/dev/mtd-utils/reb/nandsim.ko
>> make[1]: Leaving directory `/usr/src/kernels/3.17.3-200.fc20.x86_64'
>>
>>
>> But then:
>> sudo insmod nandsim.ko first_id_byte=0x20 second_id_byte=0x33
>> insmod: ERROR: could not insert module nandsim.ko: Unknown symbol in module
>>
>> I am stuck here.
>
> On Linux you can only use/load kernel modules which match *exactly* you kernel.
> IOW if you use the Fedora kernel you'll have to use their nandsim.ko.
> In case they don't build it you have to rebuild the kernel.

There are no sources for MTD NAND in Fedora (which is a shame, by the way):
 yum --enablerepo="*-source" whatprovides "*/drivers/mtd/nand/nand_base.c"
 Loaded plugins: langpacks, refresh-packagekit
 kcbench-data-3.9-0.1-14.fc20.noarch : Kernel sources from 3.9 to be
used by kcbench
 Repo        : fedora
 Matched from:
 Filename    : /usr/share/kcbench-data/linux-3.9/drivers/mtd/nand/nand_base.c


But there are all the header files, that should be enough to build a
kernel module.
My point is how to build just a working nandsim.ko ??
Obviously, just getting the nandsim.c is not enough.
But I would like to avoid downloading the whole infradead repo to
build one module ...

Thanks

>
> Thanks,
> //richard



-- 
Bruno VERNAY
