Received: from rv-out-0910.google.com ([209.85.198.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IMVXA-0005LY-LD
	for linux-mtd@lists.infradead.org; Sat, 18 Aug 2007 17:08:38 -0400
Received: by rv-out-0910.google.com with SMTP id c24so716750rvf
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Aug 2007 14:08:34 -0700 (PDT)
Message-ID: <46C75FD4.90801@gmail.com>
Date: Sat, 18 Aug 2007 14:08:36 -0700
From: Zac Medico <zmedico@gmail.com>
MIME-Version: 1.0
To: giulio fedel <giulio.fedel@andorsystems.com>
Subject: Re: jffs2 kernel dump with 2.6.22-rc7
References: <8c7950360708011141w3a716a8aua185e9f1931f17e3@mail.gmail.com>
	<46C5D764.5000303@andorsystems.com>
In-Reply-To: <46C5D764.5000303@andorsystems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

giulio fedel wrote:
> In jffs2_do_unlink() in fs/jffs2/write.c
> the jffs2_complete_reservation(c) is called even if 
> jffs2_reserve_space() is not called. This cause an unmatched 
> up(&c->alloc_sem) so the locking mechanism does not work.
> People using MTD_CAP_NORFLASH flash _and_ CONFIG_JFFS2_SUMMARY do not 
> see the problem (see  os-linux.h for the definition of 
> jffs2_can_mark_obsolete(c)).
> 
> I think this is your problem (it was the mine).

I can confirm that your patch solves the problem for me. I've been
unable to use jffs2 since 2.6.22 because of this problem. Thanks for
the fix!

Zac
