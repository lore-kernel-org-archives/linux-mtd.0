Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eIDA-00068R-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 16:06:16 +0000
Message-ID: <002601c1bbbc$6a8c4d30$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: "Ilguiz Latypov" <ilatypov@superbt.com>
Cc: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.44.0202220030340.7347-100000@server.superbt.com>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Fri, 22 Feb 2002 11:17:21 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Ilguiz,

> OK, I updated the util/doc_loadbios to accept an extra offset paramter
> (1024).

I can't seem to find an updated doc_loadbios.  Where should I look?

> The updated patch will need proper auto-configured files.  You can
> re-generate them by running
>    aclocal && automake && autoconf
> in the GRUB's top level directory.

The "aclocal && automake && autoconf" caused some errors; the errors I had were identical
to those posted by Herman Theron in the "Error using GRUB patch" thread.

Thanks,

Mark
