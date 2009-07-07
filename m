Received: from cluster-g.mailcontrol.com ([208.87.233.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOBLl-0007oB-79
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 14:09:02 +0000
Received: from rly14g.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly14g.srv.mailcontrol.com (MailControl) with ESMTP id
	n67E8brT013755
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 15:08:46 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by rly14g.srv.mailcontrol.com (MailControl) id n67E8Itf010163
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jul 2009 15:08:18 +0100
Subject: Re: ubiattach problem
From: Oren <oren_s3@VERIFONE.com>
To: dedekind@infradead.org
In-Reply-To: <1246973292.20721.313.camel@localhost.localdomain>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
	<1246968515.2208.4.camel@tlvorens3lnx>
	<1246971115.20721.308.camel@localhost.localdomain>
	<1246972892.2208.5.camel@tlvorens3lnx>
	<1246973292.20721.313.camel@localhost.localdomain>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 7 Jul 2009 17:08:12 +0300
Message-ID: <1246975692.2208.7.camel@tlvorens3lnx>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I already have these option on.

#
# UBI - Unsorted block images
#
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_RESERVE=1
# CONFIG_MTD_UBI_GLUEBI is not set

#
# UBI debugging options
#
CONFIG_MTD_UBI_DEBUG=y
CONFIG_MTD_UBI_DEBUG_MSG=y
CONFIG_MTD_UBI_DEBUG_PARANOID=y
CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y
CONFIG_MTD_UBI_DEBUG_USERSPACE_IO=y
# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set

#
# Additional UBI debugging messages
#
CONFIG_MTD_UBI_DEBUG_MSG_BLD=y
CONFIG_MTD_UBI_DEBUG_MSG_EBA=y
CONFIG_MTD_UBI_DEBUG_MSG_WL=y
CONFIG_MTD_UBI_DEBUG_MSG_IO=y

On Tue, 2009-07-07 at 16:28 +0300, Artem Bityutskiy wrote:
> On Tue, 2009-07-07 at 16:21 +0300, Oren wrote:
> > ubinize: LEB size:      126976
> > ubinize: PEB size:      131072
> > ubinize: min. I/O size: 2048
> > ubinize: sub-page size: 2048
> > ubinize: VID offset:    2048
> > ubinize: data offset:   4096
> > ubinize: loaded the ini-file "images/ubinize.cfg"
> > ubinize: count of sections: 1
> > 
> > ubinize: parsing section "ubifs"
> > ubinize: mode=ubi, keep parsing
> > ubinize: volume type: dynamic
> > ubinize: volume ID: 0
> > ubinize: volume size: 16777216 bytes
> > ubinize: volume name: NAND-block1
> > ubinize: volume alignment: 1
> > ubinize: autoresize flags found
> > ubinize: adding volume 0
> > ubinize: writing volume 0
> > ubinize: image file: images/ubifs_ncomp.img
> > 
> > ubinize: writing layout volume
> > ubinize: done
> 
> OK, thanks. Can I please see what the kernel UBI is doing?
> 
> Could you please enable this option in the kernel config:
> 
> Device Drivers  --->
>   <*> Memory Technology Device (MTD) support  --->
>     UBI - Unsorted block images  --->
>       Additional UBI debugging messages  --->
>         [*] Additional UBI initialization and build messages
> 
> Then attach the UBI device, reproduce the problem, and give me UBI
> output. I want to see what UBI finds on the flash. Please, refer
> this section for more information about how to capture the debugging
> messages:
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug
> 
