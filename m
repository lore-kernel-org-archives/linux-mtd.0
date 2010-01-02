Subject: Re: Can ID the NAND chip, but every erase block is bad?
From: David Woodhouse <dwmw2@infradead.org>
To: Bill Gatliff <bgat@billgatliff.com>
In-Reply-To: <4B3ED430.5040607@billgatliff.com>
References: <4B3ED430.5040607@billgatliff.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 02 Jan 2010 10:03:42 +0000
Message-ID: <1262426622.3181.5832.camel@macbook.infradead.org>
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

On Fri, 2010-01-01 at 23:05 -0600, Bill Gatliff wrote:
> 
> I have a platform with an ancient Linux kernel that I'm updating, and
> I'm having some problems.  The platform has a Freescale MPC5200, a
> Samsung K9 NAND flash chip, and it all works fine under 2.6.20, I'm
> trying to bring it up to 2.6.32.
> 
> Simply put, when I register the gen_nand device for this chip under
> 2.6.32, it successfully identifies the chip but then says that every
> single eraseblock in the chip is bad.  When I reboot to the 2.6.20
> kernel, I don't get any complaints there.  I see the same problem both
> with and without CONFIG_MTD_NAND_ECC_SMC.
> 
> Anyone have any ideas on where I should look for the problem?  Thanks!

Take a closer look at how bad blocks were detected under 2.6.20.

A virgin chip will use a certain byte in the spare area of each
eraseblock to mark that block as bad. But often we reclaim those bytes
and transcribe the information into a bad block table elsewhere on the
flash.

Booting a kernel which ignores the bad block table and looks for the bad
block markers in the original location will have fairly much the effect
you describe.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
