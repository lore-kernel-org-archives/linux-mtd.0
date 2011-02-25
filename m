Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Psvp8-0003C7-Q5
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:27:03 +0000
Received: by wwb29 with SMTP id 29so1358896wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 03:27:01 -0800 (PST)
Subject: Re: [PATCH] fsmc-nand: Add fsmc_nand_set_plat_data in linux/mtd/fsmc.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: viresh kumar <viresh.kumar@st.com>
In-Reply-To: <4D6790FD.9060807@st.com>
References: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>
	<1298632262.2798.66.camel@localhost>  <4D6790FD.9060807@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 13:25:38 +0200
Message-ID: <1298633138.2798.72.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin KUMAR <vipin.kumar@st.com>,
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

On Fri, 2011-02-25 at 16:52 +0530, viresh kumar wrote:
> Actually this routine will not be called many times.

Which means it is not on the hot path which means inline is not really
needed. Also, today it is not called too many times, tomorrow it could
be called more often...

>  Only for setting
> plat_data of few devices (depending on board). So i thought keeping
> it inline would be better. But will change if you want. Should i move
> it in fsmc-nand.c??

Hi, up to you, I would not keep it in a header file, this is more about
personal taste, I guess.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
