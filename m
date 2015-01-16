Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC3IA-00061R-AI
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 09:34:11 +0000
Date: Fri, 16 Jan 2015 10:33:47 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Erik Ekman <erik@kryo.se>
Subject: Re: Flash filesystem questions
In-Reply-To: <CAGgu=sBLzZa=iWjo39fcrx1ph-WjErg6FuxQqBMZaF1=1gcJ0Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1501161031561.27318@lnxricardw1.se.axis.com>
References: <CAGgu=sBpckw_J1sMcQi+Df8N8=sVjaeLZCLL9bVqEm_uHMB-5Q@mail.gmail.com>
 <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
 <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
 <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
 <CAGgu=sBLzZa=iWjo39fcrx1ph-WjErg6FuxQqBMZaF1=1gcJ0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 15 Jan 2015, Erik Ekman wrote:

> Next problem is bad blocks. I have not found anything in the hardware 
> that keeps track of them. I am thinking about using the first two 
> working blocks as maps, one u8 per erase block. Since I only have 8k, 
> 16k or 32k erase blocks it should not wear them out too much during 
> updates.

Normally flashes never keep track of bad blocks themselves, except that 
bad blocks are usually marked as such during the manufacturing process, 
but it is completely up to software to make use of the that information.

> Is this a valid strategy or is there a common smart solution?

The mtd driver layer has a bad block table mechanism which does all this 
for you. (see nand_bbt.c). It just has to be enabled using a flag in the 
board driver.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
