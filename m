Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDml-0002l7-F7
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 14:18:12 +0000
Message-ID: <1413814665.7906.316.camel@sauron.fi.intel.com>
Subject: Re: SV: bad node type after using ubiupdatevol
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Per Smitt <per.smitt@sbie.se>
Date: Mon, 20 Oct 2014 17:17:45 +0300
In-Reply-To: <1413813476716.79473@sbie.se>
References: <1413805882326.37838@sbie.se>
 ,<1413811808.7906.278.camel@sauron.fi.intel.com>
 <1413813476716.79473@sbie.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First of all, do you have fastmap enabled or disabled (check
your .config)

On Mon, 2014-10-20 at 13:57 +0000, Per Smitt wrote:
> > Can you experiment and put a very long sleep here, say, 20 minutes. The
> > idea is to wait until UBI finishes all the background operations. This
> > should not matter normally, but may be for your HW/SW it does for some
> > reasons.
> 
> I just experimented here with a manual delay somewhere between
> 10 seconds and one minute. I simply disabled the automatic reboot 
> in the firmware upgrade and manually rebooted once the writing was
> done. 

My hunch is that this just hides/reveals symptoms, and the root-cause is
not related to volume update at all. I thing this is related to flasher.
Namely, if your flasher does not skip empty pages, but writes 0xFFs to
them. See the links below.

> > What may, in theory cause issues may be related to how you flash your
> > images. There are whole bunch of tricks related to this, see [1] and
> > [2]. It is possible that you see the issues only after the update just
> > because you hit them this way first. If you do enough UBIFS operations
> > before update, you may also hit issues due to "improper" flashing.
> 
> What are the references [1] and [2] you refer to? I didn't see any references 
> added in the email.

Oh, here:

1. http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo
2. http://www.linux-mtd.infradead.org/faq/ubifs.html#L_free_space_fixup

Could you please try to re-create your image with '--space-fixup' and
try what you do (without adding any delays).

But validating the flash is a good idea irrespective.

> > To exclude those, please either use ubiformat, or just start with fully
> > erase flash, and attach it to UBI, so UBI formats it. Then you may be
> > sure it is not your u-boot/firmware/whatever flasher doing nasty things.
> 
> I have a hard time doing this since I have only one mtd-partition except
> for my kernel partition. I could perhaps try to boot Linux from the SD-card
> and then write the ubifs from there.

Yea, booting form an SD card would be the way to go. But you can start
with just quick-trying '--space-fixup' first.

Artem.
