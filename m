Subject: Re: [PATCH] fix cfi for collie flash
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Kunze <thommycheck@gmx.de>
In-Reply-To: <480E8DD9.3030108@gmx.de>
References: <480E7784.6030902@gmx.de>
	<1208910618.9212.701.camel@pmac.infradead.org>
	<480E8DD9.3030108@gmx.de>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 02:22:13 +0100
Message-Id: <1208913733.9212.708.camel@pmac.infradead.org>
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

On Wed, 2008-04-23 at 03:16 +0200, Thomas Kunze wrote:
> Again with (hopefully) no line wrappings.

Nope. In general, it's worth sending things to yourself first, saving
them from the email you receive, and checking that you can apply them to
a clean tree. Only then do you send it to other people.

Also, ...

ERROR: use tabs not spaces
#65: FILE: drivers/mtd/chips/cfi_cmdset_0001.c:622:
+               /* if numregions=0 we have one big partition */$

ERROR: use tabs not spaces
#66: FILE: drivers/mtd/chips/cfi_cmdset_0001.c:623:
+               if(!numparts)$

ERROR: space required before the open parenthesis '('
#66: FILE: drivers/mtd/chips/cfi_cmdset_0001.c:623:
+               if(!numparts)

ERROR: use tabs not spaces
#67: FILE: drivers/mtd/chips/cfi_cmdset_0001.c:624:
+                       numparts = 1;$

total: 4 errors, 0 warnings, 12 lines checked

I've fixed it for now, but don't let that stop you from becoming
familiar with scripts/checkpatch.pl and working out how to make your
mailer behave :)

Thanks for the patch.
-- 
dwmw2
