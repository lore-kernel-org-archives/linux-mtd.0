Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqOnc-0004KC-G5
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 12:51:33 +0000
Message-ID: <4F214C52.5050300@flatfrog.com>
Date: Thu, 26 Jan 2012 13:51:30 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com> <4F21168F.4000800@flatfrog.com>
 <OF515AA54C.99F179CF-ONC1257991.0040C6F9-C1257991.0041489F@transmode.se>
In-Reply-To: <OF515AA54C.99F179CF-ONC1257991.0040C6F9-C1257991.0041489F@transmode.se>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/26/2012 12:53 PM, Joakim Tjernlund wrote:
> 			/* Allocating memory for output buffer if necessary */
> 			if ((this->compr_buf_size<  orig_slen)&&  (this->compr_buf)) {
> 				spin_unlock(&jffs2_compressor_list_lock);
>
> 				kfree(this->compr_buf);
> 				spin_lock(&jffs2_compressor_list_lock);
> 				this->compr_buf_size=0;
> 				this->compr_buf=NULL;
> 			}
>
> if 2 threads are competing here, I don't think you can drop the spin lock
> temporarily as this routine do.

Agreed.  Both the freeing of this->compr_buf and the usage of it when 
calling the compressor looks weird (because another process holding the 
lock could decide that the buffer is too small and allocate a new one):

    spin_unlock(&jffs2_compressor_list_lock);
    *datalen  = orig_slen;
    *cdatalen = orig_dlen;
    compr_ret = this->compress(data_in, this->compr_buf, datalen, cdatalen);
    spin_lock(&jffs2_compressor_list_lock);


I'm not sure I'm crazy about the allocation either, come to think of it:

if (!this->compr_buf) {
	spin_unlock(&jffs2_compressor_list_lock);
	tmp_buf = kmalloc(orig_slen, GFP_KERNEL);
	spin_lock(&jffs2_compressor_list_lock);
	if (!tmp_buf) {
		printk(KERN_WARNING "JFFS2: No memory for compressor allocation. (%d 
bytes)\n", orig_slen);
		continue;
	}
	else {
		this->compr_buf = tmp_buf;
		this->compr_buf_size = orig_slen;
	}
}

Even though we hold the lock when assigning the new buffer, things could 
have been changed while we're doing the kmalloc.  In this case, maybe 
just dropping the unlock/lock and allocating with GFP_ATOMIC would solve it.

I'm not sure I see why compr_buf has to belong to the compressor.  To 
not have to kmalloc a buffer each and every time?

-- 
Orjan Friberg
FlatFrog Laboratories AB
