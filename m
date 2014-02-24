Received: from mail-ve0-f172.google.com ([209.85.128.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHzmv-00063n-4P
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 17:57:58 +0000
Received: by mail-ve0-f172.google.com with SMTP id jz11so4304906veb.17
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2014 09:57:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAEAJfCC7UhwSa+106C9qzJJnkbDYGA7wiYGwfZqY2NZ8SWACA@mail.gmail.com>
References: <CADL8D3ZrL5FKE=E4gYw81fKwQ0DEHdVPHsM8Hwji--CkTBEJ5g@mail.gmail.com>
 <CAAEAJfCC7UhwSa+106C9qzJJnkbDYGA7wiYGwfZqY2NZ8SWACA@mail.gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 24 Feb 2014 12:57:15 -0500
Message-ID: <CADL8D3bQoFuzMgVuFo9ZjdtmZnM0FbRpWMFH3TuT+1Jc8OFWqg@mail.gmail.com>
Subject: Re: Question about AM335x SoC supported NAND flash (Ezequiel Garc?a)
To: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Stefan Roese <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Daniel Mack <zonque@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mailing list bumped my email since gmail was in html mode.  Switched
to plain text mode.  Hopefully this goes through.

On Mon, Feb 24, 2014 at 12:29 PM, Ezequiel Garc=EDa
<ezequiel@vanguardiasur.com.ar> wrote:
> On 24 February 2014 14:15, Jon Cormier <jcormier@criticallink.com> wrote:
> First off apologizes if I've replied to the mailing list digest incorrect=
ly.
>>>
>>> We're developing a custom AM335x-based board, which is meant to boot fr=
om
>>> NAND.
>>>
>>> The flash device is a Micron MT29F8G08ABABA NAND. This device is
>>> ONFI-compliant
>>> and has 4 KiB page size, 512 KiB block size.
>>>
>>> Accessing it from U-Boot and Linux works just fine, apparently in ECC B=
CH8
>>> mode.
>>>
>>> However, we cannot get the SoC to boot from NAND. We've double-checked
>>> the hardware
>>> and the SYSBOOT, but still no luck with it.
>>>
>>> So, I thought about asking here, in case this device is (for some
>>> reason) not supported by the
>>> ROM code booting. Maybe someone already struggled with this and has
>>> some idea to suggest?
>>>
> [..]
>>
>> As Pekon pointed out the 335x expects BCH16 for nand devices with a 4K p=
age
>> size.  Critical Link has gotten this to work for our custom SoM.   Your
>> welcome to check it out if it will be helpful.  We are using Micron
>> MT29F4G08ABAEAH4-IT Nand.  BCH16 is working for us in our u-boot 2013.10
>> branch and in our kernel 3.2 branch (based off of TI's PSP .07).  Our
>> changes are probably not up to mainline standard as I don't have a lot o=
f
>> mainline experience yet.  Hope it helps.
>>
>
> It sure will! I'll take a look right away and let you know.
>
> Thanks a lot!
> --
> Ezequiel Garc=EDa, VanguardiaSur
> www.vanguardiasur.com.ar



--=20
Jonathan Cormier
CriticalLink
