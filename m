Received: from extraetmess.thales-e-transactions.com ([212.234.11.56])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 195hEb-0003gT-2P
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 08:21:33 +0100
Message-ID: <3E9D041C.C5BEAD3C@thales-e-transactions.com>
Date: Wed, 16 Apr 2003 09:19:56 +0200
From: "Eric DEJONC" <eric.dejonc@thales-e-transactions.com>
MIME-Version: 1.0
To: Jeremy Bowen <Jeremy.Bowen@opennw.com>
References: <DEA23DB61B62D4118B5900508B323B8401055531@OPENMAIL>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: mtd devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
It doesn't change anything if you chose one format than the other. Special
files can be placed where you want and can have the name you want. The only
thing there is in the file is the major and minor num and a boolean that
indicates if it is a char device or a block device.

regards,
Eric

Jeremy Bowen a écrit :

> Hi
>
> I've seen various references to both
> 1) "/dev/mtd/x" and
> 2) "/dev/mtdx".
>
> My system uses the 1st format. Could someone please help me understand the
> differences between these two formats and where they come from.
>
> Thanks
>
> Jeremy
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
