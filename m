Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PuIUE-0000wx-MN
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2011 05:51:07 +0000
Received: by ewy23 with SMTP id 23so1491242ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Feb 2011 21:51:04 -0800 (PST)
Subject: Re: [PATCH V2 resend] fsmc-nand: Add fsmc_nand_set_plat_data in
	drivers/mtd/nand/fsmc_nand.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: viresh kumar <viresh.kumar@st.com>
In-Reply-To: <4D6C6D79.80502@st.com>
References: <8b8879499520ac641f7e38ac0e40182eb7f32f85.1298866118.git.viresh.kumar@st.com>
	<1298897478.2809.12.camel@localhost>  <4D6C6D79.80502@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 01 Mar 2011 07:51:01 +0200
Message-ID: <1298958661.2314.11.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin KUMAR <vipin.kumar@st.com>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	Linus WALLEIJ <linus.walleij@stericsson.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-01 at 09:22 +0530, viresh kumar wrote:
> This is what i explained in the commit message also. We don't declare device
> structures in board files, as this information is machine dependent, so this is present
> in common machine file to all boards.

> Now we have to set platform data. This can be be done in board_init() routine in
> the board specific file.

>  But then this routine will contain below mentioned code,
> and so will not look clean enough.

Not sure why it will be not clean enough. Just add it to your board
files, this is few lines of code after all.

if (partitions) {
	plat_data->partitions = partitions;
	plat_data->nr_partitions = nr_partitions;
}
plat_data->options = options;
plat_data->width = width;

How many board files you have?

>  so we thought of creating this function which can
> simply be reused by all board files.

OK, but I think you should try to find some other place instead of
putting it to the driver. What is the fundamental reason to put this
code to the driver? Why it belongs to the driver?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
