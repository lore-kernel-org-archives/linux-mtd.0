Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqPyt-0006cl-Id
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 14:07:16 +0000
Message-ID: <4F215E0B.107@flatfrog.com>
Date: Thu, 26 Jan 2012 15:07:07 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com> <4F21168F.4000800@flatfrog.com>
 <OF515AA54C.99F179CF-ONC1257991.0040C6F9-C1257991.0041489F@transmode.se>
 <4F214C52.5050300@flatfrog.com>
 <OFF7DA2700.9D726421-ONC1257991.004865DC-C1257991.0048F71D@transmode.se>
In-Reply-To: <OFF7DA2700.9D726421-ONC1257991.004865DC-C1257991.0048F71D@transmode.se>
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

On 01/26/2012 02:16 PM, Joakim Tjernlund wrote:
> Anyhow, I think it is stupid (and probably buggy) to have kfree and kmalloc
> as separate. Why is it not done at the same time?

To me it looks like the lock must be held the entire time.  We can't 
allow two contexts using (i.e. freeing/allocating/writing to) the 
compressor's compr_buf.

Maybe the lock used here should be on a per-compressor basis, rather 
than on the list as a whole.  (The list lock is still needed when adding 
to/removing from the list of course.)

-- 
Orjan Friberg
FlatFrog Laboratories AB
