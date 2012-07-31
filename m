Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SwD9P-0005FJ-Hk
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 14:10:20 +0000
Message-ID: <5017E737.403@parrot.com>
Date: Tue, 31 Jul 2012 16:09:59 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
 <201207311520.17450.marex@denx.de> <5017DD72.4000607@parrot.com>
 <201207311559.15483.marex@denx.de>
In-Reply-To: <201207311559.15483.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Scott Wood <scottwood@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marek Vasut a écrit :
> Dear Matthieu CASTET,
> 
>> Hi Marek,
>>
>> Marek Vasut a écrit :
>>> Dear Matthieu CASTET,
>>>
>>>> Hi,
>>>>
>>>> for ONFI flash (like this micron one) the information should be
>>>> extracted form the ONFI table (programs_per_page IIRC)
>>>>
>>>> This should be better than relying on the SOC driver for setting this
>>>> flags.
>>>>
>>>> Does the gpmi driver set this flag because it do not support partial
>>>> write ?
>>> Yes
>>>
>>>> In this case why it doesn't set  chip->ecc.steps to 1 ?
>>> Can you elabore how exactly will that help please?
>> If you look at the nand_base.c, you will see that mtd->subpage_sft = 0 if
>> NAND_NO_SUBPAGE_WRITE flags is set or chip->ecc.steps == 1 [1].
> 
> Ok, this is what I saw coming ... this is yet another hole in the design and I 
> see only undefined behavior. So if default: branch started returning an error, 
> this whole code will break again.
Do you see any reason why chip->ecc.steps == 1 will return an error ?
This will break drivers.

The behavior match the comment : "Allow subpage writes up to ecc.steps"

Matthieu
> 
> 
>> [1]
>>     /* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
>>     if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
>>         !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
>>         switch (chip->ecc.steps) {
>>         case 2:
>>             mtd->subpage_sft = 1;
>>             break;
>>         case 4:
>>         case 8:
>>         case 16:
>>             mtd->subpage_sft = 2;
>>             break;
>>         }
>>     }
>>     chip->subpagesize = mtd->writesize >> mtd->subpage_sft;
