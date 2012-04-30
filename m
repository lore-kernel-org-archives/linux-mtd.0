Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOw28-0001Xg-79
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 19:13:17 +0000
Message-ID: <4F9EE445.6010402@freescale.com>
Date: Mon, 30 Apr 2012 14:13:09 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 07/10] mtd: IFC NAND: utilize oob_required parameter
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-8-git-send-email-computersforpeace@gmail.com>
 <4F9EC11A.7020201@freescale.com>
 <CAN8TOE_3kSPhNUN7ETaBDkqvFC9=4xxFLa6O5s-zsCsqEwG4cg@mail.gmail.com>
In-Reply-To: <CAN8TOE_3kSPhNUN7ETaBDkqvFC9=4xxFLa6O5s-zsCsqEwG4cg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Li Yang <leoli@freescale.com>,
 linux-mtd@lists.infradead.org, Prabhakar Kushwaha <prabhakar@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/30/2012 02:08 PM, Brian Norris wrote:
> On Mon, Apr 30, 2012 at 9:43 AM, Scott Wood <scottwood@freescale.com> wrote:
>> On 04/27/2012 08:29 PM, Brian Norris wrote:
>>> @@ -717,7 +718,8 @@ static void fsl_ifc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>>>                              const uint8_t *buf, int oob_required)
>>>  {
>>>       fsl_ifc_write_buf(mtd, buf, mtd->writesize);
>>> -     fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
>>> +     if (oob_required)
>>> +             fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
>>>  }
>>
>> This will result in writing junk to the non-ECC OOB bytes as opposed to
>> leaving it alone.
> 
> Then I'll drop the write_page change from this patch.
> 
> Is the read_page change sane?

It should be harmless.

> Did you review the (misspelled) eLBC patch? (patch 06/10)

No, that one wasn't CCed to me (I should probably get around to
subscribing to linux-mtd...).  It looks like the same situation as IFC.

-Scott
