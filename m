Received: from faraday.heklatech.com ([89.221.255.157])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ea4P9-0002Ua-Jg
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 18:50:17 +0000
From: "Gudjon I. Gudjonsson" <gudjon@gudjon.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Reply-To: gudjon@gudjon.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: ECC configuration of NAND from Linux  (MEMSETOOBSEL)
Date: Fri, 12 Jan 2018 19:50:00 +0100
Message-ID: <2581607.A7Zl2yeV5U@fessender>
In-Reply-To: <20180112154639.63a8d133@bbrezillon>
References: <2132429.fBNFCxDbQz@fessender> <20180112154639.63a8d133@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris

Thanks for the answer.
> > I read your FAQ and found the reference to ioctl (MEMSETOOBSEL) [1]
> > but it seems to be removed from the kernel.
> > /*
> >  * Note, the following ioctl existed in the past and was removed:
> >  * #define MEMSETOOBSEL           _IOW('M', 9, struct nand_oobinfo)
> >  * Try to avoid adding a new ioctl with the same ioctl number.
> >  */
> > I assume this is an error in the documentation but I wonder if you
> > know any solution to my problem?
> 
> It's not something you can change dynamically. When you change the ECC
> config, it makes existing content unreadable. In order to change this
> setting you'll have to erase the whole flash and then change the ECC
> config in your DT or board file (note that not all drivers support
> adjusting the ECC strength/step-size).
I will have to accept that but can you please tell me how to change the
ECC strength if my driver supports it? My plan is to use swupdate and
update the system using an SD-card that is already installed but I could
not find any reference to changing the ECC strength.
I am using the Atmel SAMA5d36 CPU and Micron mt29F2G08abaeawp 
NAND flash. 

Regards
Gudjon
