Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIPzX-0002GC-Fg
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 18:43:08 +0000
Received: by eyh6 with SMTP id 6so1192288eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 11:43:04 -0700 (PDT)
Subject: Re: [RFC] MTD: export more NAND-related informations to syfs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
In-Reply-To: <201105061728.20948.ffainelli@freebox.fr>
References: <201105061728.20948.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 21:39:33 +0300
Message-ID: <1304707173.7222.96.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-06 at 17:28 +0200, Florian Fainelli wrote:
> +       /* NAND related attributes */
> +       const char *nand_type;
> +       const char *nand_manufacturer; 

Why other flashes cannot have type and manufacturer ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
