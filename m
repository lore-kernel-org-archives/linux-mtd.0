Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qb4u8-0001bt-BA
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 06:02:40 +0000
Received: by iyn15 with SMTP id 15so4701467iyn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 23:02:39 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd/ofpart: add ofoldpart alias
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 27 Jun 2011 09:03:26 +0300
In-Reply-To: <BANLkTikmCY8UjJWRKTkM_QW2_Bxw4yqPfQ@mail.gmail.com>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
	<1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
	<1309153545.23597.13.camel@sauron>
	<BANLkTikmCY8UjJWRKTkM_QW2_Bxw4yqPfQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309154611.23597.18.camel@sauron>
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

On Mon, 2011-06-27 at 09:51 +0400, Dmitry Eremin-Solenikov wrote:
> On 6/27/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Mon, 2011-06-27 at 01:03 +0400, Dmitry Eremin-Solenikov wrote:
> >> ofpart.ko also provides ofoldpart MTD parser. Add respective
> >> MODULE_ALIAS("ofoldpart"); declaration.
> >>
> >
> > Why we need the alias?
> 
> Please check the parse_mtd_partitions code. If requested parser
> isn't registered, it tries to load corresponding module. So, this alias
> is necessary in the semi-bogus case when one will have the list
> of parsers containing ofoldpart, but not ofpart partition parser.

Fair enough, but would you please prepend MODULE_ALIAS with a comment
like this which explains why we need the alias?

-- 
Best Regards,
Artem Bityutskiy
