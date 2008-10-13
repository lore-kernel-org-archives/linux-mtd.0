Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <mike@compulab.co.il>
In-Reply-To: <48F1AF0C.8080401@compulab.co.il>
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
Content-Type: text/plain
Date: Mon, 13 Oct 2008 14:59:04 +0100
Message-Id: <1223906344.6770.603.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Mike Frysinger <vapier.adi@gmail.com>, Russ Dill <russ.dill@gmail.com>,
	Jamie Lokier <jamie@shareable.org>, Ben Dooks <ben-linux-arm@fluff.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2008-10-12 at 10:02 +0200, Mike Rapoport wrote:
> Mike Frysinger wrote:
> >> The problem is that a write to GPIO may pass a write to the static
> >> memory regions, or vice versa.  So, what we do is we insert a read
> >> with a dependency in the execution to ensure that we stall the
> >> pipeline until that read - and therefore the preceding write has
> >> completed.
> > 
> > so the function comment should read something like "make sure the gpio
> > state has actually changed before returning to the higher nand layers"
> > 
> 
> The patch with (hopefully) clearer gpio_nand_dosync() comments.

Please can I have it in a form I can apply, with changelog and
signed-off-by, and without those silly 'u16' types in it. The C language
has perfectly good types for specifying unsigned 16-bit integers; use
them.

Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
