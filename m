Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vdhnz-000483-RE
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 14:40:32 +0000
Date: Tue, 5 Nov 2013 11:40:04 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Willy Tarreau <w@1wt.eu>
Subject: Ubiblock users call (Re: mvneta / openblocks switch)
Message-ID: <20131105144003.GB9632@localhost>
References: <20131031135322.GN26784@titan.lakedaemon.net>
 <52738D6A.1010900@hitachi.com> <20131101130528.716e53d9@skate>
 <20131105103555.GD16420@1wt.eu> <5278E824.8050405@hitachi.com>
 <20131105135323.GA17316@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131105135323.GA17316@1wt.eu>
Cc: piergiorgio.beruto@gmail.com, Mike Frysinger <vapier@gentoo.org>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 05, 2013 at 02:53:23PM +0100, Willy Tarreau wrote:
> > 
> > Hmm, could you tell me which github branch is good to try?

[...]

> 
> then I have set up a large collection of patches, including Ezequiel's work
> on the NAND flash, his UBI block devices and
[...]

Hey Willy,

Which patches have you taken for UBI block device? Can you describe your usage?

I've been wanting to push this upstream since a long while, and the patches
seem ready. However, given I'm not using these *at all*, I'd like to have some
real users supporting the feature addition.

Just for reference, the latest work is here:

http://git.free-electrons.com/users/ezequiel-garcia/linux/log/?h=ubiblock-v4-two-cache

And the user stuff:

http://git.free-electrons.com/users/ezequiel-garcia/mtd-utils/log/?h=ubiblkvol

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
