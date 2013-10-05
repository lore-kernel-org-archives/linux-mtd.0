Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSSgM-0001no-1c
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 14:18:10 +0000
Received: by mail-pb0-f50.google.com with SMTP id uo5so5205852pbc.37
 for <linux-mtd@lists.infradead.org>; Sat, 05 Oct 2013 07:17:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201501380981068@web15m.yandex.ru>
References: <1380956001-6122-1-git-send-email-eliedebrauwer@gmail.com>
 <106341380974003@web15m.yandex.ru>
 <CAGWqfijZSPZrQt762HmgGj-GJjbbRbTgmNb-OSFtL1OVSdOeNQ@mail.gmail.com>
 <183051380979480@web15m.yandex.ru>
 <201501380981068@web15m.yandex.ru>
Date: Sat, 5 Oct 2013 16:17:45 +0200
Message-ID: <CAGWqfigxKOLsaQvbPWNt7AbmOdCmeUSxkFv8naJt1Hn5bo6uUQ@mail.gmail.com>
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

On Sat, Oct 5, 2013 at 3:51 PM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>
>
> 05.10.2013, 17:25, "Konstantin Tokarev" <annulen@yandex.ru>:
>> 05.10.2013, 16:56, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
>>
>>>  That's odd, yesterday I started by cloning mtd-utils.git and when I
>>>  try to repeat my own steps and apply my patch it does seem to work.
>>
>> I've figured it out: you've included patch into the mail instead of attaching
>> it as a file, so I copied it, and tab characters got lost. patch -p1 -l
>> works successfully.
>
> When trying to compress my rootfs, I got message "32866 compression errors occurred".
> Resulting image is much larger than LZO one (133M for lz4hc, 86M for lzo, 79M for zlib)
>


That only proofs I wasn't lying when I wrote this morning that my code
was fully untested. I had some time to do some testing and if you
apply the following, (cummulative to my last patch) it should also
work.

diff --git a/mkfs.ubifs/compr.c b/mkfs.ubifs/compr.c
index d9886b4..0900653 100644
--- a/mkfs.ubifs/compr.c
+++ b/mkfs.ubifs/compr.c
@@ -110,11 +110,12 @@ static int lz4hc_compress(void *in_buf, size_t in_len, voi
 {
        int ret;
        ret = LZ4_compressHC_limitedOutput(in_buf, out_buf, in_len, *out_len);
-
-       if (ret != 0) {
+       if (ret == 0) {
                errcnt += 1;
                return -1;
        }
+       else
+               *out_len = ret;

        return 0;
 }

I get the following (preliminary) results:

edb@lapelidb:/tmp$ ls -hal imag*
-rw-r--r-- 1 edb  edb  28M Oct  5 16:12 imag.lz4hc
-rw-r--r-- 1 root root 25M Oct  5 16:09 imag.lzo
-rw-r--r-- 1 root root 43M Oct  5 16:11 imag.none
-rw-r--r-- 1 root root 22M Oct  5 16:11 imag.zlib

gr
E.



-- 
Elie De Brauwer
