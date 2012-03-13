Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7Rtr-0006gN-Ss
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 13:36:29 +0000
From: Stefan Roese <sr@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
Date: Tue, 13 Mar 2012 14:36:09 +0100
References: <cover.1331119143.git.vipin.kumar@st.com>
 <CACRpkdZw-nR3uS=FKrOtzgTACWc+=FfrspuT9PvyXDm+RMRFSg@mail.gmail.com>
 <1331644780.3595.56.camel@sauron.fi.intel.com>
In-Reply-To: <1331644780.3595.56.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201203131436.09379.sr@denx.de>
Cc: Armando Visconti <armando.visconti@st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Vipin KUMAR <vipin.kumar@st.com>,
 dbaryshkov@gmail.com, linux-mtd@lists.infradead.org,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

On Tuesday 13 March 2012 14:19:40 Artem Bityutskiy wrote:
> > Oh sorry I was coding too quickly. Missed it previously.
> > Thanks for fixing this.
> > 
> > Artem, forget my patch if you like, if you already have Stefan's patch
> > applied, please add Cc: stable@kernel.org on it because I'm using
> > this driver...
> 
> I somehow missed Stefan's patch, and was not pinged, unfortunately. I
> see it in my mailbox, but it does not apply anymore because it conflicts
> with patches from st.com which I applied recently.
> 
> Stefan, would you re-send a new version and add:
>
> Cc: stable@kernel.org [3.2+]
> 
> Sorry for missing your patch.

No problem.

But the patch still applies clean onto kernel.org. I suspect that the 
conflicts are with your l2-mtd.git tree, correct? Will you push the l2 tree 
still into v3.3? If not, then this patch could be applied as is into mainline.

I'm confused. ;) Please advise.
 
Thanks,
Stefan
