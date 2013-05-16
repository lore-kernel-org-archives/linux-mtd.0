Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucsp3-0002FW-Fy
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 07:41:57 +0000
Message-ID: <1368690236.15764.178.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: docg4: add udelay(1) to polling loop
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 16 May 2013 10:43:56 +0300
In-Reply-To: <1366654990-15392-1-git-send-email-mikedunn@newsguy.com>
References: <1366654990-15392-1-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-04-22 at 11:23 -0700, Mike Dunn wrote:
>  	timeo = 1000;
>  	do {
> +		udelay(1);
>  		cpu_relax();
>  		flash_status = readb(docptr + DOC_FLASHCONTROL);
>  	} while (!(flash_status & DOC_CTRL_FLASHREADY) && --timeo);

How about using jiffies instead? Something like:

timeout = jiffies + msecs_to_jiffies(delay);
do {
} while (time_before(jiffies, timeout))

-- 
Best Regards,
Artem Bityutskiy
