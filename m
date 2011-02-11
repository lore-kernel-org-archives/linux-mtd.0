Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF7426521D.A5E8E752-ONC1257833.00648ED3-C1257833.00654F5A@transmode.se>
Date: Fri, 11 Feb 2011 13:03:00 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <90F81E81-DDBB-4F57-90A3-B9C55616C84B@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OFFF2C6D34.91E5D6C3-ONC1257
	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>
	<OF6D40AC82.1008D3DD-ONC1	<4D53E660.4020305@users.sourceforge.net>	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
	<85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>	<OFEF05BB2C.A2E3BADF-O
	<97165996-D766-468D-AB90-974E29ABCFB7@prograde.net>	<OFBD6C1723.E5530FEB-ONC1257833.005BF5C1-C1257833.005C2C61@transmode.se>
	<OF4FEF6422.2B862198-ONC125783	<3B106371-0DA1-4F15-9482-7307110A86E2@prograde.net>
	<OF626FDFE6.CA621532-ONC1257833.005E857C-C1257833.005F4BE2@transmode.se>
	<OF4712116F.F6D6711D-ONC1257833.0060F6D7-C1257833.0061BCF8@transmode.se>
	<OF7426521D.A5E8E752-ONC1257833.00648ED3-C1257833.00654F5A@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org,
	Holger brunck <holger.brunck@keymile.com>, stefan.bigler@keymile.com,
	=?iso-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 10, 2011, at 1:26 PM, Joakim Tjernlund wrote:

>> hmm, Figure 31: Program Suspend/Resume Flowchart and
>> Figure 36: Erase Suspend/Resume Flowchart actually specifies a read =
status(0x70) before suspend(0xb0)

I see the Erase Suspend/Resume Flowchart as figure 40, not 36. The sheet =
info is: 320002-10 Mar 2010. What's yours?

> Furthermore, the read status has to be to the same "partition" and you =
have to end the resume with a read status too "If the suspended =
partition was placed in Read Array mode or a Program Loop"

Mine says NOT to do that. You can program or read from any OTHER =
partition, but trying to do that to the same one that was being erased =
is not valid.

My Erase Suspend/Resume Flowchart says to do a read-status (0x70) before =
the 0xb0 suspend. (Interesting that we weren't doing that!) The the =
address for both must be the same, but can be "any device address."

I don't see where they say the resume address must match the address of =
the erase.

-Mike
