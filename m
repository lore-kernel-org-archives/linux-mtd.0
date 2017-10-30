Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9IZ0-00032Q-HP
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 22:29:48 +0000
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v2 1/1] mtd: intel-spi: Add Intel Lewisburg PCH SPI super
 SKU PCI ID
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sathyaosid@gmail.com
References: <20171029195809.GH29656@lahna.fi.intel.com>
 <77788f0c0cf55ee9fc0087364827da28c6951180.1509315023.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20171030073241.GI29656@lahna.fi.intel.com>
 <ae3620ec-293e-458e-76b1-5c13e0cdc992@wedev4u.fr>
From: sathyanarayanan kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <754005b2-fea7-91f3-b526-c325de2ad6bf@linux.intel.com>
Date: Mon, 30 Oct 2017 15:28:46 -0700
MIME-Version: 1.0
In-Reply-To: <ae3620ec-293e-458e-76b1-5c13e0cdc992@wedev4u.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi,


On 10/30/2017 03:58 AM, Cyrille Pitchen wrote:
> Applied to the spi-nor/next branch of l2-mtd
>
> Just for info, this patch didn't apply directly, it misses a line in the list of
> PCI IDS:
>
>   	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
I re-based my patch on top of Mika's SPI support patch. And it applied 
cleanly on top of 4.14-rc6 kernel. Not sure where the problem was?

http://git.infradead.org/l2-mtd.git/commitdiff/d92b0f18a2039ff736b4296ad3cf3d505512051e

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer
