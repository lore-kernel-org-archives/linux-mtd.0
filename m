Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WD8IV-0001p2-GK
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 08:02:28 +0000
From: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 11 Feb 2014 09:01:50 +0100
Subject: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>,
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
In-Reply-To: <52F1F658.9080701@nod.at>
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Bill
 Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> -----Urspr=FCngliche Nachricht-----
> Von: Richard Weinberger [mailto:richard@nod.at]=20
> Gesendet: Mittwoch, 5. Februar 2014 09:29
> An: Wiedemer, Thorsten (Lawo AG)
> Cc: linux-mtd@lists.infradead.org; Bill Pringlemeir
> Betreff: Re: UBI leb_write_unlock NULL pointer Oops (continuation)=20
>
> Am 04.02.2014 18:01, schrieb Wiedemer, Thorsten (Lawo AG):
>>  Hi,
>> =20
>>  I made a "hardcore test" with:
>>  $ while [ 1 ]; do cp <file_of_8kByte_size>=20
>>  tmp/<file_of_8kByte_size.1>; sync; done & $ while [ 1 ]; do cp=20
>>  <file_of_8kByte_size> tmp/<file_of_8kByte_size.2>; sync; done & $=20
>>  while [ 1 ]; do cp <file_of_8kByte_size> tmp/<file_of_8kByte_size.3>;=20
>>  sync; done &
>> =20
>>  It took about 2-3 hours until I had an error (two times):
>
> This test ran the over night without any error on my imx51 board. :-\
>
> Bill's great analysis showed that it may be a linked list corruption in r=
w_semaphore.
> Thorsten, can you please enable CONFIG_DEBUG_LIST?
> Also try whether you can trigger the issue with lock debugging enabled.
>
> Thanks,
> //richard

short update (I was out of office the rest of last week).
I compiled the kernel with the debug flags for debug list and lock alloc.
The kernel compiled with gcc-4.8.2 didn't start (no output on serial consol=
e and reboot of the system).
I didn't try (yet) to find out what happens at startup.

I compiled the same kernel (and same config) with gcc-4.4.4. The write test=
 runs now for over 16 hours without error.
Next step is to find out wether this is due to a changed timing because of =
the debug flags or if it's the compiler.

Best regards,
Thorsten
