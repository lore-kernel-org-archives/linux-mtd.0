From: David Woodhouse <dwmw2@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20041120145020.GA15782@synertronixx3>
References: <20041118163528.GA9471@synertronixx3>
	<1100959034.8600.33.camel@localhost.localdomain>
	<20041120145020.GA15782@synertronixx3>
Content-Type: text/plain
Date: Sat, 20 Nov 2004 15:12:44 +0000
Message-Id: <1100963565.7949.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-11-20 at 15:50 +0100, Konstantin Kletschke wrote:
> >>EIP; c00b1c74 <jffs2_build_remove_unlinked_inode+30/ec>   <=====

> Code;  c00b1c71 <jffs2_build_remove_unlinked_inode+2d/ec>
>    d:   e3 ff                     jecxz  e <_EIP+0xe>
> Code;  c00b1c73 <jffs2_build_remove_unlinked_inode+2f/ec>   <=====
>    f:   eb 00                     jmp    11 <_EIP+0x11>   <=====
> Code;  c00b1c75 <jffs2_build_remove_unlinked_inode+31/ec>
>   11:   40                        inc    %eax

Would be nice to see the actual code at jffs2_b_r_u_i+0x30, which isn't
in the above. Can you show the output of 'objdump -d' for the function
in question? And/or the result of telling gdb 'list *0xc00b1c74' on your
vmlinux?

It would also be useful to see the output with CONFIG_JFFS2_FS_DEBUG=1
when mounting the offending file system.

-- 
dwmw2
