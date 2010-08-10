Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OinE1-0000KH-8X
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 11:42:33 +0000
Received: by fxm16 with SMTP id 16so697499fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2010 04:42:31 -0700 (PDT)
Subject: Re: ubi : kernel panic on erroneous block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>, Adrian.Hunter@nokia.com
In-Reply-To: <4C61223F.30100@parrot.com>
References: <4C61223F.30100@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Aug 2010 14:42:27 +0300
Message-ID: <1281440547.2332.12.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-10 at 11:56 +0200, Matthieu CASTET wrote:
> Hi,
> 
> 
> when running test with ubifs I found the following crash.
> One block is instable (some read fails with ecc error correctable or 
> not) after a power cut. This is due to interrupted write or erase.
> 
> Our test do first a read of the ubi volume (cat /dev/ubi3_0 > /dev/null) 
> to force complete read of it.
> 
> In this case ecc correctable is detected, and scrubbing is scheduled
> But ubi_eba_copy_leb: the block become uncorrectable and added to 
> erroneous list.
> When mounting ubifs read doesn't check that it is erroneous and return data.
> It is added again for scrubbing, but prot_queue_del crash because we 
> already remove it in the first scrubbing try.
> 
> Here an attempt to fix the problem. This is ugly. I didn't try it yet. I 
>   erased my corrupted flash by accident.
> 
> One other solution could be to add the test in ubi_wl_scrub_peb, but I 
> don't think it is ok to return data on erroneous block.
> 
> An other solution could be to unmap the block (read will return 0xff), 
> but this may break upper layer ?

Matthieu, unfortunately I'm on holidays so cannot really look at this.
And I already have a lot of UBI/UBIFS issues waiting for me to look at.
I think I'll start looking at the things only in mid-September/October.
Sorry for this. But may be Adrian could take a look at this, if he has
some time? :-)

Artem.
