Received: from nf-out-0910.google.com ([64.233.182.188])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GM3Yx-0002qm-Gf
	for linux-mtd@lists.infradead.org; Sat, 09 Sep 2006 15:12:04 +0100
Received: by nf-out-0910.google.com with SMTP id l37so993209nfc
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Sep 2006 07:10:58 -0700 (PDT)
Message-ID: <625fc13d0609090710w1cf57ccaxc10e5b123e745119@mail.gmail.com>
Date: Sat, 9 Sep 2006 09:10:58 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Nils Faerber" <nils.faerber@kernelconcepts.de>
Subject: Re: Again 2.6.18-RC6 XScale P30 issues
In-Reply-To: <4502B082.1090401@kernelconcepts.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <45018BE6.5040102@kernelconcepts.de>
	<4502A2AA.30701@redfish-group.com>
	<4502B082.1090401@kernelconcepts.de>
Cc: Justin Clacherty <justin@redfish-group.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/9/06, Nils Faerber <nils.faerber@kernelconcepts.de> wrote:
> Justin Clacherty schrieb:
> > Nils Faerber wrote:
> >> So something is still wrong. At runtime the filesystem seems to be OK
> >> but after a reboot it seems to be defect. Only way to recover is to
> >> reflash the rootfs.
> > Is the bootup process writing to flash before you unlock it?  syslogd
> > might be a culprit...
>
> Well, yes, there are some scripts that touch the fs, but that is IMHO
> not the issue here. If it would be I would get the other "unable to
> write to locked sector" error.
> Instead the fs gets permanently corrupted, i.e. data is written and the
> written data is wrong.

How are you resetting the board?

> Last night I found that the JFFS2 write cache is configured. I will
> disable that now and see if that helps - I have the impression that the
> fs may contain half-baked stuff after a write. On the other hand, the
> JFFS2 write cache is not marked as an experimental feature so I thought
> I should be safe...

It typically is if you do things correctly.  You should remount the
filesystem as read-only or at the very least sync it before resetting.
 The writecache gets flushed every 5 seconds or so.  Depending on the
amount of data in there, if you reset without it being flushed you'll
loose data or even whole files.

josh
