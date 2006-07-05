Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy1Rp-0002et-8x
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 03:05:30 -0400
Date: Wed, 5 Jul 2006 10:05:10 +0300
From: Ville Herva <vherva@vianova.fi>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Subject: Re: kernel command line arguments for block2mtd do not work
Message-ID: <20060705070509.GB15078@vianova.fi>
References: <20060704143836.GA5104@vianova.fi>
	<1152082335.4825.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1152082335.4825.2.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 05, 2006 at 10:52:15AM +0400, you [Artem B. Bityutskiy] wrote:
> On Tue, 2006-07-04 at 17:38 +0300, Ville Herva wrote:
> > For the rough idea, see 
> >         http://iki.fi/v/tmp/block2mtd.c                      
> > (Sorry for the ugliness - it's just a workaround hack.)
> 
> Hello,
> 
> I'd suggest you to just send a patch. See "Patch submission" at
> http://www.linux-mtd.infradead.org/source.html

I don't think any of the ideas I listed to "fix" the problem are
satisfactory. They all run into the same dead-end of not having access to
the rootfs when parsing the arguments, and hence, not being able to open the
underlying blockdev. 

These days the kernel afaik does not have builtin
device name -> device number mapping (I think it used to - for rootfs
device mounting - but isn't that gone?). The device we are mounting might be
the rootfs, so /dev is not present. Hence, 
	open_bdev_excl(devname, O_RDWR, NULL); 
can't succeed.

What I _was_ able to do (see http://iki.fi/v/tmp/block2mtd.c) is to move the
argument parsing later in boot process - it doesn't fail anymore, but that
doesn't help much, since the device can't be opened. This means the error
message is much more helpful (and it won't crash), but is it worth it?

As a stop-gap measure I suggested making the "out of memory" message more
informative (e.g. "can't parse arguments - not possible from kernel command
line, see Documentation/block2dev.txt" or something.



-- v -- 

v@iki.fi
