Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LISu-0000gc-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 08:04:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <AIEOIMKIOAAJKHJOGAEFMEFCCEAA.david@forcedpotato.com> 
References: <AIEOIMKIOAAJKHJOGAEFMEFCCEAA.david@forcedpotato.com> 
To: "David Cooper" <david@forcedpotato.com>
Cc: "Ilguiz Latypov" <ilatypov@superbt.com>,
    "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: Re: X Windows Performance with DOC 2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Jun 2002 08:04:12 +0100
Message-ID: <16562.1024643052@redhat.com>
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

david@forcedpotato.com said:
>  - Mount operation mount /dev/nftla2 /mnt/doc causes the shell to
> hang. - Viewing the process "mount" using top shows that it is running
> continuously and using 84% CPU time. - All attempts to kill the mount
> process are futile.

OK, here we can find some clues. _What_ is it doing? Use SysRq-P a few 
times to see where it's looping, look it up in your kernel image. If you 
compile with '-g' you can get gdb to tell you the precise line.

--
dwmw2
