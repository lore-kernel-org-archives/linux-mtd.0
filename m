Received: from agminet01.oracle.com ([141.146.126.228])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iiaug-00042z-Hb
	for linux-mtd@lists.infradead.org; Thu, 18 Oct 2007 20:20:14 +0100
Date: Thu, 18 Oct 2007 12:14:54 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: <kmpark@infradead.org>
Subject: Re: onenand_sim crashes
Message-Id: <20071018121454.97c0769b.randy.dunlap@oracle.com>
In-Reply-To: <002d01c81084$60fb7980$e1ac580a@swcenter.sec.samsung.co.kr>
References: <20071016221525.307c8904.randy.dunlap@oracle.com>
	<002d01c81084$60fb7980$e1ac580a@swcenter.sec.samsung.co.kr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	'lkml' <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 Oct 2007 15:10:03 +0900 Kyungmin Park wrote:

> Hi,
> 
> Thank you for point out.
> There is a bug. It frees the static variable.
> 
> Please see the attached patch.

Confirm that fixes the problem.  Thanks.

---
~Randy
