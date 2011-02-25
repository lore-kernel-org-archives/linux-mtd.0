Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvXG-00033u-OQ
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:08:37 +0000
Subject: Re: [PATCH] fsmc-nand: Add fsmc_nand_set_plat_data in linux/mtd/fsmc.h
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: viresh kumar <viresh.kumar@st.com>
In-Reply-To: <4D6725AA.3070204@st.com>
References: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>
	<AANLkTim3yTG-ZEZdhj=ccvd_tXm4XNG7x5uT6qS54sqQ@mail.gmail.com>
	<4D6725AA.3070204@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 13:07:01 +0200
Message-ID: <1298632021.2798.62.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin KUMAR <vipin.kumar@st.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 09:14 +0530, viresh kumar wrote:
> On 02/24/2011 06:08 PM, Linus Walleij wrote:
> > 2011/2/23 Viresh Kumar <viresh.kumar@st.com>:
> > 
> >> > In most of the cases partitions info, width, etc comes from board files. And
> >> > device structure may be defined in machine files, common to all board files.
> >> > Thus, we need to set platform data from board file, for which
> >> > fsmc_nand_set_plat_data routine is required.
> > Hm you create a new function, but where is it used? If it's used by a later
> > patch perhaps you should make a patch series instead?
> 
> Linus,
> 
> Actually it will be used in SPEAr patches, which will be sent separately. I could
> have kept it as part of that series also, but just thought to send it separately.
> You want me to keep it in spear patch series instead?

I think this is important piece of information which should be in the
patch commit message.
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
