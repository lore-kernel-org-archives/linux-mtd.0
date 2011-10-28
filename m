Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RJjr3-00042W-I5
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 10:40:08 +0000
Message-ID: <4EAA8683.4080202@parrot.com>
Date: Fri, 28 Oct 2011 12:40:03 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Subject: Re: [RFC] Change ECC algorithm from userspace
References: <70E876B0EA86DD4BAF101844BC814DFE0BF244FAD1@Cloud.RL.local>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0BF244FAD1@Cloud.RL.local>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>,
	Javier Martinez Canillas <martinez.javier@gmail.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jon Povey a écrit :
> linux-mtd-bounces@lists.infradead.org wrote:
>> I want to be able to use 1-bit ECC for the first partition where I
>> save the loader binary and has to be accessed by the ROM boot but use
>> a 4-bit ECC for my rootfs partition.
>>
>> Does anyone have this same issue?
> 
> DM355 and DM365 has similar issues as the RBL expects a different OOB/ECC
> layout to Linux.
> 
>> What is the best approach to store data in a NAND device using
>> different ECC techniques?
> 
> What I have done is write a utility that calculates ECC and writes to
> the mtd device in RAW mode. So to rewrite the bootloader I take care of
> the ECC and layout at application level without changing the kernel.
>
Note that the kernel raw mode doesn't write the page in one time : it write data
and then ecc. This may cause problem with NOP1 nand.

see http://lists.infradead.org/pipermail/linux-mtd/2010-August/031262.html


Matthieu
