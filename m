Received: from forward18.mail.yandex.net ([2a02:6b8:0:1402::3])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYYv8-0007MP-0g
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 10:10:40 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Brent Taylor <motobud@gmail.com>
In-Reply-To: <CAP+RiCDKgRqi8_Y4OMqyJyCUpKJW5BVE=hNwp3WzQ7PuOMWGMw@mail.gmail.com>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
 <183031382371160@web6m.yandex.ru>
 <CAP+RiCDKgRqi8_Y4OMqyJyCUpKJW5BVE=hNwp3WzQ7PuOMWGMw@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
MIME-Version: 1.0
Message-Id: <139841382436609@web24g.yandex.ru>
Date: Tue, 22 Oct 2013 14:10:09 +0400
Content-Type: multipart/mixed; boundary="----==--bound.13986.web24g.yandex.ru"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


------==--bound.13986.web24g.yandex.ru
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r



22.10.2013, 07:43, "Brent Taylor" <motobud@gmail.com>:
> On Mon, Oct 21, 2013 at 10:59 AM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>
>> š04.10.2013, 07:09, "Brent Taylor" <motobud@gmail.com>:
>>> šHere is a patch based on linux-3.12-rc3. šI haven't performed any
>>> šperformance testing UBIFS using lz4hc, but I can mount UBIFS volumes
>>> šand haven't seen any problems yet. šThe only think I know that isn't
>>> šcorrect about the patch is the description for the Kconfig element for
>>> šselect lz4hc as a compression option. šI only copied the description
>>> šfrom the lzo description.
>> šHi Brent,
>>
>> šI'm testing your patch on my SH4 device. When I create new partition
>> šwith lz4hc compressor, it works fine: I can copy file into it, and
>> šmd5sums of original and copy match. However, after reboot I cannot
>> šread the file anymore:
>>
>> šUBIFS error (pid 1101): ubifs_decompress: cannot decompress 934 bytes, compressor lz4hc, error -22
>> šUBIFS error (pid 1101): read_block: bad data node (block 1, inode 65)
>> šUBIFS error (pid 1101): do_readpage: cannot read page 1 of inode 65, error -22
>>
>> šThe same error appears if I use lz4hc-compressed ubifs image to flash rootfs
>> š(using patched mkfs.ubifs).
>>
>> šDecompression error occurs in lz4_uncompress() function (lib/lz4/lz4_decompress.c),
>> šon the line 101:
>>
>> š/* Error: offset create reference outside destination buffer */
>> šif (unlikely(ref < (BYTE *const) dest))
>> šššššgoto _output_error;
>>
>> šBrent: are you able to read data from lz4hc volume on your device?
>> šAnyone: any ideas what may happen here?
>>
>> š--
>> šRegards,
>> šKonstantin
>
> Konstantin,
> šššI haven't seen anything like that on my at91sam9m10g45-ek
> development board. šI haven't used a flash image from mkfs.ubifs yet.
> Is it possible the file system was not umounted cleanly before the
> reboot and UBIFS went through a recovery procedure? šMaybe something
> breaks with lz4hc when UBIFS does a recovery? šThat's just a guess.

Could you save attached file on lz4hc volume, umount it and mount again?
I get aforementioned error when doing `cat set11.cfg`

-- 
Regards,
Konstantin
------==--bound.13986.web24g.yandex.ru
Content-Disposition: attachment;
	filename="set11.cfg"
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream;
	name="set11.cfg"

PSB0cnVlCiAgICBoaWRlU2luZ2xlU3VidGl0bGUgPSB0cnVlCiAgICBoaWRlU2luZ2xlQXVkaW9U
cmFjayA9IHRydWUKICAgIDtzaG93UmVjb21lbmRlZCA9IHRydWUKICAgIDtzaG93UmVtb3RlVXJs
ID0gdHJ1ZQogICAgO3VzZUlmcmFtZVJld2luZCA9IHRydWUKICAgIGlmcmFtZVJld2luZFRpCg==
------==--bound.13986.web24g.yandex.ru--
