From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148053135.3199.63.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
	<1148041434.3875.137.camel@pmac.infradead.org>
	<1148048246.3199.34.camel@sauron.oktetlabs.ru>
	<1148050203.3875.167.camel@pmac.infradead.org>
	<1148051254.3199.54.camel@sauron.oktetlabs.ru>
	<1148052379.3199.58.camel@sauron.oktetlabs.ru>
	<1148052791.3875.180.camel@pmac.infradead.org>
	<1148053135.3199.63.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 16:43:56 +0100
Message-Id: <1148053436.3875.190.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 19:38 +0400, Artem B. Bityutskiy wrote:
> Err... I don't understand. Suppose you've scanned your FS and mounted
> it.
> 
> Then the 1st call is read_inode("/"). Here you calculate nlink of all
> direntries od "/".
> 
> The 2nd, say, read_inode("/home"). Here you calculate nlink of all
> direntries of "/home".
> 
> And so forth. I don't see the problem. 

That's because you haven't actually thought it through.

Q: What affects nlink? If there's a file 'foo' in the '/' directory,
which is inode #365 -- where do you look for dirents which might affect
the nlink of that inode #365?

-- 
dwmw2
