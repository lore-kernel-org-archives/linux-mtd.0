Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCuPS-0006jn-Ei
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 11:17:46 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3532122wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Dec 2008 03:17:45 -0800 (PST)
Message-ID: <8bd0f97a0812170317s7485cd01rf7a332234c84ff97@mail.gmail.com>
Date: Wed, 17 Dec 2008 06:17:45 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Subject: Re: [RFC] remove -W from build process
In-Reply-To: <4948DF7C.7060802@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081217101924.GB4999@www.tglx.de>
	<8bd0f97a0812170229x40d7a9d1jb53a3bac2d5bd5a1@mail.gmail.com>
	<4948DF7C.7060802@linutronix.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 17, 2008 at 06:16, Sebastian Andrzej Siewior wrote:
> Mike Frysinger wrote:
>> On Wed, Dec 17, 2008 at 05:19, Sebastian Andrzej Siewior wrote:
>>> Would it be possible to use autotools for a clean build environment?
>>
>> it would make no difference here
>
> It won't fix compile error, right. I thing it could be easier the handle
> CFLAGS, cross builds, install, build dir, rebuilds, ...
> Alternatively one could clean up the current make scripts but I thing it
> would be easier to handle this with auto tools.

ive already posted a patch to cleanup the build system and it should
address every issue you highlighted here ...
-mike
