Subject: Re: bank switching
From: David Woodhouse <dwmw2@infradead.org>
To: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
In-Reply-To: <472606D2.7020709@m8.nl>
References: <472606D2.7020709@m8.nl>
Content-Type: text/plain
Date: Tue, 30 Oct 2007 08:57:44 -0400
Message-Id: <1193749064.2915.169.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-10-29 at 17:14 +0100, M8 (Servaes Joordens) wrote:
> I use the blackfin embedded uClinux environment. I want to change a 
> flash chip-driver to support all four memory banks which are available. 
> Right now, I have a driver which supports 1 memory bank of 2MB. I want 
> to be able to use the other three memory banks also 2-4Mb, 4-6MB and 6-8MB.
> 
> Memory bank selection is done by using general io pf4 and pf5. For 
> instance: when  pf4 is enabled and pf5 is disabled I am writing in the 
> region 2-4MB.
> 
> What would be the correct way to change the chip driver? Do you have a 
> template or tutorial on bank switching?
> 
> The driver I want to change is: cfi_cmdset_0001.c

No, that's the "chip driver". What you need to provide is a "map driver"
which enables physical access (read/write cycles) to the flash device in
question.

See the MTD_COMPLEX_MAPPINGS config option, which turns simple things
like 'read word' and 'write word' into out-of-line function calls in
your map driver. And see the map drivers which do this already, like
maps/sbc_gxx.c

-- 
dwmw2
