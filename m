MIME-Version: 1.0
In-Reply-To: <4E1B4E21.1090507@compulab.co.il>
References: <1309319494-17951-1-git-send-email-leiwen@marvell.com>
	<1309771536-10597-4-git-send-email-leiwen@marvell.com>
	<4E1411BB.4010000@compulab.co.il>
	<CACTFLAOmRMDH_6qo_WkndoWX-HPw9RTqbtsURDfw22sWEFS2wg@mail.gmail.com>
	<4E1B3ECC.5080308@compulab.co.il>
	<CACTFLAPMh+XMpOPPqkDTaEZppSkWxVxFMH3RALTmqOCNk8WAvw@mail.gmail.com>
	<4E1B4E21.1090507@compulab.co.il>
Date: Tue, 12 Jul 2011 14:48:24 +0200
Message-ID: <CACTFLAPpy8v1O+_eDLiLLCD++7mFk0CKbjsFDB3VopjWd99OTg@mail.gmail.com>
Subject: Re: [PATCH 3/4] MTD: pxa3xx_nand: enable multiple chip select support
From: Daniel Mack <zonque@gmail.com>
To: Igor Grinberg <grinberg@compulab.co.il>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 11, 2011 at 9:25 PM, Igor Grinberg <grinberg@compulab.co.il> wrote:
> On 07/11/11 21:53, Daniel Mack wrote:
>> At least not in our case. The first level bootloader is entered on
>> resume just as it is on a POR event, with the exception that the D3S
>> bit in the ASCR register is set in this case.
>
> You say "first level boot loader is entered"... who is loading it and where from?
> Indeed, it should happen as in POR case, but again, it resides on some non-volatile
> storage, isn't it? What storage does it reside on?

That is true. I was assuming that the first-stage loader remains in
SRAM and is re-used later, but I think you're right, and it is loaded
from NAND again after resume.

>> We unconditionally
>> initialize the static and dynamic memory controllers and then either
>> jump to the routine that initializes the NAND controller, read the 2nd
>> level loader and pass control to it. Or (in the resume case) we just
>> jump to the address stored at the RAM address 0x80000000 (which has
>> been set to cpu_resume previously) and thus enter the kernel again. No
>> NAND operations in the game in this case, and this has always worked
>> fine.
>
> Except those to read the first stage boot loader... (if it resides on NAND).
> Well, our case is working similarly and both the first stage bootloader (OBM)
> and the second stage bootloader (U-Boot) reside on the NAND flash,
> therefore BootROM has to reconfigure the NAND flash, so it can boot (resume).

Well, the load of the first NAND page (where the OBM resides) is out
of control for our software, as the code in PXA's internal ROM mask
takes care for this. We do not, however, re-initialize the NAND
controller in the resume case, just as we don't restore any other
pheripheral's registers. And this has worked fine all the time, and it
still does if Lei's latest patch set is not applied.


Daniel
