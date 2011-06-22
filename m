Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZEx5-0008TG-0K
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 04:22:08 +0000
Received: by pzk28 with SMTP id 28so308422pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 21:22:03 -0700 (PDT)
Subject: Re: [PATCH 02/18] mtd: prepare to convert of_mtd_parse_partitions
	to partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 22 Jun 2011 07:22:46 +0300
In-Reply-To: <1307833922-21602-3-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
	<1307833922-21602-3-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308716570.18119.9.camel@sauron>
Mime-Version: 1.0
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

On Sun, 2011-06-12 at 03:11 +0400, Dmitry Eremin-Solenikov wrote:
>  struct mtd_part_parser_data {
>  	unsigned long origin;
> +	struct device_node *of_node;
>  };

You forgot to add a comment for the of_node field.
I could fixup this myself, but I really have no time now, sorry.

-- 
Best Regards,
Artem Bityutskiy
