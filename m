MIME-Version: 1.0
In-Reply-To: <AANLkTinwlsrxvjHyEs1IAwaw-8GXYN2lVrUOtYp0C52n@mail.gmail.com>
References: <AANLkTil1FnPkGS7l6W0HWeXyOxXzWbZkvFWY4jJF_I_A@mail.gmail.com>
	<AANLkTinOsQ8AcH-As91CRqrEQVnXdsm_CmFQgyj7gI1_@mail.gmail.com>
	<AANLkTim9O5kuGzvQoB65fWDr3Bi9siiVBMCPx6heqZjd@mail.gmail.com>
	<AANLkTimGzVtuJuuxipim-f6UhdK287EjF41UlhdKCWRM@mail.gmail.com>
	<AANLkTindDgsvPK-ZZsyB2cdsrh0IyykBuhgStuwvyIdg@mail.gmail.com>
	<AANLkTinwlsrxvjHyEs1IAwaw-8GXYN2lVrUOtYp0C52n@mail.gmail.com>
Date: Fri, 18 Jun 2010 16:44:43 +0800
Message-ID: <AANLkTikDXl0XwO_08T87l8jY-Lf_uNZDfOjrMfsnuCto@mail.gmail.com>
Subject: Re: [PATCH 01/25] pxa3xx_nand: condense the flash definition
From: Lei Wen <adrian.wenl@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 18, 2010 at 4:14 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
> On Fri, Jun 18, 2010 at 4:10 PM, Lei Wen <adrian.wenl@gmail.com> wrote:
>> On Fri, Jun 18, 2010 at 4:00 PM, Eric Miao <eric.y.miao@gmail.com> wrote=
:
>>>>>> -struct pxa3xx_nand_timing {
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tCH; =C2=A0/* Enabl=
e signal hold time */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tCS; =C2=A0/* Enabl=
e signal setup time */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWH; =C2=A0/* ND_nW=
E high duration */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWP; =C2=A0/* ND_nW=
E pulse time */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tRH; =C2=A0/* ND_nR=
E high duration */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tRP; =C2=A0/* ND_nR=
E pulse width */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tR; =C2=A0 /* ND_nW=
E high to ND_nRE low for read */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tWHR; /* ND_nWE hig=
h to ND_nRE low for status read */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0tAR; =C2=A0/* ND_AL=
E low to ND_nRE low delay */
>>>>>> -};
>>>>>> -
>>>>>> -struct pxa3xx_nand_cmdset {
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read1;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read2;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0program;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read_stat=
us;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0read_id;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0erase;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0reset;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0lock;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock;
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint16_t =C2=A0 =C2=A0 =C2=A0 =C2=A0lock_stat=
us;
>>>>>> -};
>>>>>> -
>>>>>> -struct pxa3xx_nand_flash {
>>>>>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_timing *timing; /* N=
AND Flash timing */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset;
>>>>>> -
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint32_t page_per_block;/* Pages per block (P=
G_PER_BLK) */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint32_t page_size; =C2=A0 =C2=A0 /* Page siz=
e in bytes (PAGE_SZ) */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint32_t flash_width; =C2=A0 /* Width of Flas=
h memory (DWIDTH_M) */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint32_t dfc_width; =C2=A0 =C2=A0 /* Width of=
 flash controller(DWIDTH_C) */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint32_t num_blocks; =C2=A0 =C2=A0/* Number o=
f physical blocks in Flash */
>>>>>> - =C2=A0 =C2=A0 =C2=A0 uint32_t chip_id;
>>>>>> -};
>>>>>> -
>>>>>
>>>>> So does this prevent board code from defining their own timing and et=
c?
>>>>
>>>> No, platform could define its own timing. If there is definition for
>>>> the same chip,
>>>> driver would choose the one from platform definition first.
>>>>
>>>
>>> I'm seeing pxa3xx_nand_flash being referenced in pxa3xx_nand_platform_d=
ata
>>> below, though?
>>>
>>> struct pxa3xx_nand_platform_data {
>>>
>>> =C2=A0 =C2=A0 =C2=A0......
>>>
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct pxa3xx_nand_flash * =C2=A0 =C2=
=A0 =C2=A0 =C2=A0flash;
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0num_flash;
>>> };
>>>
>>
>> Yes, platform could define its own pxa3xx_nand_flash structure in its
>> own code, and pass the structure to let driver know.
>>
>
> I'm actually quite confused here. Did you ever try build a kernel with
> platform defined flash info?
>

I haven't tried to build one platform code with flash definition
yet... My fault...
I would correct this error in .h file.
