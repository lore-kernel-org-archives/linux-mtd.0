Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOAia-0001cF-KE
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 13:28:26 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren <oren_s3@VERIFONE.com>
In-Reply-To: <1246972892.2208.5.camel@tlvorens3lnx>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
	<1246968515.2208.4.camel@tlvorens3lnx>
	<1246971115.20721.308.camel@localhost.localdomain>
	<1246972892.2208.5.camel@tlvorens3lnx>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jul 2009 16:28:12 +0300
Message-Id: <1246973292.20721.313.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-07-07 at 16:21 +0300, Oren wrote:
> ubinize: LEB size:      126976
> ubinize: PEB size:      131072
> ubinize: min. I/O size: 2048
> ubinize: sub-page size: 2048
> ubinize: VID offset:    2048
> ubinize: data offset:   4096
> ubinize: loaded the ini-file "images/ubinize.cfg"
> ubinize: count of sections: 1
> 
> ubinize: parsing section "ubifs"
> ubinize: mode=ubi, keep parsing
> ubinize: volume type: dynamic
> ubinize: volume ID: 0
> ubinize: volume size: 16777216 bytes
> ubinize: volume name: NAND-block1
> ubinize: volume alignment: 1
> ubinize: autoresize flags found
> ubinize: adding volume 0
> ubinize: writing volume 0
> ubinize: image file: images/ubifs_ncomp.img
> 
> ubinize: writing layout volume
> ubinize: done

OK, thanks. Can I please see what the kernel UBI is doing?

Could you please enable this option in the kernel config:

Device Drivers  --->
  <*> Memory Technology Device (MTD) support  --->
    UBI - Unsorted block images  --->
      Additional UBI debugging messages  --->
        [*] Additional UBI initialization and build messages

Then attach the UBI device, reproduce the problem, and give me UBI
output. I want to see what UBI finds on the flash. Please, refer
this section for more information about how to capture the debugging
messages:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
