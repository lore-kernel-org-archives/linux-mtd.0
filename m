Received: from bear.ext.ti.com ([192.94.94.41])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhSH6-0007vR-Ee
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 09:50:17 -0500
Message-ID: <01bf01c7027b$fc0334d0$5ef5180a@ent.ti.com>
From: "Anand Patil" <anandpatil@ti.com>
To: "Josh Boyer" <jwboyer@linux.vnet.ibm.com>
References: <000e01c7021f$d436ee80$5ef5180a@ent.ti.com>
	<1162899909.19697.13.camel@crusty.rchland.ibm.com>
Subject: Re: region_info_user and otp_info
Date: Tue, 7 Nov 2006 20:19:50 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="Windows-1252";
	reply-type=original
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

Josh,
           I got a AMD NOR Flash AM29LV256M,
           It supports a feature called as Secured Silicon Sector (i.e. a 
256 byte region which can be programmed only once)
           To access the above feature a particular command sequence has to 
be issued
            How can I  know whether the above feature is already 
incorporated in the MTD release OR
            else we need to support it at the driver layer?


Warm Regards,
Anand Patil
----- Original Message ----- 
From: "Josh Boyer" <jwboyer@linux.vnet.ibm.com>
To: "Anand Patil" <anandpatil@ti.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Tuesday, November 07, 2006 5:15 PM
Subject: Re: region_info_user and otp_info


> On Tue, 2006-11-07 at 09:20 +0530, Anand Patil wrote:
>> Hi,
>>        I am new bee to MTD user land,
>>
>>       1)  Iam not getting what region information refers to in MTD?
>
> Some chips have multiple erase regions.  These regions can have
> eraseblocks of different size than the rest of the chip.  That is what
> the structure is reporting.
>
>
>>     2) I did'nt get the purpose of the below strucuture defined and its
>> usage ?
>
> OTP stands for One Time Programmable.  Some chips have an area that is
> only writable once.  It can be used to store serial numbers, or whatever
> you'd like to store as long as you only need to write that information a
> single time.  That is what this structure is referring to.
>
> josh
>
> 
