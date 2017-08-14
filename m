Received: from da1vs02.rockwellcollins.com ([205.175.227.29])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhIJg-0008Cv-8h
 for linux-mtd@lists.infradead.org; Mon, 14 Aug 2017 16:34:43 +0000
Received: by mail-yw0-f198.google.com with SMTP id o192so191478158ywd.8
 for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2017 09:33:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2pOtoug30CUe7sgB4CnQmRJSJMWmpniMyOHvV1w0nd9A@mail.gmail.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAB0kKmyHPXhv4ovmj00JgB9gow0Qi3OHm2Gh4STJFNV4S3o_Ag@mail.gmail.com>
 <CAK8P3a3W2Dw_CHDbBXPaX9=mNA1kPXdFDR1F4HLbtuLUVHjUKw@mail.gmail.com>
 <CAB0kKmyBEVWXvNBiFsFXSxz21mEFu8WVW69DWoes9oKsYEM0Vw@mail.gmail.com>
 <CAK8P3a1ooJja=P1e+m-fd0_wR_QdmWgwRWDwOWJfXpDR5ZcSjg@mail.gmail.com>
 <CAB0kKmxXvm5=ryR2nAJ76=ecmOWXLQXNYfRs8zrwinfMOMDzRQ@mail.gmail.com>
 <20170812193947.046dafd1@bbrezillon>
 <CAK8P3a2pOtoug30CUe7sgB4CnQmRJSJMWmpniMyOHvV1w0nd9A@mail.gmail.com>
From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Date: Mon, 14 Aug 2017 11:33:27 -0500
Message-ID: <CAB0kKmzcf4pVHUWS6Rk+fb3umgN6ttmdNv7QmfeUik2vAFEijA@mail.gmail.com>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
To: Arnd Bergmann <arnd@arndb.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
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

On Mon, Aug 14, 2017 at 3:08 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sat, Aug 12, 2017 at 7:39 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>> Le Fri, 11 Aug 2017 18:42:44 -0500,
>> Sanjay Tandel <sanjay.tandel@rockwellcollins.com> a =C3=A9crit :
>>> On Fri, Aug 11, 2017 at 4:30 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> > On Fri, Aug 11, 2017 at 11:03 PM, Sanjay Tandel
>>> > <sanjay.tandel@rockwellcollins.com> wrote:
>
>>> Before, it used to corrupt every 2nd byte(2nd,4rth,6th ... upto N) in m=
emory,
>>> with memcpy_toio() using 8-bit accesses for our 16-bit chip.
>>>
>>> Now, with backporting 7ddfe625cbc1/1bd46782d08b, it corrupts (N + 1)th =
byte
>>> in memory, when I tried to write N number of bytes (where N is not alig=
ned to
>>> 4-byte boundary).That means, it still tries 8-bit access for last odd b=
yte and
>>> ends up corrupting next byte.
>>
>> Yes, that's expected as the size is not 16bit aligned.
>>
>> Anyway, I read the whole thread again and AFAIU memcpy_to/fromio() is
>> only appropriate if the bus controller the device is connected to is
>> smart enough to hide all alignment problems to its users.
>>
>> Don't know what controller is causing trouble here, but you should
>> probably have a dedicated driver (if that's not already the case) that
>> overloads the ->copy_from()/->copy_to() methods to do the right thing
>> for your memory controller.
>
> Right, I think that is a good conclusion. My understanding from the discu=
ssion
> so far is that the existing code in the core mtd layer works efficiently =
and
> correctly on most bus interfaces, so we should keep that but have
> workarounds in the controller driver for any bus interface where this is
> not the case.
>
> I think it would be different if this was a regression and the core MTD s=
upport
> worked correctly in the past, but from what I read, it always behaved lik=
e
> this.
>

Okay. I will try to create dedicated driver. Thanks!

>        Arnd

Regards,
Sanjay
