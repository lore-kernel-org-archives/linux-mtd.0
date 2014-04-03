Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVjSB-00005R-JU
 for linux-mtd@lists.infradead.org; Thu, 03 Apr 2014 15:21:19 +0000
Date: Thu, 3 Apr 2014 12:19:41 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Simon Guinot <simon.guinot@sequanux.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 0/4] Allow to specify an ECC scheme through DT
Message-ID: <20140403151941.GA21114@arch.cereza>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140401100417.GI27979@kw.sim.vm.gnt>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140401100417.GI27979@kw.sim.vm.gnt>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Willy Tarreau <w@1wt.eu>, Simon Guinot <sguinot@lacie.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 01, Simon Guinot wrote:
> On Fri, Mar 21, 2014 at 08:34:46AM -0300, Ezequiel Garcia wrote:
> > Now that we have agreed on the ECC devicetree binding, here's a patchset
> > that makes pxa3xx-nand driver use it.
> > 
> > This work is required on platforms where the flash device reports a required
> > ECC strength, but that are capable of handling a stronger one. Simon Guinot
> > reported a situation where the vendor provided a bootloader configured with
> > a stronger than required ECC scheme. Without this patches, such a situation
> > would require a hack to make the driver use a specific ECC scheme.
> > 
> > (Simon: it would be great if you can confirm this allows you to remove any hacks).
> 
> Hi Ezequiel,
> 
> I confirm this allows me to configure the ECC strength and step size
> from DT.
> 
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>
> 

Thanks a lot for the test.

Brian, any comments?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
