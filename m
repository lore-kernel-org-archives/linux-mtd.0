Received: from aa011-1msr.fastwebnet.it ([62.101.93.131])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RBnMs-00048e-Jn
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2011 12:48:07 +0000
Subject: Re: erase block < 8KiB
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: angelo <angelo70@gmail.com>
In-Reply-To: <4E8977DF.1030808@gmail.com>
References: <4E8977DF.1030808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 Oct 2011 14:47:50 +0200
Message-ID: <1317905270.4526.8.camel@AURIO02>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think the best solution is to modify mkfs.jffs2 tool.
So your sectors are smaller and you flash better used.

Regards


Il giorno lun, 03/10/2011 alle 10.52 +0200, angelo ha scritto:
> Hi all,
> 
> i read several mail about this limitation.
> 
> http://lists.infradead.org/pipermail/linux-mtd/2011-February/033851.html
> http://lists.infradead.org/pipermail/linux-mtd/2011-June/036498.html
> 
> 
> I have a 4 KiB erase-size, common of some SST nor flash'es like mine 
> (SST 39VF3201B).
> 
>  From all the posts i read here in the list, there seems not to be any 
> solution guaranteed.
> 
> The tricky change to mkfs.jffs2 don't work for me. It seems to work for 
> small files, but i still get error messages copying a 600KB file in the 
> partition.
> If it's true that the minimal jffs2 block is 4KB + some bytes, of course 
> the patch to mkfs.jffs2 can't work.
> 
> Some one suggested the "virtual erase block" solution. I would like to 
> try to implement it, if i have the time.
> 
> In any case, for the common users, is there maybe another flash file 
> system that can work with 4KiB erase size ?
> 
> Many thanks,
> Regards
> 
> Angelo Dureghello
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Fabio Giovagnini

Aurion s.r.l.
P.iva 00885711200
cell. +39.335.8350919
Tel. +39.051.594.78.24
Fax. +39 051.082.14.49
skype: aurion.giovagnini
