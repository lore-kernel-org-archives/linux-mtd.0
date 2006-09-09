Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GM1o2-0004gV-7g
	for linux-mtd@lists.infradead.org; Sat, 09 Sep 2006 13:19:31 +0100
Message-ID: <4502B082.1090401@kernelconcepts.de>
Date: Sat, 09 Sep 2006 14:16:02 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: Justin Clacherty <justin@redfish-group.com>
Subject: Re: Again 2.6.18-RC6 XScale P30 issues
References: <45018BE6.5040102@kernelconcepts.de>
	<4502A2AA.30701@redfish-group.com>
In-Reply-To: <4502A2AA.30701@redfish-group.com>
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

Justin Clacherty schrieb:
> Nils Faerber wrote:
>> So something is still wrong. At runtime the filesystem seems to be OK
>> but after a reboot it seems to be defect. Only way to recover is to
>> reflash the rootfs.
> Is the bootup process writing to flash before you unlock it?  syslogd
> might be a culprit...

Well, yes, there are some scripts that touch the fs, but that is IMHO
not the issue here. If it would be I would get the other "unable to
write to locked sector" error.
Instead the fs gets permanently corrupted, i.e. data is written and the
written data is wrong.

Last night I found that the JFFS2 write cache is configured. I will
disable that now and see if that helps - I have the impression that the
fs may contain half-baked stuff after a write. On the other hand, the
JFFS2 write cache is not marked as an experimental feature so I thought
I should be safe...

Well, that like poking with a long pole in the mist, I have to admit.
Very nasty to debug...
If I find something new I'll let you know ;)

But many thanks for your (all of you) help so far!

Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--
