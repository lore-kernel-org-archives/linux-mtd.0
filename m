Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bmOb-0003hU-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 18:11:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B8BD129.4A562C0@inn.ericsson.se> 
References: <3B8BD129.4A562C0@inn.ericsson.se>  <3B8BCB83.64A68A5F@inn.ericsson.se> <25744.999017640@redhat.com> 
To: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 root 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Aug 2001 18:17:22 +0100
Message-ID: <28995.999019042@redhat.com>
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

kenneth.johansson@inn.ericsson.se said:
> find / -type d -xdev -exec mkdir /mnt/mtd/{} \;
> find / -type f -xdev -exec cp -dpvf {} /mnt/mtd/{} \; 

$ ldd /bin/bash
	libtermcap.so.2 => /lib/libtermcap.so.2 (0x40029000)
	libdl.so.2 => /lib/libdl.so.2 (0x4002d000)
	libc.so.6 => /lib/i686/libc.so.6 (0x40031000)
	/lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)

All those are symlinks not real files, hence won't have been copied onto 
your filesystem by the 'find -type f' command.




--
dwmw2
