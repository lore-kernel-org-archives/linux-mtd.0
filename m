Received: from maile.telia.com ([194.22.190.16])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18X8z7-0007za-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 23:54:45 +0000
Message-ID: <005301c2b907$f4326c10$0200a8c0@jockeXP>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Xiaogeng \(Shawn\) Jin" <xjin@redswitch.com>
Cc: <linux-mtd@lists.infradead.org>
References: <3E1F0F47.1080606@redswitch.com> <003101c2b8fc$a0947b30$0200a8c0@jockeXP> <3E1F61F5.8000706@redswitch.com>
Subject: Re: set_user_nice() not defined on 2.4.21+
Date: Sat, 11 Jan 2003 01:25:33 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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


> Hi Jocke,
> 
> Are you maintaining at least mtd/compatmac.h?

No, I just added set_user_nice() after discussion with David Woodhouse since I ran into
the same problem as you.
 
>  I also found a 
> compatibility problem of rq_data_dir(). I did find that this function is 
> already defined in linux/blkdev.h of 2.4.21-pre3. So probably 
> mtd/compatmac.h needn't define it again.

Best to run this via David Woodhouse. He knows this much better than I do. 

> 
> Joakim Tjernlund wrote:
> > Hi
> > 
> > I had the impression that set_user_nice() would be in 2.4.21 when I added set_user_nice() to 
> > mtd/compatmac.h. I can change it to KERNEL_VERSION(2,5,0) or someone can
> > submit a patch to Marcelo.
> 
> - Shawn.
