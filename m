Received: from el-out-1112.google.com ([209.85.162.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWebk-0001tX-G2
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 22:28:06 +0000
Received: by el-out-1112.google.com with SMTP id z25so1521197ele.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Feb 2009 14:28:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090120C059@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE19090120C059@mi8nycmail19.Mi8.com>
Date: Mon, 9 Feb 2009 17:28:03 -0500
Message-ID: <8bd0f97a0902091428u5e629485ke7762cbffe8b97dc@mail.gmail.com>
Subject: Re: [PATCH] mtd: add setup/teardown callbacks to plat_nand
From: Mike Frysinger <vapier.adi@gmail.com>
To: hartleys <hartleys@visionengravers.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, Feb 9, 2009 at 16:37, hartleys wrote:
> Add optional setup and teardown callbacks to the plat_nand driver.
>
> Some platforms may require additional setup, such as configuring the
> memory controller, before the nand device can be accessed.  This patch
> provides an optional callback to handle this setup as well as a callback
> to teardown the setup.

on our platforms, we've been putting the setup into the board init
code.  but it would certainly be much saner to have explicit steps for
it in the plat_nand code as you suggest.

i think having the naming convention follow existing practices would
be better.  then we dont have to keep our index of synonyms around.
i.e. change "setup" to "probe" and "teardown" to "remove"
-mike
