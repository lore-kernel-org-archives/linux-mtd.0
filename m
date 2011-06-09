Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUeIG-0006Cn-7c
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 12:25:00 +0000
Received: by wyb28 with SMTP id 28so1439405wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 05:24:56 -0700 (PDT)
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
In-Reply-To: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 15:20:37 +0300
Message-ID: <1307622037.7374.81.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-09 at 12:24 +0200, Gilles wrote:
> Hello
> 
> 	I went through the docs/FAQs on the site and elsewhere, and
> proceeded to create a Ubifs root filesystem and flash a NAND partition
> with it.
> However, "ubiattach" fails, so I guess I didn't use the right settings
> in mkfs.ubifs and/or ubinize and/or ubiformat for use with that NAND
> partition.
> 
> Here are the steps I took:
> ==============
> #First, get infos about NAND
> appliance:/> mtdinfo /dev/mtd2 -u
> mtd2
> Name:                           filesystem_nand
> Type:                           nand
> Eraseblock size:                131072 bytes, 128.0 KiB
> Amount of eraseblocks:          1984 (260046848 bytes, 248.0 MiB)
> Minimum input/output unit size: 2048 bytes
> Sub-page size:                  512 bytes
> OOB size:                       64 bytes
> Character device major/minor:   90:4
> Bad blocks are allowed:         true
> Device is writable:             true
> Default UBI VID header offset:  512
> Default UBI data offset:        2048
> Default UBI LEB size:           129024 bytes, 126.0 KiB
> Maximum UBI volumes count:      128
> ==============
> #Create root filesystem
> ubuntu:/> mkfs.ubifs --squash-uids -m 2048 -e 131072 -c 1984 -d

Use  -e 129024

P.S. Yes, I realize the options are inconsistent, and will happily
accept a clean-up :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
