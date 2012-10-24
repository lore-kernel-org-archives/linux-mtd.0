Received: from e23smtp08.au.ibm.com ([202.81.31.141])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TQx9Y-000642-01
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2012 09:21:33 +0000
Received: from /spool/local
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <hejianet@linux.vnet.ibm.com>;
 Wed, 24 Oct 2012 19:20:36 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 q9O9LNwm51118142
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2012 20:21:24 +1100
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 q9O9LMwj014080
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2012 20:21:23 +1100
Received: from [127.0.0.1] ([9.123.236.215])
 by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
 q9O9KwIw013566
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2012 20:21:22 +1100
Message-ID: <5087B304.8010903@linux.vnet.ibm.com>
Date: Wed, 24 Oct 2012 17:21:08 +0800
From: hejianet <hejianet@linux.vnet.ibm.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [question]MTD:unstable bit issues?
References: <50877953.9040602@linux.vnet.ibm.com>
 <OFCD7F9EAE.28A631AD-ONC1257AA1.002B4604-C1257AA1.002D248C@rohde-schwarz.com>
 <5087AC58.1000402@linux.vnet.ibm.com>
 <OF4005835E.007816E8-ONC1257AA1.0030E2F0-C1257AA1.003189CF@rohde-schwarz.com>
In-Reply-To: <OF4005835E.007816E8-ONC1257AA1.0030E2F0-C1257AA1.003189CF@rohde-schwarz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas
till now, we have no evidence that it is a jffs2.
we only observed a ubi error msg(not 100% sure it caused this hole):

Oct 15 20:09:10 (none) kernel: UBI error: ubi_io_write error -5 while writing 2048 bytes to PEB 1663:20480, written 0 bytes

Besides, it only appeared in power-cut stress cut, so I suspect it is relevant
to "unstable bits issue". from google information, this issue appears in both
nand and nor flash, but more frequently in nand.

On 2012-10-24 17:01, Thomas.Betker@rohde-schwarz.com wrote:
> Hello Jia:
>
>> Yes, we use jffs2.
>> How did u solve your bug? :)
>>>> ----------------------------------------------------- 
>>>> 2)a 4k bytes hole with all 0 in the flash file.
>>>> -----------------------------------------------------
> Unfortunately, we didn't solve it. Some day, it was simply gone; I have no 
> idea what had changed. I couldn't reproduce it anymore, so I couldn't do 
> any further analysis.
>
> Anyway, most likely this is not a NAND issue or MTD issue, but a JFFS2 
> issue. And I would certainly want to hear about it if you manage to find 
> and fix it ...
>
> Best regards,
> Thomas
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>
