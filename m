Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B4HqC-0003Dz-JI
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2004 11:07:04 +0000
From: "Simon Haynes" <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>,
              linux-mtd@lists.infradead.org
Date: Fri, 19 Mar 2004 10:37:04 -0000
MIME-Version: 1.0
Message-ID: <405ACD50.8515.211AB9@localhost>
In-reply-to: <1079453688.16952.40.camel@hades.cambridge.redhat.com>
References: <B1CA6BCA5B0C@baydel.com>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 Mar 2004 at 16:14, David Woodhouse wrote:

> On Tue, 2004-03-09 at 15:33 +0000, Simon Haynes wrote:
> > -bash-2.05b# mount -t jffs2 /dev/ram1 /smc
> > Cowardly refusing to erase blocks on filesystem with no valid JFFS2
> 
> This I believe we put down to user error?

Yes, this was a problem I introduced when trying to track down why I got the Magic 
bitmask messages.


> 
> > After 5 reboots the new SMC gave this magic bitmask failure.
> > 
> > jffs2: Erase block size too small (16KiB). Using virtual blocks size
> > (32KiB) instead ofs 0x000a8400 has already been seen. Skipping, jeb
> 
> That was a bug in the scanning code. Should be fixed in v1.58 of
> scan.c in CVS. Please could you try that and let me know if it works?
> 
I have not had chance a yet to download scan from CVS. However I did make the 
simple change you suggested and everything worked fine.

Thankyou, Thankyou, Thankyou

Simom.





__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
