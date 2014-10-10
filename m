Received: from mdfmta010.mxout.tbr.inty.net ([91.221.168.51]
 helo=smtp.demon.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xcc8W-0003AC-OJ
 for linux-mtd@lists.infradead.org; Fri, 10 Oct 2014 15:29:45 +0000
Date: Fri, 10 Oct 2014 16:24:45 +0100 (BST)
From: Steve B <steve@baconbits.demon.co.uk>
To: Woody Wu <narkewoody@gmail.com>
Subject: Re: How do I know my UBI/UBIFS code version?
In-Reply-To: <d4a8ef19-1bb5-4d81-9b04-ca9886e7f209@email.android.com>
Message-ID: <alpine.DEB.2.02.1410101622480.2556@ubuntu>
References: <d4a8ef19-1bb5-4d81-9b04-ca9886e7f209@email.android.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


try "ubinfo -a"

I'm no expert, but UBI/UBIF probably has dependencies upon the rest of
the kernel, if the kernel API that it uses have changed then you may
have trouble copying newer files around.

Cheers,
Steve

On Fri, 10 Oct 2014, Woody Wu wrote:

> I am running ubi/ubifs on a ported ARM linux 3.1.x.  How do I get know my ubi/ubifs version? In additional, if I found the version are too old, could I simply copy a newer version source files to my 3.1 ARM linux tree?
>
> Thanks in advance.
>
> -woody, sent from mobile
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
