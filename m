Received: from web13907.mail.yahoo.com ([216.136.175.70])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ClrF-0003Vw-Gr
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 20:42:41 +0100
Message-ID: <20030505194255.17749.qmail@web13907.mail.yahoo.com>
Date: Mon, 5 May 2003 12:42:55 -0700 (PDT)
From: Michael Moedt <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1052162831.1172.11269.camel@tubarao>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: Error: Wacky! Unable to decode failure status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > I'm getting the error message "Wacky! Unable to
> > decode failure status".  See below:
> 
> My guess is that you are using
> divers/mtd/chips/cfi_cmdset_0002.c with a
> revision earlier than 1.68 - please update to that
> version.  If you
> still have problems then send another email and I'll
> look a bit closer.

Thanks for the quick response!  I'm also looking at
the  sheet.
I am using 1.68. (last modified 04/21, by thayne.  =])

As far as we can tell, it looks like the erase
operation completes correctly, and we start reading
the flash again, getting the erased value of 0xffff.
(It is in 16-bit wide mode)

The 'ones' variable that it compares the read values
to is only an 8-bit 0xff.  I traced this back a
little,  (the CMD macro in include/linux/mtd/cfi.h and
the function right above it) and it keeps it as 8-bit
even if it knows that it's x16.

Should it be masking off only the lowest byte?

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
