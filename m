Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSSnR-00021m-U6
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 14:25:31 +0000
Received: by mail-pa0-f51.google.com with SMTP id kp14so5416965pab.38
 for <linux-mtd@lists.infradead.org>; Sat, 05 Oct 2013 07:25:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8451380982651@web23h.yandex.ru>
References: <1380956001-6122-1-git-send-email-eliedebrauwer@gmail.com>
 <106341380974003@web15m.yandex.ru>
 <CAGWqfijZSPZrQt762HmgGj-GJjbbRbTgmNb-OSFtL1OVSdOeNQ@mail.gmail.com>
 <183051380979480@web15m.yandex.ru>
 <201501380981068@web15m.yandex.ru> <8451380982651@web23h.yandex.ru>
Date: Sat, 5 Oct 2013 16:25:07 +0200
Message-ID: <CAGWqfig=ZzkD4MyW2PD=iw6NBdd+nN6S+NXd30toMObiuroFPg@mail.gmail.com>
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

On Sat, Oct 5, 2013 at 4:17 PM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>
>
> 05.10.2013, 17:52, "Konstantin Tokarev" <annulen@yandex.ru>:
>> 05.10.2013, 17:25, "Konstantin Tokarev" <annulen@yandex.ru>:
>>
>>>  05.10.2013, 16:56, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
>>>>   That's odd, yesterday I started by cloning mtd-utils.git and when I
>>>>   try to repeat my own steps and apply my patch it does seem to work.
>>>  I've figured it out: you've included patch into the mail instead of attaching
>>>  it as a file, so I copied it, and tab characters got lost. patch -p1 -l
>>>  works successfully.
>>
>> When trying to compress my rootfs, I got message "32866 compression errors occurred".
>> Resulting image is much larger than LZO one (133M for lz4hc, 86M for lzo, 79M for zlib)
>
> The next patch over your patch fixes the issue:
>
> diff --git a/mkfs.ubifs/compr.c b/mkfs.ubifs/compr.c
> index 2030042..65c7dbe 100644
> --- a/mkfs.ubifs/compr.c
> +++ b/mkfs.ubifs/compr.c
> @@ -109,9 +109,10 @@ static int lz4hc_compress(void *in_buf, size_t in_len, void *out_buf,
>             size_t *out_len)
>  {
>     int ret;
> -   ret = LZ4_compressHC_limitedOutput(in_buf, out_buf, in_len, *out_len);
> +   ret = LZ4_compressHC(in_buf, out_buf, in_len);
> +   *out_len = ret;
>
> -   if (ret != 0) {
> +   if (ret == 0) {
>         errcnt += 1;
>         return -1;
>     }
>
>
> I've replaced LZ4_compressHC_limitedOutput with LZ4_compressHC to match lzo_compress logic which changes out_len instead of limiting it. No errors are reported now. However, result is still larger than LZO (93M).
>
>

Oops, guessed our e-mails crossed each-other, the reason why I
initially choose limitedOutput is because compressHC will assume the
output buffer is large enough (which means it could potentially
outgrow the input buffer in size, it seemed safer to use the
limitedOutput option now rather than to introduce a potential buffer
overflow).

But apparently our findings are the same, lz4hc also produces a
slightly larger resulting binary, but it is the fastet one (on my x86
laptop):

edb@lapelidb:/tmp/l/mtd-utils$ time sudo mkfs.ubifs/mkfs.ubifs  -x
none -m 2048 -e 126976 -c 744 -d /tmp/rootfs/ /tmp/imag.zlib

real 0m0.452s
user 0m0.108s
sys 0m0.044s
edb@lapelidb:/tmp/l/mtd-utils$ time sudo mkfs.ubifs/mkfs.ubifs  -x
lz4hc -m 2048 -e 126976 -c 744 -d /tmp/rootfs/ /tmp/imag.lz4hc

real 0m0.805s
user 0m0.768s
sys 0m0.032s
edb@lapelidb:/tmp/l/mtd-utils$ time sudo mkfs.ubifs/mkfs.ubifs  -x
zlib -m 2048 -e 126976 -c 744 -d /tmp/rootfs/ /tmp/imag.zlib

real 0m1.834s
user 0m1.792s
sys 0m0.036s
edb@lapelidb:/tmp/l/mtd-utils$ time sudo mkfs.ubifs/mkfs.ubifs  -x lzo
-m 2048 -e 126976 -c 744 -d /tmp/rootfs/ /tmp/imag.lzo

real 0m3.341s
user 0m3.296s
sys 0m0.044s

But it's at the decompression side that the real benefit probably lies
(as in flash performance vs decompression speed).

my 2 cents
E.





-- 
Elie De Brauwer
