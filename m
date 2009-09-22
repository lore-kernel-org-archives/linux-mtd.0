Subject: Re: [PATCH] [MTD] [CHIPS] stm_flash: new ST PSD4256G compatible
	flash  chip driver
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0909221605j1f4a0d62m5707e0ad11c7ece4@mail.gmail.com>
References: <1244890798-10908-1-git-send-email-vapier@gentoo.org>
	<1253390936.6317.33.camel@macbook.infradead.org>
	<8bd0f97a0909191328j6be58c20o9bf4a4c3aadb1634@mail.gmail.com>
	<1253394106.6317.38.camel@macbook.infradead.org>
	<8bd0f97a0909221605j1f4a0d62m5707e0ad11c7ece4@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 22 Sep 2009 16:20:50 -0700
Message-Id: <1253661650.27055.494.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-09-22 at 19:05 -0400, Mike Frysinger wrote:
> 
> the only problem i have here is with the need to 0xff pad the mfr/dev
> id's.  any idea what's up with that ?  the device is 16bit and i set
> my .width in my board resources to 2, but the id field is only 8bit,
> so in 16bit mode the id is padded with 0xff instead of 0x00.

Hm, odd -- but I wouldn't lose sleep over it.

However, the datasheet suggests that the high byte is unspecified. Could
it be returning the value of the flash data at that location, rather
than a constant 0xFF? If so, we'd need to add a flag to the jedec match
table to make it match only the low byte?

Or maybe I'd make you do your own probe in that case, rather than
polluting jedec_probe.c... :)

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
