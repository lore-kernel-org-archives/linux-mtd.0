Received: from igloo.df.lth.se ([194.47.250.47] helo=df.lth.se)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FA7UB-0000HX-Bq
	for linux-mtd@lists.infradead.org; Fri, 17 Feb 2006 10:25:36 -0500
Received: from festis.df.lth.se (UNKNOWN@festis.df.lth.se [194.47.250.37])
	by df.lth.se (8.13.1/8.13.1) with ESMTP id k1HFPPk8003418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Feb 2006 16:25:25 +0100 (CET)
Received: from festis.df.lth.se (hagar@localhost.localdomain [127.0.0.1])
	by festis.df.lth.se (8.13.4/8.13.4/Debian-3) with ESMTP id
	k1HFPPcG021902
	for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2006 16:25:25 +0100
Received: (from hagar@localhost)
	by festis.df.lth.se (8.13.4/8.13.4/Submit) id k1HFPPwa021901
	for linux-mtd@lists.infradead.org; Fri, 17 Feb 2006 16:25:25 +0100
Date: Fri, 17 Feb 2006 16:25:25 +0100
From: =?iso-8859-1?Q?H=E5kan?= Kvist <hagar@df.lth.se>
To: linux-mtd@lists.infradead.org
Message-ID: <20060217152524.GA21805@festis.df.lth.se>
References: <20060217094403.GA20803@festis.df.lth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060217094403.GA20803@festis.df.lth.se>
Subject: Re: Problems with getting a nand-flash chip to work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 17, 2006 at 10:44:03AM +0100, Håkan Kvist wrote:
> Hi.
> 
> Sorry that I can't be more specific in the topic, but I really don't
> know which part that fails.
> 
> I'm trying to get a nand flash chip to work on a at91rm9200-ek
> development board from atmel, featuring an atmel at91rm9200 (arm9
> based) SoC.
> 
> We have tried to different Nand flash chips:
> * A 4 Gbit, 8-bit bus nand flash chip from Micron
> * A 512 Mbit, 8-bit bus nand flash chip from STMicroelectronics
> 

I belive that I forget to mention that the chip that we are currently 
using is the 512 Mbit chip from STMicroelectronics.

I also have tested the to write directly to the nand with the 
mtd_debug utility.

I've filled the first 4 blocks (65535 bytes) with data, and I can read
it back successfully and verify that it is identical to what I wrote.

What is the next thing I should look into?

Any idea of what I should test/look into would be very appreciated.

regards
Håkan
