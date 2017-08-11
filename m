Received: from da1vs02.rockwellcollins.com ([205.175.227.29])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dgH6P-0004U6-NC
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 21:04:20 +0000
Received: by mail-yw0-f199.google.com with SMTP id a14so75678522ywe.5
 for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2017 14:03:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3W2Dw_CHDbBXPaX9=mNA1kPXdFDR1F4HLbtuLUVHjUKw@mail.gmail.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAB0kKmyHPXhv4ovmj00JgB9gow0Qi3OHm2Gh4STJFNV4S3o_Ag@mail.gmail.com>
 <CAK8P3a3W2Dw_CHDbBXPaX9=mNA1kPXdFDR1F4HLbtuLUVHjUKw@mail.gmail.com>
From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Date: Fri, 11 Aug 2017 16:03:32 -0500
Message-ID: <CAB0kKmyBEVWXvNBiFsFXSxz21mEFu8WVW69DWoes9oKsYEM0Vw@mail.gmail.com>
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

On Fri, Aug 11, 2017 at 2:41 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Aug 11, 2017 at 6:50 PM, Sanjay Tandel
> <sanjay.tandel@rockwellcollins.com> wrote:
>> On Wed, Aug 9, 2017 at 1:10 PM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>>> Le Fri,  4 Aug 2017 08:02:20 -0500,
>>> Matt Weber <matthew.weber@rockwellcollins.com> a =C3=A9crit :
>>>
>>>> From: sgtandel <sanjay.tandel@rockwellcollins.com>
>>>>
>>>> This patch adds 16-bit I/O memory write function (map_copy_to16) in ma=
p-ram
>>>> driver. map-ram driver's block write function(i.e map_copy_to) uses
>>>> memcpy_toio() function for block transfer. memcpy_toio() is limited to=
 do
>>>> single byte write, irrespective of bankwidth.
>>>
>>> That's not true. Depending on the platform (+ config options)
>>> memcpy_to/fromio() can be a simple redirection to memcpy, and
>>> memcpy is likely to be optimized to do 32bit or 64bit accesses when
>>> possible (IOW, when alignment allows it).
>>>
>> Agree with you on memcpy_toio/_fromio.
>> but map-ram driver's map_copy_to/map_copy_from aren't based on bank-widt=
h
>> provided for specific chip.It relies on memcpy_toio, which is dependent =
on arch,
>> alignment and size.For example - like in our case of accessing 16-bit
>> flash, despite
>> of chip's bank-width being 16-bit, map_copy_to ends up accessing 8-bit u=
sing
>> memcpy_toio, because memcpy_toio for ARM arch always does 8-bit accesses=
.
>
> On almost all ARM platforms, it would use 32-bit accesses these days. On =
what
> kernel version, ARM platform and endianess do you see memcpy_toio() use 8=
-bit
> access?
>

We use version 4.1.8 with Freescale LS1021A( cortex-a7 core, little-endian)=
.
With the newer versions of kernel also, I can see same 8-bit
implementation for 32-bit ARM arch.

BTW, for other arch also memcpy_toio()  uses combination of  32-bit(or
64-bit) and 8-bit accesses,
which may not work here.Because we need all accesses to be of same
size(bank-width).


>        Arnd
