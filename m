Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168w2r-0005k5-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2001 04:10:01 +0000
Subject: Re: Using JFFS2 as root FS on CF
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: Michael Rothwell <rothwell@holly-springs.nc.us>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1006918956.9840.2.camel@gromit.house>
References: <1006918956.9840.2.camel@gromit.house>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 27 Nov 2001 23:21:25 -0500
Message-Id: <1006921285.9892.6.camel@gromit.house>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 2001-11-27 at 22:42, Michael Rothwell wrote:
> Does someone have a recipe for booting a kernel (2.4.13 or 2.4.16) with
> this type of setup and having it mount the jffs2 fs as /?


Addendum: blkmtd complains "error, missing 'device' name" -- I'm passing
it in via lilo, but it looks like blkmtd doesn't read kernel arguments.

-M
