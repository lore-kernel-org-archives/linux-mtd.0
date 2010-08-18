Received: from ussvlmgty02.spansion.com ([12.151.36.113])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OliIU-0004sL-Jz
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 13:03:15 +0000
Message-ID: <4C6BDA0E.2080404@spansion.com>
Date: Wed, 18 Aug 2010 15:03:10 +0200
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Re: [PATCH] mtd/nand: Spansion S30MLxxxP support
References: <1281652958-2354-1-git-send-email-norris@broadcom.com>
In-Reply-To: <1281652958-2354-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > Note that I am unsure about the wraparound nature of the ID string
 > here. I have not been able to fully test this with the physical chip.
 > Essentially, the rule is correct, but the ID string detection may fail
 > here. Let me know if anyone can fix this.

I have just tested this on a physical device (S30ML512P30TFE51).
Unfortunately, the extended device IDs are a little bit different so
the patch does not work yet. With a S30ML512P30TFE51, the device IDs
are as follows:

   id_data[0]=0x01
   id_data[1]=0x56
   id_data[2]=0x00
   id_data[3]=0x01
   id_data[4]=0x10
   id_data[5]=0x00
   id_data[6]=0x00
   id_data[7]=0x00

My suggestion would be to check the page size instead of the extended
IDs (seems like the patch applies to all Spansion S30ML devices with
small pages, i.e. 512 bytes). So you might write:

+		if (*maf_id == NAND_MFR_AMD && type->pagesize == 512) {
...

This works for me.
