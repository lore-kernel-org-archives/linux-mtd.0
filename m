Date: Fri, 05 Apr 2013 09:18:43 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: ofpart: support partitions of 4 GB and larger
Message-ID: <79ec730f-9ead-4fd4-a861-abdf4cde6489@zimbra>
In-Reply-To: <1365161002.28127.101.camel@i7.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Joe Schaack <jschaack@xes-inc.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: "David Woodhouse" <dwmw2@infradead.org>
> Sent: Friday, April 5, 2013 6:23:22 AM
> Subject: Re: [PATCH v2] mtd: ofpart: support partitions of 4 GB and larger
> 
> On Thu, 2013-02-21 at 16:29 -0600, Aaron Sierra wrote:
> > +       /* an 8 GB partition */
> > +       partition@0 {
> > +               label = "filesystem #1";
> > +               reg = <0x0 0x00000000 0x2 0x00000000>;
> > +       };
> > +
> > +       /* a 4 GB partition */
> > +       partition@200000000 {
> > +               label = "filesystem #2";
> > +               reg = <0x2 0x00000000 0x1 0x00000000>;
> > +       };
> > +};
> 
> The comments here don't match the actual definitions. I fixed it to
> read
> as follows:
> 
> flash@2 {
> 	#address-cells = <2>;
> 	#size-cells = <2>;
> 
> 	/* an 8 GB partition */
> 	partition@0 {
> 		label = "filesystem #1";
> 		reg = <0x0 0x00000000 0x1 0xdcd65000>;
> 	};
> 
> 	/* a 4 GB partition */
> 	partition@200000000 {
> 		label = "filesystem #2";
> 		reg = <0x1 0xdcd65000 0x0 0xee6b2800>;
> 	};
> };

David,
Blame this on my vague use of GB. I assume things would have been
crystal clear if I'd used GiB. Is this already committed with your
change? Your version doesn't seem like a realistic partitioning
scheme based on likely device erase block sizes.

Is is possible to just update the comments?

- 	/* an 8 GB partition */
+ 	/* an 8 GiB partition */
...
- 	/* a 4 GB partition */
+ 	/* a 4 GiB partition */

-Aaron
