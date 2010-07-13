Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYgUV-0002Ya-S1
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 14:29:48 +0000
Subject: Re: ubifs : corruption after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C3C30D1.9030005@parrot.com>
References: <4C346D5B.2000609@parrot.com> <4C3C1572.8080501@parrot.com>
	<4C3C2740.2040105@parrot.com>  <4C3C30D1.9030005@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 17:24:24 +0300
Message-ID: <1279031064.31639.90.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-13 at 11:24 +0200, Matthieu CASTET wrote:
> Matthieu CASTET a écrit :
> > Matthieu CASTET a écrit :
> >> Hi,
> >>
> >> we found some bug in our driver. Now there no more ubifs error when
> >> there is uncorrectable ecc error (they should happen in the last
> >> (interrupted) written page).
> >>
> >> But now we got "validate_master: bad master node at offset 69632 error
> >> 7" [1].
> > notice that gc_lnum==-1 in this case.
> > Also this didn't happen on power cut.
> > The senario was :
> > - power cut
> > - mount fs [1]
> > - do some fs operation
> > - umount fs quickly (9 second after mount in this case) [2]
> > - mount fs [3]
> > 
> > The the problem seems that gc_lnum==-1 is not handled in mount or
> > shouldn't happen in umount.
> > 
> The attached patch try to support mount with gc_lnum == -1.
> 
> Does it look sane ?

I did not give it much thought, but I do not see how master node can end
up with gc_lnum = -1 in it, and it seems we assumed this cannot happen.
Could you please add this hack to your kernel? It should catch the
situations when we write gc_lnum == -1 to the master node and print the
stack dump, which should give some idea about the code-path which causes
it.

diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 28beaee..8277f64 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -378,6 +378,15 @@ int ubifs_write_master(struct ubifs_info *c)
 	c->mst_offs = offs;
 	c->mst_node->highest_inum = cpu_to_le64(c->highest_inum);
 
+	{
+		/* Temporary hack for Matthieu */
+		int gc_lnum = le32_to_cpu(c->mst_node->gc_lnum);
+		if (gc_lnum < 0) {
+			printk(KERN_CRIT "%s: gc_lnum is %d!\n", __func__, gc_lnum);
+			dump_stack();
+		}
+	}
+
 	err = ubifs_write_node(c, c->mst_node, len, lnum, offs, UBI_SHORTTERM);
 	if (err)
 		return err;

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
