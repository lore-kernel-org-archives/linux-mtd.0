Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kp6Wc-0007dY-KA
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 19:22:46 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1323880rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Oct 2008 12:22:45 -0700 (PDT)
Message-ID: <8bd0f97a0810121222o655bfa3s1acaaaab5efe31cc@mail.gmail.com>
Date: Sun, 12 Oct 2008 15:22:45 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Russell King - ARM Linux" <linux@arm.linux.org.uk>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
In-Reply-To: <20081012190939.GA28525@flint.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48EF3291.5040000@compulab.co.il>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
	<8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
	<20081012082803.GA29975@flint.arm.linux.org.uk>
	<8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
	<20081012101326.GB29975@flint.arm.linux.org.uk>
	<8bd0f97a0810121204t115a7b95o33fb06a2fd13273d@mail.gmail.com>
	<20081012190939.GA28525@flint.arm.linux.org.uk>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Russ Dill <russ.dill@gmail.com>, Jamie Lokier <jamie@shareable.org>,
	Ben Dooks <ben-linux-arm@fluff.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Mike Rapoport <mike@compulab.co.il>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 12, 2008 at 15:09, Russell King - ARM Linux wrote:
> On Sun, Oct 12, 2008 at 03:04:06PM -0400, Mike Frysinger wrote:
>> On Sun, Oct 12, 2008 at 06:13, Russell King - ARM Linux wrote:
>> > It doesn't.  The fact that the GPIO state is preserved when free'd on
>> > PXA is just that it takes _more_ code to do anything else.
>>
>> so which is it ?  GPIO state *should* be preserved, or PXA does it
>> simply due to code frugality ?
>
> May I remind you that _you_ are the one with the system which doesn't
> preserve GPIO state.
>
>> if the API behavior is strictly documented, your complaint here is
>> pretty moot.
>
> My complaint?  I don't have a complaint.  You are the one with the
> complaint with the driver that's being discussed.  You're the one
> who's moaning about it setting state before calling gpio_free.
>
> I see no point in continuing this discussion; your arguments are
> just plain silly.  I've explained _why_ we're doing it.
>
> Our GPIO hardware behaves differently from yours.  Our gpio_free()
> is side-effect free.  Get over it.

i'm attempting to get things fixed for everyone.  stop being so
abrasive over nothing.

your original comments:
> Maybe you should reconsider that behaviour - this is a prime example
> why such behaviour is wrong.
>...
> I'll say that I've never liked this GPIO layer, because it breads ideas
> like you're putting forward, which have traditionally not been needed
> to be thought about when writing direct to the registers - where you
> have system wide control of the GPIO state without any of this "on
> gpio_free() such and such might happen" ideas.

my question is simply:
> if certain behavior is expected, then it should be codified.  i see no
> mention (unless i just missed it) of expected behavior upon freeing in
> Documentation/gpio.txt.

and i havent gotten a straight answer out of you about this.  should
state be retained when a pin gets freed or not ?  you cant say "your
implementation is broken" if you dont say *what* the expected behavior
is and the behavior you claim isnt documented.  what
$random-implementation does is irrelevant.  the agreed upon API is the
only thing that matters.
-mike
