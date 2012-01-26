Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqR6O-0001NA-Rc
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 15:19:05 +0000
Message-ID: <4F216EE0.5070600@flatfrog.com>
Date: Thu, 26 Jan 2012 16:18:56 +0100
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
 <4F215E0B.107@flatfrog.com>
 <OFC9A1C561.522D22B4-ONC1257991.005132E2-C1257991.0051AD50@transmode.se>
 <OF27590FE7.A317E826-ONC1257991.00522589-C1257991.00534258@transmode.se>
In-Reply-To: <OF27590FE7.A317E826-ONC1257991.00522589-C1257991.00534258@transmode.se>
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

On 01/26/2012 04:09 PM, Joakim Tjernlund wrote:
> Maybe you can get away with removing the extra lock dropping around kfree/kmalloc
> and if you do, you can simply the code to something like:

But you'd still need to hold the lock over

   this->compress(data_in, this->compr_buf, datalen, cdatalen);

right?

-- 
Orjan Friberg
FlatFrog Laboratories AB
