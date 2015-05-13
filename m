Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsQ7c-0004IW-66
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 06:26:25 +0000
Received: by wicnf17 with SMTP id nf17so42394920wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 23:26:01 -0700 (PDT)
Received: from [192.168.1.103] (adsl-220.37.6.44.tellas.gr. [37.6.44.220])
 by mx.google.com with ESMTPSA id ei8sm31180383wjd.32.2015.05.12.23.26.00
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Tue, 12 May 2015 23:26:00 -0700 (PDT)
Message-ID: <5552EE77.8050202@gmail.com>
Date: Wed, 13 May 2015 09:25:59 +0300
From: Michael Niarchos <michael.niarchos@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Cannot mount ubifs partition
References: <5552EE30.8060203@gmail.com>
In-Reply-To: <5552EE30.8060203@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13-May-15 06:05, Brian Norris wrote:
> On Tue, May 12, 2015 at 10:38:31PM +0300, Michael N wrote:
>> I am using a Zynq7000 with NAND 512MB and I am trying to deploy Linux on NAND
>> memory. I use a custom built kernel with minimal features (UBI and UBIFS
>> support are enabled and mtd-utils installed). I can ubiformat an mtd
>> partition, I
>> can ubiattach and ubidetach it but whenever I try to mount the
>> partition I get this error.
>>
>>             mount: mounting /dev/ubi0:ubi-rootfs on /mnt/ubifs failed:
>> No such device
> What's the exact mount command you're running? Did you take a look at
> the MTD FAQ?
>
> http://linux-mtd.infradead.org/faq/ubifs.html#L_mount_ubif

I am running this command:

$ mount -t ubifs ubi0:ubi-rootfs /mnt/ubifs

>> (ubi-rootfs is the name of the partition, I am sure about it)
> Brian
>
