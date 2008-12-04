Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L89zU-0002cT-SO
	for linux-mtd@lists.infradead.org; Thu, 04 Dec 2008 08:55:21 +0000
Date: Thu, 4 Dec 2008 09:55:18 +0100 (CET)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: JFFS2/UBIFS select zlib/lzo even if compression is disabled
In-Reply-To: <a4423d670812031641r70044496pb65eea3469c56283@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0812040950340.690@vixen.sonytel.be>
References: <a4423d670812031641r70044496pb65eea3469c56283@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 4 Dec 2008, Alexander Beregalov wrote:
> I have found the following misbehaviour:
> 
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=y
> # CONFIG_JFFS2_LZO is not set
> CONFIG_JFFS2_RTIME=y
> # CONFIG_JFFS2_RUBIN is not set
> 
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=y
> CONFIG_UBIFS_FS_ZLIB=y
> 
> config JFFS2_ZLIB
>         bool "JFFS2 ZLIB compression support" if JFFS2_COMPRESSION_OPTIONS
>         select ZLIB_INFLATE
>         select ZLIB_DEFLATE
>         depends on JFFS2_FS
>         default y
> 
> Is it an error in kconfig scripts for a long time or should it be
> described differently in Kconfig?
> Something like this
> 
> config JFFS2_ZLIB
>         bool "JFFS2 ZLIB compression support" if JFFS2_COMPRESSION_OPTIONS
>         select ZLIB_INFLATE
>         select ZLIB_DEFLATE
> -        depends on JFFS2_FS
> +        depends on JFFS2_FS && JFFS2_COMPRESSION_OPTIONS
> 
> But it looks ugly

Kconfig is correct.

| config JFFS2_COMPRESSION_OPTIONS
|         bool "Advanced compression options for JFFS2"
|         depends on JFFS2_FS
|         default n
|         help
|           Enabling this option allows you to explicitly choose which
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
|           compression modules, if any, are enabled in JFFS2.
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


| config UBIFS_FS_ADVANCED_COMPR
|         bool "Advanced compression options"
|         depends on UBIFS_FS
|         help
|           This option allows to explicitly choose which compressions, if any,
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|           are enabled in UBIFS.
            ^^^^^^^^^^^

JFFS2_COMPRESSION_OPTIONS and UBIFS_FS_ADVANCED_COMPR are not meant to
enable/disable compression in se, but to let you _choose_ which compression
modules to include. They're meant for advanced users who know they can leave
out some modules.

So if you want to disable compression, you have to first enable
JFFS2_COMPRESSION_OPTIONS resp. UBIFS_FS_ADVANCED_COMPR. After that, you can
disable e.g. CONFIG_JFFS2_ZLIB.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
