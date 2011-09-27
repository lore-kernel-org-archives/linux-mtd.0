Received: from moutng.kundenserver.de ([212.227.17.8])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R8Xse-0003li-RC
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2011 13:39:30 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH V4] mtd: Add DiskOnChip G3 support
Date: Tue, 27 Sep 2011 15:39:21 +0200
References: <1316633266-21312-1-git-send-email-robert.jarzmik@free.fr>
	<1316702729.4849.114.camel@sauron> <87mxdwiicc.fsf@free.fr>
In-Reply-To: <87mxdwiicc.fsf@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201109271539.21533.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 22 September 2011, Robert Jarzmik wrote:
> >> +#define doc_flashSequence(seq)                                              \
> >> +do {                                                                        \
> >> +    doc_dbg("doc_flashSequence: %02x " #seq "\n", DoC_Seq_##seq);   \
> >> +    doc_writeb(DoC_Seq_##seq, DoC_FlashSequence);                   \
> >> +} while (0)
> >> +
> ...zip...
> >
> > Could you please turn these macros into 'static inline' function - this
> > is one of the modern patterns of kernel programming - we try to use
> > functions for better type checking.
>
> No sorry, that I cannot. If you look closely, the ##seq is not something you can
> convert with an inline function, neither the #seq.

Better not obfuscate the code like that then ;-)

Really, passing the entire register name into an inline function is much
preferred over string concatenation, because it lets you grep for where
certain definitions are used. You can also convert them to ALL_CAPS
identifiers instead of cAmeLCAsE.

Finally, don't use the __raw_readb() style functions but instead use
the regular readb() style, which is the correct one to use in device
drivers.

	Arnd
