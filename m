Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD915-00084K-Aq
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 07:43:59 +0000
Message-ID: <1362555878.21850.9.camel@sauron>
Subject: Re: [PATCH 02/11] mtd: decommission the NAND museum
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 06 Mar 2013 09:44:38 +0200
In-Reply-To: <5136F0FA.5080905@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
 <1362489444-27762-3-git-send-email-dedekind1@gmail.com>
 <5136F0FA.5080905@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 23:32 -0800, Brian Norris wrote:
> > -config MTD_NAND_MUSEUM_IDS
> > -	bool "Enable chip ids for obsolete ancient NAND devices"
> > -	default n
> > -	help
> > -	  Enable this option only when your board has first generation
> > -	  NAND chips (page size 256 byte, erase size 4-8KiB). The IDs
> > -	  of these chips were reused by later, larger chips.
> 
> Note the keyword "reused"! Only a few of them were reused though. I 
> marked all the repeats below. I don't know what we can do with that, 
> though. Can we cut the repeats?

Yeah, let me cut the repeats, and put a big comment to the iron age
block that there is a risk of repeating, and the strategy is to kill the
old records.

And thanks a lot for review!

-- 
Best Regards,
Artem Bityutskiy
