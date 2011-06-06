Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTUsv-0005sB-Q3
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:10:06 +0000
Received: by ewy3 with SMTP id 3so1541025ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:10:03 -0700 (PDT)
Subject: Re: [PATCH 041/104] mtd: prepare to convert
	of_mtd_parse_partitions to partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
	<1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 11:05:48 +0300
Message-ID: <1307347548.3135.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-02 at 18:51 +0400, Dmitry Eremin-Solenikov wrote:
> Prepare to convert of_mtd_parse_partitions() to usual partitions parser:
> 1) Register ofpart parser
> 2) Internally don't use passed device for error printing
> 3) Add device_node to mtd_info struct
> 4) Move of_mtd_parse_partitions from __devinit to common text section
> 5) add ofpart to the default list of partition parsers
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Do not apply this and further changes so far - I had some questions.

Anyway, your series consists of as set of logical steps, which is really
nice, so let's finish with the first cmdline consolidation step, and
then move on.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
