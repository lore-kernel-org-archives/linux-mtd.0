From: David Woodhouse <dwmw2@infradead.org>
To: rhea@matrix-vision.de
In-Reply-To: <200401271247.41281.rhea@matrix-vision.de>
References: <200401271247.41281.rhea@matrix-vision.de>
Content-Type: text/plain
Message-Id: <1075209755.1633.52.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 13:22:36 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problem deleting files with NAND/JFFS2 and a possible solution
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-27 at 12:47 +0100, Howard Gray wrote:
> I'm not sufficiently knowledgeable about the internals of JFFS2 to supply a 
> proper patch, but it would seem to me that the call to "jffs2_flash_writev" 
> in write.c at line 282 should be like this:

Correct diagnosis, correct fix. I've applied it to CVS -- thanks.

-- 
dwmw2
