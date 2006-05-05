From: David Woodhouse <dwmw2@infradead.org>
To: Dmitry Bazhenov <atrey@emcraft.com>
In-Reply-To: <200605051050.24227.atrey@emcraft.com>
References: <200605051050.24227.atrey@emcraft.com>
Content-Type: text/plain
Date: Fri, 05 May 2006 12:54:44 +0100
Message-Id: <1146830084.20773.117.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 has possible race when setting file attributes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-05 at 10:50 +0400, Dmitry Bazhenov wrote:
> Hello everybody!
> 
> It seems like there is a potential race in the function jffs2_do_setattr() in 
> the case when attributes of a symlink are updated. The symlink metadata is 
> read without having f->sem locked.
> The following patch should fix the race.

Thanks. Please could you resend, including a 'Signed-off-by:' line?

-- 
dwmw2
