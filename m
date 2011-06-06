Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTXgH-0002HI-Gz
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 11:09:14 +0000
Received: by ewy3 with SMTP id 3so1586104ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 04:09:11 -0700 (PDT)
Subject: Re: [PATCH 01/32] mtd: mtd_dataflash don't specify default parsing
	options
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 14:04:54 +0300
Message-ID: <1307358294.3112.38.camel@localhost>
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
> Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
> this in every driver, instead pass NULL to force parse_mtd_partitions
> to use default.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Do you have a git URL with these patches?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
