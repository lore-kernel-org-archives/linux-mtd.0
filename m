From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <41767593.9030004@inf.u-szeged.hu>
References: <41767593.9030004@inf.u-szeged.hu>
Content-Type: text/plain
Message-Id: <1098365059.13633.1257.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 21 Oct 2004 14:24:20 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-10-20 at 16:26 +0200, Ferenc Havasi wrote:
> Dear All,
> 
> Here is the latest version of our mount time improvement.

It's looking good, but the kernel really needs to be able to write these
summaries for _itself_ in order to give a real improvement over the long
term. If the file system has to be read-only we might as well be using
cramfs, and if the summary becomes obsolete over time we might as well
not bother in a lot of cases.

-- 
dwmw2
