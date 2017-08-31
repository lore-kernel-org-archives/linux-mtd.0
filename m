Received: from secvs02.rockwellcollins.com ([205.175.225.241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnSHH-0005xi-Td
 for linux-mtd@lists.infradead.org; Thu, 31 Aug 2017 16:25:13 +0000
Received: by mail-yw0-f198.google.com with SMTP id s187so738259ywf.1
 for <linux-mtd@lists.infradead.org>; Thu, 31 Aug 2017 09:24:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170831083253.76a8d637@bbrezillon>
References: <1504036047-38848-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170830213450.663a218a@bbrezillon>
 <CAB0kKmy+Lx-w=t=vzMJSbahTh9jHLZ2z3aAOJhVwg-t4MPVjAQ@mail.gmail.com>
 <20170831083253.76a8d637@bbrezillon>
From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Date: Thu, 31 Aug 2017 11:24:27 -0500
Message-ID: <CAB0kKmwzgC9BPr=J0Xz5YjK7Y+sqrrYPYMiFc-_9GTipXXJETg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: map: new driver for NXP IFC
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 31, 2017 at 1:32 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Wed, 30 Aug 2017 19:03:48 -0500
> Sanjay Tandel <sanjay.tandel@rockwellcollins.com> wrote:
>
>> Hi Boris,
>>
>> On Wed, Aug 30, 2017 at 2:34 PM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> > Hi,
>> >
>> > On Tue, 29 Aug 2017 14:47:27 -0500
>> > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>> >
>> >> From: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
>> >>
>> >> This patch adds map driver for parallel flash chips interfaced over
>> >> a NXP Integrated Flash Controller (IFC). This driver allows either
>> >> 8-bit or 16-bit accesses, depending on bank-width, to parallel flash
>> >> chips(like Everspin MR0A16A), which are physically mapped to CPU's
>> >> memory space. For unaligned accesses, it performs read-modify-write
>> >> operations to keep access size same as bank-width.
>> >>
>> >
>> > Did you consider re-using the physmap driver [1] and adjust it to your
>> > needs like the gemini [2] or versatile [3] drivers do? If you did, what
>> > prevents you from using this approach?
>>
>> That approach would have coupled my driver with physmap driver, which has been
>> modified in newer version of kernel. So patch would not have been backward
>> compatible.
>
> Backward compatible? I guess you meant backport-able, and I don't think
> this is a good argument. We want Fixes to be backportable if they
> impact several releases, not new drivers. If you want to backport your
> driver to previous versions of Linux you can do it but it will never be
> included in the official stable releases.

We would leave the patch this way. It's okay if it is not included in
official release.

>
>>
>> I intended to create independent driver without changing any existing
>> driver code.
>
> Please look at the versatile and gemini driver, there's almost nothing
> to change in the physmap_of_core.c file, and you'll have your own
> source file (+ Kconfig option) where you can tweak the map hooks as you
> wish.

I saw those drivers and they look pretty much simple to hook with physmap
by just calling the probe function from physmap.

Thanks for your inputs!!!

>
> Regards,
>
> Boris

Regards,
Sanjay
