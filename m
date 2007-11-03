Subject: Re: address lines
From: David Woodhouse <dwmw2@infradead.org>
To: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
In-Reply-To: <472C5368.3060306@m8.nl>
References: <472C5368.3060306@m8.nl>
Content-Type: text/plain
Date: Sat, 03 Nov 2007 11:46:14 +0000
Message-Id: <1194090374.9405.42.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mtd-forum <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 2007-11-03 at 11:54 +0100, M8 (Servaes Joordens) wrote:
> I took a closer look at the bank-switching problem. The situation is:
> 
> - I have an 4Mb Flash chip MT28F320J3FS-11
> - A0-A19 are connected to the data-bus
> - A20 is connected to GPIO PF4
> 
> So the hardware probe detects 4MB flash in 1 chip and tries to access
> it 
> in a normal manner. How should I solve this? I got a patch from the 
> manufacturer of the hardware for the file cfi_cmdset_0001.c, but I do 
> wonder if that is the correct way to do it?

No, it isn't. The correct way to do it is a fairly trivial 'complex
mapping' driver, which ensures that the GPIO is set appropriately for
the high bit of the address, before each access. Didn't I already point
you to examples?

-- 
dwmw2
