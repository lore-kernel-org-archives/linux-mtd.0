Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq8fz-0004lH-3i
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 08:44:10 -0500
Message-ID: <4570317F.2030704@valcom.com>
Date: Fri, 01 Dec 2006 08:43:27 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: Darshak <darshak@elitecore.com>
Subject: Re: mkfs.jffs
References: <000901c71549$4d730d10$3d0fa8c0@elitecore1561>
In-Reply-To: <000901c71549$4d730d10$3d0fa8c0@elitecore1561>
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

Darshak wrote:
>
>
> Hi ,
> I have compiled kernel [ 2.4.33 ] with jffs support.But I am not able to 
> find command mkfs.jffs/2 how could i enable this ?
>
>
> Thanxs & Rgds
> Darshak Modi 
>
>   
Run make xconfig and under Kernel/Library/Defaults Selection click on y
for "Customize Kernel Settings", "Customize Vendor/User Settings", and
"Update Default Vendor Settings".  Then select Save and Exit which will
allow you to select what you need in the kernel to enable JFFS2, and
select what you need in the User section to enable mkfs.jffs2.
First, under File systems select Miscellaneous filesystems in the left
window.  Then select Journalling Flash File System v2 (JFFS2) support in
the upper right window.  This enables the JFFS2_FS compiler flag.  Save
and exit which will allow for the second selection.
Second, select Flash Tools and scrolling down enable mtd-utils and
mkfs.jffs2.  Save and exit and you should be able to compile in mkfs.jffs2.
