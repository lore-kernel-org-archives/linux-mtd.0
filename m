Subject: Re: JFFS2 : non-existent inode
From: David Woodhouse <dwmw2@infradead.org>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <6AA6F8E0F3CE410EB4381F9EF2B0C00C@sisodomain.com>
References: <12102132.458451236145386653.JavaMail.weblogic@epml05>
	<1236606666.572.178.camel@macbook.infradead.org>
	<6AA6F8E0F3CE410EB4381F9EF2B0C00C@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Mar 2009 15:18:20 +0000
Message-Id: <1236784700.3551.109.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-03-11 at 20:40 +0530, Amul Kumar Saha wrote:
> The following is the LOG, that we got, around the time when we
> encountered the ERROR.

Presumably pid 245 is the GC dæmon? What's PID 84? And 16442?

It looks like it's a race between deletion and GC; I'll take a closer
look. Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
