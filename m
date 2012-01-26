Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqLDp-0008GG-LF
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 09:02:25 +0000
Message-ID: <4F21169C.6050309@flatfrog.com>
Date: Thu, 26 Jan 2012 10:02:20 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com>
 <OF0111198C.16CD12BA-ONC1257991.002D7AD9-C1257991.002DC3EB@transmode.se>
In-Reply-To: <OF0111198C.16CD12BA-ONC1257991.002D7AD9-C1257991.002DC3EB@transmode.se>
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

On 01/26/2012 09:19 AM, Joakim Tjernlund wrote:
> Works for me on PowerPC, 2.6.35, NOR flash

Just to clarify: two instances of that program, each on their own partition?

What CONFIG_PREEMPT options are in your kernelconfig?

Thanks.

-- 
Orjan Friberg
FlatFrog Laboratories AB
