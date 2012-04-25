Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN4G8-0007RV-8M
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 15:36:01 +0000
Message-ID: <4F9819D7.8000301@newsguy.com>
Date: Wed, 25 Apr 2012 08:35:51 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 5/7] mtd: nand: read_page() returns max_bitflips
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-6-git-send-email-mikedunn@newsguy.com>
 <4F9702E8.2070106@freescale.com>
In-Reply-To: <4F9702E8.2070106@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Nick Spence <nick.spence@freescale.com>, linux-mtd@lists.infradead.org,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Jamie Iles <jamie@jamieiles.com>,
 Axel Lin <axel.lin@gmail.com>, Roy Zang <tie-fei.zang@freescale.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/24/2012 12:45 PM, Scott Wood wrote:
> 
> I'd prefer to clear max_bitflips before this if-block, so that we can
> rely on max_bitflips being zero when ECC wasn't requested.
> 
> Otherwise ACK the eLBC and IFC changes.


Thanks for the ACK Scott.  I'll include your preference in the next version of
the patches.

Mike
