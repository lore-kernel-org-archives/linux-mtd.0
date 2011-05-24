Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOnFe-0006NA-Vp
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 08:46:07 +0000
Received: by eyh6 with SMTP id 6so2385642eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 01:46:05 -0700 (PDT)
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rick Johnson <rick22@wi.rr.com>
In-Reply-To: <4DD6DA14.9050402@wi.rr.com>
References: <4DADF9E6.9010709@wi.rr.com>
	<1303392001.2757.16.camel@localhost>  <4DC31183.8060807@wi.rr.com>
	<1304706750.7222.95.camel@localhost>  <4DD6DA14.9050402@wi.rr.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 May 2011 11:41:44 +0300
Message-ID: <1306226504.2785.68.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-20 at 16:16 -0500, Rick Johnson wrote:
> We were able to gather more debug this time when the error reoccurred. 
> I thought I'd post it, just in case something jumps out.  The strange 
> thing is that 'num' seems to have a value that resembles an address.  In 
> the example below, num is set to 0xC72EB990.  That's been true every 
> time we've seen any debug.  Maybe it doesn't mean anything.

Hi,

1. Your kernel version is 2.6.36, do you use up-to-date UBI/UBIFS from
   the ubifs-v2.6.36 back-port tree? See here:
   http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

2. Could you please make sure you have UBIFS debugging enabled - just
   debugging support, no additional messages or checks. Then post UBIFS
   messages which it prints when you mount it. It prints things like
   LPT model (c->big_lpt) which I want to know.

3. Please, enable LPT extra checks and run your tests and try to
   reproduce this issue. To enable LPT extra checks you need to do:

   $ sudo sh -c 'echo 32 > /sys/module/ubifs/parameters/debug_chks'

   This will make UBIFS to check lprops at each commit and we have a
   better chance to catch issues.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
