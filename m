Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173KXw-0003st-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 18:39:12 +0100
Date: Thu, 2 May 2002 18:39:10 +0100
Subject: Re: Booting from DOC2000 with GRUB loader
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v481)
Cc: linux-mtd@lists.infradead.org
To: John Sutton <john@scl.co.uk>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <02050212224002.09412@diva.localdomain>
Message-Id: <82EADAEE-5DF3-11D6-B6D6-000502893FA1@regolith.co.uk>
Content-Transfer-Encoding: 7bit
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

On Thursday, May 2, 2002, at 11:56 AM, John Sutton wrote:

> Nearly there ;-)...
>

Indeed so :-)

> So I've got a 16Kb erase size.  What now?  If I hack the source so that 
> it
> just falls through this test and proceeds to malloc(meminfo.erasesize * 
> 5)
> am I heading for big trouble or success?

I *think* it works.

> Once I've gotten past this little gotcha, how do I go about using the
> erase util to erase the piece between the end of the grub and the start 
> of
> the nftl partition?

Why not just erase the entire thing, then do doc_loadbios to put the 
grub firmware into it, and then nftl_format?  Then you'd be sure it was 
all
clean and empty.

That's how I did it, anyway.

Jas.
