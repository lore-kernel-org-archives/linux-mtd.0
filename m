Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqM1y-000397-LT
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 09:54:11 +0000
In-Reply-To: <4F21169C.6050309@flatfrog.com>
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com>
 <OF0111198C.16CD12BA-ONC1257991.002D7AD9-C1257991.002DC3EB@transmode.se>
 <4F21169C.6050309@flatfrog.com>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
To: Orjan Friberg <of@flatfrog.com>
Message-ID: <OFACA7AF03.334529A7-ONC1257991.00362059-C1257991.00365A29@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 26 Jan 2012 10:53:40 +0100
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

Orjan Friberg <of@flatfrog.com> wrote on 2012/01/26 10:02:20:
>
> On 01/26/2012 09:19 AM, Joakim Tjernlund wrote:
> > Works for me on PowerPC, 2.6.35, NOR flash
>
> Just to clarify: two instances of that program, each on their own partition?

1 to 4 instances on one partition(only got one)

>
> What CONFIG_PREEMPT options are in your kernelconfig?

CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
