Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvuiE-0000Cv-1f
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 17:24:30 +0000
Received: by wyh11 with SMTP id 11so324221wyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 10:24:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314077429.2645.31.camel@sauron>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-5-git-send-email-computersforpeace@gmail.com>
	<1314003028.2644.80.camel@sauron>
	<CAN8TOE97XijzxpdjF4MHMzGhoAYw7VaLaYSD-HEP-UYUUCf13w@mail.gmail.com>
	<1314077429.2645.31.camel@sauron>
Date: Tue, 23 Aug 2011 10:24:27 -0700
Message-ID: <CAN8TOE91_cbfV4VXz3Z738D1tXEujq=2GKKc+6TO9SnL25iKUg@mail.gmail.com>
Subject: Re: [RFC 4/5] mtd: move mtd_oob_mode_t to shared kernel/user space
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 22, 2011 at 10:30 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 32/64 problems - what do you mean? enumeration = 'int' which is always
> 32 bits in all architectures Linux supports.

Oops, got things mixed up here (ints and pointers). Thanks for the
correction. My worry was unfounded...

> 3. IMHO, and I even dare to say that many kernel gurus would agree, if
> we are talking about a simple enum with just few constants inside -
> anonymous enum is the best - the code is simpler and more readable.
...
> So, I'd be happy with 3, can live with 2, and dislike 1 very much :-)

3 sounds perfect, now that I've been straightened out.

> I cannot refer to a section in a standard, but I am sure unitialized
> tags will start with 0 reliably. But yes, it is much less error-prone to
> initialize the tags explicitly, because it makes it a bit more difficult
> to make a stupid mistake by adding a new constant and change values of
> other constants.

It's also useful if we have to kill an old option at some point. I'll
probably include initializers.

>> Sorry if this is a lot of thinking out loud here :)
>
> Yeah, least significant topics usually cause most discussions - I was
> told recently by a colleague that this is called "bike shedding". Notice
> how much I wrote comparing to more important posts of yours :-)

I actually learned/recalled a few things here; I had pieces of the
puzzle but not the whole picture. And the "bike shed" is an important
addition to my vocabulary.

Thanks,
Brian
