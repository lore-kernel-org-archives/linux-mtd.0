Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C6qvY-0005jm-3Q
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2004 09:31:29 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Ben Dooks <ben-mtd@fluff.org>
In-Reply-To: <20040904173703.GA2100@fluff.org>
References: <20040904173703.GA2100@fluff.org>
Content-Type: text/plain
Date: Mon, 13 Sep 2004 07:12:39 -0600
Message-Id: <1095081159.5442.1.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: ch@hpl.hp.com, linux-mtd@lists.infradead.org
Subject: Re: jedec_probe problems with 16bit devices
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-09-04 at 18:37 +0100, Ben Dooks wrote:
> I have been trying to get an SST 39LF160 on an Simtec Electronics
> EB2410ITX (aka Bast). I have found some problems with jedec_probe
> with non-8bit devices.
> 
> Basically, the two problems are as follows:
> 
> 1) A number of functions are masking out bits from the command
> addresses, but the cfi_send_gen_cmd() moves the addresses up
> depending on the chip type, so the masking is not needed.
> 
> 2) the cfi_send_gen_cmd() is called with CFI_DEVICETYPE_X8
> instead of cfi->device_type, which causes the wrong accesses to
> be generated to the chip.

committed patch - please try it.
