Received: from vsnlchnsym01.vsnlxchange.com ([59.163.96.2])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Is0E8-0001Gr-D1
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 18:11:11 +0000
From: "Gangadhar Kodishala" <gangadhark@tataelxsi.co.in>
To: "'falls huang'" <falls.huang@gmail.com>
Subject: RE: NFTL for using FAT file system on NAND data partition
Date: Tue, 13 Nov 2007 10:10:38 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: 7bit
In-Reply-To: <49eab5c80711121939k1f9c8295wf77eef20af0ba405@mail.gmail.com>
Message-ID: <VSNLCHNFE00287Mi5ZN000118e5@VSNLCHNFE002.VSNLXCHANGE.COM>
Cc: linux-mtd@lists.infradead.org
Reply-To: gangadhark@tataelxsi.co.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Falls,

We may not move to 2.6.x for this application since all our other drivers
are 
based on the current version.

Why NFTL cannot be used on a bare nand chip ?

Please give me some more details on how I can use the yaffs and a loop file
for the
FAT file system ? We are already using the JFFS2 for the root file system
partition.
Can we use the JFFS2 with a loop file for FAT file system ?

Thanks.

Best Regards,
Gangadhar

-----Original Message-----
From: falls huang [mailto:falls.huang@gmail.com] 
Sent: Monday, November 12, 2007 7:39 PM
To: gangadhark@tataelxsi.co.in
Cc: linux-mtd@lists.infradead.org
Subject: Re: NFTL for using FAT file system on NAND data partition

Hello!

   Don't use NFTL on bare nand chip .

1.
   You can use yaffs  for your nand flash ,then create a loop file in
yaffs for fat filesystem.
2.
   upgrade to 2.6.x and try UBI .

2007/11/13, Gangadhar Kodishala <gangadhark@tataelxsi.co.in>:
> Hi All,
>
> I am working on I.MX21 based application which has Linux kernel 2.4.20
from
> Freescale.
>
> I created a data partition on the NAND device and planning to use this
> partition with FAT
> file system.
>
> How do I use the NAND data partition with FAT file system ?
> Did anyone use the NFTL drivers provided in Kernel for FAT filesystem ?
>
> Best Regards,
> Gangadhar
>
> No virus found in this outgoing message.
> Checked by AVG Free Edition.
> Version: 7.5.503 / Virus Database: 269.15.30/1126 - Release Date:
11/12/2007
> 12:56 PM
>
>
>
> The information contained in this electronic message and any attachments
to this message are intended for the exclusive use of the addressee(s) and
may contain proprietary, confidential or privileged information. If you are
not the intended recipient, you should not disseminate, distribute or copy
this e-mail. Please notify the sender immediately and destroy all copies of
this message and any attachments contained in it.
>
> Contact your Administrator for further information.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
Regards
Falls Huang

No virus found in this incoming message.
Checked by AVG Free Edition. 
Version: 7.5.503 / Virus Database: 269.15.30/1126 - Release Date: 11/12/2007
12:56 PM
 

No virus found in this outgoing message.
Checked by AVG Free Edition. 
Version: 7.5.503 / Virus Database: 269.15.31/1128 - Release Date: 11/13/2007
11:09 AM
 


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.

Contact your Administrator for further information.
