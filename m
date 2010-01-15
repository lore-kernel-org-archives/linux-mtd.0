Subject: Re: [PATCH 1/2] let MTD_XIP depend on XIP_KERNEL or ROMKERNEL
From: David Woodhouse <dwmw2@infradead.org>
To: Barry Song <21cnbao@gmail.com>
In-Reply-To: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
References: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Jan 2010 18:29:24 +0800
Message-ID: <1263551364.26767.4.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-15 at 15:50 +0800, Barry Song wrote:
> Some architectures like blackfin,h8300,m68k use ROMKERNEL to describe
> kernel XIP, not like arm which uses XIP_KERNEL 

Surely the appropriate response to that realisation is to _fix_ the
inconsistency, not just work around it?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
