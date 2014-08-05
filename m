Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEdeu-0000Cz-88
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 12:16:08 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Date: Tue, 5 Aug 2014 09:14:11 +0200
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
 <20140804232407.GI3711@ld-irv-0074>
 <20140805005200.GA19643@shldeISGChi005.sh.intel.com>
In-Reply-To: <20140805005200.GA19643@shldeISGChi005.sh.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201408050914.11864.marex@denx.de>
Cc: angus.clark@st.com, Christophe KERELLO <christophe.kerello@st.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, August 05, 2014 at 02:52:00 AM, Huang Shijie wrote:
> On Mon, Aug 04, 2014 at 04:24:07PM -0700, Brian Norris wrote:
> > The logic here is just plain convoluted, because we haven't updated the
> > flash_info struct to contain the ID length. Please fix this. Just like
> > struct nand_flash_dev, we probably need an 'id_len' field. Bonus points
> > if you can extend the structure properly without having to modify the
> > entire existing table... Maybe a new INFO6() macro? (Better name
> > suggestions are welcome.)
> 
> ok. I will try to add a "id_len" field in the next patch.
> 
> > Another reason for adding this field: what if we need to match to a
> > 6-byte ID where the 6th byte is 0x00? I already see a 5-byte ID in our
> > table where the 5th byte is 0x00.
> 
> I think it is okay if the 6the byte is 0x00.
> Anyway, we do not meet such NOR. If we meet such NOR in future, we
> can check it carefully, and see if we need to change the code a little.

Well, I expressed my disagreement on that matter a few times already. Like Brian 
mentioned, adding an id_len field would be the way to go. It would prevent all 
kinds of crazy wrap-arounds when reading the IDs and other such strange 
behavior.

Best regards,
Marek Vasut
