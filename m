Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhPNJ-0005QE-7x
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 06:44:49 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kA7BiAEZ011526
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 06:44:10 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kA7Bi5m7110648
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 06:44:05 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kA7Bi4c0027633
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 06:44:04 -0500
Subject: Re: region_info_user and otp_info
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Anand Patil <anandpatil@ti.com>
In-Reply-To: <000e01c7021f$d436ee80$5ef5180a@ent.ti.com>
References: <000e01c7021f$d436ee80$5ef5180a@ent.ti.com>
Content-Type: text/plain
Date: Tue, 07 Nov 2006 05:45:09 -0600
Message-Id: <1162899909.19697.13.camel@crusty.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-11-07 at 09:20 +0530, Anand Patil wrote:
> Hi,
>        I am new bee to MTD user land,
> 
>       1)  Iam not getting what region information refers to in MTD?

Some chips have multiple erase regions.  These regions can have
eraseblocks of different size than the rest of the chip.  That is what
the structure is reporting.


>     2) I did'nt get the purpose of the below strucuture defined and its 
> usage ?

OTP stands for One Time Programmable.  Some chips have an area that is
only writable once.  It can be used to store serial numbers, or whatever
you'd like to store as long as you only need to write that information a
single time.  That is what this structure is referring to.

josh
