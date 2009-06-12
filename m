Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1244808209.5847.447.camel@localhost.localdomain>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 12 Jun 2009 13:52:36 +0100
Message-Id: <1244811156.3511.1219.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: vishak.g@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	Amul Saha <amul.saha@samsung.com>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-12 at 15:03 +0300, Artem Bityutskiy wrote:
> 
> > flexonenand_setup( ) call is needed only when it has been built as a
> module.
> 
> Why?

Because they're adding a 'flex_bdry_info' module parameter which is a
string, that they then process just the same way as the original command
line option.

I think that's the wrong approach -- please use module_param_array()
instead, so it sets the contents of the flex_bdry[] array directly and
you can remove the flexonenand_setup() function completely.

Please ensure that your email addresses in the Signed-off-by: line are
correct, too. None of this 'user at domain' nonsense.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
