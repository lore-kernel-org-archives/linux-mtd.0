Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhAQo-0004Tf-G5
 for linux-mtd@lists.infradead.org; Mon, 14 Aug 2017 08:09:04 +0000
Received: by mail-oi0-x244.google.com with SMTP id j194so8624185oib.4
 for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2017 01:08:41 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20170812193947.046dafd1@bbrezillon>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAB0kKmyHPXhv4ovmj00JgB9gow0Qi3OHm2Gh4STJFNV4S3o_Ag@mail.gmail.com>
 <CAK8P3a3W2Dw_CHDbBXPaX9=mNA1kPXdFDR1F4HLbtuLUVHjUKw@mail.gmail.com>
 <CAB0kKmyBEVWXvNBiFsFXSxz21mEFu8WVW69DWoes9oKsYEM0Vw@mail.gmail.com>
 <CAK8P3a1ooJja=P1e+m-fd0_wR_QdmWgwRWDwOWJfXpDR5ZcSjg@mail.gmail.com>
 <CAB0kKmxXvm5=ryR2nAJ76=ecmOWXLQXNYfRs8zrwinfMOMDzRQ@mail.gmail.com>
 <20170812193947.046dafd1@bbrezillon>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 14 Aug 2017 10:08:40 +0200
Message-ID: <CAK8P3a2pOtoug30CUe7sgB4CnQmRJSJMWmpniMyOHvV1w0nd9A@mail.gmail.com>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>,
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

On Sat, Aug 12, 2017 at 7:39 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Le Fri, 11 Aug 2017 18:42:44 -0500,
> Sanjay Tandel <sanjay.tandel@rockwellcollins.com> a =C3=A9crit :
>> On Fri, Aug 11, 2017 at 4:30 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> > On Fri, Aug 11, 2017 at 11:03 PM, Sanjay Tandel
>> > <sanjay.tandel@rockwellcollins.com> wrote:

>> Before, it used to corrupt every 2nd byte(2nd,4rth,6th ... upto N) in me=
mory,
>> with memcpy_toio() using 8-bit accesses for our 16-bit chip.
>>
>> Now, with backporting 7ddfe625cbc1/1bd46782d08b, it corrupts (N + 1)th b=
yte
>> in memory, when I tried to write N number of bytes (where N is not align=
ed to
>> 4-byte boundary).That means, it still tries 8-bit access for last odd by=
te and
>> ends up corrupting next byte.
>
> Yes, that's expected as the size is not 16bit aligned.
>
> Anyway, I read the whole thread again and AFAIU memcpy_to/fromio() is
> only appropriate if the bus controller the device is connected to is
> smart enough to hide all alignment problems to its users.
>
> Don't know what controller is causing trouble here, but you should
> probably have a dedicated driver (if that's not already the case) that
> overloads the ->copy_from()/->copy_to() methods to do the right thing
> for your memory controller.

Right, I think that is a good conclusion. My understanding from the discuss=
ion
so far is that the existing code in the core mtd layer works efficiently an=
d
correctly on most bus interfaces, so we should keep that but have
workarounds in the controller driver for any bus interface where this is
not the case.

I think it would be different if this was a regression and the core MTD sup=
port
worked correctly in the past, but from what I read, it always behaved like
this.

       Arnd
