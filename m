Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPwku-0005KK-UQ
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 14:11:41 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1SPwkl-0005l5-AM
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 16:11:31 +0200
Received: from dsl.comtrol.com ([64.122.56.22])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 16:11:31 +0200
Received: from grant.b.edwards by dsl.comtrol.com with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 16:11:31 +0200
To: linux-mtd@lists.infradead.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Subject: Re: Question about mkfs.jffs2 "-s" option
Date: Thu, 3 May 2012 14:11:09 +0000 (UTC)
Message-ID: <jnu3lt$8ad$1@dough.gmane.org>
References: <jnrm65$im4$1@dough.gmane.org>
 <20120503095127.6931d370@pixies.home.jungo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2012-05-03, Shmulik Ladkani <shmulik.ladkani@gmail.com> wrote:

> Looks like mkfs.jffs2 sets 
> 	case 's':
> 		page_size = strtol(optarg, NULL, 0);
>
> and does not further parse KiB/MiB tokens.
>
> So my buest guess, try to specify '-s 4096' instead of '4KiB'.

I should have tried that.  Using -s4096 indeed produces the same
result as without the -s option.  I read the description of how the
erase block size was parsed, and assumed that applied to the the page
size as well.

-- 
Grant Edwards               grant.b.edwards        Yow! Gee, I feel kind of
                                  at               LIGHT in the head now,
                              gmail.com            knowing I can't make my
                                                   satellite dish PAYMENTS!
