Received: from eu1sys200aog105.obsmtp.com ([207.126.144.119])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGY1Q-0006a2-T9
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 15:25:38 +0000
Message-ID: <4E9EEBDC.5000002@st.com>
Date: Wed, 19 Oct 2011 16:25:16 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: "Kumar, Goutam" <goutam.kumar@ti.com>
Subject: Re: ubifs not working with 3.1 kernel and MT29F2G08ABAEAWP NAND Flash.
References: <0680EC522D0CC943BC586913CF3768C0059050481E@dbde02.ent.ti.com>
In-Reply-To: <0680EC522D0CC943BC586913CF3768C0059050481E@dbde02.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Goutam,

On 10/19/2011 03:28 PM, Kumar, Goutam wrote:
> 
> There is MT29F2G08ABAEAWP (256MB, 8-bit) NAND device on TI EVM.
> 

This particular NAND device requires 4-bit ECC.  As far as I can tell, you are
using the OMAP2 driver with 1-bit Hamming H/W ECC.  This will throw
uncorrectable ECC errors (as seen in your log) if there are 2 bit flips in any
ECC block.  The problem gets worse if there are 3 or 4 bit flips, which is still
within spec of the NAND device.

This may, or may not, be the source of your problem, but it might be worth
taking a look anyway.

The device does include a 4-bit on-die ECC engine, which can be enabled using
the 'SET_FEATURE' command.  I don't believe this is available in nand_base.c at
present, but it is not too hard to add.  You would also need to disable the
OMAP2 H/W ECC support to avoid any layout clashes in the OOB area.  Of course,
whatever changes you make to the kernel, would also have to be made to u-boot.

Cheers,

Angus
