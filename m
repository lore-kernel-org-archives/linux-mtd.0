Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwF3Z-0003YX-La
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 16:12:26 +0000
Message-ID: <501803C5.8080105@freescale.com>
Date: Tue, 31 Jul 2012 11:11:49 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
 <50178A45.3000406@parrot.com>
In-Reply-To: <50178A45.3000406@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

On 07/31/2012 02:33 AM, Matthieu CASTET wrote:
> Hi,
> 
> for ONFI flash (like this micron one) the information should be extracted form
> the ONFI table (programs_per_page IIRC)
> 
> This should be better than relying on the SOC driver for setting this flags.

This is for cases where the constraint is the controller, not the chip.

> Does the gpmi driver set this flag because it do not support partial write ?
> In this case why it doesn't set  chip->ecc.steps to 1 ?

Why is it better to lie about ECC geometry than to just say "subpage
writes aren't supported"?  Does/will the ECC geometry get used by upper
layers in evaluating the number of corrected bitflips?

-Scott
