Received: from nz-out-0506.google.com ([64.233.162.233])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IrmcY-0004Kt-W7
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 22:39:33 -0500
Received: by nz-out-0506.google.com with SMTP id z3so1000549nzf
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Nov 2007 19:39:21 -0800 (PST)
Message-ID: <49eab5c80711121939k1f9c8295wf77eef20af0ba405@mail.gmail.com>
Date: Tue, 13 Nov 2007 11:39:20 +0800
From: "falls huang" <falls.huang@gmail.com>
To: gangadhark@tataelxsi.co.in
Subject: Re: NFTL for using FAT file system on NAND data partition
In-Reply-To: <VSNLCHNFE0022TRqf6900010119@VSNLCHNFE002.VSNLXCHANGE.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0711121450r553ba5fo12f6c676fa79c3fe@mail.gmail.com>
	<VSNLCHNFE0022TRqf6900010119@VSNLCHNFE002.VSNLXCHANGE.COM>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
> I am working on I.MX21 based application which has Linux kernel 2.4.20 from
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
> Version: 7.5.503 / Virus Database: 269.15.30/1126 - Release Date: 11/12/2007
> 12:56 PM
>
>
>
> The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.
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
