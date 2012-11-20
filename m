Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TaqUz-0002vD-6K
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2012 16:16:34 +0000
Date: Tue, 20 Nov 2012 17:16:27 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Calvin Johnson <linux.cj@gmail.com>
Subject: Re: state of support for "external ECC hardware"
In-Reply-To: <CAEhpT-UNGhyG5gtbw8hDTpQ7nueOem-V3H=V9QPA_f6fiEKwTQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1211201712150.19825@lnxricardw.se.axis.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com> <20121108152125.GR2389@harvey-pc.matrox.com>
 <509BDE9B.3080909@keymile.com>
 <alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com>
 <CAEhpT-UNGhyG5gtbw8hDTpQ7nueOem-V3H=V9QPA_f6fiEKwTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "Bigler, Stefan" <Stefan.Bigler@keymile.com>,
 =?ISO-8859-15?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 Gerlando Falauto <gerlando.falauto@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Christopher Harvey <charvey@matrox.com>, Ivan Djelic <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 20 Nov 2012, Calvin Johnson wrote:

> I thought of sharing my recent experience with MLC NAND which requires
> 24-bit ECC.
> ...

Thanks for sharing your experiences.

> From various articles in the internet, it seems that NAND flashes are
> going to get more denser and the bit flips are going to increase.
> Hence the H/W ECC controllers are going to have more demand. The S/W
> BCH algorithm available in Linux will consume plenty of cycles which
> can be offloaded to the H/W ECC controller.

That is certainly the case for the newer and larger flashes. However, in 
the past year or so it seems that manufacturers have appeared which are 
offering "small" (i.e. 1 Gb and thereabouts) flashes with 1 bit ECC 
requirements, and are planning to do so for a number of years.

It seems that while the big manufacturers (Micron, Samsung, etc) are 
moving on to state-of-the-art higher densities, there is still a market 
interest for smaller, more reliable flashes, I would think mostly for code 
storage for embedded systems.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
