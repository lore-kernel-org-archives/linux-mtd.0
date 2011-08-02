Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoNq3-00029N-0B
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 22:53:28 +0000
Received: by wyf23 with SMTP id 23so232806wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Aug 2011 15:53:21 -0700 (PDT)
Date: Tue, 2 Aug 2011 23:53:16 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: MTD-related kobject badness during linux-next boot
Message-ID: <20110802225316.GF5063@pulham.picochip.com>
References: <CAGq3pz4LHRkCqaJfqoMYe-=mn+s5CVZipab7bd8F3z+ou3xxVA@mail.gmail.com>
	<CAN8TOE9mWEmS5YJqNrS9OrG=t+emeLcXNpKR1BiZ6VDJW7_c=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8TOE9mWEmS5YJqNrS9OrG=t+emeLcXNpKR1BiZ6VDJW7_c=A@mail.gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	Daniel Drake <dsd@laptop.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, Aug 02, 2011 at 10:40:29AM -0700, Brian Norris wrote:
> Since Dmitry's change, it looks like cafe_nand will add the master
> device, then parse and register its partitions, if found. However, if
> partitions are NOT found, then mtd_device_parse_register() falls back
> to adding the master device, which was already added. In
> drivers/mtd/mtdcore.c, see:
> 
>      int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
>      ...
>      if (err > 0) {
>      ...
>      } else if (err == 0) {
>              err = add_mtd_device(mtd);
>      ...
> 
> 
> So it looks like perhaps we can solve the problem by just killing the
> "register the whole device first" and allow mtd_device_parse_register
> to do it if there are no partitions. Any cafe_nand developers know if
> this is a problem? i.e., is there a reason we need both the whole
> device AND the partitions sent to add_mtd_device()? I'll send a full
> patch with sign-off and description if there are no objections.

I think that's the right thing to do.  There's actually a comment in 
drivers/mtd/mtdpart.c saying:

	/* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
         * to have the same data be in two different partitions.
         */

So I do think it should be the whole device *or* the partitions.  In any 
case, your patch looks good to me.

Jamie
