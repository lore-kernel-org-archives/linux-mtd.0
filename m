Received: from courier.cs.helsinki.fi ([128.214.9.1] helo=mail.cs.helsinki.fi)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtJrm-0003fj-PS
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 09:53:47 +0000
Date: Tue, 6 May 2008 12:53:35 +0300 (EEST)
From: "=?ISO-8859-1?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@helsinki.fi>
To: linux-mtd@lists.infradead.org
Subject: cfi_{build,send_gen}_cmd bloats, how to uninline?
Message-ID: <Pine.LNX.4.64.0805030002240.3985@wrl-59.cs.helsinki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When doing some time ago measurements on how static inlines affect the 
size of the kernel, I found out that uninlining cfi_{build,send_gen}_cmd 
yield to considerable size reduction (measured with 32-bit x86, gcc 
version 4.1.2 20070626 (Red Hat 4.1.2-13), on v2.6.25-rc2-mm1 IIRC, 
allyesconfig minus number of manually selected DEBUG related CONFIGs):

42 funcs, 199 +, 33328 -, diff: -33129 --- cfi_build_cmd
14 funcs, 365 +, 14648 -, diff: -14283 --- cfi_send_gen_cmd

...(Because there's depency between them as cfi_send_gen_cmd includes a 
call to cfi_build_cmd, total for both to is likely going to less than what 
those two summed together are, uninlining cfi_send_gen_cmd might even not 
pay off much).

I'm unsure how should the uninlining be performed in this case, 
especially since there's some alerting comment like this:

"/* We do it this way to give the compiler a fighting chance
    of optimising away all ..."

"* It looks too long to be inline, but in the common case it should almost all
 * get optimised away."

...Perhaps somebody has just assumed gcc to be more clever than it 
actually is, I wonder if the claimed optimization was ever happening
in practice... :-/

Any ideas?


-- 
 i.
