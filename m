Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18LtrS-0007Eh-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 23:32:22 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: "Christian Gan" <cgan@iders.ca>, <linux-mtd@lists.infradead.org>,
	"yaffs list" <yaffs@toby-churchill.org>
Subject: Re: NAND and concat
Date: Wed, 11 Dec 2002 12:58:16 +1300
References: <NFBBLPGPLKFIKCCPLALEOEPHCEAA.cgan@iders.ca>
In-Reply-To: <NFBBLPGPLKFIKCCPLALEOEPHCEAA.cgan@iders.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021211000255.6A0C2149A7@dragon.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm not sure I understand what you mean by concat for NAND. Do you mean being 
able to read/write directly to the char device?

Certainly handling OOB and pages makes things a bit different. Someone wrote 
a nand dumper which maybe does what you want (or can be persuaded :-). The 
yaffs format tool uses the char interface. It needs to expand to load up a 
mkyaffsimage image into flash.

-- CHarles
