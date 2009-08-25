Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mfx7F-0000wT-Rt
	for linux-mtd@lists.infradead.org; Tue, 25 Aug 2009 14:35:22 +0000
Message-ID: <4A93F68E.30303@gmail.com>
Date: Tue, 25 Aug 2009 17:34:54 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Ivan Li <lijinlei1@163.com>
Subject: Re: Error creating FAT32 over Nand flash
References: <6CF41D77BA9F4BC5856D0031BA902A85@ivan>
	<D6830EA55F9F4A9FBCD742B09BE98D9F@ivan>
In-Reply-To: <D6830EA55F9F4A9FBCD742B09BE98D9F@ivan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/25/2009 05:21 PM, Ivan Li wrote:
> Some progress for it: I found the sector number mentioned in error message resides in BAD block.
> Is there any fix for that?

Yes, do not use mtdblock but write a real FTL layer.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
