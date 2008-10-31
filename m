Received: from e8.ny.us.ibm.com ([32.97.182.138])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kw2p9-0007sX-UP
	for linux-mtd@lists.infradead.org; Fri, 31 Oct 2008 22:50:36 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e8.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id m9VMl0Wi026667
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2008 18:47:00 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m9VMoVLA113318
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2008 18:50:31 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m9VMoMi1006774
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2008 18:50:23 -0400
Message-ID: <20081031185004.rnjfcze1c0c4cw8c@imap.linux.ibm.com>
Date: Fri, 31 Oct 2008 18:50:04 -0400
From: Corinna Schultz <cschultz@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: ST M29W320D incorrectly configured
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
In-Reply-To: <1225463927.16774.106.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org, ebiederm@xmission.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Following up, for the sake of anyone reading this thread, now or in  
the future. :-)

Quoting David Woodhouse <dwmw2@infradead.org>:
> It would be nice if we could do it that way, but these ST chips don't
> seem to work. When they're in 16-bit mode, they really do need a byte
> address of 0x555 for the second unlock address, not 0x554 (0x2aa*2) as
> every other chip seems to accept. Although it takes _extra_ logic to
> check the input on the 'A-1' pin, they seem to have it.
>
> So I think the answer is to go back to cfi->addr_unlock[12] being _byte_
> addresses within the chip...
>
> +		cfi->addr_unlock1 = 0x555 << cfi->device_type;
> +		cfi->addr_unlock2 = 0x2aa << cfi->device_type;

The patch works on my hardware, except for this part here, which  
should be multiplying, not shifting.

We will be doing more extensive testing, and I'll post back in this  
thread if we find any significant problems.

Thanks, David!

-Corinna Schultz
IBM LTC
