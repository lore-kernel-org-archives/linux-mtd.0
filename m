Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Tj2G-0008CZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Jan 2003 13:35:52 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8100FPDGI9OP@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 01 Jan 2003 15:06:10 +0100 (MET)
Date: Wed, 01 Jan 2003 15:03:13 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: jedec probe problem
In-reply-to: <E18TieE-00087a-00@pentafluge.infradead.org>
To: thierry <jokyman@sina.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200301011503.13225.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=gb2312
Content-transfer-encoding: 7BIT
References: <E18TieE-00087a-00@pentafluge.infradead.org>
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

On Wednesday 01 January 2003 14:42, thierry wrote:
> my flash is hy29lv160 in word mode and buswidth is 16 bit.
> I use jedec_probe_chip() to detect my flash.
> According to the data sheet of my flash,I set:
> cfi->addr_unlock1 = 0x555;
> cfi->addr_unlock2 = 0x2aa;
> but when it execute:
> 	cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
> CFI_DEVICETYPE_X16, NULL); cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base,
> map, cfi, CFI_DEVICETYPE_X16, NULL); cfi_send_gen_cmd(0x90,
> cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X16, NULL); cfi->mfr =
> jedec_read_mfr(map, base, osf);
> it stop after the third cfi_send_gen_cmd and can't read the manufacture
> code. Can someone point out my mistake?
> Thanks!
Please use cfi_probe. 
Check, if this works. 
If yes, study the code and you have a pointer. 
If not, enable debugging and provide detailed logs.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
