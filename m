Received: from mail-da0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URYFX-0006Bo-CI
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 01:30:28 +0000
Received: by mail-da0-f47.google.com with SMTP id s35so1839560dak.6
 for <linux-mtd@lists.infradead.org>; Sun, 14 Apr 2013 18:30:24 -0700 (PDT)
Date: Sun, 14 Apr 2013 18:30:22 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [stable] mtdchar: fix offset overflow detection
Message-ID: <20130415013022.GB12279@kroah.com>
References: <1365985630.2783.90.camel@deadeye.wl.decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365985630.2783.90.camel@deadeye.wl.decadent.org.uk>
Cc: Brad Spengler <spender@grsecurity.net>,
 Linus Torvalds <torvalds@linux-foundation.org>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sasha Levin <levinsasha928@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 15, 2013 at 01:27:10AM +0100, Ben Hutchings wrote:
> Brad Spengler pointed out this fix from 3.6 was missing from the earlier
> stable branches:
> 
> commit 9c603e53d380459fb62fec7cd085acb0b74ac18f
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Sep 8 12:57:30 2012 -0700
> 
>     mtdchar: fix offset overflow detection
> 
> It looks cleanly cherry-pickable, although I haven't yet tested this.

Yes, it looks like it should be applied, and that it applies cleanly.
Thanks for letting us know.

greg k-h
