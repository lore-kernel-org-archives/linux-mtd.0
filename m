Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8V2E-0002HF-Bm
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 13:18:31 +0000
Message-ID: <52E8FF94.7000101@denx.de>
Date: Wed, 29 Jan 2014 14:18:12 +0100
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Pekon Gupta <pekon@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v7 0/6] mtd: nand: omap: optimized chip->ecc.correct()
 for H/W ECC schemes
References: <1389942797-4632-1-git-send-email-pekon@ti.com>
In-Reply-To: <1389942797-4632-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17.01.2014 08:13, Pekon Gupta wrote:
> *changes v6 -> v7*
> [PATCH 1/6] <no change>
> [PATCH 2/6] <no change>
> [PATCH 3/6] <dropped older version, refer commit message>
>   - erased-page detection done based on count of zero-bits in OOB & DATA
>   - incorporated some feedbacks from Brian Norris <computersforpeace@gmail.com>
> 	http://lists.infradead.org/pipermail/linux-mtd/2014-January/051533.html
> 	http://lists.infradead.org/pipermail/linux-mtd/2014-January/051534.html
> [PATCH 4/6] <new> remove redundant bit-flip counting for erased-page
> [PATCH 5/6] <minor cleanup>
> [PATCH 6/6] <minor cleanup>
> (As there are functional changes in this version, so not attaching
>   Tested-by: Stefan Roese <sr@denx.de>)

Thanks, Pekon. This still fixes some problems we have seen on an AM335x 
board with ECC errors on UBI/UBIFS mounting. So for the whole patch series:

Tested-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
