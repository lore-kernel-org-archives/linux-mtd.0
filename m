Received: from bay113-f16.bay113.hotmail.com ([65.54.168.26] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EXUVr-0005zs-P3
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2005 21:07:43 -0500
Message-ID: <BAY113-F1669CA3931C829A1382D63E8610@phx.gbl>
In-Reply-To: <43689B3F.2000401@yandex.ru>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru
Date: Thu, 03 Nov 2005 09:48:16 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header support in JFFS2(revision 6)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > This is the 6th version of the patch.
> > The only change compared with 5th version is:
> > I replace jffs2_cleanmarker_oob() with jffs2_ebh_oob() to
> > avoid confusion since cleanmarker is gone.
>> >
>I wonder, did you try this on NOR or mtdram?

oh, it's my fault to forget to mention the testing status of
this patch.
I tested this patch on NOR, mtdram, nandsim and even Joern's
ramtd.

For NOR, I run LTP for about 4 hours;
for mtdram, nansim and ramtd, I run LTP for about 12 hours.
Also I did many mount/umount tests.
Unitil now, no problem is found.

Thanks,
Forrest
