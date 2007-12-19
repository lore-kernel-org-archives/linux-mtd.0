Received: from smail4.alcatel.fr ([62.23.212.167])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4v03-0003Zq-EX
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 09:14:05 +0000
Received: from bsf.alcatel.fr (mail205.sxb.bsf.alcatel.fr [155.132.205.115])
	by smail4.alcatel.fr (ALCANET/NETFR) with ESMTP id lBJ9D5Z9001362
	for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2007 10:13:07 +0100
Received: from mail (mail-bsf-alcatel-fr.sxb.bsf.alcatel.fr [155.132.205.91])
	by bsf.alcatel.fr (8.8.8p2+Sun/8.9.3) with ESMTP id KAA15305
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Dec 2007 10:13:04 +0100 (MET)
Received: from [172.25.53.29] (frilld0063502 [172.25.53.29])
	by mail (8.8.8p2+Sun/) with ESMTP id KAA15301
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Dec 2007 10:13:04 +0100 (MET)
Message-ID: <4768E0A0.5080700@alcatel-lucent.fr>
Date: Wed, 19 Dec 2007 10:13:04 +0100
From: Patrick Agrain <patrick.agrain@alcatel-lucent.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 errors - are these normal?
References: <3adeeb410712180743o77233e51pcb544e3c4b286712@mail.gmail.com>
	<Pine.LNX.4.64.0712190858010.21948@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0712190858010.21948@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ramesh ,

What Flash from ST have you tested ? Is it a 256MBytes ? Large Pages 
(2048 bytes) ?
What is the marking on the chip ?

Thanks in advance.
Regards,

Patrick Agrain

Ricard Wanderlof a écrit :
> On Tue, 18 Dec 2007, Ramesh wrote:
> 
>> Hi,
>>
>> I am using linux 2.6.19 and ST micro NAND chip (256M) on a PowerPC
>> platform. After booting the OS, we install firmware on to the flash.
>> These firmware images are RPM packages. Once some packages are
>> installed, we start getting some ECC errors. I guess that's fine but
>> after a few more RPM installs, the errors seem more serious. Here's a
>> sample:
> 
> You shouldn't be getting ECC errors that quickly, on a chip like that I 
> would expect it would take many months before you'd see an ECC error if 
> ever.
> 
> My guess without knowing more would be that there is a hardware problem 
> causing the communication with the nand chip to fail ever so often.
> 
>> The jffs2 image is created with the following flags: -e 0x20000 -s
>> 0x1000 -b -v -p -n
>> Then I use sumtool with -e 0x20000 -b -p.
> 
> If the device mounts properly then there shouldn't be much wrong with the 
> image.
> 
> /Ricard
> --
> Ricard Wolf Wanderlöf                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
