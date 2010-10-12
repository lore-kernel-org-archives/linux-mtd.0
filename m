Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P5aeK-0002h8-14
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 08:55:56 +0000
In-Reply-To: <1286872959.2164.5.camel@localhost>
References: <1286467304-23370-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1286872959.2164.5.camel@localhost>
Subject: Re: [PATCH] jffs2: Fix serious write stall due to erase
To: dedekind1@gmail.com
Message-ID: <OFA79EFC65.D894AD39-ONC12577BA.0030F160-C12577BA.00310669@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 12 Oct 2010 10:55:29 +0200
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

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/10/12 10:42:39:
>
> On Thu, 2010-10-07 at 18:01 +0200, Joakim Tjernlund wrote:
> > Drop the alloc_sem before erasing flash in
> > jffs2_garbage_collect_pass().
> > Otherwise writes are put on hold until the erase
> > has finised.
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
> >
> >  I am fairly sure it is safe to unlock the alloc_sem before
> >  calling jffs2_erase_pending_blocks(). Extra confirmation
> >  would be great though.
> >
> >  This problem was introduced in 2.6.35
>
> This looks safe for me as well, but I do not remember JFFS2 locking
> rules anymore, so I'm not 100% sure. I've pushed your patch to my
> l2-mtd-2.6.git.

Thanks, now if just David could weigh in :)

      Jocke
