Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJkL9-0004bf-Ac
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 11:11:12 +0000
Received: by ywm19 with SMTP id 19so4026379ywm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2011 04:11:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4EAA845B.1020009@parrot.com>
References: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
	<4EAA845B.1020009@parrot.com>
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 28 Oct 2011 13:10:49 +0200
Message-ID: <CAAwP0s32AJCm_AjxubDSu8ikzhXeRWUqqsPrBmygUHPkRvtv8g@mail.gmail.com>
Subject: Re: [RFC] Change ECC algorithm from userspace
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 28, 2011 at 12:30 PM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> Hi,
>
> Javier Martinez Canillas a =C3=A9crit :
>> Hello,
>>
>> I want to be able to use 1-bit ECC for the first partition where I
>> save the loader binary and has to be accessed by the ROM boot but use
>> a 4-bit ECC for my rootfs partition.
>>
>> Does anyone have this same issue?
> We use raw programming and compute the ecc in software.
>
>

Hi Matthieu,

We also thought that solution but it wasn't clear for me if doing a
RAW write to the mtd device I skip the NAND driver and could also
write the oob section without that value being recalculate and rewrite
by the driver.

>>
>> What is the best approach to store data in a NAND device using
>> different ECC techniques?
>>
>> I've think of two approaches:
>>
>> 1- Adding an ioctl to mtdchar (something like ECCSETBITS) to change
>> the ECC technique used.
> But this won't work if there is concurrent acess to mtd. One program may =
want 1
> bit ecc other want 4 bits ecc.
>
>> 2- Use a platform data field to notify the omap2 nand driver that the
>> ROM boot only supports 1-bit ECC. So it can use a 1-bit ECC to write
>> and read the first 4 sectors but a 4-bit ECC for the rest.
> This may be better.
>
> Matthieu
>
> PS : note that some OMAP ROM support a better protection than Hamming (bu=
t the
> details are not public AFAIK)
>
> From OMAP34xx Multimedia Device, Silicon Revision 3.1.x, public version :
>
> Pages can contain errors caused by memory alteration. To correct these er=
rors,
> the ROM code uses ECC,
> based on Hamming codes for SLC NAND and BCH (Bose, Ray-Chaudhuri, Hocquen=
ghem)
> code for
> multilevel cell (MLC) devices. The computed ECC is compared to ECC stored=
 in the
> spare area of the
> corresponding page. If there are uncorrectable errors, the ROM code retur=
ns with
> FAIL.
>

Yes I've read that on the DM3730 TRM but as far as I understand only
applies to MLC devices, but ours is SLC.

Thank you and best regards,

--=20
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
Barcelona, Spain
