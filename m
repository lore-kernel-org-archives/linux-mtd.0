Received: from ernst.netinsight.se ([194.16.221.21])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PnWSv-0004Qp-Kp
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 13:21:46 +0000
Message-ID: <4D53E660.4020305@users.sourceforge.net>
Date: Thu, 10 Feb 2011 14:21:36 +0100
From: =?windows-1252?Q?Anders_Grafstr=F6m?=
 <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Michael Cashwell <mboards@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>		<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>	<4D4AD9ED.8060104@keymile.com>	<4D4B37D4.4050204@keymile.com>	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	<4D4BDD48.6040600@keymile.com>	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>		<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>	<OF56DD046D.3279E067	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1257832.006EA817-C1257832.006F1836@transmode.se>
	<F3D5308D-6A78-4FD9-9FE5-3E9EE0A4EE12@prograde.net>
In-Reply-To: <F3D5308D-6A78-4FD9-9FE5-3E9EE0A4EE12@prograde.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Holger brunck <holger.brunck@keymile.com>, stefan.bigler@keymile.com,
	linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2011-02-09 22:59, Michael Cashwell wrote:
> On Feb 9, 2011, at 3:13 PM, Joakim Tjernlund wrote:
> 
>> hmm, this sounds similar(from http://www.numonyx.com/Documents/Specification%20Updates/SU-309045_P30.pdf)
>>
>> 5. W602: erase suspend resume operation
>> Problem: P30 product may fail to erase in intensive erase/suspend/resume environments. This is
>>        due to an internal firmware issue that is exhibited in certain applications that require at
>>       least 3000 to 4000 erase/suspend/resume cycles during the erase of a single block.
>> Implication: Customer may see erase failure (SR reports “A0”) during a background erase. This
>>                does not damage the device in any way, but data in the block may be disturbed from its
>>               original state.

I've seen this issue with Intel 28F640J5 chips as well.

There's an old thread on it.
http://lists.infradead.org/pipermail/linux-mtd/2008-April/021266.html

A delay was suggested similar to the one you're experimenting with I think.
http://lists.infradead.org/pipermail/linux-mtd/2008-April/021436.html

/Anders
