Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3Pmr-0004Oc-Hb
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 14:50:42 +0000
Received: by wmvv187 with SMTP id v187so160463647wmv.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 06:50:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <565A26D6.5090504@openwrt.org>
References: <1448555221-24257-1-git-send-email-nbd@openwrt.org>
 <CAAEAJfDk=21tvXRMtpgckct9pKjUkmWJ9hPDikgt88sxhpvQ6A@mail.gmail.com>
 <565A26D6.5090504@openwrt.org>
Date: Mon, 30 Nov 2015 11:50:19 -0300
Message-ID: <CAAEAJfCjjAQaECdbLa=w4tpHre+g_T7b6PfrF=K1CeFxE_7xFQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: spi-nor: disable protection for Winbond
 flash at startup"
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Felix Fietkau <nbd@openwrt.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
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

On 28 November 2015 at 19:12, Felix Fietkau <nbd@openwrt.org> wrote:
> On 2015-11-28 22:56, Ezequiel Garcia wrote:
>> On 26 November 2015 at 13:27, Felix Fietkau <nbd@openwrt.org> wrote:
>>> This reverts commit c6fc2171b249e73745c497b578b417a2946f1b2f.
>>>
>>> This commit is breaking read access on at least s25fl064k, but also
>>> possibly other Spansion flash chips.
>>>
>>> Any mtd read seems to succeed, but simply returns a zero-filled buffer.
>>>
>>> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 7 +++----
>>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-no=
r.c
>>> index 4988390..8b8842e 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1194,14 +1194,13 @@ int spi_nor_scan(struct spi_nor *nor, const cha=
r *name, enum read_mode mode)
>>>         mutex_init(&nor->lock);
>>>
>>>         /*
>>> -        * Atmel, SST, Intel/Numonyx, and others serial NOR tend to pow=
er up
>>> -        * with the software protection bits set
>>> +        * Atmel, SST and Intel/Numonyx serial nor tend to power
>>> +        * up with the software protection bits set
>>>          */
>>>
>>>         if (JEDEC_MFR(info) =3D=3D SNOR_MFR_ATMEL ||
>>>             JEDEC_MFR(info) =3D=3D SNOR_MFR_INTEL ||
>>> -           JEDEC_MFR(info) =3D=3D SNOR_MFR_SST ||
>>> -           JEDEC_MFR(info) =3D=3D SNOR_MFR_WINBOND) {
>>> +           JEDEC_MFR(info) =3D=3D SNOR_MFR_SST) {
>>>                 write_enable(nor);
>>>                 write_sr(nor, 0);
>>>         }
>>
>> As Brian mentioned, this looks definitely fishy.
>>
>> IIUC, the above statement is trying to unlock flashes that power-up as
>> locked. But you say your flash is still locked after booting? And
>> moreover, removing the unlock quirk fixes it?
> The flash isn't locked when the system boots, reads and writes work just
> fine.
>
>> I think a more complete description of your problem might help us fix
>> this the right way. Perhaps the above line clearing the status
>> register is wrong?
> Without the write_enable/write_sr, the flash is readable and writable.
> With it, any reads return only null-bytes as data. What other info about
> the problem do you need?
>

Well, printing the status register right before a read (i.e. when the
problem shows) might help understand what's going on.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
