Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qb4jG-0001S3-GE
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 05:51:27 +0000
Received: by vws8 with SMTP id 8so3830369vws.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 22:51:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1309153545.23597.13.camel@sauron>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
	<1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
	<1309153545.23597.13.camel@sauron>
Date: Mon, 27 Jun 2011 09:51:24 +0400
Message-ID: <BANLkTikmCY8UjJWRKTkM_QW2_Bxw4yqPfQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd/ofpart: add ofoldpart alias
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/27/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2011-06-27 at 01:03 +0400, Dmitry Eremin-Solenikov wrote:
>> ofpart.ko also provides ofoldpart MTD parser. Add respective
>> MODULE_ALIAS("ofoldpart"); declaration.
>>
>
> Why we need the alias?

Please check the parse_mtd_partitions code. If requested parser
isn't registered, it tries to load corresponding module. So, this alias
is necessary in the semi-bogus case when one will have the list
of parsers containing ofoldpart, but not ofpart partition parser.

-- 
With best wishes
Dmitry
