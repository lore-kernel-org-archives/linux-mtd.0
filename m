Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qb4cy-0001MW-Ji
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 05:44:57 +0000
Received: by pwi3 with SMTP id 3so3189442pwi.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 22:44:52 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd/ofpart: add ofoldpart alias
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 27 Jun 2011 08:45:40 +0300
In-Reply-To: <1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
	<1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309153545.23597.13.camel@sauron>
Mime-Version: 1.0
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-27 at 01:03 +0400, Dmitry Eremin-Solenikov wrote:
> ofpart.ko also provides ofoldpart MTD parser. Add respective
> MODULE_ALIAS("ofoldpart"); declaration.
> 

Why we need the alias?

-- 
Best Regards,
Artem Bityutskiy
