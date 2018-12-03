Received: from mx0a-0028f201.pphosted.com ([148.163.150.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTtO4-0000mx-Tr
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 18:56:10 +0000
To: <tglx@linutronix.de>
CC: <linux-mtd@lists.infradead.org>, <boris.brezillon@bootlin.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <beanhuo@micron.com>
From: Piotr Wojtaszczyk <wojtaszczykp@cumminsallison.com>
Subject: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial erase issue
Message-ID: <2acabca0-cc7a-6655-8bd9-592b516f58a2@cumminsallison.com>
Date: Mon, 3 Dec 2018 12:55:46 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 Nov 2018 22:12:50 +0100 (CET)
Thomas Gleixner <tglx at linutronix.de> wrote:

 > On some Micron NAND chips block erase fails occasionaly despite the chip
 > claiming that it succeeded. The flash block seems to be not completely
 > erased and subsequent usage of the block results in hard to decode 
and very
 > subtle failures or corruption.

Doesn't UBI check block after erase in do_sync_erase()? Do the bitflips 
develop over time?

--

Peter
