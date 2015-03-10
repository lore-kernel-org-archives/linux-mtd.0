Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVQgt-0001mL-8J
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 20:23:48 +0000
Received: by pdev10 with SMTP id v10so4872139pde.13
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 13:23:24 -0700 (PDT)
Date: Tue, 10 Mar 2015 13:23:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH] mtd: part: Create the master device node when partitioned
Message-ID: <20150310202317.GB32500@ld-irv-0074>
References: <1425680522-7898-1-git-send-email-dehrenberg@chromium.org>
 <20150310015329.GA32500@ld-irv-0074>
 <CAAK6Zt2xY=maQOQyC1sg7U2pAthbvE2QaWN_UaJC+CA6KBp1sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAK6Zt2xY=maQOQyC1sg7U2pAthbvE2QaWN_UaJC+CA6KBp1sA@mail.gmail.com>
Cc: richard.weinberger@gmail.com, Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Nam Nguyen <namnguyen@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gwendal Grignou <gwendal@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 10, 2015 at 01:00:35PM -0700, Daniel Ehrenberg wrote:
> On Mon, Mar 9, 2015 at 6:53 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > I kinda like this strategy. If users were flexible enough, I'd like to
> > be able to make this the default eventually. But that probably won't
> > happen, so we may have to live with this Kconfig forever, in that case.
> 
> :( It'd also be nice if we could name things like mtda, mtda0, mtda1,
> etc like SCSI. Alas!

Yeah...

> >
> > BTW, is there any way to tell the difference between a partition and a
> > master device, from user space?
> 
> Not that I know of.
> >
> > Also, would we want to address these comments from mtdpart.c?
> >
> >  * We don't register the master, or expect the caller to have done so,
> >  * for reasons of data integrity.
> >
> >
> >         /* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
> >          * to have the same data be in two different partitions.
> >          */
> >
> > First of all, as I mentioned previously, I don't think the argument is
> > valid. We can't (and shouldn't have to) protect users from themselves
> > here.
> 
> Agreed. Anything I should do to address this comment besides deleting it?

This depends on the answer to the next part.

> >
> > Secondly, I think maybe this should be changed if we register both
> > master and partition(s). The partition *should* use the master as its
> > parent if we register both devices.
> >
> While I'd like that change, it looks to me like it'd have to be
> conditional on the new sysfs variable. The master's sysfs entries
> won't be populated otherwise.

Right.

> Or should we build the sysfs node in
> either case?

No, I don't think we want to change the current behavior.

> What if people are depending on the current sysfs
> semantics (not too hard to imagine actually)?

If we're making these kinds of changes, they should only be for when you
have the new Kconfig entry enabled. I think it's fair to induce a few
sensible, related ABI changes when the kernel is configured to use a new
option. So:
1. register both master and partition(s)
2. use master as the parent of the partition (i.e., tree structure)

We should briefly describe those changes in the Kconfig, and adjust the
code comments to something like, "Historically, we did not register both
the master and partition(s) as devices--and therefore didn't arrange
them as a tree structure--because <fill in bogus reasons>."

> > Side ntoe: that might provide the means for differentiating master and
> > partition -- check the device parent in sysfs.
> >
> > Brian
> 
> Yeah, that'd be easy. It'd also be easy to add sysfs properties
> describing the partition more.

Sure. Off the top of my head: I don't think we have a way to read what
the offset of a partition is within the master. This info is only
printed to the kernel log. (I'm not specifically requesting such
information, but I can imagine it being useful.)

Brian
