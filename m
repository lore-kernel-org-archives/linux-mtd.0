Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gCqE-0004g1-S6
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 01:23:19 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>,
	linux-mtd@lists.infradead.org
Date: Sat, 26 Jul 2003 12:27:02 +1200
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
In-Reply-To: <a05200f4ebb46f6708c1c@[130.161.115.44]>
MIME-Version: 1.0
Message-Id: <20030726002315.8FA634083@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Handling multiple NAND chips
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 26 July 2003 03:12, J.D. Bakker wrote:
> Hi all,
>
> I have an expansion board for the LART (an embedded computer based on
> the DEC/Intel StrongARM) with eight NAND flash devices on it. As
> suggested by the Toshiba datasheet, they share data, CLE, ALE, nWE
> and nRE and RDY. Each chip has its own nCE line.
>
> I would like to use all eight chips with mtdconcat and YAFFS. Given
> the above, how should I hook the eight NANDs up to the mtd layer ?
> I've gone through CVS, but haven't found any hints in The Source.
>
David has given some answaers.

One thing to watch out for: some NAND chips have very high pin capacitance 
and a fan-out of 8 might get a bit freaky.

You'll need quite a bit of RAM for holding various data structures. :-).

-- CHarles
