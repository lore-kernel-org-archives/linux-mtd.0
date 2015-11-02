Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtOQ7-0008Vv-5U
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 23:21:48 +0000
Received: by pasz6 with SMTP id z6so162070309pas.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2015 15:21:24 -0800 (PST)
Date: Mon, 2 Nov 2015 15:21:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-mtd@lists.infradead.org, cdoban@broadcom.com, rjui@broadcom.com,
 sbranden@broadcom.com
Subject: Re: [3/3] mtd: cfi_cmdset_{0001, 0002}: use common MTD reboot
 boilerplate
Message-ID: <20151102232122.GG7274@google.com>
References: <1417746968-28747-3-git-send-email-computersforpeace@gmail.com>
 <20151102200513.GA26475@roeck-us.net>
 <20151102215818.GD7274@google.com>
 <20151102221633.GA30556@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151102221633.GA30556@roeck-us.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 02:16:33PM -0800, Guenter Roeck wrote:
> On Mon, Nov 02, 2015 at 01:58:18PM -0800, Brian Norris wrote:
> > On Mon, Nov 02, 2015 at 12:05:13PM -0800, Guenter Roeck wrote:
> > > On Thu, Dec 04, 2014 at 06:36:08PM -0800, Brian Norris wrote:
> > > > We don't have to implement this glue code in the chip driver any more.
> > > > 
> > > > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > > > ---
> > > > Not tested yet
> > > > 
> > > Tested-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > Thanks! Did you verify that your reboot notifier callback (e.g.,
> > cfi_intelext_reset()) is actually called on reboot?
> > 
> No, I just verified that it boots and shuts down correctly.
> 
> Do you want me to verify if the notifier is called, given the
> problems you discovered with the patch ?

Up to you. It'd be nice to know, but even with that info, we'd have more
work to do before we can take this, since I'm pretty sure there are
platforms out there where the notifier won't be called.

(And sorry, my emails can be a little evolutionary as they progress,
when I start to type before I've finished investigating everything.)

BTW, do you want to send out the patch for your suggestion in the other
thread, or should I?

Thanks,
Brian
