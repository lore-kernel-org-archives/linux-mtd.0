Received: from rwcrmhc51.attbi.com ([204.127.198.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cCcj-0007ed-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 23:16:17 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Glen <mtd@empireenterprises.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [Fwd: Re: boot from diskonchip millenium]
Date: Tue, 6 Aug 2002 18:15:01 -0400
References: <1028669214.1719.1.camel@glen>
In-Reply-To: <1028669214.1719.1.camel@glen>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020806221545.NGDX19356.rwcrmhc51.attbi.com@there>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Glen wrote:
> This is what I did, with the 0.92 patch; are you saying I should have
> done otherwise?  

Glen,

The 0.92 patch is for released Grub; 2002-07-29 is for the latest Grub CVS 
code.  The 0.92 w/patch should work fine.

> Interestingly enough, after I boot the machine to the HDD by entering
> the commands in grub manually, I no longer have a nftl partition.

It's been my experience that after burning the grub_firmware, you may need to 
do the format and fdisk again.   This could be caused by running doc_loadbios 
when the NFTL module is loaded (and a valid NFTL signature is detected):

http://lists.infradead.org/pipermail/linux-mtd/2002-June/005129.html
http://lists.infradead.org/pipermail/linux-mtd/2002-June/005123.html

> Does grub write to the DOC upon booting?

Grub doesn't have the capability to write to a DoC, as far as I know.

Mark
