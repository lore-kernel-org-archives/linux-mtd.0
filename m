Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjRCp-00024U-09
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2013 09:37:35 +0000
Message-ID: <1370252414.21714.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 1/4] mtd: cfi_cmdset_0002: Add support for reading OTP
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Date: Mon, 03 Jun 2013 12:40:14 +0300
In-Reply-To: <51A61274.70607@omicron.at>
References: <1367003430-24584-1-git-send-email-christian.riesch@omicron.at>
 <38c84e40-1171-4040-bc8b-ec51a0485819@mary.at.omicron.at>
 <1369811482.5446.216.camel@sauron.fi.intel.com>
 <51A5FA84.8030906@omicron.at>
 <1369835589.24286.31.camel@sauron.fi.intel.com> <51A61274.70607@omicron.at>
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

On Wed, 2013-05-29 at 16:36 +0200, Christian Riesch wrote:
> > But retlen is where you return the amount of bytes you actually
> wrote.
> > The return code is either 0 or a negative error code number. This is
> > what we do in mtd_write() and I'd expect the OTP functions to be
> > consistent.
> 
> Unlike mtd_write, mtd->_get_fact_prot_info (which is a pointer to 
> cfi_amdstd_get_fact_prot_info here) does not have a retlen parameter.
> Do 
> you suggest to change this?

Yes, I would suggest this.

-- 
Best Regards,
Artem Bityutskiy
