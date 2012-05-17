Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SV0FV-0005SW-91
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 12:56:11 +0000
Date: Thu, 17 May 2012 13:55:44 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v7 3/3] MTD: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
Message-ID: <20120517125544.GJ9571@n2100.arm.linux.org.uk>
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
 <1337093256-19117-4-git-send-email-josh.wu@atmel.com>
 <1337160353.24809.26.camel@sauron.fi.intel.com>
 <20403.29677.517067.528042@ipc1.ka-ro>
 <1337161217.24809.38.camel@sauron.fi.intel.com> <4FB49C60.5030002@atmel.com>
 <1337255011.2564.2.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1337255011.2564.2.camel@koala>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, Josh Wu <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org,
 Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 17, 2012 at 02:43:31PM +0300, Artem Bityutskiy wrote:
> On Thu, 2012-05-17 at 14:36 +0800, Josh Wu wrote:
> > >> message text should not be split across lines anyway to ease grepping
> > >> for the message.
> > > I think the consensus is that it is personal decision of the author. I
> > > am not trying to enforce this and I also split messages. In this case I
> > > was only wondering why that backslash is used? I never saw this before
> > > in the linux kernel.
> > >
> > 
> > oh, I add the backslash only because if without it, there should be a 
> > warning about message is splitting into two lines.
> 
> Backslash is not needed in C. The preprocessor removes it anyway. We do
> not put them.
> 
> > Now I think I will just keep the text message in one line. That will 
> > avoid any warnings. thanks.
> 
> You can just remove the backslashes. I think your lines splitting is
> fine otherwise.

It's also preferred _not_ to wrap error messages as that makes them
harder to grep for.  Linus has mentioned this several times on LKML
and has corrected error messages that he encounters that he can't
find via grep.
