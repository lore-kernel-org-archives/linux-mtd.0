Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZL9Y3-0005f5-Et
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 12:36:28 +0000
Received: by wicmv11 with SMTP id mv11so56557144wic.0
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 05:36:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMqctQFvB+aUXrFEwsrExZcjVbZgLrFQ-Ua3tXfjceiNmNSXQ@mail.gmail.com>
References: <1437479828-30826-1-git-send-email-B48286@freescale.com>
 <CY1PR0301MB0780E3F6E2A1170A7A56A8538B8A0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CAOMqctQFvB+aUXrFEwsrExZcjVbZgLrFQ-Ua3tXfjceiNmNSXQ@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 31 Jul 2015 14:35:26 +0200
Message-ID: <CAOMqctRkFVVzeTF7+6LWB+iwafJUmYbgTSWWXpni9=R7G1S2HQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: mtd/spi-nor: add checking for the spi_nor_read
To: Hou Zhiqiang <B48286@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "shijie.huang@intel.com" <shijie.huang@intel.com>,
 Hu Vincent <Mingkai.Hu@freescale.com>
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

On 31 July 2015 at 14:13, Michal Suchanek <hramrach@gmail.com> wrote:
> Hello,
>
> On 31 July 2015 at 12:35, Hou Zhiqiang <B48286@freescale.com> wrote:
>> Hi Shijie and Brian,
>>
>> Do you have any comment?
>>
>>> -----Original Message-----
>>> From: Zhiqiang Hou [mailto:B48286@freescale.com]
>>> Sent: 2015=E5=B9=B47=E6=9C=8821=E6=97=A5 19:57
>>> To: linux-mtd@lists.infradead.org; computersforpeace@gmail.com;
>>> dwmw2@infradead.org
>>> Cc: Hu Mingkai-B21284; Hou Zhiqiang-B48286
>>> Subject: [PATCH] RFC: mtd/spi-nor: add checking for the spi_nor_read
>>>
>>> From: Hou Zhiqiang <B48286@freescale.com>
>>>
>>> Compare the var retlen with len to ensure the read operation successful=
.
>>>
>>> There are some SPI controllers that have a maximum transfer length, e.g=
.
>>> Freescale eSPI controller is able to transfer 0x10000 Bytes each time.
>>> If the spi_nor_read diliver a transaction length that excced the abilit=
y
>>> of the SPI controller, there should be multiple read operation to make
>>> sure this transaction completion.
>>>
>>> Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++++--
>>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-
>>> nor.c index fbc5035..ec10cd1 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -715,6 +715,8 @@ static int spi_nor_read(struct mtd_info *mtd, loff_=
t
>>> from, size_t len,  {
>>>       struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
>>>       int ret;
>>> +     size_t cnt =3D 0;
>>> +     u_char *cur =3D buf;
>>>
>>>       dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
>>>
>>> @@ -722,8 +724,16 @@ static int spi_nor_read(struct mtd_info *mtd, loff=
_t
>>> from, size_t len,
>>>       if (ret)
>>>               return ret;
>>>
>>> -     ret =3D nor->read(nor, from, len, retlen, buf);
>>> -
>>> +     *retlen =3D 0;
>>> +     while (len > 0) {
>>> +             ret =3D nor->read(nor, from, len, &cnt, cur);
>>> +             if (ret < 0)
>>> +                     break;
>>> +             len -=3D cnt;
>>> +             cur +=3D cnt;
>>> +             *retlen +=3D cnt;
>>> +             from +=3D cnt;
>>> +     }
>>>       spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
>>>       return ret;
>>>  }
>>> --
>>> 2.1.0.27.g96db324
>>
>> Thanks,
>> Zhiqiang
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
> It appears that nor->read() always returns 0.
>
> Also see https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg9=
42729.html
>

Sorry, there is some e-mail thread connectivity problem. This is a
link to the actual patch

http://lists.infradead.org/pipermail/linux-mtd/2015-July/060466.html
