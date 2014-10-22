Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xh336-0003oQ-K0
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 21:02:29 +0000
Received: by mail-pa0-f43.google.com with SMTP id eu11so78982pac.16
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 14:02:06 -0700 (PDT)
Date: Wed, 22 Oct 2014 14:02:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] mtd: docg3: fix 'defined but not used' warning
Message-ID: <20141022210203.GE1193@ld-irv-0074>
References: <1413998606-9589-1-git-send-email-computersforpeace@gmail.com>
 <CAN8TOE9yDA=v_v-48ZiG=5+Dk_JamxYxd_0jrWGtwQ5QXGrszA@mail.gmail.com>
 <87tx2vlwsg.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tx2vlwsg.fsf@free.fr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 22, 2014 at 09:38:39PM +0200, Robert Jarzmik wrote:
> Brian Norris <computersforpeace@gmail.com> writes:
> 
> > On Wed, Oct 22, 2014 at 10:23 AM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> >>    drivers/mtd/devices/docg3.c:2122:28: warning: 'docg3_dt_ids' defined but not used [-Wunused-variable]
> >>     static struct of_device_id docg3_dt_ids[] = {
> >
> > I suppose I should add that this only happens when CONFIG_OF=n. I'll
> > add this to the commit message if/when I apply this.
> 
> Thanks Brian, I had forgotten the non device-tree case, and overviewed the
> warning. Your change is the way to go.

OK, applied to l2-mtd.git.

Brian
