Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NHz3D-0001Kn-Ll
	for linux-mtd@lists.infradead.org; Tue, 08 Dec 2009 12:20:24 +0000
Subject: Re: [RFC] [PATCH] [MTD-UTILS]: flash_lock: fix length being passed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790912020628n5e91f811haa56b6380a71ab32@mail.gmail.com>
References: <ce9ab5790912020628n5e91f811haa56b6380a71ab32@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Dec 2009 14:19:51 +0200
Message-Id: <1260274791.19669.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-02 at 19:58 +0530, Vimal Singh wrote:
> This patch fixes the 'length' calculation.
> Making it:
> +       mtdLockInfo.length = (num_sectors - 1) * mtdInfo.erasesize;
> Rather:
> -       mtdLockInfo.length = num_sectors * mtdInfo.erasesize;
> 
> Say there are 240 blocks present in the device. Then:
> offset starts from: 0x0
> and full size of device: 0x1E00000
> 
> doing: 240 * 0x20000 gives -> 0x1E00000
> But last block address should be 0x1DE0000 (which spans for 0x20000
> bytes, adding upto size of 0x1E00000)
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
