Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgTOx-0002Ua-8r
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 14:41:04 -0500
Message-ID: <41C72EAC.50308@ieee.org>
Date: Mon, 20 Dec 2004 14:57:32 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E793518139B@atcml01.atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E793518139B@atcml01.atc.army.mil>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Doc_loadbios fails?  Docboot?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm CC'ing the list on this since other people may benefit.

Carlos, John J USAATC wrote:

>Dan,
>
>  Maybe you can answer some questions for me.  I use dformat to create the
>BDK and BDTL partitions.  The BDK is 2 Meg and the BDTL the remainder.  My
>/proc/mtd shows just one entry mtd0.  
>
This sounds like the problem.  My guess is that you did not compile MTD 
partition support into your kernel.  If partition support is not 
available, I think only one device (mtd0) gets created, which is not 
what you want.  See if you can verify that this kernel config option is 
turned on.

>I then try to follow your guide lines
>for docboot.  I use mtd0 in the nand_eraseall and the nandwrite function.  I
>write the doc_spl and then reboot (init18 hook).  I can't boot from the doc.
>I have lilo on a floppy and when I direct lilo (on a floppy) to boot from my
>hard drive the inftla chip is gone/messed up and the driver doesn't see an
>inftla1.
>
>  Could you tell my why this might be?
>  
>
Since you did a nand_eraseall/nandwrite to mtd0, you erased your 
*entire* device, and then wrote docboot to the beginning.  Not what you 
intended at all :)

Let me know if you have any success.  If this works for you, I should 
update the docboot instructions to tell people they need partition support.

    -Dan
