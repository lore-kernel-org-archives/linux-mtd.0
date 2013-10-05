Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSRPX-0000oO-Ra
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 12:56:45 +0000
Received: by mail-pa0-f41.google.com with SMTP id bj1so5359440pad.14
 for <linux-mtd@lists.infradead.org>; Sat, 05 Oct 2013 05:56:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <106341380974003@web15m.yandex.ru>
References: <1380956001-6122-1-git-send-email-eliedebrauwer@gmail.com>
 <106341380974003@web15m.yandex.ru>
Date: Sat, 5 Oct 2013 14:56:19 +0200
Message-ID: <CAGWqfijZSPZrQt762HmgGj-GJjbbRbTgmNb-OSFtL1OVSdOeNQ@mail.gmail.com>
Subject: Re: [PATCH v0] mkfs.ubifs: Add support for lz4hc compressor in
 mkfs.ubifs
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "motobud@gmail.com" <motobud@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 5, 2013 at 1:53 PM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>
>
> 05.10.2013, 10:53, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
>> Brent et all,
>>
>> I was bored last night and while following the thread on the lz4hc
>> compression for ubifs got my attention so I decided to give a go at
>> implementing in. Below you can find a patch which does just that.
>>
>> An lz4hc and favor_lz4hc compr type, they mimick lzo and favor_lzo
>> but use lz4hc instead of lzo.
>>
>> In order to use lz4hc I included 3 files from the lz4 project since
>> lz4 is not yet available in a conventient modular form (suggestions
>> to fix this are welcome).
>>
>> In the meantime I saw however that Brent was also considering adding
>> lz4hc support mkfs.ubifs so I'm making a v0 zero post either to serve
>> as input for review comment (mainly on handling the lz4 dependency)
>> and then I'll take care of cleaning up and testing it myself, or just
>> to serve as some reference to the implementation of Brent, let me know
>> of you want some polishing up on this version or are already in an
>> advanced phase of a solution of yourself.
>>
>> (Yes, it's called v0, it's still untested but I would like input on
>> the lz4 dependency handling and the extension of the options, or
>> do we see something feasible where we contain lzo/lz4hc and zlib on
>> the fly, suggestions welcome).
>>
>> my 2 cents
>> E.
>
> Thank you very much!
>
> Unfortunately, your patch does not apply cleanly. I've tried mtd-utils
> master and v1.5.0, and got rejects in both cases.
>

That's odd, yesterday I started by cloning mtd-utils.git and when I
try to repeat my own steps and apply my patch it does seem to work.

edb@lapelidb:/tmp$ mkdir l
edb@lapelidb:/tmp$ cd l/
edb@lapelidb:/tmp/l$ git clone -q git://git.infradead.org/mtd-utils.git
edb@lapelidb:/tmp/l$ cd mtd-utils/
edb@lapelidb:/tmp/l/mtd-utils$ patch -p1 <
/tmp/0001-mkfs.ubifs-Add-support-for-lz4hc-compressor-in-mkfs..patch
patching file Makefile
patching file mkfs.ubifs/README
patching file mkfs.ubifs/compr.c
patching file mkfs.ubifs/compr.h
patching file mkfs.ubifs/lz4/lz4.h
patching file mkfs.ubifs/lz4/lz4hc.c
patching file mkfs.ubifs/lz4/lz4hc.h
patching file mkfs.ubifs/mkfs.ubifs.c
patching file mkfs.ubifs/ubifs-media.h
patching file mkfs.ubifs/ubifs.h
edb@lapelidb:/tmp/l/mtd-utils$

The only thing I can imagine is that I started from a wrong repository
... any pointers ?

gr
E.



-- 
Elie De Brauwer
