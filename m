Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 155vQf-0002Dv-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2001 21:21:53 +0100
Message-ID: <3B17FAA2.16C9B2E8@daniel.com>
Date: Fri, 01 Jun 2001 15:27:14 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Herman Oosthuysen <herman@wirelessnetworksinc.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: JFFS2
References: <01060110160400.02053@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

No, JFFS2 is completely separate from JFFS(1). You do of course need MTD support
for both.

Vipin


Herman Oosthuysen wrote:

> Hi guys,
>
> Something is not clear to me:
> In order to have JFFS2 support, do I have to compile in the JFFS stuff as well?
>
> I modified the following lines in fs/config.in:
> ## Herman - Add JFFS2 Support
> tristate 'Journaling FLASH filesystem (JFFS) support' CONFIG_JFFS_FS
> tristate 'Journalling Flash filesystem (JFFS2) support' CONFIG_JFFS2_FS
> int 'Journalling Flash filesystem (JFFS2) Debug Verbosity' CONFIG_JFFS2_FS_DEBUG
>
> Cheers,
> --
> Herman Oosthuysen
> Phone: 403+569-5687
> E-mail: Herman@WirelessNetworksInc.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
