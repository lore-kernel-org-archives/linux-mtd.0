Received: from demumfd002.nsn-inter.net ([93.183.12.31])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTS0k-00057n-85
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 07:47:18 +0000
Message-ID: <5253B860.5030604@nsn.com>
Date: Tue, 08 Oct 2013 09:46:40 +0200
From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
MIME-Version: 1.0
To: ext Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: phram: Make phram 64-bit compatible
References: <524C4CF5.7060601@nsn.com>
 <20131007174943.GB23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131007174943.GB23337@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Joern Engel <joern@lazybastard.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On 10/07/2013 07:49 PM, ext Brian Norris wrote:
> Are we (MTD) holding a revolutionary position against the standard
> kernel libraries, which recognize [KkMmGg] prefixes, but not [kMG]i
> prefixes? Should we extend memparse() to accept either form? Or would
> doing so simply pollute the library and not really satisfy anyone?

I was also irritated re-inventing the wheel here, but the problem is --
millions of people out there have their startup scripts and uboot environments
for phram, who expect this just to work with the next kernel upgrade...

-- 
Best regards,
Alexander Sverdlin.
