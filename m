Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffXZd-0005iQ-U7
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 21:32:00 +0000
Date: Tue, 17 Jul 2018 23:31:43 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 "Brian Norris" <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Bean Huo <beanhuo@micron.com>
Subject: Re: [2/3] mtd: rawnand: micron: Disable ECC earlier in the read path
Message-ID: <20180717233143.030b9935@bbrezillon>
In-Reply-To: <16b088c3887b4f1b84bd1002b0de75cb@svr-chch-ex1.atlnz.lc>
References: <20180703122009.29914-3-boris.brezillon@bootlin.com>
 <a01b89d899504e8596da9e416d22b1f7@svr-chch-ex1.atlnz.lc>
 <20180716181057.65d78303@bbrezillon>
 <20180716225538.542cb096@bbrezillon>
 <afe826dcb4934dea9795541ee0385542@svr-chch-ex1.atlnz.lc>
 <20180717134156.3d8e016c@bbrezillon>
 <16b088c3887b4f1b84bd1002b0de75cb@svr-chch-ex1.atlnz.lc>
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

On Tue, 17 Jul 2018 21:27:26 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi Boris,
> 
> On 17/07/18 23:42, Boris Brezillon wrote:
> > On Mon, 16 Jul 2018 22:42:54 +0000
> > Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
> >   
> >> On 17/07/18 08:55, Boris Brezillon wrote:  
> >>> On Mon, 16 Jul 2018 18:10:57 +0200
> >>> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> >>>      
> >>>> On Mon, 16 Jul 2018 09:00:59 +0000
> >>>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
> >>>>     
> >>>>> Hi Boris,
> >>>>>
> >>>>> On 04/07/18 00:20, Boris Brezillon wrote:  
> >>>>>> We are about to support extracting the real number of bitflips for
> >>>>>> 4-bits ECC when WRITE_RECOMMEND is returned. This requires re-reading
> >>>>>> the page in raw mode to compare it to the corrected version, and this
> >>>>>> logic will be placed in micron_nand_on_die_ecc_status_4().
> >>>>>>
> >>>>>> Moving the micron_nand_on_die_ecc_setup() will allow us to disable
> >>>>>> ECC only once.
> >>>>>>
> >>>>>> As a result, we have to rework the exit path and add an error path
> >>>>>> where the ECC is disabled.
> >>>>>>
> >>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>  
> >>>>>
> >>>>> As I said on the other thread this appears to cause a problem for me on
> >>>>> the MT29F1G08ABAFAWP-ITE setup I have. I notice we're not able to find
> >>>>> the BBT, not sure if that is symptom or cause.  
> >>>
> >>> It's most likely the symptom, not the cause.
> >>>      
> >>>>>>
> >>>>>> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> >>>>>> index 63ac98a36ed7..b9cbaf125a98 100644
> >>>>>> --- a/drivers/mtd/nand/raw/nand_micron.c
> >>>>>> +++ b/drivers/mtd/nand/raw/nand_micron.c
> >>>>>> @@ -197,30 +197,37 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
> >>>>>>     
> >>>>>>     	ret = nand_read_page_op(chip, page, 0, NULL, 0);
> >>>>>>     	if (ret)
> >>>>>> -		goto out;
> >>>>>> +		goto err_disable_ecc;
> >>>>>>     
> >>>>>>     	ret = nand_status_op(chip, &status);
> >>>>>>     	if (ret)
> >>>>>> -		goto out;
> >>>>>> +		goto err_disable_ecc;
> >>>>>>     
> >>>>>>     	ret = nand_exit_status_op(chip);
> >>>>>>     	if (ret)
> >>>>>> -		goto out;
> >>>>>> +		goto err_disable_ecc;
> >>>>>>     
> >>>>>> -	if (chip->ecc.strength == 4)
> >>>>>> -		max_bitflips = micron_nand_on_die_ecc_status_4(chip, status);
> >>>>>> -	else
> >>>>>> -		max_bitflips = micron_nand_on_die_ecc_status_8(chip, status);
> >>>>>> +	micron_nand_on_die_ecc_setup(chip, false);  
> >>>>
> >>>> Hm, can you try to move the micron_nand_on_die_ecc_setup(chip, false)
> >>>> call just before nand_exit_status_op()?
> >>>>     
> >>>
> >>> Just pushed a branch fixing that [1]. Can you test it? If it works,
> >>> I'll ask Miquel to drop the initial set of patches and instead pick the
> >>> fixed ones so that we don't break bisectibility.
> >>>
> >>> [1]https://github.com/bbrezillon/linux-0day/commits/nand/next
> >>>      
> >>
> >> Still appears to have the same problem.
> >>
> >> I'm guessing that since you can't actually disable ecc on this chip
> >> calling micron_nand_on_die_ecc_setup(chip, false); before reading the
> >> oob data interferes with it somehow (if I call it after there is no
> >> problem).
> >>
> >> We could add code to qualify the attempt to disable ecc early based on
> >> it being optional/mandatory or just stick with it being disabled late.  
> > 
> > Okay. I gave up on disabling ECC earlier and instead implemented what
> > you suggested. Can you test
> > https://github.com/bbrezillon/linux-0day/commits/nand/next again and
> > let me know if it works for you?  
> 
> Yes that works for me. Feel free to add
> 
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> 
> to
> 
> 88240e244026 mtd: rawnand: micron: Make ECC activation stateful
> 6ae7f205cec0 mtd: rawnand: micron: Avoid enabling/disabling ECC when it 
> can't be disabled

Okay, cool.

Miquel, can you drop:

683ca8a70738 mtd: rawnand: micron: Get the actual number of bitflips
d73e5d29aa29 mtd: rawnand: micron: Disable ECC earlier in the read path
db2d37331813 mtd: rawnand: micron: Stop passing mtd to ecc_status() funcs
51f3b3970a8c mtd: rawnand: micron: detect forced on-die ECC
386fc2609d15 mtd: rawnand: micron: support 8/512 on-die ECC

I'll send a new patch series soon.

Thanks,

Boris
