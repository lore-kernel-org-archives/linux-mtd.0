Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9T6z-0007xJ-Ex
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 18:37:33 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Magnus =?ISO-8859-1?Q?M=E5rtensson?= <magnus.martensson@axis.com>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
References: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
Message-Id: <1066152707.10573.20.camel@tubarao>
Mime-Version: 1.0
Date: 14 Oct 2003 11:31:47 -0600
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: word line disturbance
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-14 at 09:31, Magnus Mårtensson wrote:
> Hi.
> I had a discussion with flash manufacturer Atmel last week regarding
>  a phenomenon that we had seen. 
> The phenomenon was called "word line disturbance" and it could occur
>  if you tried to program only ones
> to a location that already contained ones. The result could be that
>  some bit on another address got tainted. Ex
> writing 0xffff to address A could result in the content on address B
>  changing from 0xffff to 0xfffe.

I'll add this to the list of broken flash chips.  I'm doing some major
rework of jedec_probe.c and cfi_cmdset_0002.c so that chips with
different "features" can be handled in a sane way.  What are the
identifiers of these Atmel chips and are they CFI or are they probed
with jedec_probe?

> Anyway I thought of a software fix to this problem. Since it is
>  unnecessary to write
> ones to a place in flash where there already are only ones and since
>  ones is the default bit state after an erase operation you
> should simply skip that write.

Simple enough.

>  In our case this fix has also resulted
>  in improvement in performance since we support firmware upgrades
> over ftp and the firmware image is padded with 0xffff. The patch can
>  be seen below (diff to 2.4.22 kernel).

Sounds reasonable enough to not even be a special case.  The patch makes
the assumption that there are already ones written to the address.  A
more correct method would be to read the address and compare against the
datum - if they are equal then the function should return.

I'll see about rolling this into some of the changes I'm making.  Right
now I've seen more flash chips with problems than chips that function
correctly.
