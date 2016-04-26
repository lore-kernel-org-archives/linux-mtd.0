Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auzCl-0005Ih-W9
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 09:22:53 +0000
Subject: Re: [PATCH 4/8] mtd-utils: Add flash stress test Utility
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-5-git-send-email-richard@nod.at>
 <20160426101850.2ccde903@bbrezillon>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
From: Richard Weinberger <richard@nod.at>
Message-ID: <571F3354.4040909@nod.at>
Date: Tue, 26 Apr 2016 11:22:28 +0200
MIME-Version: 1.0
In-Reply-To: <20160426101850.2ccde903@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.04.2016 um 10:18 schrieb Boris Brezillon:
> Please use getopt_long(). I guess this applies to all your patches, so
> I'll stop mentioning it.
> 

I agree, other mtd-utils programs use getopt too. Let's stay consistent.

BTW: How do you feel about switching globally over to argp?
http://www.gnu.org/software/libc/manual/html_node/Argp.html

IMHO it is much less pain to use and offers nice features such as auto generating
--help.
Although it is a GNU feature there is also a standalone package available which can be used
when building for musl or uclibc.

Thanks,
//richard
