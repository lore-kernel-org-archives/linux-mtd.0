From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
In-Reply-To: <3F984931.E6409ED7@mvista.com>
References: <3F984931.E6409ED7@mvista.com>
Content-Type: text/plain
Message-Id: <1066981292.29915.584.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 24 Oct 2003 08:41:33 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Different nand interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-10-23 at 14:33 -0700, Alice Hennessy wrote:
> Hi,
> 
> I need some advice on how to support a board that has a hardware state
> machine that creates a parallel bus style interface to the NAND chip. 
> It is totally different from the standard 8 IO signal controls.   It
> can do write_byte and read_byte put requires the offset into the flash
> as a parameter.    nand.c is fairly modular, allowing several
> functions to be coded in the hardware file but there is no current
> method of passing an offset into, say, read_byte and write_byte unless
> the nand_chip priv field
> can be used (via mtd->priv).   Do you think the standard nand.c can be
> used in this case or should I create a specific one for this board?

S'difficult to say without knowing more details of the hardware in
question. What does it _do_ with the address lines in question? Are you
at least looking at the current code which has read_buf() functions?

Even the DiskOnChip isn't this bizarre :)

-- 
dwmw2
