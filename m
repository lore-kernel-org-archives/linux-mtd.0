Received: from bes.se.axis.com ([195.60.68.10])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPpA3-0001L3-UE
 for linux-mtd@lists.infradead.org; Tue, 18 Mar 2014 08:14:12 +0000
Date: Tue, 18 Mar 2014 08:55:51 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
In-Reply-To: <20140317184741.GB3834@ld-irv-0074>
Message-ID: <alpine.DEB.2.02.1403180850140.26118@lnxricardw1.se.axis.com>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
 <20140313052219.GQ31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2F71@DBDE04.ent.ti.com>
 <20140313062845.GT31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2FD2@DBDE04.ent.ti.com>
 <20140317184741.GB3834@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 17 Mar 2014, Brian Norris wrote:

> I would think even a hardware designer could figure out that flagging an
> ECC error every time you read an all-0xff erased page would be a bad
> idea. And that has nothing to do with bit error rates.

One would think so, but I've come across two NAND controllers lately where 
the hardware designers apparently had no clue this was an issue.

The same controllers also have no way of letting the rest of the world 
knowing how many bitflips were corrected during ECC correction. Which 
makes their ECC functionality almost worthless with flashes that exhibit a 
significant amount of bitflips, as it is impossible to know if it's just a 
bit or two that has flipped, or we are close to the error correction 
capability limit.

I think we software poeple have to be more vocal towards the hardware 
people in terms of want we want to see from a software point of view. The 
attitide taken by the hardware side seems to be "let's just correct the 
bits transparently so the software doesn't need to worry", which was 
alright in the 1-bit era but is not a sustainable philosophy nowadays.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
