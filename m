Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVQu7-0002zx-85
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 20:37:27 +0000
Received: by pabrd3 with SMTP id rd3so5131804pab.5
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 13:37:05 -0700 (PDT)
Date: Tue, 10 Mar 2015 13:36:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH] mtd: part: Create the master device node when partitioned
Message-ID: <20150310203658.GC32500@ld-irv-0074>
References: <1425680522-7898-1-git-send-email-dehrenberg@chromium.org>
 <20150310015329.GA32500@ld-irv-0074>
 <CAAK6Zt2xY=maQOQyC1sg7U2pAthbvE2QaWN_UaJC+CA6KBp1sA@mail.gmail.com>
 <20150310202317.GB32500@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150310202317.GB32500@ld-irv-0074>
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

On Tue, Mar 10, 2015 at 01:23:17PM -0700, Brian Norris wrote:
> On Tue, Mar 10, 2015 at 01:00:35PM -0700, Daniel Ehrenberg wrote:
> > On Mon, Mar 9, 2015 at 6:53 PM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> > > I kinda like this strategy. If users were flexible enough, I'd like to
> > > be able to make this the default eventually. But that probably won't
> > > happen, so we may have to live with this Kconfig forever, in that case.
> > 
> > :( It'd also be nice if we could name things like mtda, mtda0, mtda1,
> > etc like SCSI. Alas!
> 
> Yeah...

BTW, mtda{,0,1,...} is probably a little ambitious, but we might be able
to get by with phasing in your new Kconfig option as default after a few
releases. Then we could probably gauge whether we can kill the old
behavior completely.

Brian
