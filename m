Received: from jafar.unixpac.com.au ([203.3.121.10])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MJSs-0006V5-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 03:20:26 +0100
Subject: Re: Trying to boot linux off a 2MiB M-Sys DoC2000 chip
From: Gonzalo Servat <gonzalo@linuxaus.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.44.0206232114130.6614-100000@server.superbt.com>
References: <Pine.LNX.4.44.0206232114130.6614-100000@server.superbt.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Jun 2002 12:19:49 +1000
Message-Id: <1024885189.15257.51.camel@pluto.unixpac.com.au>
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

On Mon, 2002-06-24 at 11:16, Ilguiz Latypov wrote:
> 
> Gonzalo,
> 
> Did you see the recent instruction on applying the MTD DiskOnChip patch 
> to GRUB?  It's in
> 
>     http://lists.infradead.org/pipermail/linux-mtd/2002-June/005240.html

Ah, great. Thanks for that!

I followed the instructions and as I was trying to compile grub-0.92, in
the stage2 directory it gave me lots of 'overriding old commands for
target xxxxxxxxxxx' and 'ignorning old commands for target
xxxxxxxxxxxxx'

where xxxxxxxxxx was for example: nbloader.exec, pxeloader.exe,
diskless.exec, etc.

After all those errors I got a lot of "undefined reference to terminal"
and "undefined reference to debug" and a few other undefined references
and after an undef reference to 'chain_stage2' it exited and didn't
finish compiling. Any ideas?

Thanks again

Gonzalo.

 
> Ilguiz
> 
> On 24 Jun 2002, Gonzalo Servat wrote:
> 
> > I tried this and Grub doesn't like "dc0". It says "Error 23: Error while
> > parsing number"
> 
> 
> 
