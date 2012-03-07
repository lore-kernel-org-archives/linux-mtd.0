Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5P2x-0003nK-2l
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 22:09:24 +0000
Date: Wed, 7 Mar 2012 23:09:18 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Richard Weinberger <rw@linutronix.de>
Subject: Re: [RFC][PATCH 1/7] MTD: UBI: Add checkpoint on-chip layout
In-Reply-To: <4F57CCF4.6040902@linutronix.de>
Message-ID: <alpine.LFD.2.02.1203072252300.2742@ionos>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1329250006-22944-2-git-send-email-rw@linutronix.de>
 <1331136589.3463.3.camel@sauron.fi.intel.com>
 <4F57CCF4.6040902@linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: tim.bird@am.sony.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 Mar 2012, Richard Weinberger wrote:

> Am 07.03.2012 17:09, schrieb Artem Bityutskiy:
> > On Tue, 2012-02-14 at 21:06 +0100, Richard Weinberger wrote:
> > > Specify the on-chip checkpoint layout.
> > > The checkpoint consists of two major parts.
> > > A super block (identified via UBI_CP_SB_VOLUME_ID) and
> > > zero or more data blocks (identified via UBI_CP_DATA_VOLUME_ID).
> > > Data blocks are only used if whole checkpoint information does not fit
> > > into the super block.
> > 
> > And superblock is also a more or less standard name used by file-system.
> > I easily imagine difficulties and confusion when discussing UBIFS and
> > UBI and mixing UBI and UBIFS supersblocks up. IMHO, anything unique is
> > much better, even if it does not make much sense. E.g., "boss block" or
> > "pomo block" (pomo = boss in Finnish).
> > 
> > Would you consider picking a different name as well please?
> > 
> 
> Will do.

What about FASTMAP ?

That's what the whole story is about. Building the logical/physical
mappings (fast). Then call the "super block" FASTMAP_REF and the data
stuff FASTMAP_DATA.

That's the sanest I could come up with aside of smuggling in my
favourite buzzword ROADMAP :)

Of course we could stay with latin and name it: UBIUBI. ubiubi is latin
for: where the heck is it, but I guess that's stretching it a bit :)

Thanks,

	tglx
