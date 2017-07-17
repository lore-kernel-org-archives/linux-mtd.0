Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dX2MH-00013R-UN
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 09:30:31 +0000
Received: by mail-io0-x241.google.com with SMTP id f66so7035144iof.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 02:30:09 -0700 (PDT)
Message-ID: <1500283754.8256.11.camel@gmail.com>
Subject: Re: [PATCH v3 02/10] mtd: powernv_flash: Lock around concurrent
 access to OPAL
From: Balbir Singh <bsingharora@gmail.com>
To: Cyril Bur <cyrilbur@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org
Cc: stewart@linux.vnet.ibm.com, alistair@popple.id.au, dwmw2@infradead.org,
 rlippert@google.com
Date: Mon, 17 Jul 2017 19:29:14 +1000
In-Reply-To: <1500278150.29477.1.camel@gmail.com>
References: <20170712042304.19745-1-cyrilbur@gmail.com>
 <20170712042304.19745-3-cyrilbur@gmail.com>
 <1500276875.8256.3.camel@gmail.com> <1500278150.29477.1.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2017-07-17 at 17:55 +1000, Cyril Bur wrote:
> On Mon, 2017-07-17 at 17:34 +1000, Balbir Singh wrote:
> > On Wed, 2017-07-12 at 14:22 +1000, Cyril Bur wrote:
> > > OPAL can only manage one flash access at a time and will return an
> > > OPAL_BUSY error for each concurrent access to the flash. The simplest
> > > way to prevent this from happening is with a mutex.
> > > 
> > > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > > ---
> > 
> > Should the mutex_lock() be mutex_lock_interruptible()? Are we OK waiting on
> > the mutex while other operations with the lock are busy?
> > 
> 
> This is a good question. My best interpretation is that
> _interruptible() should be used when you'll only be coming from a user
> context. Which is mostly true for this driver, however, MTD does
> provide kernel interfaces, so I was hesitant, there isn't a great deal
> of use of _interruptible() in drivers/mtd. 
> 
> Thoughts?

What are the kernel interfaces (I have not read through mtd in detail)?
I would still like to see us not blocked in mutex_lock() across threads
for parallel calls, one option is to use mutex_trylock() and return if
someone already holds the mutex with -EBUSY, but you'll need to evaluate
what that means for every call.

Balbir Singh.
