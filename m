Received: from chrudim.coprosys.cz ([194.108.73.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178HFz-0003Cm-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 10:09:07 +0100
Message-ID: <3CE3774A.6949DB6B@wolfhill.cz>
Date: Thu, 16 May 2002 11:09:30 +0200
From: Ales Makarov <ales.makarov@wolfhill.cz>
Reply-To: ales.makarov@wolfhill.cz
MIME-Version: 1.0
To: zeusj@firstlinux.net
CC: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: MTD+JFFS2 on DragonBall VZ
References: <20020515132253.B581E36F9@sitemail.everyone.net>
Content-Type: text/plain; charset=us-ascii
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

I've written my mtd_partition structure.

Should I add the mtd_device first and then mtd_partitions? (I don't need
the whole device access)

  flash0_mtd->module = THIS_MODULE;
  add_mtd_device(flash0_mtd);
  add_mtd_partitions(flash0_mtd, flash0_parts, FLASH0_PARTS);

Ales


Jim Zeus wrote:
> 
> --- Ales Makarov <ales.makarov@wolfhill.cz> wrote:
> >Hi,
> >>Till now I needed MTD with only one chip. But I want use MTD also on the
> >second chip (with partitioning). Do I have to write my own mapper for
> >our board?
> 
> You have to write your own mtd_partition structure
> 
> _____________________________________________________________
> Want a new web-based email account ? ---> http://www.firstlinux.net
> 
> _____________________________________________________________
> Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
