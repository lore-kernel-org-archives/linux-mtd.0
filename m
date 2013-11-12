Received: from smtprelay0057.hostedemail.com ([216.40.44.57]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg27O-0006Ma-69
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 00:46:10 +0000
Message-ID: <1384217148.4771.9.camel@joe-AO722>
Subject: Re: [PATCH] block: cmdline-parser: perfect cmdline format checking
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 11 Nov 2013 16:45:48 -0800
In-Reply-To: <20131111153420.d4e9c4ef2a90e70bfb01fd83@linux-foundation.org>
References: <C3050A4DBA34F345975765E43127F10F1C08B3FB@szxeml512-mbs.china.huawei.com>
 <20131111153420.d4e9c4ef2a90e70bfb01fd83@linux-foundation.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "fengguang.wu@intel.com" <fengguang.wu@intel.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Caizhiyong <caizhiyong@hisilicon.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-11-11 at 15:34 -0800, Andrew Morton wrote:
> On Sat, 9 Nov 2013 11:45:14 +0000 Caizhiyong <caizhiyong@hisilicon.com> wrote:
[]
> >  -perfect cmdline format checking, make the error information clear
> >   for understand, make this lib fully equivalent to the old parser
> >   in drivers/mtd/cmdlinepart.c
> > 
> > ...
> >
> > +#define PARSER                       "cmdline-parser: "
> > ...
> > -			pr_warn("cmdline partition size is invalid.");
> > +			pr_warn(PARSER "partition '%s' size '0x%llx' too small.",
> 
> You can use the standard pr_fmt() mechanism instead of this.
[]
> diff -puN block/cmdline-parser.c~mtd-cmdlinepart-use-cmdline-partition-parser-lib-fix block/cmdline-parser.c
[]
> @@ -21,10 +26,12 @@ static int parse_subpart(struct cmdline_
>  	if (*partdef == '-') {
>  		new_subpart->size = (sector_t)(~0ULL);
>  		partdef++;
> +		lastpart = 1;
>  	} else {
>  		new_subpart->size = (sector_t)memparse(partdef, &partdef);
>  		if (new_subpart->size < (sector_t)PAGE_SIZE) {
> -			pr_warn("cmdline partition size is invalid.");
> +			pr_warn(PARSER "partition '%s' size '0x%llx' too small.",
> +				partorg, new_subpart->size);

As well, please add terminating '\n' newlines to all the formats.
This helps avoid possible logging message interleaving.
