Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197hiS-0003sz-MM
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 21:16:41 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Stephan Linke" <Stephan.Linke@epygi.de>,
	"Linux-Mtd" <linux-mtd@lists.infradead.org>
Date: Tue, 22 Apr 2003 08:17:39 +1200
References: <FCEAKDJJAPHPLJFINDAJIEBIDAAA.Stephan.Linke@epygi.de>
In-Reply-To: <FCEAKDJJAPHPLJFINDAJIEBIDAAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Message-Id: <20030421201646.C88A140B5@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: "verify NAND page writes" and & partial write
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Veriify NAND page writes does not work with YAFFS for the reason you give.
YAFFS does its own verification when needed.

-- Charles

On Monday 21 April 2003 23:36, Stephan Linke wrote:
> Hi,
>
> I try to use the "verify NAND page writes" option but but it always failes
> when YAFFS tries to do a partial write on the OOB area. Is it intentional
> that this option failes with partial writes? Everything works fine when I
> disable this feature.
>
> Thanks, Stephan
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
