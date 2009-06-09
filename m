Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1243432517.11172.32.camel@localhost.localdomain>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 09 Jun 2009 14:38:07 +0100
Message-Id: <1244554687.4538.16.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: vishak.g@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-27 at 16:55 +0300, Artem Bityutskiy wrote:
> On Mon, 2009-05-25 at 16:22 +0530, apgmoorthy wrote:
> > I tried on the MTD Git  and have seen the warning as you mentioned.
> > '#ifndef MODULE' around the function 'flexonenand_setup' should help
> > to get away with that warning.
> > We will post a patch.
> 
> Does this mean that if I build OneNAND as a module I have no
> possibility to define FlexOneNAND boundary?
> 
> Sorry if I missed the discussion, but why you cannot use something
> like 'module_param_array()' ?

That certainly seems like it would be the best answer.
Can we have a patch to do that please?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
