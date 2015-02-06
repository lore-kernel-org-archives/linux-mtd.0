Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJfE3-00071p-Ue
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 09:29:25 +0000
Message-ID: <54D48955.40700@nod.at>
Date: Fri, 06 Feb 2015 10:28:53 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH] mtd: denali: Disable sub-page writes in Denali NAND driver
References: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
 <CADhT+weaYA1cSQCNP98Ta0ChgxymbBbwtRikdUdcbL2pQB-TXQ@mail.gmail.com>
 <CAFLxGvynJFPECTG5f_ZN_VpgkiZE01MUiJh4Yvj-Pf8MuOit7g@mail.gmail.com>
 <54D397C8.808@opensource.altera.com>
 <alpine.DEB.2.02.1502060925000.11532@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1502060925000.11532@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: Dinh Nguyen <dinh.linux@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Linux List <linux-kernel@vger.kernel.org>,
 "yamada.m@jp.panasonic.com" <yamada.m@jp.panasonic.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 06.02.2015 um 09:29 schrieb Ricard Wanderlof:
> 
> On Thu, 5 Feb 2015, Graham Moore wrote:
> 
>> Actually, we made this change to make UBIFS work.  So, yes, the driver 
>> never worked for UBI.  Worked fine for JFFS2, raw data.
>>
>> A customer reported an issue with ECC errors when using UBIFS on NAND 
>> flash with Altera SoC.
>>
>> We debugged it and found the ECC errors occur because the UBI subsystem 
>> is trying to write sub-pages in the NAND, but neither the NAND chip 
>> itself nor the Denali NAND controller support sub-page writes.
> 
> Just a bit curious.
> 
> It is not uncommon for controllers or chips not to support sub-page 
> writes. In that case however, the partition(s) used by UBI should be 
> formatted accordingly, i.e. using the appropriate --sub-page-size argument 
> to ubiformat (when formatting partitions on the system itself), or the 
> corresponding argument to ubinize (when preparing images offline).
> 
> If that is done correctly, then the lack of subpage write capability is 
> not a problem per se (of course, the UBI EC and VID headers then take up 
> more space so less space is available for user data; on a flash with 2k 
> pages it is only 2k bytes per LEB that is lost however).

Yeah, but UBI automatically will use subpages unless you specify
use the vid_hdr_offs parameter.
IOW, if the driver advertises subpages UBI will use them.

Thanks,
//richard
