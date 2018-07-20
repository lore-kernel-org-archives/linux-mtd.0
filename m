Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgPcu-0007a9-Vd
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 07:14:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 20 Jul 2018 12:44:42 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 4/5] mtd: rawnand: qcom: update BBT related flags
In-Reply-To: <20180718234255.4e51c188@xps13>
References: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
 <1530863519-5564-5-git-send-email-absahu@codeaurora.org>
 <20180718231526.38046099@xps13> <20180718233637.49a39751@bbrezillon>
 <20180718234144.158217f2@xps13> <20180718234255.4e51c188@xps13>
Message-ID: <cf73ae307c3a155e232788d0257a3c97@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-07-19 03:12, Miquel Raynal wrote:
> Abhishek,
> 
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed, 18 Jul 2018
> 23:41:44 +0200:
> 
>> Hi Boris,
>> 
>> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 18 Jul 
>> 2018
>> 23:36:37 +0200:
>> 
>> > On Wed, 18 Jul 2018 23:15:26 +0200
>> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>> >
>> > > Hi Abhishek,
>> > >
>> > > Abhishek Sahu <absahu@codeaurora.org> wrote on Fri,  6 Jul 2018
>> > > 13:21:58 +0530:
>> > >
>> > > > Remove the NAND_SKIP_BBTSCAN to use RAM based BBT.
>> > >
>> > > Unless I am understanding it the wrong way, NAND_SKIP_BBTSCAN will skip
>> > > the scan of the on-chip BBT and will scan every block to construct a
>> > > RAM, based BBT thanks to the BBM.
>> > >
>> > > So flash based BBT is already unused and removing this flag is a
>> > > mistake, right?
>> >
>> > ->scan_bbt() is also taking care of building the in-RAM BBT based on
>> > BBM when no on-flash BBT is provided, so I think it's the right thing
>> > to do.
>> 
>> Oh right. Then doing so is harmless.
> 
> Could you please update the commit log to reflect this aspect?
> 

  Thanks Miquel and Boris.
  I will update the commit log.

  Regards,
  Abhishek
