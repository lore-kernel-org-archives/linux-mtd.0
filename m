From: David Woodhouse <dwmw2@infradead.org>
To: yahoo_groups@rovoreed.com
In-Reply-To: <431DE248.20912.15DAC1@localhost>
References: <431DE248.20912.15DAC1@localhost>
Content-Type: text/plain
Date: Thu, 08 Sep 2005 11:16:58 +0100
Message-Id: <1126174618.4171.149.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskonChip problems.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-06 at 18:39 +0000, yahoo_groups@rovoreed.com wrote:
> I used to have a driver called fldrvlnx, which created a module called
> doc.o and I'd simply load that module and then I could mount the
> DiskonChip with a line in fstab like
> 
> /dev/fla1       /mnt/fla1       msdos   defaults        0       0

You were using a binary-only module. If you were shipping embedded
products which used a combination of that and the GPL'd kernel, then you
were violating the GPL. You really shouldn't admit to such things in
public. I hope you were doing this only in your lab and not shipping
such code.

> Now I see in 2.4.31, things have moved on and the DiskonChip stuff is
> different. Can someone enlighten me as to how I'm supposed to get it
> to work ?

Enable the DOC2000 hardware driver and NFTL, and it should turn up
as /dev/nftla 

-- 
dwmw2
