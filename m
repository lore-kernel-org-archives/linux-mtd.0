From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <4174C8EF.50604@inf.u-szeged.hu>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru>  <4174C8EF.50604@inf.u-szeged.hu>
Content-Type: text/plain
Message-Id: <1098177387.13633.1066.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 19 Oct 2004 10:16:27 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 bugfix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-10-19 at 09:57 +0200, Ferenc Havasi wrote:
>  But, I think you are right, and I commited your patch.
> 
> I hope David will aggree with it.

The patch looks correct. We should probably double-check the other error
cases which behave similarly -- I think there are cases were we should
be doing an iput() but we don't.

-- 
dwmw2
