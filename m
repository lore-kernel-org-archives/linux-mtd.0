Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDcKD-00087T-CH
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2016 19:19:50 +0000
Subject: Re: [PATCH] mtd: nand: xway: fix build undefined MODULE_DEVICE_TABLE()
To: Hauke Mehrtens <hauke@hauke-m.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20161130225110.10759-1-hauke@hauke-m.de>
 <20161201133627.38953fb0@bbrezillon>
 <d9847313-cb0b-5cdc-b70f-5fa3f5638473@phrozen.org>
 <20161201144706.6757b632@bbrezillon>
 <098516d2-89e7-3c7a-9c52-4ab46671e355@phrozen.org>
 <6d1536a4-a712-e7bf-5b0f-998ac6a8d829@hauke-m.de>
Cc: richard@nod.at, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 cyrille.pitchen@atmel.com, computersforpeace@gmail.com, dwmw2@infradead.org
From: John Crispin <john@phrozen.org>
Message-ID: <bdf8a3a3-f58a-5115-7e84-84199f8b2b0d@phrozen.org>
Date: Sun, 4 Dec 2016 20:19:21 +0100
MIME-Version: 1.0
In-Reply-To: <6d1536a4-a712-e7bf-5b0f-998ac6a8d829@hauke-m.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 04/12/2016 20:15, Hauke Mehrtens wrote:
> I also do not like this ebu integration. the ebu lock is also a problem.

yep, the lock is needed for pci to work. its really ugly i agree.

	John
