Received: from jafar.unixpac.com.au ([203.3.121.10])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Md4b-0007qz-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 00:16:42 +0100
Subject: Re: Trying to boot linux off a 2MiB M-Sys DoC2000 chip
From: Gonzalo Servat <gonzalo@linuxaus.com>
To: Mark Meade <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <200206241018875.SM02488@there>
References: <200206241018875.SM02488@there>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 25 Jun 2002 09:16:00 +1000
Message-Id: <1024960561.16998.14.camel@pluto.unixpac.com.au>
Mime-Version: 1.0
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

ahh ha! I did upgrade auto{make,conf} on a different machine and tried
compiling grub on that but evidently the version wasn't new enough. 
It *requires* version 1.5. 
Anyway, I've upgraded automake and autoconf now and aclocal && automake
&& autoconf didn't give any errors this time and I'm in the process of
compiling it but it's already looking a hell of a lot better!

Thanks a lot Mark!

Regards,
Gonzalo.


On Tue, 2002-06-25 at 00:21, Mark Meade wrote:
> Gonzalo Servat wrote:
> > After all those errors I got a lot of "undefined reference to terminal"
> > and "undefined reference to debug" and a few other undefined references
> > and after an undef reference to 'chain_stage2' it exited and didn't
> > finish compiling. Any ideas?
> 
> Hi Gonzalo,
> 
> Did you try updating automake and autoconf to the latest versions?  I had 
> errors compiling GRUB with older versions, but I don't recall if they were 
> the same as the errors you described.
> 
> Regards,
> 
> Mark
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
