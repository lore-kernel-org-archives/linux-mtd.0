Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nq11g-0003YN-Jc
	for linux-mtd@lists.infradead.org; Fri, 12 Mar 2010 09:19:29 +0000
Received: by pvc22 with SMTP id 22so405370pvc.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Mar 2010 01:19:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0554BEF07D437848AF01B9C9B5F0BC5D9C10D43E@dlee01.ent.ti.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
	<62cbdcd91003041227i5af7e246u381e1bf7802a8cb@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9C10D43E@dlee01.ent.ti.com>
Date: Fri, 12 Mar 2010 14:49:22 +0530
Message-ID: <aecf5e531003120119rde30668o2827d2e6f638b149@mail.gmail.com>
Subject: Re: MLC nand driver for linux
From: Sasa Sasa <sasak.1983@gmail.com>
To: "Paulraj, Sandeep" <s-paulraj@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	massimo cirillo <maxcir@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Paulraj,

Thanks for your help.

I am able to bring basic mlc nand. But have some queries:-
1) Right now I am using no ECC. Can we write same data to same page
without erasing it in mlc nand which is possible for SLC.
i.e writing "cat file > /dev/mtd0"  will corrupt mlc nand while
writing it multiple times.


2) In jffs2 data gets corrupted while mounting and remounting it
again. and got the following error
JFFS2 notice: (542) read_dnode: wrong data CRC in data node at
0x02109184: read 0x419fcf65, calculated 0x6e3d71b3.

Do you have any idea that these issues might be related to timing
programming for mlc nand. or any specific changes would be done in mlc
nand driver?

Regards
Sasa

On Fri, Mar 5, 2010 at 3:16 AM, Paulraj, Sandeep <s-paulraj@ti.com> wrote:
>
>
>> Hi,
>> Sorry my earlier message was rejected because of suspicious header.
>>
>> Hi Paulraj,
>> I'm interested in testing Numonyx MLC Nand devices.
>> So, what kind of tests have you done with MLC NAND ?
> The ones we get in mtd-utils
>> File system level ?
> We load jffs and yaffs2
>> Driver level ?
> We check if ECC correction actually takes place
>> Have you modified in any part the nand_base.c file ?
> No.
>> And what kernel version ?
> The latest 2.6.33.. I have been working on it since 2.6.28.
>> thanks
>>
>
>
