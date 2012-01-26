Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqLDj-0008GG-SP
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 09:02:19 +0000
Message-ID: <4F21168F.4000800@flatfrog.com>
Date: Thu, 26 Jan 2012 10:02:07 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com>
In-Reply-To: <4F206D8F.5010206@flatfrog.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/25/2012 10:01 PM, Orjan Friberg wrote:
> That one-liner was boiled down from the following program, which still
> oopses instantly:

The C program seems to work fine with CONFIG_PREEMPT_NONE=y.

If that is indeed the problem I guess it's reasonable that it worked 
better with PREEMPT_VOLUNTARY than PREEMPT because there are fewer 
preemtion points.

-- 
Orjan Friberg
FlatFrog Laboratories AB
