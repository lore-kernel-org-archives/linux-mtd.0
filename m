Received: from mx1.auerswald.de ([212.185.163.234] helo=mail.auerswald.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NhL6p-0002i3-JD
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 10:56:56 +0000
From: "Kai-Uwe Bloem" <kai-uwe.bloem@auerswald.de>
Subject: Re-2: [PATCH 2/2]
	s/jffs2_erase_pending_trigger/jffs2_garbage_collect_trigger/
To: linux-mtd@lists.infradead.org
Date: Tue, 16 Feb 2010 10:56:51 +0000
Message-ID: <DIIE.000028C80024515A@mail.auerswald.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset="us-ascii"
Content-Transfer-Encoding: 7Bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > But then you make the code more confusing. Indeed, readability becomes
> > worse.
> >
> > I would just change 'jffs2_erase_pending_trigger()' and make it wake up
> > the GC thread, just like 'jffs2_garbage_collect_trigger()'...
> 
> Depends on your point of view, I think erasing blocks is GC so to
> me it makes sense. However I acknowledge that erasing is different from
> other forms of GC so I can change it back if you really want me too.

Yes, please. I too think that it would be more readable, since the intention is more visible.

--


To: joakim.tjernlund@transmode.se
    dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org
