Subject: Re: [PATCH resend] MTD: nandsim: allow changing some module parameters
From: David Woodhouse <dwmw2@infradead.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
In-Reply-To: <20080728070631.4707.68077.sendpatchset@localhost.localdomain>
References: <20080728070626.4707.99096.sendpatchset@localhost.localdomain>
	<20080728070631.4707.68077.sendpatchset@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 01 Sep 2008 12:26:44 +0100
Message-Id: <1220268404.2982.65.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-07-28 at 10:06 +0300, Artem Bityutskiy wrote:
> Grant write permissions to some nandsim module parameters
> to make it possible to change them runtime e.g., via sysfs:
> 
> echo 1 > /sys/module/nandsim/parameters/rptwear
> 
> There is no reason to have that file read-only. This patches
> also changes the permissions from octal to S_* format.
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Got a current version of this?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
