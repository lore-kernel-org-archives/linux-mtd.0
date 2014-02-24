Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WI2Dn-0002Od-Qg
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 20:33:52 +0000
Date: Mon, 24 Feb 2014 17:33:26 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 1/2] of_mtd: Add helpers to get ECC strength and ECC
 step size
Message-ID: <20140224203325.GA28620@localhost>
References: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392749474-12936-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <530B6FA9.5050902@gmail.com>
 <CACxGe6u7HJD7Cz+6DTUX3QuA=SokZNzZHW-mvsFhq5JCX6tFYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACxGe6u7HJD7Cz+6DTUX3QuA=SokZNzZHW-mvsFhq5JCX6tFYQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 24, 2014 at 07:08:15PM +0000, Grant Likely wrote:
> On Mon, Feb 24, 2014 at 4:13 PM, Boris BREZILLON
> <b.brezillon.dev@gmail.com> wrote:
> > On 18/02/2014 19:51, Ezequiel Garcia wrote:
> >>
> >> This commit adds simple helpers to obtain the devicetree properties
> >> that specify the ECC strength and ECC step size to use on a given
> >> NAND controller.
> >>
> >> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> >> ---
> >> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> >> index cb32d9c..c078f99 100644
> >> --- a/include/linux/of_mtd.h
> >> +++ b/include/linux/of_mtd.h
> >> @@ -13,6 +13,8 @@
> >>     #include <linux/of.h>
> >>   int of_get_nand_ecc_mode(struct device_node *np);
> >> +int of_get_nand_ecc_step_size(struct device_node *np)
> >> +int of_get_nand_ecc_strength(struct device_node *np)
> >
> >
> > You forgot the semicolon.
> 
> Repeat after me: "I shall not post patches that I have not compiled"
> 

Certainly: "I shall not post patches that I have not compiled".

Hope this helps me learn the lesson.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
