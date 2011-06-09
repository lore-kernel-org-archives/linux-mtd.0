Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUhAi-0000U9-Q3
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 15:29:25 +0000
Received: by fxm14 with SMTP id 14so1497728fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 08:29:22 -0700 (PDT)
Subject: Re: [PATCH 01/17] mtd: prepare to convert of_mtd_parse_partitions
	to partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <4DF0DA9A.2050301@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
	<1307629388-24769-2-git-send-email-dbaryshkov@gmail.com>
	<1307629589.7374.103.camel@localhost>  <4DF0DA9A.2050301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 18:25:04 +0300
Message-ID: <1307633104.7374.125.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-09 at 18:37 +0400, Dmitry Eremin-Solenikov wrote:
> I know they aren't nice. OTOH ofpart.c also seems a bit non-logical: one 
> can have of node in the MTD, but doesn't (strangely) want to compile in 
> ofpart.c. Of course I can add separate small of-handling functions (to 
> do OF handling) to mtdcore.c to be replaced by empty functions in the 
> absence of CONFIG_OF, but this also look like overhead for me.

Anyway, if I understand correctly (correct me if I don't!) - this is
basically about passing parser-specific information to parsers. And if
this is right, your way of adding this parser-specific information to
'struct mtd_info *' is bad, and we need to invent something better.

Right?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
