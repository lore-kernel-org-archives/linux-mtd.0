Received: from rv-out-0708.google.com ([209.85.198.241])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KdtsQ-0001LV-0f
	for linux-mtd@lists.infradead.org; Thu, 11 Sep 2008 21:38:58 +0000
Received: by rv-out-0708.google.com with SMTP id b17so659623rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Sep 2008 14:38:56 -0700 (PDT)
Message-ID: <8bd0f97a0809111438r1cc7228al892edd621d4f4588@mail.gmail.com>
Date: Thu, 11 Sep 2008 17:38:56 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: fundu_1999@yahoo.com
Subject: Re: Flash Mapping and gpio
In-Reply-To: <684880.57070.qm@web63404.mail.re1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8bd0f97a0809111428o168053a8n6dac603529ad3d23@mail.gmail.com>
	<684880.57070.qm@web63404.mail.re1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 11, 2008 at 17:34, Fundu wrote:
>> you shouldnt go mucking about in common code.  this is what
>> flash
>> mapping drivers are for.
>>
>> ive already written a generic gpio one to do exactly what
>> you want
>> (but it's only been tested on nommu/Blackfin so far):
>> http://blackfin.uclinux.org/git/?p=readonly-mirrors/linux-kernel.git;a=blob_plain;f=drivers/mtd/maps/gpio-addr-flash.c;hb=HEAD
>
> these are on 2.6 kernel. i'm using 2.4.20.

didnt realize anyone ran ancient cruft like that anymore.  big waste
of time.  g'luck.
-mike
