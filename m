Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RKRK7-0001Zg-2S
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 09:05:00 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 00/13]  DocG3 fixes and write support
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
	<201110300241.39534.marek.vasut@gmail.com>
Date: Sun, 30 Oct 2011 10:04:44 +0100
In-Reply-To: <201110300241.39534.marek.vasut@gmail.com> (Marek Vasut's message
	of "Sun, 30 Oct 2011 02:41:39 +0200")
Message-ID: <87bosy6eab.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dwmw2@infradead.org, mikedunn@newsguy.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marek Vasut <marek.vasut@gmail.com> writes:

> Hi,
>
> can you sum up the situation about the another (docg4) driver for us not 
> watching this too tightly? Was there any improvement/progress/... ?
The review is underway, my comments should be dealt with, and a V2 of the patch
should be sent. It's not in my hands.

The global view we have with Mike is that chips are different, and each one
deserves its own driver. Several registers are common, and the docg3.h could
become common.

Cheers.

--
Robert
