Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dfJC-0005uI-00
	for <linux-mtd@lists.infradead.org>; Sun, 11 Aug 2002 00:06:10 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0N004IQHHEVD@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 11 Aug 2002 01:05:39 +0200 (MEST)
Date: Sun, 11 Aug 2002 01:05:31 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Hardware ECC in NAND flash driver
In-reply-to: <1028975588.9592.167.camel@thomas.tec.linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Steven Hein <ssh@sgi.com>, linux-mtd@lists.infradead.org
Message-id: <1029020732.9668.344.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <3D511B55.6ADABE4D@sgi.com>
 <1028726139.19447.255.camel@thomas.tec.linutronix.de>
 <3D527739.5B19816C@sgi.com>
 <1028975588.9592.167.camel@thomas.tec.linutronix.de>
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

On Sat, 2002-08-10 at 12:33, Thomas Gleixner wrote:
> More comments later today.
Hi Steven,

back again. I tried several possibilities to deal with all aspects. I
picked up most of your ideas and worked them into the existing code. My
final conclusion is as follows: 

struct nand_chip got following extensions:

calculate_ecc - function for ecc calculation or readback from ecc
hardware, defaults to nand_calculate_ecc for software ecc
correct_data - function for ecc correction, matching to ecc generator
(sw/hw), defaults to nand_correct_data for software ecc
enable_hwecc - function to enable (reset) hardware ecc generator
eccmod - mode of ecc: see constants
eccsize - databytes used per ecc-calculation, set by nand.c depending on
eccmod value

following eccmodes are defined at the moment

#define NAND_ECC_NONE		0 
is forced, if CONFIG_MTD_NAND_ECC is not set
#define NAND_ECC_SOFT		1 
is forced, if CONFIG_MTD_NAND_ECC is set and no hardware ecc is selected
#define NAND_ECC_HW3_256	2 
user selectable, if your ecc hardware supports 3 byte ecc for 256 byte
of data (DOC or passive SmartMedia adaptors)
#define NAND_ECC_HW3_512	3
user selectable, if your ecc hardware supports 3 byte ecc for 512 byte
of data (Samsung S3C2410)

If you select hardware ecc in your driver, you have to take care, that
calculate_ecc, correct_data and enable_hwecc are filled with the
relevant function pointers and eccmod is set to the appropriate type,
before you call nand_scan.

I'm still not willing to write already written data to the device for a
second time. So I decided to skip hardware ecc for that case. If you use
a NAND aware filesystem e.g. JFFS2 this should not happen, otherwise you
will get in trouble anyway. 

The funtion, which does correct_data calculations for the specfic
hardware ecc should be implemented as a general function in nand_ecc.c
to make it usable for similar hardware drivers and to avoid duplicated
code in these drivers.

Please remove the ECC reset out of your command function and move it to
a seperate function, which will be called by enable_hwecc.

Get code from CVS and enjoy. Thanks for your suggestions. The standard
software ecc mode runs on my machine without complains. I tested HW3_256
mode with software ecc routines and a dummy enable_hwecc and found no
problems. Any suggestions and improvements are welcome. 
Happy testing.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
