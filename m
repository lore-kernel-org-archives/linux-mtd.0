Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SwYbv-0003bl-3S
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2012 13:05:11 +0000
Message-ID: <50192980.7050303@parrot.com>
Date: Wed, 1 Aug 2012 15:05:04 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
 <50178A45.3000406@parrot.com> <501803C5.8080105@freescale.com>
In-Reply-To: <501803C5.8080105@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>,
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

Hi Scott,

Scott Wood a écrit :
> On 07/31/2012 02:33 AM, Matthieu CASTET wrote:
>> Hi,
>>
>> for ONFI flash (like this micron one) the information should be extracted form
>> the ONFI table (programs_per_page IIRC)
>>
>> This should be better than relying on the SOC driver for setting this flags.
> 
> This is for cases where the constraint is the controller, not the chip.
> 
>> Does the gpmi driver set this flag because it do not support partial write ?
>> In this case why it doesn't set  chip->ecc.steps to 1 ?
> 
> Why is it better to lie about ECC geometry than to just say "subpage
> writes aren't supported"?  Does/will the ECC geometry get used by upper
> layers in evaluating the number of corrected bitflips?
If it is not because of ecc geometry, why the controller doesn't support subpage
writes ?



Matthieu
