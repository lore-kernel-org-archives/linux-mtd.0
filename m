Received: from e28smtp06.in.ibm.com ([122.248.162.6])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TQwi7-0003Nx-82
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2012 08:53:12 +0000
Received: from /spool/local
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <hejianet@linux.vnet.ibm.com>;
 Wed, 24 Oct 2012 14:23:01 +0530
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
 by d28relay02.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 q9O8qwJ836044890
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2012 14:22:58 +0530
Received: from d28av03.in.ibm.com (loopback [127.0.0.1])
 by d28av03.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 q9O8qw3Z011015
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2012 19:52:58 +1100
Message-ID: <5087AC58.1000402@linux.vnet.ibm.com>
Date: Wed, 24 Oct 2012 16:52:40 +0800
From: hejianet <hejianet@linux.vnet.ibm.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Thomas.Betker@rohde-schwarz.com
Subject: Re: [question]MTD:unstable bit issues?
References: <50877953.9040602@linux.vnet.ibm.com>
 <OFCD7F9EAE.28A631AD-ONC1257AA1.002B4604-C1257AA1.002D248C@rohde-schwarz.com>
In-Reply-To: <OFCD7F9EAE.28A631AD-ONC1257AA1.002B4604-C1257AA1.002D248C@rohde-schwarz.com>
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
Yes, we use jffs2.
How did u solve your bug? :)
On 2012-10-24 16:13, Thomas.Betker@rohde-schwarz.com wrote:
> Hello Jia:
>
>> ----------------------------------------------------- 
>> 2)a 4k bytes hole with all 0 in the flash file.
>> -----------------------------------------------------
>> -original-file DD AF C8 EE 57 EB 84 CE A1 7F B1 38 E7 22 51 2F
>> -    94 AE 77 5B 48 EA 61 8C 09 BB C5 74 6E B1 87 D2 
>> -    A9 32 8D 2A E7 7F D2 C3 DB 1A 92 E7 66 7C B8 4E 
>> ......
>>
>> +file-in-flash 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> +    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
>> +    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
>> ......
>> -----------------------------------------------------
> We have also seen this "4k zeros" issue for some time. I never found out 
> was was happening because the issue was suddenly no longer reproducible. 
> :-(
>
> In our case, though, we didn't have NAND flash, but JFFF2 with serial NOR 
> flash. So I would guess that this is not a NAND problem.
>
> Which file system do you run? Is it JFFS2?
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
