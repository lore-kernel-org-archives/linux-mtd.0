Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpGXE-0000Gr-Oh
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 12:31:19 +0000
Date: Tue, 27 May 2014 09:30:17 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2 for v3.15 0/3] UBI: block: Support very large volumes
Message-ID: <20140527123017.GA1655@arch.cereza>
References: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1401188546.1304.128.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1401188546.1304.128.camel@sauron.fi.intel.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 May 02:02 PM, Artem Bityutskiy wrote:
> On Mon, 2014-05-05 at 07:11 -0300, Ezequiel Garcia wrote:
> > This bug was reported on #mtd IRC. I don't have to reporter name to give proper
> > credit. It should be applied as a fix for v3.15.
> 
> I've taken them, thanks.
> 
> However, I do not think they are important enough to send to 3.15. The
> first patch, may be, but I doubt there is really a user suffering from
> that. The second is just an optimization. The third is a fix, but I am
> not sure if anyone uses this driver with such a huge MTD device. So I
> think 3.16 should be all-right, how does this sound to you?
> 

Sure, I'm fine with that.

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
