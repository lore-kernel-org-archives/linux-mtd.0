Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R8bod-0008Io-Gt
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2011 17:51:36 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V4] mtd: Add DiskOnChip G3 support
References: <1316633266-21312-1-git-send-email-robert.jarzmik@free.fr>
	<1316702729.4849.114.camel@sauron> <87mxdwiicc.fsf@free.fr>
	<201109271539.21533.arnd@arndb.de>
Date: Tue, 27 Sep 2011 19:51:18 +0200
In-Reply-To: <201109271539.21533.arnd@arndb.de> (Arnd Bergmann's message of
	"Tue, 27 Sep 2011 15:39:21 +0200")
Message-ID: <878vp96fhl.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
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

Arnd Bergmann <arnd@arndb.de> writes:

> On Thursday 22 September 2011, Robert Jarzmik wrote:
>> >> +#define doc_flashSequence(seq)                                              \
>> >> +do {                                                                        \
>> >> +    doc_dbg("doc_flashSequence: %02x " #seq "\n", DoC_Seq_##seq);   \
>> >> +    doc_writeb(DoC_Seq_##seq, DoC_FlashSequence);                   \
>> >> +} while (0)
>> >> +
>> ...zip...
>> >
>> > Could you please turn these macros into 'static inline' function - this
>> > is one of the modern patterns of kernel programming - we try to use
>> > functions for better type checking.
>>
>> No sorry, that I cannot. If you look closely, the ##seq is not something you can
>> convert with an inline function, neither the #seq.
>
> Better not obfuscate the code like that then ;-)
>
> Really, passing the entire register name into an inline function is much
> preferred over string concatenation, because it lets you grep for where
> certain definitions are used.
Right. But how do handle the "#seq" then ?

The whole point here is to write humanly readable debug messages. A message of
the like "doc_flashsequence: 48 SET_PLANE1" is much better than
"doc_flashsequence: 48", don't you think ?

If we consider to loose that debugging messages, it's way easier to drop the "do
.. while(0)" sequences, and just keep the register write.

Now if you're convinced removing the "SET_PLANE1" debugging message is less
important that ability to grep the full register name, why not, but from a
maintenance point of view I would prefer letting the "macroness" in.

> You can also convert them to ALL_CAPS
> identifiers instead of cAmeLCAsE.
Point taken for V6.

>
> Finally, don't use the __raw_readb() style functions but instead use
> the regular readb() style, which is the correct one to use in device
> drivers.
Point taken for V6.

Cheers.

-- 
Robert
