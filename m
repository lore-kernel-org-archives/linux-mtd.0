Received: from mailb.telia.com ([194.22.194.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fya9-0006Ua-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2002 07:32:57 +0000
Message-ID: <00b901c1bf62$8188a200$da9240d5@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <02022614424803.15969@jocke.lumentis.se>  <0111121314140A.28381@jocke.lumentis.se> <02010409585400.10979@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se>  <17692.1014738817@redhat.com>
Subject: Re: scan.c & ACCURATE 
Date: Wed, 27 Feb 2002 08:43:54 +0100
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

> Joakim.Tjernlund@lumentis.se said:
> >  Patch 2 increases INOCACHE_HASHSIZE to 14 which also make scan alot
> > faster.
>
> How does this compare with 8, which is easier to divide by?

Well, I don't remember any figures and I don't think I tested 8, but I do
remember getting better mount times each time I increased INOCACHE_HASHSIZE.
I don't think dividing is a problem, keeping the lists short in the hash
table is more
important.

         Jocke
