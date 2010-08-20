Subject: Re: Bad assumption about ID field definition for Samsung NAND?
From: David Woodhouse <dwmw2@infradead.org>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C6EBE90.2090604@broadcom.com>
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com> <20100819171558.GA8536@code-monkey.de>
	<AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
	<4C6DAFFD.4040602@broadcom.com>
	<AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
	<20100820134316.GA437@code-monkey.de> <4C6EBE90.2090604@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Aug 2010 20:53:28 +0100
Message-ID: <1282334008.25239.91.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: r64343@freescale.com, Kevin Cernekee <cernekee@gmail.com>,
	Tilman Sauerbeck <tilman@code-monkey.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 10:42 -0700, Brian Norris wrote:
> On 08/20/2010 06:43 AM, Tilman Sauerbeck wrote:
> 
> > Okay, how do we proceed? Should I send a proper patch with the diff
> > above? Or does anyone want to try and come up with a better fix...?
> 
> I vote for Tilman's patch. There's nothing unnecessarily ugly about it; 
> it simply checks cell-type in order to decide whether we use Samsung's 
> new "standard" for MLC or fall-back to the real standard. If anything, 
> the existing code (checking ID length) is ugly. However, both checks 
> seem necessary.

That's for 2.6.36 and -stable (for 2.6.35), yes?


@@ -2852,6 +2852,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
                 */
                if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
                                id_data[0] == NAND_MFR_SAMSUNG &&
+                               (chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
                                id_data[5] != 0x00) {
                        /* Calc pagesize */
                        mtd->writesize = 2048 << (extid & 0x03);

Can I have a signed-off-by for it?

Brian, I have a distinct impression that there's at least one more patch
from you that I really ought to be sending to Linus for 2.6.36, but I
can't find it right now. Other than this and what's already in
mtd-2.6.git, is there anything else?

Thanks, btw.

-- 
dwmw2
