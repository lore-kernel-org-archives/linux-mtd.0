Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B8Bl4-0007qT-L6
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2004 06:25:54 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HVD00AS7J35RV@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 30 Mar 2004 07:25:53 +0200 (MEST)
Date: Tue, 30 Mar 2004 06:22:22 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <4068FF5A.8090207@setabox.com>
To: "William J. Beksi" <wjbeksi@setabox.com>, linux-mtd@lists.infradead.org
Message-id: <200403300722.22974.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <4068FF5A.8090207@setabox.com>
Subject: Re: ECC for Samsung nand flash
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 30 March 2004 07:02, William J. Beksi wrote:
> Has anyone implemented an ECC algorithm for Samsung nand flash devices?
> The nand_ecc.c in the cvs seems to be specific for Toshiba devices.

He ? What is specific ? 
ECC is a checksum algorithm for error detection and correction and is nowhere 
specific for Toshiba.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
