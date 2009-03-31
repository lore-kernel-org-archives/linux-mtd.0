Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LonmH-0003ap-HW
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 23:54:04 +0000
Received: by bwz3 with SMTP id 3so2829634bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Mar 2009 16:53:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200903311418.53772.david-b@pacbell.net>
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
Date: Wed, 1 Apr 2009 01:51:48 +0200
Message-ID: <ac3eb2510903311651i4c5f6805tc74fe04ee765be9c@mail.gmail.com>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: Kay Sievers <kay.sievers@vrfy.org>
To: David Brownell <david-b@pacbell.net>, dwmw2@infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 31, 2009 at 23:18, David Brownell <david-b@pacbell.net> wrote:
> On Thursday 26 March 2009, David Brownell wrote:
>> From: David Brownell <dbrownell@users.sourceforge.net>
>>
>> Update driver model support in the MTD framework, so it fits
>> better into the current udev-based hotplug framework:
>
> Hmm, no comments? =C2=A0I had understood there was interest over on
> the MTD side of things in exposing more information through
> sysfs, to help avoid the need to add Even More Ioctls as part
> of support for things like NAND chips with 4KB pages, or which
> handle more than 4GBytes ...

Please have a look at this. We got asked repeatedly to provide better
hotplug/udev integration, and the patches, and having the parent
device properly assigned, would solve some of the problems people run
into currently.

Thanks,
Kay
