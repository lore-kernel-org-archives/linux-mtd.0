Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsQAm-0005F1-5v
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 06:29:40 +0000
Received: by wgnd10 with SMTP id d10so30166781wgn.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 23:29:17 -0700 (PDT)
Message-ID: <5552EF3B.1070506@gmail.com>
Date: Wed, 13 May 2015 09:29:15 +0300
From: Michael Niarchos <michael.niarchos@gmail.com>
MIME-Version: 1.0
To: =?ISO-2022-JP?B?IkJlYW4gSHVvIBskQnA5SUxJTBsoQiAoYmVhbmh1byki?=
 <beanhuo@micron.com>
Subject: Re: Cannot mount ubifs partition
References: <mailman.43705.1431478462.22890.linux-mtd@lists.infradead.org>
 <A765B125120D1346A63912DDE6D8B631013AF1DC@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B631013AF1DC@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13-May-15 04:57, Bean Huo 霍斌斌 (beanhuo) wrote:
> 
>> I am using a Zynq7000 with NAND 512MB and
>> I am trying to deploy Linux on NAND memory.
>> I use a custom built kernel with minimal features
>> (UBI and UBIFS support are enabled and mtd-utils installed).
>> I can ubiformat an mtd partition, I can ubiattach and ubidetach it but whenever
>> I try to mount the partition I get this error.
> 
>             >mount: mounting /dev/ubi0:ubi-rootfs on /mnt/ubifs failed:
>> No such device
> 
>> (ubi-rootfs is the name of the partition, I am sure about it)
> 
>> I am sorry if I am asking about a problem that has been reported before, but I am new to this list
> 
>> Thanks in advance,
>> Michael
> 
> Hi, Michael
> 
> Do you have create a ubi volume ubi-rootfs on this mtd device ?
> 
> ubimkvol /dev/ubi0 -N ubi-rootfs -m
> 

I have created a ubi volume in u-boot with the following commands.

	ubi part nand-rootfs
	ubi create ubi-rootfs

"nand-rootfs is the name of the nand partition"
