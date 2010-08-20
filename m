Received: from code-monkey.de ([88.198.45.137])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmRsM-0008W2-IX
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 13:43:22 +0000
Date: Fri, 20 Aug 2010 15:43:16 +0200
From: Tilman Sauerbeck <tilman@code-monkey.de>
To: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: Bad assumption about ID field definition for Samsung NAND?
Message-ID: <20100820134316.GA437@code-monkey.de>
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com>
	<20100819171558.GA8536@code-monkey.de>
	<AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
	<4C6DAFFD.4040602@broadcom.com>
	<AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kevin Cernekee [2010-08-19 20:29]:
> On Thu, Aug 19, 2010 at 3:28 PM, Brian Norris <norris@broadcom.com> wrote:
> > On 08/19/2010 12:46 PM, Kevin Cernekee wrote:
> >> @@ -2852,6 +2852,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> >>                  */
> >>                 if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
> >>                                 id_data[0] == NAND_MFR_SAMSUNG &&
> >> +                               (chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
> >>                                 id_data[5] != 0x00) {
> >>                         /* Calc pagesize */
> >>                         mtd->writesize = 2048 << (extid & 0x03);
> 
> This looks OK (at least for K9GAG08U0D).
> 
> I wonder if Samsung could provide some firm guidelines for when to use
> the old style vs. the new style.

Okay, how do we proceed? Should I send a proper patch with the diff
above? Or does anyone want to try and come up with a better fix...?

Regards,
Tilman

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?
