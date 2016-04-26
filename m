Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auzbI-0002wd-Hp
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 09:48:13 +0000
Date: Tue, 26 Apr 2016 11:47:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at, Brian
 Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/8] mtd-utils: Add flash stress test Utility
Message-ID: <20160426114750.1a9186dc@bbrezillon>
In-Reply-To: <571F3354.4040909@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-5-git-send-email-richard@nod.at>
 <20160426101850.2ccde903@bbrezillon> <571F3354.4040909@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 Apr 2016 11:22:28 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 26.04.2016 um 10:18 schrieb Boris Brezillon:
> > Please use getopt_long(). I guess this applies to all your patches, so
> > I'll stop mentioning it.
> >   
> 
> I agree, other mtd-utils programs use getopt too. Let's stay consistent.
> 
> BTW: How do you feel about switching globally over to argp?
> http://www.gnu.org/software/libc/manual/html_node/Argp.html
> 
> IMHO it is much less pain to use and offers nice features such as auto generating
> --help.
> Although it is a GNU feature there is also a standalone package available which can be used
> when building for musl or uclibc.

I don't have any objection to it. Let's see how Brian feels about it.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
