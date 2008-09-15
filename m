Received: from an-out-0708.google.com ([209.85.132.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KfJyQ-0003Jf-DJ
	for linux-mtd@lists.infradead.org; Mon, 15 Sep 2008 19:43:07 +0000
Received: by an-out-0708.google.com with SMTP id c24so240935ana.99
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Sep 2008 12:43:00 -0700 (PDT)
Message-ID: <6934efce0809151243h60a6e48bpf0c7600d4badf3c4@mail.gmail.com>
Date: Mon, 15 Sep 2008 12:43:00 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Jamie Lokier" <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <20080915163421.GA13631@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0809121452kd20deb6m268715f6ed83a71e@mail.gmail.com>
	<20080915163421.GA13631@shareable.org>
Cc: cotte@de.ibm.com, Greg Ungerer <gerg@snapgear.com>,
	linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> >> I'm using Spansion MirrorBit S29GL128N, which reads at about 0.6 MByte/s.
>>
>> If you are using a GL, you'll probably find our P33 a good fit and at
>> competitive prices to GL as I understand it.  That's I think 50Mhz.
>
> What's a GL?  Never heard of it - all I can think of is OpenGL :-)

S29_GL_128N

> I'm not sure if cache is an option with this device - but would it
> make a difference anyway?

Well the first read takes 100ns (plus the other chipset overhead
300ns) but other reads in a page are only an extra 25ns each.  So your
benefit is not from having the entire executable in cache it's from
having the next 7 instructions in the cacheline for only an extra 25ns
each instead of 400ns.

> Interesting, thanks.  I'm not sure it's possible to change the way NOR
> is being used with this chip, and it'll be a while before it's
> economical to replace the board with a new design.

Usually these things can be fixed in the bootloader or by hacking the
kernel to tweak the relevant chipset registers.
