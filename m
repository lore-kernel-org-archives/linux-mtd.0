Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhFrk-0008SG-No
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 09:06:49 +0000
Message-ID: <1369732174.5446.115.camel@sauron.fi.intel.com>
Subject: Re: UBIFS failure & stable page writes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Date: Tue, 28 May 2013 12:09:34 +0300
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE2D@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE2D@SI-MBX14.de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-05-28 at 10:15 +0200, Prins Anton (ST-CO/ENG1.1) wrote:
> Adding debug messages what I see is the 'recovery' takes place and when completed it starts looking for the root-node.
> Strange enough it looks in the TNC for the root node, cannot find it... but doesn't load further from media...

No, you can see from the code it is sprinkled with dbg_<xxx>() prints,
where "xxx" is a subsystem name. You can enable them. In your old kernel
this is probably about enabling them in Kconfig. See some docs here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_debug

-- 
Best Regards,
Artem Bityutskiy
