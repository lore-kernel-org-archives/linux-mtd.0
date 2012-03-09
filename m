Received: from mga03.intel.com ([143.182.124.21])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5vlX-00039P-LI
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:05:37 +0000
Message-ID: <1331284067.22872.33.camel@sauron.fi.intel.com>
Subject: Re: UBI: infinite error loop
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Patrick <kpa_info@yahoo.fr>
Date: Fri, 09 Mar 2012 11:07:47 +0200
In-Reply-To: <1330090528.12272.YahooMailNeo@web29011.mail.ird.yahoo.com>
References: <1330090528.12272.YahooMailNeo@web29011.mail.ird.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-02-24 at 13:35 +0000, Patrick wrote:
> I don't think it's normal that this error loop infinitely again and again...
> 
> Any help is appreciated !

You've got help AFAICS. I agree that an infinite loop is not normal. But
the right thing for UBI to do in this situation would be to mark all
your eraseblocs as bad, which is not what you want I guess, so it is
probably better to have this infinite loop?

-- 
Best Regards,
Artem Bityutskiy
