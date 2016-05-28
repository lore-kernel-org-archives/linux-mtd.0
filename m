Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6dhJ-0006rt-Dv
 for linux-mtd@lists.infradead.org; Sat, 28 May 2016 12:50:34 +0000
Received: by mail-oi0-x22b.google.com with SMTP id j1so211546528oih.3
 for <linux-mtd@lists.infradead.org>; Sat, 28 May 2016 05:50:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160528141213.6da8e461@bbrezillon>
References: <1464429250-27670-1-git-send-email-keguang.zhang@gmail.com>
 <20160528141213.6da8e461@bbrezillon>
Date: Sat, 28 May 2016 04:50:11 -0800
Message-ID: <CA+uuBqZa-jBcHbd67wKoObSfyCGZyYrKAKU+o-rPRoXP-+84tA@mail.gmail.com>
Subject: Re: [PATCH V3] mtd: nand: add Loongson1 NAND driver
From: Mychaela Falconia <mychaela.falconia@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Keguang Zhang <keguang.zhang@gmail.com>,
 Richard Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/28/16, Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> I think your controller matches Mychaela's "high-level NAND controller"
> definition [1]. Mychaela, can you confirm the Loongson controller
> looks like yours?

Yes, from the code it does look like a very similar deal. The OP's
implementation attaches to the "generic" NAND layer essentially by
cheating: capturing NAND Read Page, Write Page and Read ID command
opcodes, performing the entire operation in the function which, from
the "generic" layer's perspective, it supposed to just issue the
command and return, and then fooling the "generic" layer into
believing that's it's talking to a low-level NAND controller.
Faraday's driver for their FTNANDC024 does the same thing, except that
with their controller even more hacks are needed and the code is much
dirtier.

Note that if the NAND chip uses ONFI, the OP's implementation will
fail for the same reason as Faraday's: the "cheating" logic that tries
to emulate a low-level NAND controller on top of a high-level one does
not handle the ONFI Read Parameter Page command.

To Boris: yes, I realize that I appear to have dropped my original
thread regarding FTNANDC024. I just had a major life disruption: the
Internet connection serving my personal mail server (the one from
which I started that thread) went down around 2016-05-26T22:30:00
GMT/UTC, and as I just learned, it may never come back up, i.e., I may
have to get an entirely different kind of connection before I'll be
able to run my own servers again. I'm using Gmail right now as an
emergency stopgap measure, but I am a life-long command line user, and
webmail is not acceptable to me as a permanent solution. Therefore, I
am currently in hibernation until I get a new comfortable email setup
arranged. When I do get my life back together (i.e., a usable email
setup that's usable in my terminal command line environment), I will
get back to the FTNANDC024 thread.

M~
