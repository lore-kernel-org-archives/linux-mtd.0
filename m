Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KdhET-0004Bd-TN
	for linux-mtd@lists.infradead.org; Thu, 11 Sep 2008 08:08:54 +0000
Message-ID: <48C8D247.4090601@gandalf.sssup.it>
Date: Thu, 11 Sep 2008 10:09:43 +0200
From: michael <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Erase Block size
References: <EE63F03D9E04774997AEBCD21FC77F25317838@ccomm-ex1.ccomm.com>
	<Pine.LNX.4.64.0809110900220.5390@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0809110900220.5390@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Sugathan,
	Rupesh" <rs@carriercomm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Ricard Wanderlof wrote:
> On Wed, 10 Sep 2008, Sugathan, Rupesh wrote:
>
>   
>> I have a scenario where I need to deploy the same jffs2 image on two
>> flash memory parts, one with a 128KB sector size and the other with
>> 256KB sector size.
>>
>> I read from http://www.linux-mtd.infradead.org/doc/jffs2.html that
>> building the jffs2 image with smaller 'erase block size' should be
>> harmless even in the flash with 256KB sector size, although there might
>> be some warning messages at mount time. However, the warning messages
>> are not desired since this is a production image.
>>
>> Can anyone tell me if there is any utility that can be used to alter the
>> erase block size on-the-fly? Or I would greatly appreciate if anyone has
>> some other solution to this problem.
>>     
You can use linux to flash image :). Erase the flash, mount it and 
install file.

Regards Michael
