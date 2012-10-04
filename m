Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJo5a-0003Eb-Mq
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 16:15:55 +0000
In-Reply-To: <OFD47DAD5E.85DB9677-ONC1257A8D.003FBACE-C1257A8D.004EC32A@rohde-schwarz.com>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
 <OF52EBAA51.F623F8FB-ONC1257A8B.005B88EA-C1257A8B.005BD53C@transmode.se>
 <OFF2FAA55C.4813D4C0-ONC1257A8B.0060F9EA-C1257A8B.00634CA4@transmode.se>
 <OF930A0EE5.DA214D86-ONC1257A8B.00673BC9-C1257A8B.0067E92C@transmode.se>
 <OFD47DAD5E.85DB9677-ONC1257A8D.003FBACE-C1257A8D.004EC32A@rohde-schwarz.com>
Subject: Re: JFFS2 deadlock, kernel 3.4.11
To: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF422CEB2B.7CB3BECB-ONC1257A8D.0058F723-C1257A8D.00595592@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 4 Oct 2012 18:15:46 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas.Betker@rohde-schwarz.com wrote on 2012/10/04 16:20:16:
>
> Hello Joakim,
>
> (sorry if the indentation is wrong, I have not yet found out how to do
> this in Lotus Notes):

Try Reply With Internet-style History (We use Notes here too)

>
> [Joakim Tjernlund]
> So maybe this will help(not even compile tested), don't know if
> jffs2_reserve_space()
> can be called with f->sem held.
> If this is bad, then perhaps move pg =
> grab_cache_page_write_begin(mapping, index, flags)
> to later in this function somehow?
> [/Joakim Tjernlund]
>
> jffs2_reserve_space() must not be called with f->sem held because it
> acquires c->alloc_sem.

hmm, are you sure? Did it fail?
As far as I can see jffs2_garbage_collect_live() does this.

>
> So I have moved mutex_lock(&f->sem) and grab_cache_page_write_begin()
> after jffs2_reserve_space(). Attached is my 3.4.11 patch (which is based
> on your patch) for review; I hope it is not mangled by Lotus Notes ...

don't have time to look ATM

>
> The first tests (with proof of locking correctness enabled) were fine. The
> main tests will run until tomorrow evening, though; last time, it took me
> all day to reproduce the deadlock, and I want to be reasonably sure that
> it is gone -- and that no new deadlocks were introduced.
>
> Best regards,
> Thomas
>
> [attachment "jffs2_write_begin.patch" deleted by Joakim Tjernlund/Transmode]
