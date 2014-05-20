Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmpmt-0005Ma-0h
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 19:33:23 +0000
Received: by mail-pb0-f47.google.com with SMTP id rp16so610878pbb.6
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 12:33:02 -0700 (PDT)
Date: Tue, 20 May 2014 12:32:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: update patch state on patchwork
Message-ID: <20140520193258.GV28907@ld-irv-0074>
References: <20980858CB6D3A4BAE95CA194937D5E73EAC3B93@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC3B93@DBDE04.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Bityutskiy,
 Artem \(artem.bityutskiy@intel.com\)" <artem.bityutskiy@intel.com>,
 "David Woodhouse \(dwmw2@infradead.org\)" <dwmw2@infradead.org>,
 patchwork@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Fri, Apr 18, 2014 at 09:15:03AM +0000, Pekon Gupta wrote:
> I was just wondering if there is a script which can automatically search the
> git tree and update state of patch on patchwork [1].

There is, sort of. Jeremy Kerr presented a few things at Linux Plumbers
a while back, and it includes a "catchup" script:

  http://www.linuxplumbersconf.org/2011/ocw/system/presentations/255/original/patchwork.pdf

It marks "Accepted" patches based on the hash of the diff. There are
also git post-recevie hooks for updating automatically.

> If not then is it possible
> to update the patch status from now onwards (or may be a month back) ?
> This can be added as part of git-commit script used by Maintainers.
> 
> This would be helpful in reviewing and finding references. And would be
> good for Maintainers too to keep a track of pending ones.

I've looked into your suggestion. I'm beginning to integrate Patchwork
into my workflow, and I'll see how it works out. I still have a few
kinks to work out (e.g., how to most easily mark patches as Superseded
when a new version is sent, for instance), but I have a few mutt and git
hooks established which help me in some of the major points. And I may
end up archiving much of the older stuff, just to start relatively
fresh.

Any tips for using patchwork to its fullest are welcome. I'm kind of in
a trial phase right now, where I'll see how much value patchwork can
add. If it really is just more work (on maintaining metadata) than it
helps, then I may not stick with it.

> [1] http://patchwork.ozlabs.org/project/linux-mtd/list/

Regards,
Brian
