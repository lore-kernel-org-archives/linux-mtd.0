Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YICss-0002IF-1e
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 09:01:30 +0000
Received: by mail-pa0-f46.google.com with SMTP id lj1so79846282pab.5
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 01:01:09 -0800 (PST)
Date: Mon, 2 Feb 2015 01:01:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Niklas Cassel <nks@flawful.org>
Subject: Re: [PATCH] mtd: avoid registering reboot notifier twice
Message-ID: <20150202090105.GE3523@norris-Latitude-E6410>
References: <1422752930-696-1-git-send-email-nks@flawful.org>
 <20150201230723.GA3523@norris-Latitude-E6410>
 <54CF2261.1040707@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54CF2261.1040707@flawful.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 02, 2015 at 08:08:17AM +0100, Niklas Cassel wrote:
> 
> On 02/02/2015 12:07 AM, Brian Norris wrote:
> > On Sun, Feb 01, 2015 at 02:08:50AM +0100, Niklas Cassel wrote:
> >> Calling mtd_device_parse_register with the same mtd_info
> >> (e.g. registering several partitions on a single device)
> >> would add the same reboot notifier twice, causing an
> >> infinte loop in notifier_chain_register during boot up.
> > No driver should be calling mtd_device_parse_register() multiple times
> > on the same mtd_info. Under what context do you see this? What driver?
> arch/cris/arch-v32/drivers/axisflashmap.c

Yikes, that file is ugly! I am reminded of (one of the many reasons) why
ARM ditched board files.

> It calls mtd_device_register for different partitions on same device using the same mtd_info.
> 
> What do you suggest this driver should do instead?

Well, it would be really great if it could aggregate the partitions it
wants all into one list (array) and pass that to the MTD core all at
once.

It also looks like this should have all been written as an MTD partition
parser (struct mtd_part_parser), and some additional platform data to
select the default maps if they aren't found on the flash. But there are
a lot of odd cases in that code that make it difficult to do now.

I'm tempted to suggest just calling add_mtd_partitions() directly, since
you couldn't possibly be making good use out of the "parse" part of the
mtd_device_parse_register() function. If you were, you'd get a ton of
duplicate partitions, since the parser (e.g., cmdlinepart) would get
called a bunch of times, and it would add the same partitions for
*every* time you're calling mtd_device_register(). [1]

But (as noted in mtdcore.h) add_mtd_partitions() is really private to
the core MTD files.

So... any chance you can rewrite this as an MTD parser + platform data?

Also, now that you point this issue out, I see that one other driver
might have the same problem as you -- diskonchip.c. It has a
dubiously-formed partition registration setup. I'm tempted to remove its
first mtd_device_register() and drop its 'no_autopart' parameter and see
if anyone complains.

If we have enough problems with this code, though, I might rip out some
of:

  3efe41be224c mtd: implement common reboot notifier boilerplate

until I can find a better way.

Brian

[1] This suggests that your code is quite broken already, but just
happens to work for the particular cases that are hard-coded here.
