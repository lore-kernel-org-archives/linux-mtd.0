Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqNt6-0007eq-IN
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 11:53:09 +0000
In-Reply-To: <4F21168F.4000800@flatfrog.com>
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com> <4F21168F.4000800@flatfrog.com>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
To: Orjan Friberg <of@flatfrog.com>
Message-ID: <OF515AA54C.99F179CF-ONC1257991.0040C6F9-C1257991.0041489F@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 26 Jan 2012 12:53:04 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



linux-mtd-bounces@lists.infradead.org wrote on 2012/01/26 10:02:07:

> From: Orjan Friberg <of@flatfrog.com>
> To: <linux-mtd@lists.infradead.org>
> Date: 2012/01/26 10:15
> Subject: Re: JFFS2 oops when writing to two partitions simultaneously
> Sent by: linux-mtd-bounces@lists.infradead.org
>
> On 01/25/2012 10:01 PM, Orjan Friberg wrote:
> > That one-liner was boiled down from the following program, which still
> > oopses instantly:
>
> The C program seems to work fine with CONFIG_PREEMPT_NONE=y.
>
> If that is indeed the problem I guess it's reasonable that it worked
> better with PREEMPT_VOLUNTARY than PREEMPT because there are fewer
> preemtion points.

The spin locking in jffs2_compress() seems broken:

	case JFFS2_COMPR_MODE_SIZE:
	case JFFS2_COMPR_MODE_FAVOURLZO:
		orig_slen = *datalen;
		orig_dlen = *cdatalen;
		spin_lock(&jffs2_compressor_list_lock);
		list_for_each_entry(this, &jffs2_compressor_list, list) {
			/* Skip decompress-only backwards-compatibility and disabled modules */
			if ((!this->compress)||(this->disabled))
				continue;
			/* Allocating memory for output buffer if necessary */
			if ((this->compr_buf_size < orig_slen) && (this->compr_buf)) {
				spin_unlock(&jffs2_compressor_list_lock);

				kfree(this->compr_buf);
				spin_lock(&jffs2_compressor_list_lock);
				this->compr_buf_size=0;
				this->compr_buf=NULL;
			}

....

if 2 threads are competing here, I don't think you can drop the spin lock
temporarily as this routine do.

 Jocke
