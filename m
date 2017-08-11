Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dgFoK-0004Wk-56
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 19:41:33 +0000
Received: by mail-oi0-x241.google.com with SMTP id s21so4202929oie.5
 for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2017 12:41:11 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <CAB0kKmyHPXhv4ovmj00JgB9gow0Qi3OHm2Gh4STJFNV4S3o_Ag@mail.gmail.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAB0kKmyHPXhv4ovmj00JgB9gow0Qi3OHm2Gh4STJFNV4S3o_Ag@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 11 Aug 2017 21:41:10 +0200
Message-ID: <CAK8P3a3W2Dw_CHDbBXPaX9=mNA1kPXdFDR1F4HLbtuLUVHjUKw@mail.gmail.com>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
To: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
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

On Fri, Aug 11, 2017 at 6:50 PM, Sanjay Tandel
<sanjay.tandel@rockwellcollins.com> wrote:
> On Wed, Aug 9, 2017 at 1:10 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>> Le Fri,  4 Aug 2017 08:02:20 -0500,
>> Matt Weber <matthew.weber@rockwellcollins.com> a =C3=A9crit :
>>
>>> From: sgtandel <sanjay.tandel@rockwellcollins.com>
>>>
>>> This patch adds 16-bit I/O memory write function (map_copy_to16) in map=
-ram
>>> driver. map-ram driver's block write function(i.e map_copy_to) uses
>>> memcpy_toio() function for block transfer. memcpy_toio() is limited to =
do
>>> single byte write, irrespective of bankwidth.
>>
>> That's not true. Depending on the platform (+ config options)
>> memcpy_to/fromio() can be a simple redirection to memcpy, and
>> memcpy is likely to be optimized to do 32bit or 64bit accesses when
>> possible (IOW, when alignment allows it).
>>
> Agree with you on memcpy_toio/_fromio.
> but map-ram driver's map_copy_to/map_copy_from aren't based on bank-width
> provided for specific chip.It relies on memcpy_toio, which is dependent o=
n arch,
> alignment and size.For example - like in our case of accessing 16-bit
> flash, despite
> of chip's bank-width being 16-bit, map_copy_to ends up accessing 8-bit us=
ing
> memcpy_toio, because memcpy_toio for ARM arch always does 8-bit accesses.

On almost all ARM platforms, it would use 32-bit accesses these days. On wh=
at
kernel version, ARM platform and endianess do you see memcpy_toio() use 8-b=
it
access?

       Arnd
