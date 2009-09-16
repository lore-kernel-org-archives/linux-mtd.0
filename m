Received: from www.dpsmart.com.br ([200.198.101.12] helo=mail.dataprom.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnspX-00058I-Km
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 11:37:52 +0000
Subject: Re: Oops on 2.6.31 with udev and root using ubifs
From: Raphael Derosso Pereira <raphael.pereira@dataprom.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <4AB0CD47.6040000@gmail.com>
References: <1253041322.4496.6.camel@eng009>
	<9c9fda240909151621s70d5d312k462aa51b7dddb0d8@mail.gmail.com>
	<1253099755.4496.10.camel@eng009>  <4AB0CD47.6040000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Sep 2009 08:37:45 -0300
Message-Id: <1253101065.4496.14.camel@eng009>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kmpark@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm sure about 2.6.31 and have checked the sources to make sure the
patch was there and it is.

--
Raphael Derosso Pereira
DATAPROM®
Departamento de Engenharia
Tel.: +55 41 3014-1325
Fax.: +55 41 3014-1201

raphael.pereira@dataprom.com

www.dataprom.com 




Em Qua, 2009-09-16 às 14:34 +0300, Artem Bityutskiy escreveu:
> On 09/16/2009 02:15 PM, Raphael Derosso Pereira wrote:
> > Hello,
> >
> > The patch is already applied. I have disabled gluebi from kernel (turned
> > it to be compiled as module) and the Oops vanished. It really seems that
> > the problem is related to have an UBI volume mounted and trying to use
> > gluebi on top of that volume.
> 
> I think I fixed this at some point:
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=8022c13c27b822cf22f13df10b42aae89cd56bf0
> 
> and it is a 2.6.31. Are you sure you are using 2.6.31?
> 
