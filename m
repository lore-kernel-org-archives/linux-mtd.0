From: David Woodhouse <dwmw2@infradead.org>
To: Manfred Gruber <gruber.m@utanet.at>
In-Reply-To: <200408201300.05579.gruber.m@utanet.at>
References: <200408201300.05579.gruber.m@utanet.at>
Content-Type: text/plain
Message-Id: <1092999456.14552.3387.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 20 Aug 2004 11:57:36 +0100
Content-Transfer-Encoding: 7bit
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Number of CFI chips ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-08-20 at 13:00 +0200, Manfred Gruber wrote:
> Hi guys !
> 
> I am trying to find out why my 2 AM29LV256M do not work.
> See before was: Re: JFFS2 with AM29LV256M
> 
> I found out that CFI only detects one chip.
> 
> What should CFI detect when I have 2 AM29LV256M chips on a 32 bit bus. Each 
> AM29LV256 has 16 bit bus with with connected to the 32bit bus. So CFI has to 
> setect 2 chips, am i right ?(wehn interleave is set to 2, and buswith is set 
> to 32)
> 
> When it only detects one chip, my problem must be in detecting the chips by 
> CFI, is this correct ?

Not necessarily. Some of our printks are confusing -- if it claims to
have detected only one chip then it might mean one _pair_ of chips. Can
you show exactly what it said?

-- 
dwmw2
