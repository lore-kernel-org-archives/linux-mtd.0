Received: from [203.194.144.59] (helo=ns3.dns-hk.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zdzW-0003QY-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 15:08:43 +0100
Message-ID: <000d01c27066$782bb2a0$b200a8c0@your.myip.org>
Reply-To: <paul@maypaul.com>
From: <paul@maypaul.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Tino Keitel" <tino.keitel@innominate.com>
Cc: <linux-mtd@lists.infradead.org>
References: <20021010114147.GB9941@tkeitel001.bln.gelonet.local>  <009701c27036$ee169f00$9000010a@paulwong>  <10847.1034250809@passion.cambridge.redhat.com>
Subject: Re: help! compile error 
Date: Thu, 10 Oct 2002 22:08:07 +0800
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

how can I solve it? which mail or any link to talk about it's problem?
thanks

Paul
----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Tino Keitel" <tino.keitel@innominate.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, October 10, 2002 7:53 PM
Subject: Re: help! compile error


>
> tino.keitel@innominate.com said:
> >  IIRC this is a binutils<->kernel issue that has nothing to do with
> > the mtd source.
>
> Nah. Something needs __devexit_p() but as it's been discussed so many
times
> elsewhere I can't be bothered to respond. Although I should fix it in CVS
> at some point I suppose.
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
