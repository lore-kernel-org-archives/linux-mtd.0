From: David Woodhouse <dwmw2@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1096893405.22034.9.camel@weaponx.rchland.ibm.com>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
	<4161379C.3070109@oktetlabs.ru>
	<1096893405.22034.9.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain
Message-Id: <1096893838.30942.587.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 13:43:59 +0100
Content-Transfer-Encoding: 7bit
Cc: Artem Bityuckiy <dedekind@oktetlabs.ru>, linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 07:36 -0500, Josh Boyer wrote:
> Yes and no.  It makes sense for any flash device that you can't write to
> the same page multiple times without an erase in between.  NAND is
> certainly the largest group of such devices.  There are others that have
> this behavior as well.  See cfi_cmdset_0020.c.
> 
> Although, JFFS2 doesn't support those chips right now, so I guess I am
> just rambling :).

There's more chips like that on the way too. It'll be 

	if (!jffs2_can_mark_obsolete(c))

and it'll probably also be in the ifdef, although we may actually change
the name of that configuration option.

I agree that it shouldn't be left to the GC thread alone -- there isn't
one on eCos and it's optional on Linux too. We can write out snapshots
in the normal course of garbage collection though, when we have
obsoleted a node belonging to the inode in question.



-- 
dwmw2
