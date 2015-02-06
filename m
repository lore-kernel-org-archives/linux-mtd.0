Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJeIg-00029K-7k
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 08:30:07 +0000
Date: Fri, 6 Feb 2015 09:29:40 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH] mtd: denali: Disable sub-page writes in Denali NAND driver
In-Reply-To: <54D397C8.808@opensource.altera.com>
Message-ID: <alpine.DEB.2.02.1502060925000.11532@lnxricardw1.se.axis.com>
References: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
 <CADhT+weaYA1cSQCNP98Ta0ChgxymbBbwtRikdUdcbL2pQB-TXQ@mail.gmail.com>
 <CAFLxGvynJFPECTG5f_ZN_VpgkiZE01MUiJh4Yvj-Pf8MuOit7g@mail.gmail.com>
 <54D397C8.808@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Dinh Nguyen <dinh.linux@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>,
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


On Thu, 5 Feb 2015, Graham Moore wrote:

> Actually, we made this change to make UBIFS work.  So, yes, the driver 
> never worked for UBI.  Worked fine for JFFS2, raw data.
> 
> A customer reported an issue with ECC errors when using UBIFS on NAND 
> flash with Altera SoC.
> 
> We debugged it and found the ECC errors occur because the UBI subsystem 
> is trying to write sub-pages in the NAND, but neither the NAND chip 
> itself nor the Denali NAND controller support sub-page writes.

Just a bit curious.

It is not uncommon for controllers or chips not to support sub-page 
writes. In that case however, the partition(s) used by UBI should be 
formatted accordingly, i.e. using the appropriate --sub-page-size argument 
to ubiformat (when formatting partitions on the system itself), or the 
corresponding argument to ubinize (when preparing images offline).

If that is done correctly, then the lack of subpage write capability is 
not a problem per se (of course, the UBI EC and VID headers then take up 
more space so less space is available for user data; on a flash with 2k 
pages it is only 2k bytes per LEB that is lost however).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
