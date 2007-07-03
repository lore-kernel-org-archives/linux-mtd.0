From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: "'Vinit Agnihotri'" <vinit.agnihotri@gmail.com>,
	<linux-mtd@lists.infradead.org>
References: <9b52d64c0707022228u1d47fa1awfef79a9f6574b0f@mail.gmail.com>
Subject: RE: What is subpage_sft??
Date: Tue, 3 Jul 2007 14:34:27 +0900
Message-ID: <000f01c7bd33$d71f6850$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-reply-to: <9b52d64c0707022228u1d47fa1awfef79a9f6574b0f@mail.gmail.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I tried searching on net to understand what subpage_sft means, but
> aint find any relevant information.
> 
> What does subpage_sft means?? Where it is used?? Is it related with
> NAND or NOR flash?
> Can anybody provide this little information to me. Any relevant
> document or link is welcome.

It is used at UBI. It means it can program sector(s) with (mtd->writesize >> mtd->subpage_sft) instead of page (2KB).

	switch (mtd->oobsize) {
        case 64:
                this->ecclayout = &onenand_oob_64;
                mtd->subpage_sft = 2;
                break;

        case 32:
                this->ecclayout = &onenand_oob_32;
                mtd->subpage_sft = 1;
                break;

        default:
                printk(KERN_WARNING "No OOB scheme defined for oobsize %d\n",
                        mtd->oobsize);
                mtd->subpage_sft = 0;
                /* To prevent kernel oops */
                this->ecclayout = &onenand_oob_32;
                break;
        }

        this->subpagesize = mtd->writesize >> mtd->subpage_sft;

E.g., OneNAND (SLC) can program 4 times with 512

Thank you,
Kyungmin Park
