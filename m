Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVQKo-0001xg-29
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 20:00:58 +0000
Received: by qgdq107 with SMTP id q107so4863326qgd.6
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 13:00:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150310015329.GA32500@ld-irv-0074>
References: <1425680522-7898-1-git-send-email-dehrenberg@chromium.org>
 <20150310015329.GA32500@ld-irv-0074>
Date: Tue, 10 Mar 2015 13:00:35 -0700
Message-ID: <CAAK6Zt2xY=maQOQyC1sg7U2pAthbvE2QaWN_UaJC+CA6KBp1sA@mail.gmail.com>
Subject: Re: [PATCH] mtd: part: Create the master device node when partitioned
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On Mon, Mar 9, 2015 at 6:53 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> I kinda like this strategy. If users were flexible enough, I'd like to
> be able to make this the default eventually. But that probably won't
> happen, so we may have to live with this Kconfig forever, in that case.

:( It'd also be nice if we could name things like mtda, mtda0, mtda1,
etc like SCSI. Alas!
>
> BTW, is there any way to tell the difference between a partition and a
> master device, from user space?

Not that I know of.
>
> Also, would we want to address these comments from mtdpart.c?
>
>  * We don't register the master, or expect the caller to have done so,
>  * for reasons of data integrity.
>
>
>         /* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
>          * to have the same data be in two different partitions.
>          */
>
> First of all, as I mentioned previously, I don't think the argument is
> valid. We can't (and shouldn't have to) protect users from themselves
> here.

Agreed. Anything I should do to address this comment besides deleting it?
>
> Secondly, I think maybe this should be changed if we register both
> master and partition(s). The partition *should* use the master as its
> parent if we register both devices.
>
While I'd like that change, it looks to me like it'd have to be
conditional on the new sysfs variable. The master's sysfs entries
won't be populated otherwise. Or should we build the sysfs node in
either case? What if people are depending on the current sysfs
semantics (not too hard to imagine actually)?

> Side ntoe: that might provide the means for differentiating master and
> partition -- check the device parent in sysfs.
>
> Brian

Yeah, that'd be easy. It'd also be easy to add sysfs properties
describing the partition more.

Thanks,
Dan
