Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwzWs-0003U9-Hu
	for linux-mtd@lists.infradead.org; Sat, 28 Feb 2004 08:08:58 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
	linux-mtd@lists.infradead.org
Date: Sat, 28 Feb 2004 21:17:13 +1300
References: <01139FC052A0D411900B00508B9535FC102796BE@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC102796BE@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040228080849.232E54687@blood.actrix.co.nz>
Subject: Re: Searching for 16bit NAND Driver
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 27 February 2004 21:37, Shen Aaron-r62966 wrote:
> Hi CHarles,
>
>   Thanks for your response at first.
>
>   Let me decribe my doubt in detail. After I boot up my system on board
> with a NOR Flash, the "/dev/mtd/2" is the partition for bootloader of NAND.
> I just copy my bootloader for NAND to the partition and then switch to boot
> up from the NAND Flash. For a 8 bit NAND Flash, it has been succeeded. But
> failed for 16 bit NAND.
>
>   When booting from NAND Flash, the NFC will copy the data in its first 2k
> to a special address automatically and then set pc to there to run. What I
> have found by using MultiICE is that the data copied there are different.
> For example, the data should be "DF003028". I can read it successfully when
> using 8 bit NAND. But for 16 bit NAND, the data changed to be "0B300B28",
> followed by "08DF0800". It seems the original data has been cut to two
> parts and re-orginized.
>
>   Do you have any comment? Hope I made sense.

It looks to me like you need to set up your bus accessing or something like 
that correctly.

It looks like the data has been written as 8-bytes per cycle, but read as 
16-bits per cycle. 

-- Charles
