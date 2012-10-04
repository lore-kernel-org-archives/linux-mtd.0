Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJqa7-0003Ul-9q
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 18:55:35 +0000
In-Reply-To: <OFB615AF11.05DABF7D-ONC1257A8D.00661C69-C1257A8D.0066832C@transmode.se>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
 <OF52EBAA51.F623F8FB-ONC1257A8B.005B88EA-C1257A8B.005BD53C@transmode.se>
 <OFF2FAA55C.4813D4C0-ONC1257A8B.0060F9EA-C1257A8B.00634CA4@transmode.se>
 <OF930A0EE5.DA214D86-ONC1257A8B.00673BC9-C1257A8B.0067E92C@transmode.se>
 <OFD47DAD5E.85DB9677-ONC1257A8D.003FBACE-C1257A8D.004EC32A@rohde-schwarz.com>
 <OF422CEB2B.7CB3BECB-ONC1257A8D.0058F723-C1257A8D.00595592@transmode.se>
 <OF7B7B7723.82703A82-ONC1257A8D.005A1DFC-C1257A8D.005CA7D7@rohde-schwarz.com>
 <OFB615AF11.05DABF7D-ONC1257A8D.00661C69-C1257A8D.0066832C@transmode.se>
Subject: Re: JFFS2 deadlock, kernel 3.4.11
Message-ID: <OFEB6FD0F2.3E7FF2DB-ONC1257A8D.00677FC4-C1257A8D.0067F4B9@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 4 Oct 2012 20:55:28 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Thomas.Betker@rohde-schwarz.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Thomas.Betker@rohde-schwarz.com wrote on 2012/10/04 18:51:58:
> >
> > Hello Joakim:
> >
> > > Try Reply With Internet-style History (We use Notes here too)
> >
> > Got it. Thanks!
> >
> > > > jffs2_reserve_space() must not be called with f->sem held because it
> > > > acquires c->alloc_sem.
> > >
> > > hmm, are you sure? Did it fail?
> > > As far as I can see jffs2_garbage_collect_live() does this.
> >
> > jffs2_reserve_space() does mutex_lock(&c->alloc_sem) first thing, and
> > README.Locking says "Never attempt to allocate space or lock alloc_sem
> > with any f->sem held.". So I didn't even try; yes, I am a coward. (:-)
> > Also, all the code I checked carefully releases f->sem before calling
> > jffs2_reserve_space().
>
> I see, thanks.
>
> >
> > jffs2_garbage_collect_live() doesn't call jffs2_reserve_space() directly.
> > Is it called indirectly somehow?
>
> hmm, misread the code a bit so forget this comment.
>
> >
> > > > So I have moved mutex_lock(&f->sem) and grab_cache_page_write_begin()
> > > > after jffs2_reserve_space(). Attached is my 3.4.11 patch (which is
> > based
> > > > on your patch) for review; I hope it is not mangled by Lotus Notes ...
> > >
> > > don't have time to look ATM
> >
> > Okay. When the tests succeed, I will simply mail it to the list as a
> > regular patch, for general review.
>
> I think your patch will work, but I don't like having 2 call sites
> to grab_cache_page_write_begin(mapping, index, flags) so I came
> up with this instead(untested as well):

Forgot, could you add some debug code to test if pageofs <= inode->i_size:
	ri.isize = cpu_to_je32(max((uint32_t)inode->i_size, pageofs));
      ....
      if(pageofs <= inode->i_size) {
         print debug stuff here
      }
	ri.dsize = cpu_to_je32(pageofs - inode->i_size);

 Jocke
