Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e97mt-0005p8-Da
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 10:59:25 +0000
Subject: Re: [PATCH v2 1/1] mtd: intel-spi: Add Intel Lewisburg PCH SPI super
 SKU PCI ID
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 sathyanarayanan.kuppuswamy@linux.intel.com
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sathyaosid@gmail.com
References: <20171029195809.GH29656@lahna.fi.intel.com>
 <77788f0c0cf55ee9fc0087364827da28c6951180.1509315023.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20171030073241.GI29656@lahna.fi.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <ae3620ec-293e-458e-76b1-5c13e0cdc992@wedev4u.fr>
Date: Mon, 30 Oct 2017 11:58:58 +0100
MIME-Version: 1.0
In-Reply-To: <20171030073241.GI29656@lahna.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 30/10/2017 à 08:32, Mika Westerberg a écrit :
> On Sun, Oct 29, 2017 at 03:17:35PM -0700, sathyanarayanan.kuppuswamy@linux.intel.com wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> This patch adds Intel Lewisburg PCH SPI serial flash controller super
>> SKU PCI ID.
>>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 

Applied to the spi-nor/next branch of l2-mtd

Just for info, this patch didn't apply directly, it misses a line in the list of
PCI IDS:

 	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },

Best regards,

Cyrille
