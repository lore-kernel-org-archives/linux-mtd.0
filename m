From: David Woodhouse <dwmw2@infradead.org>
To: prasadam kumar <prasadamkumar@yahoo.com>
In-Reply-To: <20050224142708.76840.qmail@web11603.mail.yahoo.com>
References: <20050224142708.76840.qmail@web11603.mail.yahoo.com>
Content-Type: text/plain
Date: Thu, 24 Feb 2005 15:21:27 +0000
Message-Id: <1109258488.5420.85.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: crc error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-02-24 at 06:27 -0800, prasadam kumar wrote:
> 
> > g 0x1008000
> Uncompressing Linux ............................
> 
> crc error
> 
> -- System halted

Check the contents of the flash precisely match the original kernel
image by reading it back from Linux. Check the contents of the flash
still match when you read it from your bootloader. Check that the bus
timings etc. are set up correctly, and that you're not trying to do
burst reads into the icache when they're not supported etc.

-- 
dwmw2
