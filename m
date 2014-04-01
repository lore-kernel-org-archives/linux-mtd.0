Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUweg-0004uk-7C
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 11:14:59 +0000
Date: Tue, 1 Apr 2014 08:13:59 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 1/4] mtd: Add sysfs attr to expose ECC stats
Message-ID: <20140401111359.GA3324@arch.cereza>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB91D7@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB91D7@DBDE04.ent.ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Pekon,

On Mar 27, Gupta, Pekon wrote:
> >
> >+static ssize_t mtd_ecc_stats_show(struct device *dev,
> >+		struct device_attribute *attr, char *buf)
> >+{
> >+	struct mtd_info *mtd = dev_get_drvdata(dev);
> >+	struct mtd_ecc_stats *ecc_stats = &mtd->ecc_stats;
> >+
> >+	return snprintf(buf, PAGE_SIZE, "%8u %8u %8u %8u\n", ecc_stats->corrected,
> >+						ecc_stats->failed,
> >+						ecc_stats->badblocks,
> >+						ecc_stats->bbtblocks);
> Though I would have liked to see each field of ecc_stats as a separate sysfs entry

I tried to match the ecc_stats structure exactly in the sysfs entry. Keep
in mind creating/keeping a sysfs file has its cost. Since it's trivial
to get one of the fields with any text parsing tool I didn't think having
a file per stat was worth it.

> But, I don't know what it impacts to keep it different from /sys/block/<device>/stat
> Do you know any user-space tools which utilize these, and can be re-used on
> UBI-block kind of layer, if we keep this compatibility ?
> 

It won't impact as they are two completely different things. The ecc_stats
output is only "vaguely inspired" in block stats; but these are two completely
different stats. It's not about tool reusability, but about consistency.

> Also, How about printing what these numbers mean ?
> I hope this will still keep it machine readable.

Well, this is not a debugfs entry, so I'm not sure we want to add such debug
information. Anyone can take a look at the code and see what ecc_stats mean.

On the other side, I don't have a strong opinion on this.

> 
> Also please update "Documentation/ABI/testing/sysfs-class-mtd"
> with details about 'ecc_stats'
> 

OK, I will.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
