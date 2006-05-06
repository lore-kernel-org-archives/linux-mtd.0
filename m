From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <445C476A.2090506@ak.jp.nec.com>
References: <445C476A.2090506@ak.jp.nec.com>
Content-Type: text/plain
Date: Sat, 06 May 2006 13:07:21 +0100
Message-Id: <1146917241.2766.61.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: jmorris@redhat.com, sds@tycho.nsa.gov, russell@coker.com.au,
	linux-mtd@lists.infradead.org, lorenzo@gnu.org, joern@wohnheim.fh-wedel.de
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-05-06 at 15:51 +0900, KaiGai Kohei wrote:
> Hello,
> 
> This attached patches provide xattr support including POSIX-ACL and
> SELinux support on JFFS2 (version.5).
> We can apply those patches to the latest git-tree.
> - xattr_on_jffs2.kernel.version-5.patch can be applied to mtd-2.6.git.
> - xattr_on_jffs2.utils.version-5.patch can be applied to mtd-utils.git.

Thank you. These patches look good to me, in general. I do have a couple
of minor comments to make, but I'll do that with a slightly shorter Cc
list.

In the meantime I've committed the utils patch directly to the mtd-utils
git tree at git://git.infradead.org/mtd-utils.git and I have created a
new kernel git tree at git://git.infradead.org/jffs2-xattr-2.6.git. 
(Both of these are browsable at http://git.infradead.org for non-git
users).

I've created a new git tree for the kernel side because I want Linus to
pull from the existing MTD git tree immediately after he releases
2.6.17, and I'd like the xattr code to be in public view (and the -mm
tree) for a bit longer than that. As soon as Linus releases 2.6.17 and
pulls from the MTD tree for 2.6.18, I intend to pull the xattr code into
the main mtd tree -- as long as other reviewers are happy. OK?

-- 
dwmw2
