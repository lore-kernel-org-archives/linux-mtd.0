MIME-Version: 1.0
In-Reply-To: <20131031155808.GB2468@localhost>
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131031155808.GB2468@localhost>
Date: Thu, 31 Oct 2013 14:22:33 -0400
Message-ID: <CAN8TOE-XdPgHykzzJtpkQ3ApTLXjZ+hCiAPpOBCZqa7uVt=kcA@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] Armada 370/XP NAND support
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 31, 2013 at 12:58:09PM -0300, Ezequiel Garcia wrote:
> Can we start discussing this patchset?
> I realize is a big series, but better starting sooner than later! :)

Yeah, I'm still figuring out prioritization here. I got a little
side-tracked on a few other patch series, some of which had
dependencies on each other. I will take a look at yours next.

...

> >   mtd: nand: pxa3xx: Introduce multiple page I/O support
> ^^^
> .. this one seems to me like the most conflicting patches as
> they extend the ECC, adding BCH. Could you review them and
> provide any comments?

Sure thing.

Brian
