Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7REl-0000JI-N4
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:54:00 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
Date: Tue, 13 Mar 2012 13:53:39 +0100
References: <cover.1331119143.git.vipin.kumar@st.com>
 <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
 <CACRpkda26TT24Wrm5A7u2T-zTgWYHWC2EJD=frBAQX8ffkB3eA@mail.gmail.com>
In-Reply-To: <CACRpkda26TT24Wrm5A7u2T-zTgWYHWC2EJD=frBAQX8ffkB3eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201203131353.40163.sr@denx.de>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Armando Visconti <armando.visconti@st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Vipin KUMAR <vipin.kumar@st.com>,
 dbaryshkov@gmail.com, Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 13 March 2012 13:39:32 Linus Walleij wrote:
> > (...) and I get the default partitions from some SPEAr platform
> > currently,
> 
> This is just because of the above bug.
> 
> I'll fix!

I already sent a fix for this:

mtd: fsmc_nand.c: Partition info from pdata overrides driver defaults

Thanks,
Stefan
