Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a30GC-0003mr-RX
 for linux-mtd@lists.infradead.org; Sun, 29 Nov 2015 11:35:18 +0000
Received: by wmuu63 with SMTP id u63so97900030wmu.0
 for <linux-mtd@lists.infradead.org>; Sun, 29 Nov 2015 03:34:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOMqctRDMqsJAAiUFw6jbhTeCCp1yKPtpqke7c0PnqTavAUTwg@mail.gmail.com>
References: <5615780D.7050407@gmail.com> <20151120232836.GC64635@google.com>
 <CAOMqctRDMqsJAAiUFw6jbhTeCCp1yKPtpqke7c0PnqTavAUTwg@mail.gmail.com>
Date: Sun, 29 Nov 2015 08:34:53 -0300
Message-ID: <CAAEAJfAnTbRxEYVGHD-=XiJULmPzANLGWMvDCYAv69Uns1Kq=Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: handle failed spi_write in m25p80_erase
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
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

On 29 November 2015 at 08:18, Michal Suchanek <hramrach@gmail.com> wrote:
> Hello,
>
> On 21 November 2015 at 00:28, Brian Norris <computersforpeace@gmail.com> =
wrote:
>> On Wed, Oct 07, 2015 at 09:52:45PM +0200, Heiner Kallweit wrote:
>>> Return an error if spi_write fails.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>  drivers/mtd/devices/m25p80.c | 4 +---
>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.=
c
>>> index 634b0c4..f10daa8 100644
>>> --- a/drivers/mtd/devices/m25p80.c
>>> +++ b/drivers/mtd/devices/m25p80.c
>>> @@ -171,9 +171,7 @@ static int m25p80_erase(struct spi_nor *nor, loff_t=
 offset)
>>>       flash->command[0] =3D nor->erase_opcode;
>>>       m25p_addr2cmd(nor, offset, flash->command);
>>>
>>> -     spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
>>> -
>>> -     return 0;
>>> +     return spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
>>>  }
>>>
>>>  /*
>>
>> m25p80_erase() has been dropped, as it can be implemented in spi-nor.c,
>> with calls only to ->write_reg(). This error handling is done correctly
>> there. See:
>>
>> cd78ea02dc82 ("mtd: m25p80: drop erase() callback")
>> c67cbb839da9 ("mtd: spi-nor: provide default erase_sector implementation=
")
>>
>
> Where are these patches applied?
>

As per [1] latest MTD patches are in http://git.infradead.org/l2-mtd.git.

[1] http://www.linux-mtd.infradead.org/source.html

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
