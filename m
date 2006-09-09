Received: from customer-domains.icp-qv1-irony8.iinet.net.au ([203.59.1.133])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GM0qm-0002r7-DV
	for linux-mtd@lists.infradead.org; Sat, 09 Sep 2006 12:18:18 +0100
Message-ID: <4502A2AA.30701@redfish-group.com>
Date: Sat, 09 Sep 2006 21:16:58 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Subject: Re: Again 2.6.18-RC6 XScale P30 issues
References: <45018BE6.5040102@kernelconcepts.de>
In-Reply-To: <45018BE6.5040102@kernelconcepts.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Nils Faerber wrote:
> So something is still wrong. At runtime the filesystem seems to be OK
> but after a reboot it seems to be defect. Only way to recover is to
> reflash the rootfs.
>   
Is the bootup process writing to flash before you unlock it?  syslogd 
might be a culprit...
