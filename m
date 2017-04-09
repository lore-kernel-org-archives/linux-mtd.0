Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxCti-000886-FJ
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 13:28:56 +0000
Date: Sun, 9 Apr 2017 15:28:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V3 2/3] mtd: add core code reading DT specified part probes
Message-ID: <20170409152821.585eb8a4@bbrezillon>
In-Reply-To: <20170409130406.564802a4@bbrezillon>
References: <20170331114016.26858-1-zajec5@gmail.com>
 <20170331114016.26858-2-zajec5@gmail.com>
 <20170409130406.564802a4@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 9 Apr 2017 13:04:06 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> static char **mtd_alloc_part_type_table(int nentries)

Oops, s/char **/const char **/

> {
> 	return kzalloc((nentries + 1) * sizeof(*res), GFP_KERNEL);
> }
> 
> static void mtd_free_part_type_table(const char * const *table)
> {
> 	kfree(table);
> }

I realize this might not be suitable for all kind of part-probes
definitions. Some might need to dynamically allocate each string and
expect the core to free them in mtd_free_part_type_table() (the one I
have in mind is the cmdline part-probes parser). Others already have
the strings statically defined or allocated and maintained somewhere
else (this is the case with DT which provides direct access to string
definitions), which means the core shouldn't free them.

I see 3 solutions to this problem:

1/ go back to your initial solution with DT specific functions, and
   wait until someone decides to implement another way to define
   part-probes (cmdline or ACPI) before considering a more complex
   solution
2/ always allocate strings dynamically and let
   mtd_free_part_type_table() free them. This implies using kstrdup() on
   strings returned by of_property_read_string_array()
3/ use something smarter to let the part-probes table creator free it,
   for example, by using something like:

	struct mtd_part_probes {
		const char * const *types;
		void (*free)(const char * const *types);
	}

#3 is overkill IMO. I'm fine with #1 and #2, pick the one you prefer.
