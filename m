Date: Wed, 4 Dec 2013 13:41:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 22/28] mtd: nand: pxa3xx: Introduce multiple page
 I/O support
Message-ID: <20131204214125.GC27149@ld-irv-0074.broadcom.com>
References: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383656135-8627-23-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131105190432.GQ20061@ld-irv-0074.broadcom.com>
 <20131106011351.GH11759@localhost>
 <CAN8TOE_ZmcsvShKY273KQCaopJEXgtXVR1XY9pP5EKkUK+bUbA@mail.gmail.com>
 <20131106113210.GB2616@localhost>
 <20131118181009.GZ9468@ld-irv-0074.broadcom.com>
 <20131118183325.GC21975@localhost>
 <20131118185059.GB9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131118185059.GB9468@ld-irv-0074.broadcom.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

I'd like to follow up on this question, since you didn't answer it, and
it's still relevant, since we haven't yet merged your GPMI DT binding
(it's queued for the next merge window):

On Mon, Nov 18, 2013 at 10:50:59AM -0800, Brian Norris wrote:
> Do you have a good reason why you needed GPMI NAND to choose the ECC
> configuration (a la "miminum ECC") instead of fully specifying your ECC
> selection in device tree? I recall most of your arguments were about
> using an ECC strength that leaves room for user data in OOB (e.g., with
> JFFS2). But you could have done the same thing by creating a proper DT
> property to describe the desidered ECC strength, with no real
> disadvantage, right?

I'll rephrase it: why can't/don't you define a GPMI binding for the
actual ECC level, like:

  fsl,nand-ecc-strength and fsl,nand-ecc-sector

?

Then, you could still default to the old geometry if these properties
aren't present, and you don't have to rely on Linux auto-detecting ECC
properties for non-ONFI chips.

(Side note: I see you submitted patches for Hynix MLC ECC
auto-detection; I'm not sure this approach is really scalable, but it
may be OK for some chips. Anyway, I'll address these patches separately
once I get to them.)

Brian
