Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYLd-0002uD-VN
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 11:51:58 +0000
Received: by fxm14 with SMTP id 14so3462955fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 04:51:56 -0700 (PDT)
Subject: Re: [PATCH 07/32] mtd: atmel_nand don't specify default parsing
	options
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-7-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
	<1307351782-7456-7-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 14:47:40 +0300
Message-ID: <1307360860.3112.40.camel@localhost>
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

On Mon, 2011-06-06 at 13:15 +0400, Dmitry Eremin-Solenikov wrote:
> -	num_partitions = parse_mtd_partitions(mtd, part_probes,
> +	num_partitions = parse_mtd_partitions(mtd, NULL,
>  					      &partitions, 0);

Ditto, this should have become one-liner, I'll do this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
