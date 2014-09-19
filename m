Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XV197-0000Co-1M
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 16:34:57 +0000
Received: by mail-pa0-f50.google.com with SMTP id fa1so418997pad.23
 for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2014 09:34:35 -0700 (PDT)
Date: Fri, 19 Sep 2014 09:34:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Message-ID: <20140919163431.GE1193@ld-irv-0074>
References: <1408345720-5402-1-git-send-email-josh.wu@atmel.com>
 <20140918003258.GD1193@ld-irv-0074> <541A92E3.60906@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <541A92E3.60906@atmel.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, galak@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 18, 2014 at 04:08:03PM +0800, Josh Wu wrote:
> On 9/18/2014 8:32 AM, Brian Norris wrote:
> >On Mon, Aug 18, 2014 at 03:08:40PM +0800, Josh Wu wrote:
> >>+static int pmecc_build_galois_table(int mm,
> >>+		int16_t *index_of, int16_t *alpha_to)
> >>+{
...
> >>+}
> >Is this algorithm documented? How did you come up with this?
> 
> It is not documented in datasheet. It is based BCH algorithm. But do
> you know if the soft BCH use a same table like this?

I haven't delved into the algorithms here too much. Other BCH/ECC codes
do similar steps, but either (1) there's usually a few comments about
their origin or else (2) they're transparently handled by hardware ECC
engines and software doesn't need to care about the details much.

Brian
