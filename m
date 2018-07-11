Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdCQ2-0006YZ-7A
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 10:32:25 +0000
Date: Wed, 11 Jul 2018 12:32:09 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "Chris Packham"
 <chris.packham@alliedtelesis.co.nz>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>
Subject: Re:  [PATCH 2/2] mtd: rawnand: micron: Fix on-die ECC detection logic
Message-ID: <20180711123209.5271d411@bbrezillon>
In-Reply-To: <1be1ede4dcf14f24b68b8497b167c1b3@SIWEX5A.sing.micron.com>
References: <1be1ede4dcf14f24b68b8497b167c1b3@SIWEX5A.sing.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

On Wed, 11 Jul 2018 10:05:06 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> 
> >+	if (chip->id.len != 5 ||
> >+	    (chip->id.data[4] & MICRON_ID_INTERNAL_ECC_MASK) != 0x2)
> >+		return MICRON_ON_DIE_UNSUPPORTED;
> >+  
> 
> I think, we should firstly check if by default internal ECC is on.
> If default is off, then can try to enable through set/get feature command.
> if default is on, there is no need to set up completely.

No, see my comment below.

>   
> 
> > 	ret = micron_nand_on_die_ecc_setup(chip, true);
> > 	if (ret)
> > 		return MICRON_ON_DIE_UNSUPPORTED;
> >  
> 
> >-	ret = nand_get_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature);
> >-	if (ret < 0)
> >-		return ret;
> >+	ret = nand_readid_op(chip, 0, id, sizeof(id));
> >+	if (ret)
> >+		return MICRON_ON_DIE_UNSUPPORTED;
> >
> >-	if ((feature[0] & ONFI_FEATURE_ON_DIE_ECC_EN) == 0)
> >+	if (!(id[4] & MICRON_ID_ECC_ENABLED))
> > 		return MICRON_ON_DIE_UNSUPPORTED;
> >  
> 
> Here I say for sure, the value of Bit7 in byte 4 of READID is permanent. It is a reflection of
> the default state of the device. it cannot change by set feature.

That's not what the board I have on my desk says. I have a
MT29F2G08ABAEAH4, and I can tell you for sure this bit changes when I
enable/disable on-die ECC. Do the test, and you'll see...

See, that's what I'm complaining about. You keep saying things that
appear to be untrue when when we check on real HW parts. So, either we
have NANDs that are buggy, or you didn't check yourself.

Regards,

Boris
