Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sxsg-00056L-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 04:25:46 +0100
To: "Jeremy Jackson" <jerj@coplanar.net>
Cc: <linux-mtd@lists.infradead.org>, <linuxbios@lanl.gov>
Subject: Re: jedec_probe_chip error?
References: <015501c1db7f$5ea5ac90$7e0aa8c0@bridge>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 03 Apr 2002 20:25:37 -0700
In-Reply-To: <015501c1db7f$5ea5ac90$7e0aa8c0@bridge>
Message-ID: <m3bsd016xa.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

"Jeremy Jackson" <jerj@coplanar.net> writes:

> in Linux-MTD:
> 
> I'm looking at mtd/drivers/chips/jedec_probe.c:jedec_probe_chip
> line 794 from current CVS.
> 
> for CFI_DEVICETYPE_X8, the unlock1 and unlock2 values
> seem wrong.   They're currently 0x555 and 0x2aa, resp.
> Does it work like this?  

Unless it's changed since I last looked the code auto detects
whether it should use 0x555/0x2aa or 0x5555/0x2aaa.  If one variant
doesn't work it then tries the other.

> All of the small (512KiB -
> 128KiB) devices I've read the datasheets for, require
> 0x5555 and 0x2aaa here.  Are there any devices which
> use the current code's values?

Yes. I believe it is SST that is the odd man out in this
regard. 
 
> Also, I have discovered (see prev. post) at least one device that doesn't
> respond to the aa 55 90 sequence, requiring an alternate
> "old" sequence instead.  Any guidance on the best way to
> implement this generically would be appreciated.

My hunch is to try the very old sequence last, if the newer
sequences do not work.  In the worst case you will have to write
your own probe routine.  But I suspect Jedec probe can stretch a
little more. 

Eric
 
