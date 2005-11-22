Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeYZo-0007zH-SS
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 08:53:02 -0500
Message-ID: <438322C6.6020002@inf.u-szeged.hu>
Date: Tue, 22 Nov 2005 14:53:10 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: kevinwu <kevinwu@e28.com>
References: <1132624224.3577.15.camel@localhost.localdomain>
In-Reply-To: <1132624224.3577.15.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: small erase block size with EBS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I have a NAND flash with a small erase block(16KiB)
> When I use sumtool, I find that the summary image size is much larger
> than the original one if I use option --eraseblock=0x4000.
> But When I use option --eraseblock=0x20000, The summary image is a bit
> larger than the original one.
> EBS fits for large erase block as far as I know. 
> That is to say, I can not use EBS if the NAND erase block is small. What
> a pitty!
 > Is there any way to use EBS on a small erase block size NAND?

EBS should work on your system but if the erase block size is small it 
may be not too usefull. Generally if you use bigger erase block size the 
speedup will be greater and the "used place penalty" will be smaller.

So I suggest to test it: measure the rete of speedup and the difference 
in image size on your system, and you can decide it is OK for you or not.

> What about CS?

CS doesn't depend on erase block size as EBS does, so you may try it. 
The code of CS is more then one mouth old, so you should use it with 
earlier mtd snapshot. If you can wait a little we will update it at the 
first week of december.

Ferenc
