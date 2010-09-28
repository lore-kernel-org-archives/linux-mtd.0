Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0UyY-0002hB-V3
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 07:51:47 +0000
Received: by fxm4 with SMTP id 4so4402794fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 00:51:45 -0700 (PDT)
Subject: Re: [PATCH] old ubi-utils: drop -Werror
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1284278763.1783.15.camel@brekeke>
References: <1284263293-31064-1-git-send-email-vapier@gentoo.org>
	<1284278763.1783.15.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 10:49:56 +0300
Message-ID: <1285660196.2437.34.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andreas Arnez <arnez@de.ibm.com>, Frank Haverkamp <haver@vnet.ibm.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-09-12 at 11:06 +0300, Artem Bityutskiy wrote:
> On Sat, 2010-09-11 at 23:48 -0400, Mike Frysinger wrote:
> > Considering this is marked as "old" which is synonymous with "dead",
> > having the dir cause build failures because of warnings makes no
> > sense.  So drop the -Werror usage.
> > 
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> 
> I wonder if people still use them and may be we can just remove them?
> Added Frank and Andreas who are the potential users of the old
> ubi-utils.

OK, let's remove the old utilities.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
