Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZfQf-0001i7-Eh
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 11:19:46 +0000
Date: Fri, 25 Oct 2013 08:19:07 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2 4/5] mtd: nand: omap2: Use devm_kzalloc
Message-ID: <20131025111906.GC2489@localhost>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382696277-9063-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AD60@DBDE04.ent.ti.com>
 <20131025104246.GA2489@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AE0F@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2AE0F@DBDE04.ent.ti.com>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 25, 2013 at 11:09:14AM +0000, Gupta, Pekon wrote:
> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> > 
> > Hm.. well the problem with that patch is that it's in the middle of an
> > unrelated series. As I already told you, I think you should have pushed
> > that as a one-patch fix. Have you seen that suggestion?
> > 
> Yes, I know.. actually the original patch series, when it started somewhere
> April (or before) is very different from the version v11 now :-).
> This devm_ update was added in middle of v6-v7 version change
> (Most of the changes since first version of this patchset is captured in 
> Cover-letter).
> 
> 

Well, in order to *avoid* having a patchset flowing for 5 months and 11
revisions you coudl try to keep series small. You could have that single
fix merged if you send it alone. Not sure why you insist in *not* doing
that.

> > On the other side, you're fixing too many things in that single patch,
> > for my taste. Maybe I'm not the smarter developer, but going through
> > that patch is not easy to catch if there's no mistake done.
> > 
> > Usually if it's possible to split a patch (maintaining consistency) it makes
> > the reviewing process easier.
> > If you'd rather send this devm_xxx change yourself that's fine by me,
> > 
> Ahh nothing like that.. Brian had already reviewed these couple of times

Ah, good. In that case you should add "Reviewed-by" if Brian already
reviewed it. IMHO, the patch could be cleaner and the commit message
could be better.

> And it was only [Patch 04/10] which was last one remaining..

Yes, and because you added *another* patch to the series you keep
spinning patchset versions.

> I just said it because this might show up in merge conflict .. or rejects..
> 
> > but *please* split the patch in two and write proper commit messages.
> > 
> > Anyway: this is just a silly change, the important one is the other
> > nand_scan_ident() fix. Could you help me review that?
> > 
> > I'm interested in knowing how will that work with 8-bit and 16-bit devices.
> > --
> Yes, I'm just preparing the scenario where BUSWIDTH_AUTO would fail..
> unless you do GPMC driver changes also.. same issue was found by
> Matthieu CASTET (matthieu.castet@parrot.com)
> (please see my other mail)
> 

OK, let's try to focus in that patch alone, I'd like to move forward.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
