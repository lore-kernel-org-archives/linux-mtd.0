Received: from 209-87-231-114.storm.ca ([209.87.231.114] helo=[10.0.1.163])
	by pentafluge.infradead.org with esmtpsa (Exim 4.60 #1 (Red Hat Linux))
	id 1FRUFz-0001q0-Pb
	for linux-mtd@lists.infradead.org; Thu, 06 Apr 2006 14:10:40 +0100
Message-ID: <4435134E.6000102@netwinder.org>
Date: Thu, 06 Apr 2006 09:10:38 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <4433E9A1.1030807@netwinder.org>
In-Reply-To: <4433E9A1.1030807@netwinder.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: FAQ entry for loopback mounting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting myself:

> METHOD mtdram:
 > [snip]
>     # cp file.jffs2 /dev/mtd0
>     # mount -tjffs2 /dev/mtdblock0 /mnt/foo

I'm bored of arguing about suffixes.  Let's talk MTD.

When using mtdram device, is it necessary to fill the device with 0xff 
first?  Suppose I make a 8388608 byte mtdram device and then my 
file.jffs2 is only 6000000 bytes long.  Need I fill the rest of the 
device with 0xff before mounting?  Should I fill with zeros (there was 
an unanswered question on this subject 2005-Dec-14 on the list).

What about if I "reaload", eg. umount the device, and want to copy a new 
file.jffs2 image into it?  Or should the driver be reloaded in this case?

-R
