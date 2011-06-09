Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUh6S-0000RJ-Mq
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 15:25:01 +0000
Received: by fxm14 with SMTP id 14so1492664fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 08:24:58 -0700 (PDT)
Subject: Re: [PATCH 01/17] mtd: prepare to convert of_mtd_parse_partitions
	to partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307632654.7374.121.camel@localhost>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
	<1307629388-24769-2-git-send-email-dbaryshkov@gmail.com>
	<1307629589.7374.103.camel@localhost>  <4DF0DA9A.2050301@gmail.com>
	<1307631767.7374.111.camel@localhost>  <4DF0E1E8.9010307@gmail.com>
	<1307632654.7374.121.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 18:20:40 +0300
Message-ID: <1307632840.7374.123.camel@localhost>
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

On Thu, 2011-06-09 at 18:17 +0300, Artem Bityutskiy wrote:
> And change the current "origin" argument with a
> "struct mtd_part_parser_data *data" pointer?

Which of course can be NULL if there is nothing to say, as well as
of_node may be NULL, in which case the parsers which needs those things
can just return "no partitions" or something like that?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
