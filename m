Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWmP-0000z7-A4
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:11:30 +0000
Subject: Re: [PATCH] mtd: denali: remove calling mtd_device_unregister()
	after nand_release()
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Axel Lin <axel.lin@gmail.com>
In-Reply-To: <1307063535.10001.1.camel@phoenix>
References: <1307063535.10001.1.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 13:07:09 +0300
Message-ID: <1307354829.3112.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Iles <jamie@jamieiles.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Woodhouse <David.Woodhouse@intel.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 09:12 +0800, Axel Lin wrote:
> The implementation of nand_release() already call mtd_device_unregister(),
> no need to call it again.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
