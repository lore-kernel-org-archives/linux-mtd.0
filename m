Received: from eu1sys200aog108.obsmtp.com ([207.126.144.125])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Psw4s-0003IC-0I
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:43:18 +0000
Message-ID: <4D6795C7.6090708@st.com>
Date: Fri, 25 Feb 2011 17:13:03 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] fsmc-nand: Add fsmc_nand_set_plat_data in linux/mtd/fsmc.h
References: <e63303f4cd51aa61f08e2b026b6a80dc0d9cd54a.1298442421.git.viresh.kumar@st.com>	
	<1298632262.2798.66.camel@localhost> <4D6790FD.9060807@st.com>
	<1298633138.2798.72.camel@localhost>
In-Reply-To: <1298633138.2798.72.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Vipin KUMAR <vipin.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	Linus WALLEIJ <linus.walleij@stericsson.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/25/2011 04:55 PM, Artem Bityutskiy wrote:
> On Fri, 2011-02-25 at 16:52 +0530, viresh kumar wrote:
>> > Actually this routine will not be called many times.
> Which means it is not on the hot path which means inline is not really
> needed. Also, today it is not called too many times, tomorrow it could
> be called more often...
> 
>> >  Only for setting
>> > plat_data of few devices (depending on board). So i thought keeping
>> > it inline would be better. But will change if you want. Should i move
>> > it in fsmc-nand.c??
> Hi, up to you, I would not keep it in a header file, this is more about
> personal taste, I guess.

Ok. I have moved this to fsmc-nand.c. Will send V2.

-- 
viresh
