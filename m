Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Q95Z-0001jF-00
	for mtd-list@infradead.org; Tue, 06 Feb 2001 14:27:25 +0000
Received: from d167.as5200.mesatop.com ([208.164.122.167] helo=localhost.localdomain)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Q95X-0001j9-00
	for mtd@infradead.org; Tue, 06 Feb 2001 14:27:24 +0000
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (Postfix) with SMTP id 3F86B3A5
	for <mtd@infradead.org>; Tue,  6 Feb 2001 07:30:11 -0700 (MST)
From: Steven Cole <elenstev@mesatop.com>
Reply-To: elenstev@mesatop.com
Date: Tue, 6 Feb 2001 07:30:11 -0700
Content-Type: text/plain;
  charset="us-ascii"
Subject: Re: [PATCH] 2.4.1-ac3 CONFIG_INPUT documentation in Configure.help
To: mtd@infradead.org
MIME-Version: 1.0
Message-Id: <01020607301103.02799@localhost.localdomain>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Tuesday 06 February 2001 02:46, David Woodhouse wrote:
> elenstev@mesatop.com said:
> >  Now, only  496 undocumented config options in the 2.4.1-ac3 tree left
> > to go, out of a total of 1982, of which 40 are apparently unused.
>
> There are quite possibly some MTD related ones already in my CVS which I've
> forgotten to flush in the last set of patches. Don't hesitate to poke me
> (please Cc mtd@infradead.org in the hope that someone else will do it
> instead though :)

It looks like the following MTD related config options have no help in
Configure.help:

CONFIG_MTD_CFI_AMDSTD
CONFIG_MTD_DEBUG
CONFIG_MTD_DEBUG_VERBOSE
CONFIG_MTD_DOCPROBE_55AA
CONFIG_MTD_DOCPROBE_ADDRESS
CONFIG_MTD_DOCPROBE_HIGH
CONFIG_MTD_PHYSMAP_BUSWIDTH
CONFIG_MTD_PMC551_DEBUG
CONFIG_MTD_PNC2000
CONFIG_MTD_RAM
CONFIG_MTDRAM_ERASE_SIZE
CONFIG_MTDRAM_TOTAL_SIZE
CONFIG_MTD_ROM

Steven



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
