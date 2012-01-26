Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqQEb-0000tT-8G
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 14:23:30 +0000
In-Reply-To: <4F215E0B.107@flatfrog.com>
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com> <4F21168F.4000800@flatfrog.com>
 <OF515AA54C.99F179CF-ONC1257991.0040C6F9-C1257991.0041489F@transmode.se>
 <4F214C52.5050300@flatfrog.com>
 <OFF7DA2700.9D726421-ONC1257991.004865DC-C1257991.0048F71D@transmode.se>
 <4F215E0B.107@flatfrog.com>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
To: Orjan Friberg <of@flatfrog.com>
Message-ID: <OF2516B1B0.B197779A-ONC1257991.004E8469-C1257991.004F0B1F@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 26 Jan 2012 15:23:21 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Orjan Friberg <of@flatfrog.com> wrote on 2012/01/26 15:07:07:
>
> On 01/26/2012 02:16 PM, Joakim Tjernlund wrote:
> > Anyhow, I think it is stupid (and probably buggy) to have kfree and kmalloc
> > as separate. Why is it not done at the same time?
>
> To me it looks like the lock must be held the entire time.  We can't
> allow two contexts using (i.e. freeing/allocating/writing to) the
> compressor's compr_buf.

This is more complex than I got time for. I can say there is more to it though.
Compare
	case JFFS2_COMPR_MODE_PRIORITY:
		output_buf = kmalloc(*cdatalen,GFP_KERNEL);

and

case JFFS2_COMPR_MODE_SIZE:
	case JFFS2_COMPR_MODE_FAVOURLZO:
		orig_slen = *datalen;
		orig_dlen = *cdatalen;
..
tmp_buf = kmalloc(orig_slen, GFP_KERNEL);

It is not the same len used to kmalloc!

I would stay away from JFFS2_COMPR_MODE_SIZE and JFFS2_COMPR_MODE_FAVOURLZO
all together as it looks broken in more than one way.

>
> Maybe the lock used here should be on a per-compressor basis, rather
> than on the list as a whole.  (The list lock is still needed when adding
> to/removing from the list of course.)
>
> --
> Orjan Friberg
> FlatFrog Laboratories AB
