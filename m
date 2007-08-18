Received: from rv-out-0910.google.com ([209.85.198.191])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IMW4G-0005mh-FJ
	for linux-mtd@lists.infradead.org; Sat, 18 Aug 2007 17:42:53 -0400
Received: by rv-out-0910.google.com with SMTP id c24so719854rvf
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Aug 2007 14:42:45 -0700 (PDT)
Message-ID: <625fc13d0708181442k5efc6eb3g783ad32b2efdcadc@mail.gmail.com>
Date: Sat, 18 Aug 2007 16:42:45 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "giulio fedel" <giulio.fedel@andorsystems.com>,
	"David Woodhouse" <dwmw2@infradead.org>, Joakim.Tjernlund@transmode.se
Subject: Re: jffs2 kernel dump with 2.6.22-rc7
In-Reply-To: <46C5D764.5000303@andorsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8c7950360708011141w3a716a8aua185e9f1931f17e3@mail.gmail.com>
	<46C5D764.5000303@andorsystems.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/17/07, giulio fedel <giulio.fedel@andorsystems.com> wrote:
> In jffs2_do_unlink() in fs/jffs2/write.c
> the jffs2_complete_reservation(c) is called even if
> jffs2_reserve_space() is not called. This cause an unmatched
> up(&c->alloc_sem) so the locking mechanism does not work.
> People using MTD_CAP_NORFLASH flash _and_ CONFIG_JFFS2_SUMMARY do not
> see the problem (see  os-linux.h for the definition of
> jffs2_can_mark_obsolete(c)).
>
> I think this is your problem (it was the mine).

Hm.  That would be a regression introduced by commit
a491486a2087ac3dfc00efb4f838c8d684afaf54 I think.

Your patch seems like the correct fix.  Could you make it a strip
level of 1 and add the appropriate Signed-off-by line?  If so, we
should probably push this to -stable for 2.6.22 and be sure to get it
into 2.6.23.

josh
