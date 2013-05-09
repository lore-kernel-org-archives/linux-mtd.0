Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaTWn-0007bS-93
 for linux-mtd@lists.infradead.org; Thu, 09 May 2013 16:17:09 +0000
Message-ID: <518BCBF6.5030502@newsguy.com>
Date: Thu, 09 May 2013 09:16:54 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 13/26] mtd: nand: docg4: remove unnecessary
 platform_set_drvdata()
References: <005101ce4aec$f89a6b90$e9cf42b0$@samsung.com>
In-Reply-To: <005101ce4aec$f89a6b90$e9cf42b0$@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/06/2013 11:34 PM, Jingoo Han wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
> (device-core: Ensure drvdata = NULL when no driver is bound).
> Thus, it is not needed to manually clear the device driver data to NULL.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Mike Dunn <mikedunn@newsguy.com>

Thanks!

Mike
