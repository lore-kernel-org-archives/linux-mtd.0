Received: from ns.suse.de ([213.95.15.193] helo=Cantor.suse.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tYqd-0007Ur-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Apr 2002 19:54:07 +0100
Date: Fri, 5 Apr 2002 20:54:03 +0200
To: "Richard A. Smith" <rsmith@bitworks.com>
Cc: "linuxbios@lanl.gov" <linuxbios@lanl.gov>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: jedec_probe_chip error?
Message-ID: <20020405205403.A28921@suse.de>
References: <20020404123603.A2734@suse.de> <MDAEMON-F200204051113.AA130309MD40469@bitworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MDAEMON-F200204051113.AA130309MD40469@bitworks.com>; from rsmith@bitworks.com on Fri, Apr 05, 2002 at 11:09:54AM -0600
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

* Richard A. Smith <rsmith@bitworks.com> [020405 19:09]:
> >get /dev/bios from the OpenBIOS cvs tree:
> >http://www.freiburg.linux.de/OpenBIOS/dev/cvs.html
> 
> The Readme lists that this should work under a 2.2.x kernel, however
> I get serveral errors trying to compile with 2.2.19 
[..] 
> Does it sill work with 2.2.x?

Oops. I dropped 2.2 support with one of the last releases. It is tested
under 2.4 - backporting it shouldnt be too hard - drop me a note if 2.4 
is not an option for you.
 
> I'm using the latest tarball from the above link.  I was unable to
> get a CVS copy as it kept complaining that 'anonymous' was an unknown
> user.

Hmm... I'll check into that asap.

Best regards,
  Stefan Reinauer
  
-- 
Ok hex 4666 dup negate do i 4000 dup 2* negate do " *" 0 dup 2dup 1e 0 do
 2swap * e >>a 2* 5 pick + -rot - j + dup dup * e >>a rot dup dup * e >>a 
  rot swap 2dup + 10000 > if 3drop 3drop "  " 0 dup 2dup leave then loop 
              2drop 2drop type 268 +loop cr drop 5de +loop
