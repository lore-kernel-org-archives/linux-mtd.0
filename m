Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmEVV-0001sT-JU
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 03:45:01 +0000
Date: Mon, 19 May 2014 00:43:55 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/4] mtd: Add sysfs attr to expose ECC stats
Message-ID: <20140519034355.GB1062@arch.cereza>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB91D7@DBDE04.ent.ti.com>
 <20140401111359.GA3324@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EAC31AE@DBDE04.ent.ti.com>
 <20140513005053.GZ28907@ld-irv-0074>
 <20140513022614.GA1447@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140513022614.GA1447@arch.cereza>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 May 11:26 PM, Ezequiel Garcia wrote:
> On 12 May 05:50 PM, Brian Norris wrote:
> > > There are some guidelines about attributes in 'Documentation/filesystems/sysfs.txt'
> > > Though it's acceptable to put array of values of the "same type" in single sysfs file,
> > > But I'm still not confident on having all members of 'struct ecc_stats' being
> > > represented by single sysfs file
> > [...]
> > 
> > I agree, it looks like the sysfs policy would recommend against putting
> > distinct properties in the same file.
> > 
[..]
> > So I personally might lean toward "one file per attribute" here.
> > 

Brian,

Having agreed on doing one file per attribute, I'm now not sure how to
name them. Maybe you can give me a hand?

Let me add some context: these are the per-MTD partition fields of the
mtd_ecc_stats struct, although two of them aren't related to ECC, but to
the bad blocks management. This is the struct:

struct mtd_ecc_stats {
        __u32 corrected;
        __u32 failed;
        __u32 badblocks;
        __u32 bbtblocks;
};

How about the following?

* corrected_bits
* uncorrectable_errors
* badblocks
* bbtblocks
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
