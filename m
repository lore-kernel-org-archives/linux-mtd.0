Received: from ns.suse.de ([213.95.15.193] helo=Cantor.suse.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t4b9-0005ay-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 11:36:07 +0100
Date: Thu, 4 Apr 2002 12:36:04 +0200
To: Jeremy Jackson <jerj@coplanar.net>
Cc: linux-mtd@lists.infradead.org, linuxbios@lanl.gov
Subject: Re: jedec_probe_chip error?
Message-ID: <20020404123603.A2734@suse.de>
References: <015501c1db7f$5ea5ac90$7e0aa8c0@bridge>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015501c1db7f$5ea5ac90$7e0aa8c0@bridge>; from jerj@coplanar.net on Wed, Apr 03, 2002 at 06:21:02PM -0800
From: stepan@suse.de (Stefan Reinauer)
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

* Jeremy Jackson <jerj@coplanar.net> [020404 04:21]:
> Also, I have discovered (see prev. post) at least one device that doesn't
> respond to the aa 55 90 sequence, requiring an alternate
> "old" sequence instead.  Any guidance on the best way to
> implement this generically would be appreciated.
 
There's 3 different methods used by flash devices to identify
themselfes.
aa 55 90 is the most used one. Others (i.e. some Winbonds) need
aa 55 80 aa 55 60, whereas the third method (some other winbonds)
is aa 55 80 aa 55 20.
As far as I could estimate, the order in which you probe is crucial.
Some chips answer to aa 55 80 aa 55 60 or  aa 55 80 aa 55 20 with
their protection map instead of their id. 
Eon Flashchips don't put their device id to 0x01, but to 0x101. 
0x00 and 0x01 contain the vendor id (0x7f)

/dev/bios does that part of the probing pretty ok. I suggest you have a
look at programming.c:flash_probe_address()

get /dev/bios from the OpenBIOS cvs tree:
http://www.freiburg.linux.de/OpenBIOS/dev/cvs.html

Best regards,
  Stefan Reinauer
  
-- 
Ok hex 4666 dup negate do i 4000 dup 2* negate do " *" 0 dup 2dup 1e 0 do
 2swap * e >>a 2* 5 pick + -rot - j + dup dup * e >>a rot dup dup * e >>a 
  rot swap 2dup + 10000 > if 3drop 3drop "  " 0 dup 2dup leave then loop 
              2drop 2drop type 268 +loop cr drop 5de +loop
