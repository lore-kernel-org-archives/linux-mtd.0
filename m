Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJoea-0006EF-HI
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 16:52:05 +0000
In-Reply-To: <OF422CEB2B.7CB3BECB-ONC1257A8D.0058F723-C1257A8D.00595592@transmode.se>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
 <OF52EBAA51.F623F8FB-ONC1257A8B.005B88EA-C1257A8B.005BD53C@transmode.se>
 <OFF2FAA55C.4813D4C0-ONC1257A8B.0060F9EA-C1257A8B.00634CA4@transmode.se>
 <OF930A0EE5.DA214D86-ONC1257A8B.00673BC9-C1257A8B.0067E92C@transmode.se>
 <OFD47DAD5E.85DB9677-ONC1257A8D.003FBACE-C1257A8D.004EC32A@rohde-schwarz.com>
 <OF422CEB2B.7CB3BECB-ONC1257A8D.0058F723-C1257A8D.00595592@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
MIME-Version: 1.0
Subject: Re: JFFS2 deadlock, kernel 3.4.11
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF7B7B7723.82703A82-ONC1257A8D.005A1DFC-C1257A8D.005CA7D7@rohde-schwarz.com>
Date: Thu, 4 Oct 2012 18:51:58 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Joakim:

> Try Reply With Internet-style History (We use Notes here too)

Got it. Thanks!

> > jffs2_reserve_space() must not be called with f->sem held because it
> > acquires c->alloc_sem.
> 
> hmm, are you sure? Did it fail?
> As far as I can see jffs2_garbage_collect_live() does this.

jffs2_reserve_space() does mutex_lock(&c->alloc_sem) first thing, and 
README.Locking says "Never attempt to allocate space or lock alloc_sem 
with any f->sem held.". So I didn't even try; yes, I am a coward. (:-) 
Also, all the code I checked carefully releases f->sem before calling 
jffs2_reserve_space().

jffs2_garbage_collect_live() doesn't call jffs2_reserve_space() directly. 
Is it called indirectly somehow?

> > So I have moved mutex_lock(&f->sem) and grab_cache_page_write_begin()
> > after jffs2_reserve_space(). Attached is my 3.4.11 patch (which is 
based
> > on your patch) for review; I hope it is not mangled by Lotus Notes ...
> 
> don't have time to look ATM

Okay. When the tests succeed, I will simply mail it to the list as a 
regular patch, for general review.

Best regards,
Thomas
