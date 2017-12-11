Received: from mail-pg0-x233.google.com ([2607:f8b0:400e:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOQdE-0007uO-E1
 for linux-mtd@lists.infradead.org; Mon, 11 Dec 2017 16:08:42 +0000
Received: by mail-pg0-x233.google.com with SMTP id j9so11212038pgc.11
 for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2017 08:08:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171211141307.6535523c@xps13>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <CAAEAJfBGG9wMVGnwSBfgr+tpr_E_weVBqTc=EvDGU6JUQveFQg@mail.gmail.com>
 <20171210151734.7e1aac59@xps13>
 <CAAEAJfCX5wakFfuPbEvyQjCu3V8Qv3O98=kF1STxDQcQ+vkgoQ@mail.gmail.com>
 <20171211141307.6535523c@xps13>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 11 Dec 2017 13:08:23 -0300
Message-ID: <CAAEAJfCkGGOXOPmE5QVKrNGWcX1Tfe76_AwtVDnNrSEkcZN81w@mail.gmail.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 December 2017 at 10:13, Miquel RAYNAL
<miquel.raynal@free-electrons.com> wrote:
> On Mon, 11 Dec 2017 09:30:53 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
>> On 10 December 2017 at 11:17, Miquel RAYNAL
>> <miquel.raynal@free-electrons.com> wrote:
>> > Hi Ezequiel,
>> >
>> >> >> [    2.296924] nand: device found, Manufacturer ID: 0x2c, Chip
>> >> >> ID: 0xda [    2.303311] nand: Micron MT29F2G08ABAEAH4
>> >> >> [    2.307334] nand: 256 MiB, SLC, erase size: 128 KiB, page
>> >> >> size: 2048, OOB size: 64
>> >> >> [    2.314939] pxa3xx-nand f10d0000.flash: ECC strength 16, ECC
>> >> >> step size 2048
>> >> >
>> >> > In theory, Marvell NAND flash controller does support 16-bit
>> >> > strength per 512 bytes over 2048 bytes pages. However, this
>> >> > controller driver (pxa3xx_nand) does not. See [1] for the
>> >> > supported configurations.
>> >>
>> >> Why do you say the driver does not support it?
>> >
>> > My reading of the trace was incomplete as it is mentioned that the
>> > 16-bit correction applies on 2kiB chunks (a full page) while I was
>> > referring to 512 bytes chunks.
>> >
>> > Protecting 2kiB pages with BCH algorithm may prevent the flip of up
>> > to 16 bits per page, which may also be seen as 4 bits per 512 bytes.
>> > Asking for 16-bit strength for 512 bytes (configuration I was
>> > referring to) is supported by the controller but simply not
>> > implemented.
>> >
>> > However, below code setting up ecc->strength to 16 while
>> > ecc_stepsize is 512 is, IMHO, wrong.
>> >
>>
>> If you feel there's anything wrong and worth changing in the current
>> driver, please submit a patch.
>
> Somehow I did it last week, by sending the first version of a rework :)
>

Sure, and I'm happy to see the rework.

However, this driver will still be around, possibly for many years
given vendors using stable kernels.

So, really: if there's anything you think is worth discussing and fixing,
please submit a patch.

Thanks!
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
