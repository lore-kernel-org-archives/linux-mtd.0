Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XESz7-00008d-QY
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 00:52:14 +0000
Date: Tue, 5 Aug 2014 08:52:00 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Message-ID: <20140805005200.GA19643@shldeISGChi005.sh.intel.com>
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
 <20140527011231.GA5876@shlinux1.ap.freescale.net>
 <5384B5EB.4050203@st.com>
 <20140528052237.GA7984@shlinux1.ap.freescale.net>
 <20140804232407.GI3711@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140804232407.GI3711@ld-irv-0074>
Cc: marex@denx.de, angus.clark@st.com,
 Christophe KERELLO <christophe.kerello@st.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 04, 2014 at 04:24:07PM -0700, Brian Norris wrote:
> 
> The logic here is just plain convoluted, because we haven't updated the
> flash_info struct to contain the ID length. Please fix this. Just like
> struct nand_flash_dev, we probably need an 'id_len' field. Bonus points
> if you can extend the structure properly without having to modify the
> entire existing table... Maybe a new INFO6() macro? (Better name
> suggestions are welcome.)

ok. I will try to add a "id_len" field in the next patch.
> 
> Another reason for adding this field: what if we need to match to a
> 6-byte ID where the 6th byte is 0x00? I already see a 5-byte ID in our
> table where the 5th byte is 0x00.
I think it is okay if the 6the byte is 0x00. 
Anyway, we do not meet such NOR. If we meet such NOR in future, we
can check it carefully, and see if we need to change the code a little.

thanks
Huang Shijie
