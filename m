Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOwKR-0003PH-PJ
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 19:32:12 +0000
Message-ID: <4F9EE8B6.2030107@freescale.com>
Date: Mon, 30 Apr 2012 14:32:06 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 07/10] mtd: IFC NAND: utilize oob_required parameter
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-8-git-send-email-computersforpeace@gmail.com>
 <4F9EC11A.7020201@freescale.com>
 <CAN8TOE_3kSPhNUN7ETaBDkqvFC9=4xxFLa6O5s-zsCsqEwG4cg@mail.gmail.com>
 <4F9EE445.6010402@freescale.com>
 <CAN8TOE9g-LwDk-5d99400pp16Z7LopWZTJSPEU+EZsdo_D_u2Q@mail.gmail.com>
In-Reply-To: <CAN8TOE9g-LwDk-5d99400pp16Z7LopWZTJSPEU+EZsdo_D_u2Q@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, Li Yang <leoli@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/30/2012 02:23 PM, Brian Norris wrote:
> On Mon, Apr 30, 2012 at 12:13 PM, Scott Wood <scottwood@freescale.com> wrote:
>> On 04/30/2012 02:08 PM, Brian Norris wrote:
>>> Is the read_page change sane?
>>
>> It should be harmless.
> 
> Right, but I am now handling Shmulik's comments about auto-incremented
> NAND. It seems like there are few/no users of auto-incrementing page
> reads, but if any driver relied on reading page,oob,page,oob,etc.
> without a READ command in between, then we might cause problems by
> skipping the OOB buffer read. Of course, with various NAND
> controllers/drivers, this issue is hard for me to sort through.

This isn't an issue with eLBC/IFC -- besides not currently supporting
autoincrement, the OOB is still read.  We just wouldn't pull it out of
the controller buffer.  Not sure if the time saved is significant.

-Scott
