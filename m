Received: from forward1h.mail.yandex.net ([2a02:6b8:0:f05::10])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSSg6-0001nm-8x
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 14:17:55 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
In-Reply-To: <201501380981068@web15m.yandex.ru>
References: <1380956001-6122-1-git-send-email-eliedebrauwer@gmail.com>
 <106341380974003@web15m.yandex.ru>
 <CAGWqfijZSPZrQt762HmgGj-GJjbbRbTgmNb-OSFtL1OVSdOeNQ@mail.gmail.com>
 <183051380979480@web15m.yandex.ru> <201501380981068@web15m.yandex.ru>
Subject: Re: [PATCH v0] mkfs.ubifs: Add support for lz4hc compressor in
 mkfs.ubifs
MIME-Version: 1.0
Message-Id: <8451380982651@web23h.yandex.ru>
Date: Sat, 05 Oct 2013 18:17:31 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
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



05.10.2013, 17:52, "Konstantin Tokarev" <annulen@yandex.ru>:
> 05.10.2013, 17:25, "Konstantin Tokarev" <annulen@yandex.ru>:
>
>> š05.10.2013, 16:56, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
>>> ššThat's odd, yesterday I started by cloning mtd-utils.git and when I
>>> šštry to repeat my own steps and apply my patch it does seem to work.
>> šI've figured it out: you've included patch into the mail instead of attaching
>> šit as a file, so I copied it, and tab characters got lost. patch -p1 -l
>> šworks successfully.
>
> When trying to compress my rootfs, I got message "32866 compression errors occurred".
> Resulting image is much larger than LZO one (133M for lz4hc, 86M for lzo, 79M for zlib)

The next patch over your patch fixes the issue:

diff --git a/mkfs.ubifs/compr.c b/mkfs.ubifs/compr.c
index 2030042..65c7dbe 100644
--- a/mkfs.ubifs/compr.c
+++ b/mkfs.ubifs/compr.c
@@ -109,9 +109,10 @@ static int lz4hc_compress(void *in_buf, size_t in_len, void *out_buf,
            size_t *out_len)
 {
    int ret;
-   ret = LZ4_compressHC_limitedOutput(in_buf, out_buf, in_len, *out_len);
+   ret = LZ4_compressHC(in_buf, out_buf, in_len);
+   *out_len = ret;

-   if (ret != 0) {
+   if (ret == 0) {
        errcnt += 1;
        return -1;
    }


I've replaced LZ4_compressHC_limitedOutput with LZ4_compressHC to match lzo_compress logic which changes out_len instead of limiting it. No errors are reported now. However, result is still larger than LZO (93M).



-- 
Regards,
Konstantin
