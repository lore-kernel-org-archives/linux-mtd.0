Received: from forward10.mail.yandex.net ([2a02:6b8:0:202::5])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSSGb-0001ST-1h
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 13:51:35 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
In-Reply-To: <183051380979480@web15m.yandex.ru>
References: <1380956001-6122-1-git-send-email-eliedebrauwer@gmail.com>
 <106341380974003@web15m.yandex.ru>
 <CAGWqfijZSPZrQt762HmgGj-GJjbbRbTgmNb-OSFtL1OVSdOeNQ@mail.gmail.com>
 <183051380979480@web15m.yandex.ru>
Subject: Re: [PATCH v0] mkfs.ubifs: Add support for lz4hc compressor in
 mkfs.ubifs
MIME-Version: 1.0
Message-Id: <201501380981068@web15m.yandex.ru>
Date: Sat, 05 Oct 2013 17:51:08 +0400
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



05.10.2013, 17:25, "Konstantin Tokarev" <annulen@yandex.ru>:
> 05.10.2013, 16:56, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
>
>> šThat's odd, yesterday I started by cloning mtd-utils.git and when I
>> štry to repeat my own steps and apply my patch it does seem to work.
>
> I've figured it out: you've included patch into the mail instead of attaching
> it as a file, so I copied it, and tab characters got lost. patch -p1 -l
> works successfully.

When trying to compress my rootfs, I got message "32866 compression errors occurred".
Resulting image is much larger than LZO one (133M for lz4hc, 86M for lzo, 79M for zlib)

-- 
Regards,
Konstantin
