Received: from e34.co.us.ibm.com ([32.97.110.152])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KveDm-0006qe-Ni
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 20:34:23 +0000
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e34.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id m9UKY7GZ012004
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2008 14:34:07 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m9UKYKKB039318
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2008 14:34:21 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m9UKXoa9010792
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2008 14:33:51 -0600
Message-ID: <20081030163326.9gcpyg7n48s4s8gs@imap.linux.ibm.com>
Date: Thu, 30 Oct 2008 16:33:26 -0400
From: Corinna Schultz <cschultz@linux.vnet.ibm.com>
To: Corinna Schultz <cschultz@linux.vnet.ibm.com>
Subject: cfi_cmdset_0002.c possible BUG (was Re: ST M29W320D incorrectly
	configured)
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
In-Reply-To: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Corinna Schultz <cschultz@linux.vnet.ibm.com>:

> I'm having a problem getting the unlock addresses correctly configured
> for the ST M29W320D chip. CFI query data is shown below (from
> debugging statements I enabled and/or added to the driver). The chip
> is wired so that the #BYTE pin is low, putting the chip into x8 mode.
> The data bus is physically 8 bits.

OK, I understand things a bit better now. device_type is detected at =20
runtime, and the constants are misleadingly named. They are scaling =20
values, and in my case, (x16 chip in x8 mode) device_type should be 2, =20
or CFI_DEVICETYPE_X16, which is what it is being detected as. My =20
interfaceDesc is also 2 (x8/x16 async modes), as it should be. So far =20
so good.

Given this, the conditional used to assign the unlock addresses seems =20
to have logic errors. Here's the original patch: =20
http://lists.infradead.org/pipermail/linux-mtd-cvs/2004-September/004096.htm=
l

Does anyone know the reasoning behind this change? Was this tested? =20
Has anyone else reported problems with this code (it's pretty old)?


-Corinna Schultz
IBM LTC
