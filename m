Received: from mbutcher206.dsl.frii.net ([216.17.171.206] helo=www.aleph-null.tv)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DZbT-0000Je-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 23:40:40 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: M Butcher <mbutcher@aleph-null.tv>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: DOC Millenium not found by docprobe
Date: Fri, 22 Jun 2001 16:39:49 -0600
Cc: "MTD for Linux" <linux-mtd@lists.infradead.org>
References: <0106211659100B.11839@golan> <26595.993165317@redhat.com>
In-Reply-To: <26595.993165317@redhat.com>
MIME-Version: 1.0
Message-Id: <0106221639490C.11839@golan>
Content-Transfer-Encoding: 8bit
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

On Thursday 21 June 2001 05:15 pm, David Woodhouse wrote:
> mbutcher@aleph-null.tv said:
> > But I wanted to create a single partition, so I followed the steps in
> > the  jffs howto and did the following:
> > (0: sometimes do an 'erase')
> > 1: nftl_format /dev/mtd0
> > 2: fdisk /dev/nftla (make one big partition)
>
> You didn't need step 1. We definitely shouldn't be encouraging people to do
> that. Just using fdisk to change the partitioning would have been enough.
>

So I should really only nftl_format when the DOC is hosed?

> > 3: mke2fs /dev/nftla
>
> Is this a typo? Having made a partition you then erased it by using mkfs on
> the _whole_ device rather than the single partition. That's fine if it's
> what you wanted... but...
>

That should have been mke2fs /dev/nftla1 

The intent was to make the fs on the partition... 

> > 4: mount -t ext2 /dev/nftla1 /mnt
>
> I'm amazed this worked.
>

Well... had I typed #3 correctly, you probably wouldn't be as amazed. ;-)

> mbutcher@aleph-null.tv said:
> >  When I used the Millenium Only driver, I got an error from docprobe
> > saying  something like "no driver", though I could see it with lsmod.
>
> To use that, you need to undef DOC_SINGLE_DRIVER in docprobe.c
>

Oh, yeah... that's even in the doc. Sorry. Which driver would you recommend 
in this situation? The Millenium-only?


Also, any ideas why the DOC "disappears" after a while -- e.g. why, after 
doing the above process a few times, the DOC is no longer detected?


Thanks,

Matt
