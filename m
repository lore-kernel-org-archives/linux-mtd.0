Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BXVo-0000mx-CX
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 11:11:28 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE900JFP8AMJM@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 02 May 2003 12:11:11 +0200 (MEST)
Date: Fri, 02 May 2003 13:10:53 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: 
 <515CABE7496FD111AA3300201829FCBE2FFDF9@archie.gsi.synergie-inf.com>
To: m.neiger@synergie-inf.com,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Message-id: <200305021310.53793.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <515CABE7496FD111AA3300201829FCBE2FFDF9@archie.gsi.synergie-inf.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: zlib and uClinux
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 02 May 2003 11:52, Marc Neiger wrote:
> Hi,
>
> I try to compile uCLinux for coldfire including mtd patch, and I can't get
> the mtd utils to compile.
>
> uclinux : uClinux-dist-20030305.tar.gz
> mtd patch : mtd-snapshot-20030427.tar.bz2

Did you use utils/patchin.sh ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
