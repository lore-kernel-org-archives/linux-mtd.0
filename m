Received: from mail1.bizmail.net.au ([202.162.77.164])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GZhnI-0000DM-BF
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 01:47:24 -0400
Received: from webmail.bizmail.com.au (localhost.localdomain [127.0.0.1])
	by mail1.bizmail.net.au (Postfix) with ESMTP id 5FC0FCDC038
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Oct 2006 15:58:20 +1000 (EST)
Message-ID: <1897.58.105.227.226.1161064700.squirrel@58.105.227.226>
Date: Tue, 17 Oct 2006 15:58:20 +1000 (EST)
Subject: Failed to build mkfs.jffs2
From: yh@bizmail.com.au
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Michael.

> Have you a zlib compiled for your target?

As I compiled it by "make CC=cc", I suppose you mean the zlib on my PC,
right? If so, yes, I've got "libz.a  libz.so  libz.so.1  libz.so.1.2.3" on
my /usr/lib.

If you mean the zlib for arm target, could you please explain more.

Thank you.

Jim


Michael Trimarchi wrote:
> yh@bizmail.com.au wrote:
>
>
>>Hi,
>>
>>I am using the version mtd-20050122 for a linux arm system, I can build
>>mtd under arm-linux-gcc, but failed to build a host tool mkfs.jffs2 by
>>"make CC=cc" in util directory on FC5. Please see following error
>>messages. Is there any way to fix it, rather than to change a new version?
>>
>>compr_zlib.c:65: error: ‘z_stream’ has no member named ‘zalloc'
>>compr_zlib.c:66: error: ‘z_stream’ has no member named ‘zfree’
>>
>>Thanks.
>>
>>Jim
>>
>>______________________________________________________
>>Linux MTD discussion mailing list
>>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>
>>
>
> Have you a zlib compiled for your target?
>
> Regards Michael
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
