Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8uEy-0006Ct-Lp
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 18:22:26 +0000
Received: by mail-wm0-x22d.google.com with SMTP id n186so177564090wmn.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2015 10:22:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151215181257.GD10460@google.com>
References: <1448240997-26969-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20151215181257.GD10460@google.com>
Date: Tue, 15 Dec 2015 15:22:02 -0300
Message-ID: <CAAEAJfDPJJLJyw5ddhLo9J75h73XspJForaZsUovhogdTfCkVA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: wait until lock/unlock operations are ready
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Stas Sergeev <stsp@list.ru>
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

Brian,

On 15 December 2015 at 15:12, Brian Norris <computersforpeace@gmail.com> wr=
ote:
> On Sun, Nov 22, 2015 at 10:09:57PM -0300, Ezequiel Garcia wrote:
>> On Micron and Numonyx devices, the status register write command
>> (WRSR), raises a work-in-progress bit (WIP) on the status register.
>> The datasheets for these devices specify that while the status
>> register write is in progress, the status register WIP bit can still
>> be read to check the end of the operation.
>>
>> This commit adds a wait_till_ready call on lock/unlock operations,
>> only for these manufacturers. This is needed to prevent applications
>> from issuing erase or program operations before the unlock operation
>> is completed.
>>
>> Reported-by: Stas Sergeev <stsp@list.ru>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor=
.c
>> index e9c26c0e2258..acc9b05e02be 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -485,6 +485,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs,=
 uint64_t len)
>>       u8 status_old, status_new;
>>       u8 mask =3D SR_BP2 | SR_BP1 | SR_BP0;
>>       u8 shift =3D ffs(mask) - 1, pow, val;
>> +     int ret;
>
> I've merged other patches in the meantime (sorry), so this might need a
> rebasing on l2-mtd.git. I'd do it, but should get a v2 anyway.
>

No problem.

>>
>>       status_old =3D read_sr(nor);
>>
>> @@ -521,7 +522,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs=
, uint64_t len)
>>               return -EINVAL;
>>
>>       write_enable(nor);
>> -     return write_sr(nor, status_new);
>> +     ret =3D write_sr(nor, status_new);
>> +     if (ret)
>> +             return ret;
>> +     ret =3D spi_nor_wait_till_ready(nor);
>> +     if (ret)
>> +             return ret;
>> +     return 0;
>
> Why not just return spi_nor_wait_till_ready(nor)?
>
>>  }
>>
>>  /*
>> @@ -535,6 +542,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t of=
s, uint64_t len)
>>       uint8_t status_old, status_new;
>>       u8 mask =3D SR_BP2 | SR_BP1 | SR_BP0;
>>       u8 shift =3D ffs(mask) - 1, pow, val;
>> +     int ret;
>>
>>       status_old =3D read_sr(nor);
>>
>> @@ -569,7 +577,13 @@ static int stm_unlock(struct spi_nor *nor, loff_t o=
fs, uint64_t len)
>>               return -EINVAL;
>>
>>       write_enable(nor);
>> -     return write_sr(nor, status_new);
>> +     ret =3D write_sr(nor, status_new);
>> +     if (ret)
>> +             return ret;
>> +     ret =3D spi_nor_wait_till_ready(nor);
>> +     if (ret)
>> +             return ret;
>> +     return 0;
>
> Same?
>

Sure, somehow I missed that.

I'll send a fixed v2.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
