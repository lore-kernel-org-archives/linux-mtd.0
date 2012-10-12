Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TManf-0003Bo-7o
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 08:40:56 +0000
In-Reply-To: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: Re: JFFS2 deadlock, kernel 3.4.11
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFBD733ECD.FFA516F7-ONC1257A95.002EA2AB-C1257A95.002FA73F@rohde-schwarz.com>
Date: Fri, 12 Oct 2012 10:40:26 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Joakim,

there was a minor error in my original post:

> The GC thread hangs in lock_page(page), the write thread hangs in the 
> first mutex_lock(&f->sem). The cause seems to be an AB-BA deadlock:

When retesting, I found that the write thread hangs in the _second_ 
mutex_lock(&f->sem), i.e., the one for jffs2_do_readpage_nolock(); looking 
at my notes, I am pretty sure that this was also the case in the first 
deadlocks.

Actually, it seems that the path with jffs2_reserve_space() is never taken 
in the 'scp' tests. For testing the patch, I would like to make sure that 
this path also works, but so far, I couldn't find a way to force jffs2 to 
take it. I will have to dig a bit deeper for this ...

Best regards,
Thomas
