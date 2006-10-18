Received: from mail1.bizmail.net.au ([202.162.77.164])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ga8qK-0000u2-0P
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 06:40:24 -0400
Message-ID: <453604A2.5030000@bizmail.com.au>
Date: Wed, 18 Oct 2006 20:40:34 +1000
From: yh@bizmail.com.au
MIME-Version: 1.0
To: Michael Trimarchi <trimarchi@gandalf.sssup.it>
Subject: Re: Failed to build mkfs.jffs2
References: <45302F20.8030904@bizmail.com.au>
	<4533905D.1090103@gandalf.sssup.it>
In-Reply-To: <4533905D.1090103@gandalf.sssup.it>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: yh@bizmail.com.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've just realized you may be talking about to config mtd to enable 
ZLIB, is it correct? If yes, could you please explain how to config MTD, 
I saw Kconfig in fs directory, but I could not find mtd.config file?

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
