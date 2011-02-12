Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PoD1E-0004JA-Ry
	for linux-mtd@lists.infradead.org; Sat, 12 Feb 2011 10:48:02 +0000
In-Reply-To: <90F81E81-DDBB-4F57-90A3-B9C55616C84B@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>
	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
	<85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>
	<OFEF05BB2C.A2E3BADF-O
	<97165996-D766-468D-AB90-974E29ABCFB7@prograde.net>
	<OFBD6C1723.E5530FEB-ONC1257833.005BF5C1-C1257833.005C2C61@transmode.se>
	<OF4FEF6422.2B862198-ONC125783
	<3B106371-0DA1-4F15-9482-7307110A86E2@prograde.net>
	<OF626FDFE6.CA621532-ONC1257833.005E857C-C1257833.005F4BE2@transmode.se>
	<OF4712116F.F6D6711D-ONC1257833.0060F6D7-C1257833.0061BCF8@transmode.se>
	<OF7426521D.A5E8E752-ONC1257
	<90F81E81-DDBB-4F57-90A3-B9C55616C84B@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OFA87374CE.124B46B9-ONC1257835.003A3756-C1257835.003B526E@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Sat, 12 Feb 2011 11:47:57 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, stefan.bigler@keymile.com,
	Holger brunck <holger.brunck@keymile.com>,
	=?ISO-8859-15?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Michael Cashwell <mboards@prograde.net> wrote on 2011/02/11 19:03:00:
>
> On Feb 10, 2011, at 1:26 PM, Joakim Tjernlund wrote:
>
> >> hmm, Figure 31: Program Suspend/Resume Flowchart and
> >> Figure 36: Erase Suspend/Resume Flowchart actually specifies a read status(0x70) before suspend(0xb0)
>
> I see the Erase Suspend/Resume Flowchart as figure 40, not 36. The sheet info is: 320002-10 Mar 2010. What's yours?

  Apr 2010
  Order Number: 208042-05
from
  http://www.numonyx.com/en-US/MemoryProducts/NOR/Pages/P30P33Documents.aspx
>
> > Furthermore, the read status has to be to the same "partition" and you have to end the resume with a read status too "If the suspended partition was placed in Read Array mode or a Program Loop"
>
> Mine says NOT to do that. You can program or read from any OTHER partition, but trying to do that to the same one that was being erased is not valid.

Partition != erase block, not sure how though.

>
> My Erase Suspend/Resume Flowchart says to do a read-status (0x70) before the 0xb0 suspend. (Interesting that we weren't doing that!) The the address for both must be the same, but can be "any device address."
>
> I don't see where they say the resume address must match the address of the erase.

It says Same Partition which will map to Any Address if you only got one partition.

BTW, when we went from 130 to 65 nm parts, bus timing changed to slower and we
had to adjust our chip select logic to match. The 65 nm parts needed some extra
time for the read access. Have you adjusted yours?

 Jocke
