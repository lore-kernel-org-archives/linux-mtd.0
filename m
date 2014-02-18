Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFrLZ-0006fe-L3
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 20:32:54 +0000
Date: Tue, 18 Feb 2014 17:32:27 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v6 1/3] ubi: Introduce block devices for UBI volumes
Message-ID: <20140218203226.GC13799@localhost>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392650551.21319.22.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1392650551.21319.22.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 17, 2014 at 05:22:31PM +0200, Artem Bityutskiy wrote:
> On Sun, 2014-02-16 at 17:03 -0300, Ezequiel Garcia wrote:
> > +static int ubiblock_read(struct ubiblock *dev, char *buffer, int pos, int len)
> > +{
> > +	int leb, offset, ret;
> > +	int bytes_left = len;
> > +	int to_read = len;
> 
> "pos" sounds like byte offset, which cannot be true because 'int' would
> be too short type for it. 
> 

[..]
> > +
> > +	pos = blk_rq_pos(req) << 9;
> 
> So 'pos' is actually the 512-byte sector number? Would you please better
> name then, something self-documenting like 'sec' or 'sector' ?
> 

No, 'pos' is the byte offset. See the << 9, which is the custom
translation from 512-byte sector into byte offset.

I'm completely sure which type to use, size_t ? loff_t ? off_t ?

> > +
> > +	/*
> > +	 * Let's prevent the device from being removed while we're doing I/O
> > +	 * work. Notice that this means we serialize all the I/O operations,
> > +	 * but it's probably of no impact given the NAND core serializes
> > +	 * flash acceses anywafy.
> > +	 */
> > +	mutex_lock(&dev->vol_mutex);
> > +	ret = ubiblock_read(dev, req->buffer, pos, len);
> > +	mutex_unlock(&dev->vol_mutex);
> 
> Would you please a better name for 'vol_mutex'. Just makes me confused
> because this is what we use in UBI to lock the entire volume. And here
> it is different mutex. Let's express the code in clearer terms and use
> something like just 'device_lock' or something which would suggest that
> this is locks the entire ubiblock device.
> 

Sure, no problem.

Thanks for the review!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
