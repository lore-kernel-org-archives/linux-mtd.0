Received: from smtp-1.llnl.gov ([128.115.3.81])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ep8q1-0000gw-1r
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 13:37:24 -0500
From: Dave Peterson <dsp@llnl.gov>
To: ebiederman@lnxi.com (Eric W. Biederman)
Date: Wed, 21 Dec 2005 10:37:17 -0800
References: <200512201642.05224.dsp@llnl.gov> <m3vexjqlc2.fsf@maxwell.lnxi.com>
In-Reply-To: <m3vexjqlc2.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512211037.17680.dsp@llnl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: ichxrom driver question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 20 December 2005 17:40, Eric W. Biederman wrote:
> Hmm. Immediately after the erase operation you should see all f's.

I tried it a few times.  My recollection is that after the first
attempt at erasing, the first part of the flash memory contained
all f's and the rest contained data that appeared to be the old BIOS.
On a subsequent attempt, I saw all zeros, and this is what I still
see when I try to flash the BIOS again.

> The only thing I can think of that might trigger what you are seeing
> is a cached flash chip.

What does "cached flash chip" mean?  I have very little familiarity
with how these flash chips operate.

> The ICH3-S is more of a conduit.  The usual questions are:
>
> Is there motherboard specific magic that denies writes?
> What is the actual flash chip you are flashing.

How do I determine whether there is motherboard-specific magic?
The motherboard is a Supermicro P4DPR-iGM and the flash chip is an
Intel 82802AB.

> Except for the possibility of bad cache I can't think of anything
> that would cause the wrong data to be written.  Are you certain
> you have a good flash image?

The flash image I tried to install was an exact duplicate of the
currently installed flash image, obtained as follows:

    # dd if=/dev/mtd0 of=bios_image

I was just testing the BIOS flashing mechanism to see if it worked.
