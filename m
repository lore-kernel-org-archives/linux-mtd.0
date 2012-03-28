Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SCi7B-0005sq-3e
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2012 01:55:57 +0000
Received: by yhjj52 with SMTP id j52so493440yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2012 18:55:53 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 Mar 2012 18:55:53 -0700
Message-ID: <CAN8TOE_8sTtuvBq+SOSLv5Kbw_2G8ByX-euiDm=z2btO-kLkcw@mail.gmail.com>
Subject: nand_base - kill chip->oob_poi?
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Gleixner <tglx@linutronix.de>,
 David Brownell <dbrownell@users.sourceforge.net>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm looking to support a new NAND hardware controller, and it doesn't
support OOB read/write for its fastest modes of operation, since most
normal activity (i.e., UBI(FS)) doesn't need OOB. So I'm trying to
cleanly separate data and OOB functionality so that read and write
driver functions can address data, OOB, or both based on the MTD API
request.

Unfortunately, the more I study nand_base.c, the more I see that
{read,write}_page functionality is mostly tied together with OOB.
Specifically, there is a lot of usage of a dirty, backend
"nand_chip.oob_poi" pointer for transferring OOB data between
functions. And some driver functions (the "syndrome" class of
functions) expect that they can *always* read/write to oob_poi, even
if the high-level API call only needed to read from the in-band data.
Thus, chip->oob_poi is required but not always used, and there is no
way for a driver to know if OOB was actually requested in the first
place.

So the question is: can anybody provide tips for allowing OOB
read/write to be conditional at the driver level, during page
read/write? I have a plan (below), but it conflicts somewhat with some
current {read,write}_page implementations as seen above in the
"syndrome" functions.

My plan looked something like the following:
- avoid using chip->oob_poi explicitly if at all possible
- pass both buf and oob pointers to the various {read,write}_page
interfaces (in nand_chip and in nand_ecc_ctrl)
- allow oob to be NULL, which would imply that the API call only
needed the in-band data

So the nand_ecc_ctrl interfaces would look like:

void (*write_page)(struct mtd_info *mtd, struct nand_chip *chip, const
uint8_t *buf, const uint8_t *oob);
int (*read_page)(struct mtd_info *mtd, struct nand_chip *chip, uint8_t
*buf, uint8_t *oob, int page);
...

And similarly for nand_chip:

int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
                        const uint8_t *buf, const uint8_t *oob, int page,
                        int cached, int raw);

Any recommendations, tips, questions, or criticisms are welcome. If I
don't see any other great ideas, I may post a preliminary patch series
soon.

Brian

P.S. I see that there may be another way to solve my problem (besides
my plan above): just add more interfaces in the nand_ecc_ctrl
structure. But I think this is an ugly solution, and the NAND
infrastructure needs to be cleaner, not uglier.
