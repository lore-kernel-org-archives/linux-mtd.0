From: David Woodhouse <dwmw2@infradead.org>
To: manningc2@actrix.gen.nz
In-Reply-To: <20031120012218.349D84FE2@blood.actrix.co.nz>
References: <20031120012218.349D84FE2@blood.actrix.co.nz>
Content-Type: text/plain
Message-Id: <1069317642.31205.39.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 20 Nov 2003 08:40:43 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002.c patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-11-20 at 14:28 +1300, Charles Manning wrote:
> Two variables being declared in mid-block as allowed by C++, but not C.

Also by C. But since some people use ancient compilers I've committed
your patch. Thanks.

-- 
dwmw2
