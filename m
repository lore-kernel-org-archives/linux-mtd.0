Received: from tds-102399.k.se.telia.net ([213.64.187.90] helo=bjorndell)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vxr2-0001AE-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 10:28:12 +0100
Received: from bjorn by bjorndell with local (Exim 3.32 #1 (Debian))
	id 15vxYR-0003Xt-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 11:08:59 +0200
Date: Tue, 23 Oct 2001 11:08:59 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Eriksson <mdeans@algonet.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: filesystem for battery-buffered SRAM
Message-ID: <20011023110859.A13613@algonet.se>
References: <3BD43008.3A7C27D7@esd-electronics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3BD43008.3A7C27D7@esd-electronics.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, Oct 22, 2001 at 04:41:12PM +0200, Matthias Fuchs wrote:
> I have to setup an embedded Linux box that uses 1MB of battery buffered
> SRAM to store nonvolatile data.
> This memory is directly mapped into ma addressspace and needs no magic
> things to read or write to it.
> 
> What might be the best choice for a filesystem for this memory and is it
> possible to setup file access with MTD.
> With other words: Is MTD able to access normal RAM devices (no FLASH,
> but SRAM) ?

 Use mtdram with CONFIG_MTDRAM_ABS_POS. It's (the config option) there
for exactly this purpose.


-- 
//Björnen.
