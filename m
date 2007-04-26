Subject: Re: [JFFS2] kernel BUG at fs/jffs2/gc.c:516!
From: David Woodhouse <dwmw2@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <000e01c787b7$d96f1850$e1ac580a@swcenter.sec.samsung.co.kr>
References: <000e01c787b7$d96f1850$e1ac580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 14:55:22 +0100
Message-Id: <1177595722.2755.408.camel@pmac.infradead.org>
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

On Thu, 2007-04-26 at 13:03 +0900, Kyungmin Park wrote:
> When the JFFS2 is tested with fsstress, I delete the several open files forcely.
> The goal of this test is that it is robust and handles it well when disk is
> full. But JFFS2 doesn't, it is died rarely with below message.
> 
> In POSIX Spec., it is possible to delete the open file, but I think JFFS2 don't
> handle this one well. This problem is occured at every kernel version.
> 
> My queustion is that Is it the expected behavior of JFFS2 or we missed the
> handling of this case? please give some clues.

I suspect the problem is not related to deleting open files -- that's a
case which we should handle just fine.

I suspect a locking issue, which leads to this node being absent from
the node lists even though it's not marked obsolete. Do you have an
image of the flash when this has happened? I'd like to see the _full_
set of nodes for this file.

If you can reproduce, then logs of CONFIG_JFFS2_FS_DEBUG=1 while you do
so would be enlightening -- we need to see what's happening to that node
at 0x00540000 when it was dropped from the lists.

-- 
dwmw2
